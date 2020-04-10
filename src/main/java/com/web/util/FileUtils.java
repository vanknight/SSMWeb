package com.web.util;

import com.fasterxml.jackson.core.type.TypeReference;
import com.web.bean.temp.ProvinceSelect;
import com.web.bean.temp.UrbanSelect;
import com.web.service.RedisService;

import java.io.*;
import java.util.Base64;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/27 11:08
 * @description:
 */
@Component
public class FileUtils {

    private Logger log = LoggerFactory.getLogger(FileUtils.class);

    @Value("classpath:json/cityList-18-4.json")
    private Resource provinceList;

    @Autowired
    private JsonUtils jsonUtils;

    @Autowired
    private RedisService redisService;

    private Integer selectTime = 60 * 60 * 24;

    private String getWebRootPath(HttpServletRequest request) {
        String webRoot = request.getSession().getServletContext().getRealPath("/");
        if (webRoot == null) {
            webRoot = this.getClass().getClassLoader().getResource("/").getPath();
            webRoot = webRoot.substring(0, webRoot.indexOf("WEB-INF"));
        }
        return webRoot;
    }

    private String readBuffer(Resource resource) throws IOException {
        BufferedReader br = new BufferedReader(
            new InputStreamReader(resource.getInputStream(), "UTF-8")
        );
        StringBuffer provinceListJsonSb = new StringBuffer();
        String line = null;
        while ((line = br.readLine()) != null) {
            provinceListJsonSb.append(line);
        }
        String defaultString = provinceListJsonSb.toString();

        return defaultString.replace("\r\n", "").replaceAll(" +", "");
    }

    public List<ProvinceSelect> getProvinceListJson() throws IOException {
        String key = "file_province_list";
        String result = "";
        try {
            if (redisService.exists(key)) {
                log.info("province-select---读取缓存");
                result = redisService.get(key);
            } else {
                result = readBuffer(provinceList);
                log.info("province-select---存入缓存");
                redisService.set(key, result, selectTime);
            }
        } catch (Exception e) {
            log.info("province-select---不经过缓存");
            result = readBuffer(provinceList);
        }
        List<ProvinceSelect> list = jsonUtils
            .fromJson(result, new TypeReference<List<ProvinceSelect>>() {
            });

        saveUrbanByProvinceList(list);

        return list;
    }
    public List<UrbanSelect> getUrbanList(String name) throws IOException {
        String key = "file_urban_list_" + name;
        String result = "";
        try {
            if (redisService.exists(key)) {
                log.info("urban-select---读取缓存");
                result = redisService.get(key);
            } else {
                return null;
            }
        } catch (Exception e) {
            log.info("urban-select---不经过缓存");
            return null;
        }
        return jsonUtils.fromJson(result,
            new TypeReference<List<UrbanSelect>>() {
            });
    }

    public void saveUrbanByProvinceList(List<ProvinceSelect> list) {
        try {
            String prefix = "file_urban_list_";
            for (ProvinceSelect provinceSelect : list) {
                List<UrbanSelect> urbanSelects = provinceSelect.getSub();
                String key = prefix + provinceSelect.getName();

                String value = jsonUtils.toJson(urbanSelects);
                if (!redisService.exists(key) && value != null && value.length() > 0) {
                    redisService.set(key, value, selectTime);
                }
            }
        } catch (Exception e) {
            return;
        }
    }

    public String uploadImageToRedis(String basePath, MultipartFile file) {
        if (file != null && !file.isEmpty()) {
            String oldFileName = file.getOriginalFilename();
            assert oldFileName != null;
            String suffix = oldFileName.substring(oldFileName.lastIndexOf("."));

            String newFileName = basePath +
                RandomUtils.getUUID8()+"-"+RandomUtils.getUUID8()+suffix;
            try {
                String imageDate = Base64.getEncoder().encodeToString(file.getBytes());
                redisService.set(Constants.REDIS_FILE_PREFIX + "_" + newFileName,
                    imageDate, selectTime / 24);
                return newFileName;
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            return null;
        }
        return null;
    }

    public boolean uploadImageToLocalDisk(HttpServletRequest request, String newFileName) {
        if (newFileName != null && newFileName.length() > 0) {
            String key = Constants.REDIS_FILE_PREFIX + "_" + newFileName;
            String webRoot = getWebRootPath(request);
            if (webRoot == null) {
                return false;
            }

            System.out.println("--------------------------------------------");
            System.out.println("----------------------------------webRoot : " + webRoot);
            System.out.println("--------------------------------------------");
            String filePath = webRoot + "v2/assets/pages/img/" + newFileName;
            System.out.println("--------------------------------------------");
            System.out.println("----------------------------------保存路径 : " + filePath);
            System.out.println("--------------------------------------------");

            if (!redisService.exists(key)) {
                return false;
            }
            try {
                String contentString = redisService.get(key);
                byte[] content = Base64.getDecoder().decode(contentString);
                File imgFile = new File(filePath);
                FileOutputStream outputStream = new FileOutputStream(imgFile);
                outputStream.write(content);
                outputStream.close();
                return true;
            } catch (IOException e) {
                e.printStackTrace();
                return false;
            }
        } else {
            return true;
        }
    }

    public boolean uploadImagesToLocalDisk(HttpServletRequest request, String imagesStr, String regex) {
        String[] imagesArr = imagesStr.split(regex);
        for (int i = 0;i < imagesArr.length;i++){
            boolean mark = uploadImageToLocalDisk(request,imagesArr[i]);
            if(!mark){
                return false;
            }
        }
        return true;
    }

    public boolean uploadImagesToLocalDisk(HttpServletRequest request, String imagesStr) {
        return uploadImagesToLocalDisk(request,imagesStr,";");
    }
}
