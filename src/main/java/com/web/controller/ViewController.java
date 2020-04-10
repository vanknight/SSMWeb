package com.web.controller;

import com.alipay.api.AlipayApiException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.web.annotation.Authorization;
import com.web.annotation.CurrentUser;
import com.web.bean.pojo.User;
import com.web.bean.temp.ProvinceSelect;
import com.web.bean.temp.UrbanSelect;
import com.web.service.UserService;
import com.web.util.Constants;
import com.web.util.FileUtils;
import com.web.util.JsonUtils;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import sun.misc.BASE64Encoder;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/17 16:43
 * @description:
 */
@Controller
@RequestMapping("/view")
public class ViewController {
    private Logger log = Logger.getLogger(getClass());
    private BASE64Encoder encoder = new BASE64Encoder();

    @Autowired
    private JsonUtils jsonUtils;
    @Autowired
    private FileUtils fileUtils;
    @Autowired
    private UserService userService;

    @RequestMapping("/{viewname}/{msg}")
    public ModelAndView viewGo(
        @PathVariable("viewname") String viewname,
        @PathVariable("msg") String msg
    ) {
        ModelAndView mv = new ModelAndView("base/" + viewname);
        mv.addObject("msg", msg);
        return mv;
    }

    @RequestMapping("/shop-index")
    public ModelAndView viewGo1() {
        ModelAndView mv = new ModelAndView("base/shop-index");
        log.debug("进入主页");
        return mv;
    }
    @RequestMapping("/shop-privacy-policy")
    public ModelAndView viewGo2() {
        ModelAndView mv = new ModelAndView("base/shop-privacy-policy");
        return mv;
    }
    @RequestMapping("/shop-terms-conditions-page")
    public ModelAndView viewGo3() {
        ModelAndView mv = new ModelAndView("base/shop-terms-conditions-page");
        return mv;
    }

    @RequestMapping(value = "/code", method = RequestMethod.GET)
    public ResponseEntity code() throws IOException {

        int width = 100;
        int height = 30;

        BufferedImage bufferedImage = new BufferedImage(width, height, 1);

        Graphics graphics = bufferedImage.getGraphics();

        graphics.setColor(Color.cyan);
        graphics.fillRect(0, 0, width, height);

        graphics.setColor(Color.BLUE);
        graphics.drawRect(0, 0, width - 1, height - 1);

        graphics.setColor(Color.RED);
        graphics.setFont(new Font("宋体", 1, 20));
        Graphics2D graphics2d = (Graphics2D) graphics;
        String s = "ABCDEFGHGKLMNPQRSTUVWXYZ23456789";
        Random random = new Random();
        String regCode = "";
        int x = 5;
        for (int i = 0; i < 4; i++) {
            int index = random.nextInt(32);
            String content = String.valueOf(s.charAt(index));
            regCode = regCode + content;
            double theta = random.nextInt(45) * 3.141592653589793D / 180.0D;

            graphics2d.rotate(theta, x, 18.0D);
            graphics2d.drawString(content, x, 18);
            graphics2d.rotate(-theta, x, 18.0D);
            x += 20;
        }
        graphics.setColor(Color.gray);
        for (int i = 0; i < 5; i++) {
            int x1 = random.nextInt(width);
            int x2 = random.nextInt(width);

            int y1 = random.nextInt(height);
            int y2 = random.nextInt(height);
            graphics.drawLine(x1, y1, x2, y2);
        }
        graphics.dispose();

        String imgFormat = "jpg";
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(bufferedImage, imgFormat, baos);
        byte[] bytes = baos.toByteArray();

        StringBuilder base64Image = new StringBuilder("data:image/");

        base64Image.append(imgFormat);
        base64Image.append(";base64,");
        base64Image.append(encoder.encodeBuffer(bytes));

        Map<String, Object> map = new LinkedHashMap<>(3);
        map.put("status", 0);
        map.put("reg_code", regCode);
        map.put("stream", base64Image.toString());

        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }

    @RequestMapping("/index")
    public ModelAndView viewIndex() {
        return new ModelAndView("base/shop-index");
    }

    @RequestMapping("/forget-password")
    public ModelAndView viewForgetPassword() {
        return new ModelAndView("base/shop-forget-password-form");
    }

    @RequestMapping(value = "/change-password-page/{enCode}", method = RequestMethod.GET)
    public ModelAndView forgetPasswordUI(
        @PathVariable("enCode") String enCode
    ) throws JsonProcessingException {
        ModelAndView modelAndView = new ModelAndView("base/shop-change-password-form");

        log.debug("注册enCode : " + enCode);
        Assert.notNull(enCode, "user can not be empty");
        modelAndView.addObject("enCode", enCode);
        return modelAndView;
    }

    @RequestMapping("/registerUI")
    public ModelAndView registerUI() {
        ModelAndView modelAndView = new ModelAndView("user/shop-register");
        return modelAndView;
    }

    @RequestMapping("/loginUI")
    public ModelAndView loginUI(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("user/shop-login");
        modelAndView.addObject(
            "random_key",
            userService.createRandomKey(session.getId(), 60 * 5)
        );
        return modelAndView;
    }

    @Authorization
    @RequestMapping(value = "/refundUI/{oid}", produces = "text/html;charset=UTF-8",
                    method = RequestMethod.GET)
    public ModelAndView orderToRefundUI(
        @CurrentUser User user,
        @PathVariable("oid") String oid
    ) throws AlipayApiException, IOException {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("order/shop-order-refund-page");
        if (user != null) {
            modelAndView.addObject("status", Constants.SUCCESS);
            modelAndView.addObject("data", oid);
        } else {
            modelAndView.addObject("status", Constants.ERROR);
            modelAndView.addObject("msg", "验证失效，请重新登陆");
        }

        return modelAndView;
    }

    @RequestMapping(value = "/province-select", method = RequestMethod.GET)
    public ResponseEntity provinceListJson() throws IOException {
        Map<String, Object> map = new LinkedHashMap<>(2);

        List<ProvinceSelect> list = fileUtils.getProvinceListJson();

        if (list == null || list.size() < 1) {
            map.put("status", Constants.ERROR);
            map.put("msg", "获取省份列表失败");
        } else {
            map.put("status", Constants.SUCCESS);
            map.put("data", list);
        }
        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }

    @RequestMapping(value = "/urban-select/{provinceName}", method = RequestMethod.GET)
    public ResponseEntity urbanListByName(
        @PathVariable("provinceName") String provinceName
    ) throws IOException {
        Map<String, Object> map = new LinkedHashMap<>(2);

        List<UrbanSelect> list = fileUtils.getUrbanList(provinceName);

        if (list == null || list.size() < 1) {
            map.put("status", Constants.ERROR);
            map.put("msg", "获取市级列表失败");
        } else {
            map.put("status", Constants.SUCCESS);
            map.put("data", list);
        }
        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }

}
