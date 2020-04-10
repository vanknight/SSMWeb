package com.web.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.github.pagehelper.PageInfo;
import com.web.annotation.Authorization;
import com.web.annotation.CurrentUser;
import com.web.bean.pojo.Product;
import com.web.bean.pojo.User;
import com.web.bean.pojo.WishProduct;
import com.web.service.ProductService;
import com.web.service.WishProductService;
import com.web.util.Constants;
import com.web.util.JsonUtils;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.log4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/10 14:59
 * @description:
 */
@Controller
@RequestMapping("/product")
public class ProductController {
    private Logger log = Logger.getLogger(getClass());

    @Autowired
    private JsonUtils jsonUtils;

    @Autowired
    private ProductService productService;

    @Autowired
    private WishProductService wishProductService;

    @RequestMapping("/one/{pid}")
    public ModelAndView getProductByPid(@PathVariable("pid") String pid)
        throws JsonProcessingException {
        ModelAndView mv = new ModelAndView("base/shop-item");
        Product product = productService.getProductByPid(pid);
        if (product == null || product.getState() != 0) {
            mv.addObject("status", 1);
            mv.addObject("msg", "商品不存在或者下架了");
        } else {

            mv.addObject("status", 0);
            mv.addObject("data", product);
        }
        return mv;
    }


    @RequestMapping("/list")
    public ModelAndView getProduct(
        @RequestParam(value = "pageNum", required = false, defaultValue = "1") Integer pageNum,
        @RequestParam(value = "pageSize", required = false, defaultValue = "6") Integer pageSize
    ) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView("base/shop-product-list");

        List<Product> list = productService.findAll(pageNum, pageSize);
        if (list == null) {
            mv.addObject("status", Constants.ERROR);
            mv.addObject("msg", "没有商品存在");
        } else {

            PageInfo<Product> pageInfo = new PageInfo<>(list);
            mv.addObject("status", Constants.SUCCESS);
            mv.addObject("data", pageInfo);
        }
        return mv;
    }

    @RequestMapping("/search/list")
    public ModelAndView getSearchProduct(
        @RequestParam(value = "search") String string,
        @RequestParam(value = "pageNum", required = false, defaultValue = "1") Integer pageNum,
        @RequestParam(value = "pageSize", required = false, defaultValue = "6") Integer pageSize
    ) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView("base/shop-product-list");

        List<Product> list = productService.findSearch(string,pageNum, pageSize);
        if (list == null || list.size() < 1) {
            mv.addObject("status", Constants.ERROR);
            mv.addObject("msg", "没有商品存在");
        } else {
            PageInfo<Product> pageInfo = new PageInfo<>(list);
            mv.addObject("status", Constants.SUCCESS);
            mv.addObject("data", pageInfo);
        }
        return mv;
    }


    @RequestMapping(value = "/new/{size}", produces = {
        "application/json;charset=UTF-8;"}, method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity getNewProductList(@PathVariable("size") int size)
        throws JsonProcessingException {

        Map<String, Object> map = new LinkedHashMap<>(2);
        List<Product> list = productService.getNewProductList(0, size);
//        assert list == null;
        if (list == null || list.size() < 1) {
            map.put("status", Constants.ERROR);
            map.put("msg", "没有最新的商品");
        } else {
            map.put("status", Constants.SUCCESS);
            map.put("data", list);

        }

        return new ResponseEntity<String>(jsonUtils.toJson(map), HttpStatus.OK);
    }


    @RequestMapping(value = "/hot/{size}", produces = {
        "application/json;charset=UTF-8;"}, method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity getHotProductList(@PathVariable("size") int size)
        throws JsonProcessingException {

        Map<String, Object> map = new LinkedHashMap<>(2);
        List<Product> list = productService.getHotProductList(0, size);

        if (list == null || list.size() < 1) {
            map.put("status", Constants.ERROR);
            map.put("msg", "没有最热的商品");
        } else {
            map.put("status", Constants.SUCCESS);
            map.put("data", list);

        }
        return new ResponseEntity<String>(jsonUtils.toJson(map), HttpStatus.OK);
    }


    @RequestMapping(value = "/category/{cid}/{size}", method = RequestMethod.GET)
    public ResponseEntity getProductByCid(
        @PathVariable("cid") String cid,
        @PathVariable("size") Integer size
    ) throws JsonProcessingException {
        Map<String, Object> map = new LinkedHashMap<>(2);

        List<Product> list = productService.getProductByCid(cid, size);

        if (list == null || list.size() < 1) {
            map.put("status", Constants.ERROR);
            map.put("msg", "该分类下没有商品");
        } else {
            map.put("status", Constants.SUCCESS);
            map.put("data", list);
        }
        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }


    @RequestMapping(value = "/category/{cid}", method = RequestMethod.GET)
    public ModelAndView getProductByCid(
        @PathVariable("cid") String cid,
        @RequestParam(value = "pageNum", required = false, defaultValue = "1") Integer pageNum,
        @RequestParam(value = "pageSize", required = false, defaultValue = "6") Integer pageSize
    ) throws JsonProcessingException {

        ModelAndView mv = new ModelAndView("base/shop-product-list");

        List<Product> list = productService.getProductByCid(cid, pageNum, pageSize);

        if (list == null || list.size() < 1) {
            mv.addObject("status", Constants.ERROR);
            mv.addObject("msg", "该分类下没有商品");
        } else {
            PageInfo<Product> pageInfo = new PageInfo<>(list);
            mv.addObject("status", Constants.SUCCESS);
            mv.addObject("data", pageInfo);
        }
        return mv;
    }



    @RequestMapping(value = "/randomProduct/{size}", method = RequestMethod.GET)
    public ResponseEntity getRandomProduct(
        @PathVariable(value = "size") int size
    ) throws JsonProcessingException {

        Map<String, Object> map = new LinkedHashMap<>(2);

        List<Product> list = productService.findAll();

        if (list == null || list.size() < size) {
            map.put("status", Constants.ERROR);
            map.put("msg", "商品数量不够啦");
        } else {
            if (list.size() > size) {

                List<Product> randomList = new ArrayList<>();
                Random random = new Random();
                List<Integer> indexs = new ArrayList<>();

                for (int i = 0; i < size; i++) {
                    int index = random.nextInt(list.size() - 1) + 1;
                    while (indexs.contains(index)) {
                        index = random.nextInt(list.size() - 1) + 1;
                    }
                    indexs.add(index);
                }
                for (Integer index : indexs) {
                    randomList.add(list.get(index));
                }
                map.put("status", Constants.SUCCESS);
                map.put("data", randomList);
            } else {
                map.put("status", Constants.SUCCESS);
                map.put("data", list);
            }
        }
        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }

    @Authorization
    @RequestMapping(value = "/wish", method = RequestMethod.GET)
    public ModelAndView wishList(
        @CurrentUser User user,
        @RequestParam(value = "pageNum", required = false, defaultValue = "1") Integer pageNum,
        @RequestParam(value = "pageSize", required = false, defaultValue = "6") Integer pageSize
    ) {
        ModelAndView modelAndView = new ModelAndView("user/shop-wish-list");
        if (user != null) {
            List<WishProduct> list = wishProductService.findByUid(user.getUid(), pageNum, pageSize);
            if (list == null || list.size() < 1) {
                modelAndView.addObject("status", Constants.ERROR);
                modelAndView.addObject("msg", "没有收藏的商品");
            } else {
                PageInfo<WishProduct> pageInfo = new PageInfo<>(list);
                modelAndView.addObject("status", Constants.SUCCESS);
                modelAndView.addObject("data", pageInfo);
                System.out.println("pageInfo : " + pageInfo);
            }

        } else {
            modelAndView.addObject("status", Constants.ERROR);
            modelAndView.addObject("msg", "验证失效，请重新登陆");
        }

        return modelAndView;
    }

    @Authorization
    @RequestMapping(value = "/wish/{pid}", method = RequestMethod.DELETE)
    public ResponseEntity deleteWish(
        @CurrentUser User user,
        @PathVariable("pid") String pid
    ) throws JsonProcessingException {
        Map<String, Object> map = new LinkedHashMap<>(2);
        if (user != null) {
            boolean mark = wishProductService.deleteWishProduct(user.getUid(), pid);
            if (mark) {
                map.put("status", Constants.SUCCESS);
                map.put("msg", "删除成功");
            } else {
                map.put("status", Constants.ERROR);
                map.put("msg", "删除失败");
            }

        } else {
            map.put("status", Constants.ERROR);
            map.put("msg", "验证失效，请重新登陆");
        }

        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }

    @Authorization
    @RequestMapping(value = "/wish/{pid}", method = RequestMethod.PUT)
    public ResponseEntity addWish(
        @CurrentUser User user,
        @PathVariable("pid") String pid
    ) throws JsonProcessingException {
        Map<String, Object> map = new LinkedHashMap<>(2);
        if (user != null) {
            WishProduct wishProduct = wishProductService.findByUidAndPid(user.getUid(), pid);
            if (wishProduct == null) {
                wishProduct = new WishProduct();
                wishProduct.setUid(user.getUid());
                wishProduct.setPid(pid);
                boolean mark = wishProductService.insertWishProduct(wishProduct);
                if (mark) {
                    map.put("status", Constants.SUCCESS);
                    map.put("msg", "添加成功");
                } else {
                    map.put("status", Constants.ERROR);
                    map.put("msg", "添加失败");
                }
            } else {
                map.put("status", Constants.ERROR);
                map.put("msg", "已经存在");
            }

        } else {
            map.put("status", Constants.ERROR);
            map.put("msg", "验证失效，请重新登陆");
        }

        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }
}
