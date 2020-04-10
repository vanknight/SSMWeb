package com.web.controller;

import com.web.annotation.Authorization;
import com.web.annotation.CurrentUser;
import com.web.bean.pojo.*;
import com.web.bean.temp.Logistics;
import com.web.service.CategoryService;
import com.web.service.ExpressService;
import com.web.service.KdApiService;
import com.web.service.OrderItemService;
import com.web.service.OrdersService;
import com.web.service.ProductService;
import com.web.service.UserService;
import com.web.util.Constants;
import com.web.util.FileUtils;
import com.web.util.JsonUtils;
import com.web.util.Md5Utils;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/5/3 14:05
 * @description:
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    private Logger log = Logger.getLogger(getClass());

    @Autowired
    private UserService userService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ProductService productService;

    @Autowired
    private OrderItemService orderItemService;

    @Autowired
    private OrdersService ordersService;

    @Autowired
    private ExpressService expressService;

    @Autowired
    private KdApiService kdApiService;

    @Autowired
    private FileUtils fileUtils;


    private final Integer adminNumber = 2;

    private String productImgFilePathSuffix = "products/temp/";
    private String productDetailsImgFilePathSuffix = "products/details/";
    private String productDetailsImagesRegex = ";";

    @Autowired
    private JsonUtils jsonUtils;

    @Authorization
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView adminIndex(
        @CurrentUser User user
    ) {
        if (user != null && user.getState() >= adminNumber) {
            return new ModelAndView("admin/admin-index");
        } else {
            return new ModelAndView("base/shop-index");
        }
    }

    @Authorization
    @RequestMapping(value = "/users", method = {RequestMethod.GET})
    public ModelAndView getUserList(
        @CurrentUser User user
    ) throws IOException, ServletException {
        ModelAndView mv = new ModelAndView("admin/admin-user-list");
        if (user != null && user.getState().equals(adminNumber)) {
            List<User> list = userService.findAll();
            mv.addObject("status", Constants.SUCCESS);
            mv.addObject("data", list);
            mv.addObject("count", list.size());
        } else {
            mv.addObject("status", Constants.ERROR);
            mv.addObject("msg", "权限不够或未登陆");
        }

        return mv;
    }


    @Authorization
    @RequestMapping(value = "/users/{uid}", method = {
        RequestMethod.GET}, produces = "text/html;charset=UTF-8")
    public ModelAndView editUser(
        @CurrentUser User user,
        @PathVariable("uid") Long uid
    ) throws IOException, ServletException {
        ModelAndView mv = new ModelAndView("admin/admin-user-form");
        if (user != null && user.getState().equals(adminNumber)) {
            mv.addObject("status", Constants.SUCCESS);
            User user1 = userService.findByUid(uid);
            mv.addObject("data", user1);
        } else {
            mv.addObject("status", Constants.ERROR);
            mv.addObject("msg", "权限不够或未登陆");
        }
        return mv;
    }

    @Authorization
    @RequestMapping(value = "/users/{uid}", method = {
        RequestMethod.PUT}, produces = "text/json;charset=UTF-8")
    public ResponseEntity updateUser(
        @CurrentUser User user,
        @PathVariable("uid") Long uid,
        @RequestBody User updateUser
    ) throws IOException, ServletException {
        Map<String, Object> map = new LinkedHashMap<>(2);
        if (user != null && user.getState().equals(adminNumber)) {
            map.put("status", Constants.SUCCESS);
            if (updateUser.getPassword() != null && updateUser.getPassword().trim().length() > 1) {
                userService.deleteToken(updateUser.getUid());
                updateUser.setPassword(Md5Utils.MD5(updateUser.getPassword()));
            } else {
                updateUser.setPassword(null);
            }
            boolean mark = userService.updateUserByUid(updateUser);
            if (mark) {


                map.put("msg", "更新成功");
            } else {
                map.put("msg", "更新失败");
            }
        } else {
            map.put("status", Constants.ERROR);
            map.put("msg", "权限不够或未登陆");
        }
        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }

    @Authorization
    @RequestMapping(value = "/users/{uid}", method = {
        RequestMethod.DELETE}, produces = "text/json;charset=UTF-8")
    public ResponseEntity deleteUser(
        @CurrentUser User user,
        @PathVariable("uid") Long uid
    ) throws IOException, ServletException {
        Map<String, Object> map = new LinkedHashMap<>(2);
        if (user != null && user.getState().equals(adminNumber)) {
            map.put("status", Constants.SUCCESS);
            boolean mark = userService.deleteUser(uid);
            if (mark) {
                map.put("msg", "删除成功");
            } else {
                map.put("msg", "删除失败");
            }
        } else {
            map.put("status", Constants.ERROR);
            map.put("msg", "权限不够或未登陆");
        }
        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }

    @Authorization
    @RequestMapping(value = "/categories", method = {RequestMethod.GET})
    public ModelAndView getCategoryList(
        @CurrentUser User user
    ) throws IOException, ServletException {
        ModelAndView mv = new ModelAndView("admin/admin-category-list");
        if (user != null && user.getState().equals(adminNumber)) {
            List<Category> list = categoryService.findAllNoRedis();
            mv.addObject("status", Constants.SUCCESS);
            mv.addObject("data", list);
            mv.addObject("count", list.size());
        } else {
            mv.addObject("status", Constants.ERROR);
            mv.addObject("msg", "权限不够或未登陆");
        }

        return mv;
    }


    @Authorization
    @RequestMapping(value = "/categories/{cid}", method = {
        RequestMethod.GET}, produces = "text/html;charset=UTF-8")
    public ModelAndView editCategory(
        @CurrentUser User user,
        @PathVariable("cid") String cid
    ) throws IOException, ServletException {
        ModelAndView mv = new ModelAndView("admin/admin-category-form");
        if (user != null && user.getState().equals(adminNumber)) {
            mv.addObject("status", Constants.SUCCESS);
            Category category = categoryService.findByCidNoRedis(cid);
            mv.addObject("data", category);
        } else {
            mv.addObject("status", Constants.ERROR);
            mv.addObject("msg", "权限不够或未登陆");
        }
        return mv;
    }


    @Authorization
    @RequestMapping(value = "/categories/{cid}", method = {
        RequestMethod.PUT}, produces = "text/json;charset=UTF-8")
    public ResponseEntity updateCategory(
        @CurrentUser User user,
        @PathVariable("cid") String cid,
        @RequestBody Category category
    ) throws IOException, ServletException {
        Map<String, Object> map = new LinkedHashMap<>(2);
        if (user != null && user.getState().equals(adminNumber)) {
            map.put("status", Constants.SUCCESS);
            boolean mark = categoryService.updateCategoryNoRedis(category);
            if (mark) {
                map.put("msg", "更新成功");
            } else {
                map.put("msg", "更新失败");
            }
        } else {
            map.put("status", Constants.ERROR);
            map.put("msg", "权限不够或未登陆");
        }
        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }

    @Authorization
    @RequestMapping(value = "/categories/{cid}", method = {
        RequestMethod.DELETE}, produces = "text/json;charset=UTF-8")
    public ResponseEntity updateCategory(
        @CurrentUser User user,
        @PathVariable("cid") String cid
    ) throws IOException, ServletException {
        Map<String, Object> map = new LinkedHashMap<>(2);
        if (user != null && user.getState().equals(adminNumber)) {
            map.put("status", Constants.SUCCESS);
            boolean mark = categoryService.deleteCategory(cid);
            if (mark) {
                map.put("msg", "删除成功");
            } else {
                map.put("msg", "删除失败");
            }
        } else {
            map.put("status", Constants.ERROR);
            map.put("msg", "权限不够或未登陆");
        }
        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }


    @Authorization
    @RequestMapping(value = "/products", method = {RequestMethod.GET})
    public ModelAndView getProductList(
        @CurrentUser User user
    ) throws IOException, ServletException {
        ModelAndView mv = new ModelAndView("admin/admin-product-list");
        if (user != null && user.getState().equals(adminNumber)) {

            mv.addObject("status", Constants.SUCCESS);
            List<Product> list = productService.findAllByAdmin();
            mv.addObject("data", list);
            mv.addObject("count", list.size());

        } else {
            mv.addObject("status", Constants.ERROR);
            mv.addObject("msg", "权限不够或未登陆");
        }

        return mv;
    }

    @Authorization
    @RequestMapping(value = "/products/{pid}", method = {
        RequestMethod.GET}, produces = "text/html;charset=UTF-8")
    public ModelAndView editProduct(
        @CurrentUser User user,
        @PathVariable("pid") String pid,
        HttpServletResponse response
    ) throws IOException, ServletException {
        response.setHeader("Content-Type", "text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        ModelAndView mv = new ModelAndView("admin/admin-product-form");
        if (user != null && user.getState().equals(adminNumber)) {
            mv.addObject("status", Constants.SUCCESS);
            Product product = productService.findByPidAdmin(pid);
            List<Category> list = categoryService.findAllNoRedis();
            mv.addObject("data", product);
            mv.addObject("categories", list);
        } else {
            mv.addObject("status", Constants.ERROR);
            mv.addObject("msg", "权限不够或未登陆");
        }
        return mv;
    }

    @Authorization
    @RequestMapping(value = "/products/{pid}", method = {
        RequestMethod.DELETE}, produces = "text/json;charset=UTF-8")
    public ResponseEntity deleteProduct(
        @CurrentUser User user,
        @PathVariable("pid") String pid
    ) throws IOException, ServletException {
        Map<String, Object> map = new LinkedHashMap<>(2);

        if (user != null && user.getState().equals(adminNumber)) {
            map.put("status", Constants.SUCCESS);
            boolean mark = productService.deleteProductByState(pid);
            if (mark) {
                map.put("msg", "删除成功");
            } else {
                map.put("msg", "删除失败");
            }
        } else {
            map.put("status", Constants.ERROR);
            map.put("msg", "权限不够或未登陆");
        }
        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }

    @Authorization
    @RequestMapping(value = "/products/{pid}", method = {
        RequestMethod.PUT}, produces = "text/json;charset=UTF-8")
    public ResponseEntity updateProduct(
        @CurrentUser User user,
        @PathVariable("pid") String pid,
        @RequestBody Product product,
        HttpServletRequest request
    ) throws IOException, ServletException {
        Map<String, Object> map = new LinkedHashMap<>(2);

        if (user != null && user.getState().equals(adminNumber)) {
            boolean mark0 = false;
            boolean mark = false;
            map.put("status", Constants.SUCCESS);
            Product product0 = productService.findByPidAdmin(pid);

            if (product0 != null && product0.getImage().trim().equals(product.getImage().trim())) {
                mark0 = true;
            } else {
                mark0 = fileUtils.uploadImageToLocalDisk(request, product.getImage());
            }

            if (mark0) {
                mark = productService.updateByPidNoRedis(product);
            }
            if (mark) {
                map.put("msg", "商品更新成功");
            } else {
                map.put("msg", "商品更新失败");
            }
        } else {
            map.put("status", Constants.ERROR);
            map.put("msg", "权限不够或未登陆");
        }
        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }

    @Authorization
    @RequestMapping(value = "/products/upload-img", method = {
        RequestMethod.POST}, produces = "text/json;charset=UTF-8")
    public ResponseEntity uploadImage(
        @CurrentUser User user,
        @RequestParam(value = "file", required = false) MultipartFile file
    ) throws IOException, ServletException {
        Map<String, Object> map = new LinkedHashMap<>(3);
        if (user != null && user.getState().equals(adminNumber)) {
            String pathName = fileUtils.uploadImageToRedis(productImgFilePathSuffix, file);
            if (pathName == null || pathName.length() < 1) {
                map.put("status", Constants.ERROR);
                map.put("msg", " 图片上传失败");
            } else {
                map.put("status", Constants.SUCCESS);
                map.put("data", pathName);
                log.debug("上传图片成功");
            }
        } else {
            map.put("status", Constants.ERROR);
            map.put("msg", "权限不够或未登陆");
        }
        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }


    @Authorization
    @RequestMapping(value = "/orders", method = {RequestMethod.GET})
    public ModelAndView getOrderList(
        @CurrentUser User user
    ) throws IOException, ServletException {
        ModelAndView mv = new ModelAndView("admin/admin-orders-list");
        if (user != null && user.getState().equals(adminNumber)) {
            mv.addObject("status", Constants.SUCCESS);
            List<Orders> list = ordersService.findAll();
            mv.addObject("data", list);
            mv.addObject("count", list.size());
        } else {
            mv.addObject("status", Constants.ERROR);
            mv.addObject("msg", "权限不够或未登陆");
        }

        return mv;
    }


    @Authorization
    @RequestMapping(value = "/orders/{oid}", method = {
        RequestMethod.GET}, produces = "text/html;charset=UTF-8")
    public ModelAndView editOrder(
        @CurrentUser User user,
        @PathVariable("oid") String oid
    ) throws IOException, ServletException {

        ModelAndView mv = new ModelAndView("admin/admin-orders-form");
        if (user != null && user.getState().equals(adminNumber)) {
            mv.addObject("status", Constants.SUCCESS);
            Orders order = ordersService.findByOid(oid);
            mv.addObject("data", order);
        } else {
            mv.addObject("status", Constants.ERROR);
            mv.addObject("msg", "权限不够或未登陆");
        }
        return mv;
    }


    @Authorization
    @RequestMapping(value = "/orders/{oid}", method = {
        RequestMethod.PUT}, produces = "text/json;charset=UTF-8")
    public ResponseEntity updateOrder(
        @CurrentUser User user,
        @PathVariable("oid") String oid,
        @RequestBody Orders orders,
        HttpServletRequest request
    ) throws IOException, ServletException {
        Map<String, Object> map = new LinkedHashMap<>(2);

        if (user != null && user.getState().equals(adminNumber)) {
            map.put("status", Constants.SUCCESS);
            boolean mark = ordersService.updateByOid(orders);
            if (mark) {
                map.put("msg", "订单更新成功");
            } else {
                map.put("msg", "订单更新失败");
            }
        } else {
            map.put("status", Constants.ERROR);
            map.put("msg", "权限不够或未登陆");
        }
        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }

    @Authorization
    @RequestMapping(value = "/orders/{oid}", method = {
        RequestMethod.DELETE}, produces = "text/json;charset=UTF-8")
    public ResponseEntity deleteOrder(
        @CurrentUser User user,
        @PathVariable("oid") String oid
    ) throws IOException, ServletException {
        Map<String, Object> map = new LinkedHashMap<>(2);

        if (user != null && user.getState().equals(adminNumber)) {
            map.put("status", Constants.SUCCESS);
            boolean mark = ordersService.deleteByOid(oid);
            if (mark) {
                map.put("msg", "删除成功");
            } else {
                map.put("msg", "删除失败");
            }
        } else {
            map.put("status", Constants.ERROR);
            map.put("msg", "权限不够或未登陆");
        }
        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }

    @Authorization
    @RequestMapping(value = "/orders/item/{oid}", method = {
        RequestMethod.GET}, produces = "text/json;charset=UTF-8")
    public ModelAndView showOrdersItem(
        @CurrentUser User user,
        @PathVariable("oid") String oid
    ) throws IOException, ServletException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/admin-orders-item-list");

        if (user != null && user.getState().equals(adminNumber)) {
            List<OrderItem> list = orderItemService.findByOid(oid);
            if (list != null && list.size() > 0) {
                mv.addObject("status", Constants.SUCCESS);
                mv.addObject("data", list);
            } else {
                mv.addObject("status", Constants.ERROR);
                mv.addObject("msg", "没有订单项");
            }


        } else {
            mv.addObject("status", Constants.ERROR);
            mv.addObject("msg", "权限不够或未登陆");
        }
        return mv;
    }

    @Authorization
    @RequestMapping(value = "/express/{oid}", method = {
        RequestMethod.GET}, produces = "text/json;charset=UTF-8")
    public ModelAndView showExpressItem(
        @CurrentUser User user,
        @PathVariable("oid") String oid
    ) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        if (user != null && user.getState().equals(adminNumber)) {
            Express express = expressService.findByOid(oid);
            modelAndView.setViewName("admin/admin-orders-express");
            //请求
            if (express != null) {
                Logistics logistics = kdApiService
                    .getOrderTracesByJson(express.getShipperCode(), express.getLogisticCode());
                if (logistics.getState() != null) {
                    modelAndView.addObject("status", Constants.SUCCESS);
                    modelAndView.addObject("logistics", logistics);
                } else {
                    modelAndView.addObject("status", Constants.ERROR);
                    modelAndView.addObject("msg", "未查询到物流");
                }
            } else {
                modelAndView.addObject("status", Constants.ERROR);
                modelAndView.addObject("msg", "暂无快递信息");
                express = new Express();
                express.setOid(oid);
            }
            modelAndView.addObject("express", express);

        } else {
            modelAndView.addObject("status", Constants.ERROR);
            modelAndView.addObject("msg", "验证失效，请重新登陆");
        }

        return modelAndView;
    }

    @Authorization
    @RequestMapping(value = "/express/{oid}", method = {
        RequestMethod.PUT}, produces = "text/json;charset=UTF-8")
    public ResponseEntity addExpress(
        @CurrentUser User user,
        @PathVariable("oid") String oid,
        @RequestBody Express express
    ) throws Exception {
        Map<String, Object> map = new LinkedHashMap<>(2);

        if (user != null && user.getState().equals(adminNumber)) {
            boolean mark = expressService.updateByEid(express);
            if (mark) {
                map.put("status", Constants.SUCCESS);
                map.put("msg", "添加物流成功");
            } else {
                map.put("status", Constants.ERROR);
                map.put("msg", "添加物流失败");
            }

        } else {
            map.put("status", Constants.ERROR);
            map.put("msg", "验证失效，请重新登陆");
        }

        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }


    @Authorization
    @RequestMapping(value = "/product-details", method = {RequestMethod.GET})
    public ModelAndView getProductDetailsList(
        @CurrentUser User user
    ) throws IOException, ServletException {
        ModelAndView mv = new ModelAndView("admin/admin-product-details-list");
        if (user != null && user.getState().equals(adminNumber)) {

            mv.addObject("status", Constants.SUCCESS);
            List<ProductDetails> list = productService.findDetailsAllByAdmin();
            mv.addObject("data", list);
            mv.addObject("count", list.size());

        } else {
            mv.addObject("status", Constants.ERROR);
            mv.addObject("msg", "权限不够或未登陆");
        }

        return mv;
    }

    @Authorization
    @RequestMapping(value = "/product-details/{id}", method = {
        RequestMethod.GET}, produces = "text/html;charset=UTF-8")
    public ModelAndView editProductDetails(
        @CurrentUser User user,
        @PathVariable("id") Long id,
        HttpServletResponse response
    ) throws IOException, ServletException {
        response.setHeader("Content-Type", "text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        ModelAndView mv = new ModelAndView("admin/admin-product-details-form");
        if (user != null && user.getState().equals(adminNumber)) {
            mv.addObject("status", Constants.SUCCESS);
            ProductDetails details = productService.findDetailsByIdAdmin(id);
            mv.addObject("data", details);
        } else {
            mv.addObject("status", Constants.ERROR);
            mv.addObject("msg", "权限不够或未登陆");
        }
        return mv;
    }

    @Authorization
    @RequestMapping(value = "/product-details/{id}", method = {
        RequestMethod.DELETE}, produces = "text/json;charset=UTF-8")
    public ResponseEntity editProductDetails(
        @CurrentUser User user,
        @PathVariable("id") Long id
    ) throws IOException, ServletException {
        Map<String, Object> map = new LinkedHashMap<>(2);

        if (user != null && user.getState().equals(adminNumber)) {
            map.put("status", Constants.SUCCESS);
            boolean mark = productService.deleteProductDetailsById(id);
            if (mark) {
                map.put("msg", "删除成功");
            } else {
                map.put("msg", "删除失败");
            }
        } else {
            map.put("status", Constants.ERROR);
            map.put("msg", "权限不够或未登陆");
        }
        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }


    @Authorization
    @RequestMapping(value = "/product-details/upload-img", method = {
        RequestMethod.POST}, produces = "text/json;charset=UTF-8")
    public ResponseEntity uploadImages(
        @CurrentUser User user,
        @RequestParam(value = "file", required = false) MultipartFile file
    ) throws IOException, ServletException {
        Map<String, Object> map = new LinkedHashMap<>(3);
        if (user != null && user.getState().equals(adminNumber)) {
            String pathName = fileUtils.uploadImageToRedis(productDetailsImgFilePathSuffix, file);
            if (pathName == null || pathName.length() < 1) {
                map.put("status", Constants.ERROR);
                map.put("msg", " 图片上传失败");
            } else {
                map.put("status", Constants.SUCCESS);
                log.debug("上传图片成功");
                map.put("data", pathName + productDetailsImagesRegex);
            }
        } else {
            map.put("status", Constants.ERROR);
            map.put("msg", "权限不够或未登陆");
        }
        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }


    @Authorization
    @RequestMapping(value = "/product-details/{id}", method = {
        RequestMethod.PUT}, produces = "text/json;charset=UTF-8")
    public ResponseEntity updateProductDetails(
        @CurrentUser User user,
        @PathVariable("id") Long id,
        @RequestBody ProductDetails productDetails,
        HttpServletRequest request
    ) throws IOException, ServletException {
        Map<String, Object> map = new LinkedHashMap<>(2);

        if (user != null && user.getState().equals(adminNumber)) {
            boolean mark0;
            boolean mark = false;
            map.put("status", Constants.SUCCESS);
            ProductDetails productDetails1 = productService.findDetailsByIdAdmin(id);
            if (productDetails1 != null &&
                productDetails.getImages().trim().equals(productDetails1.getImages().trim())) {
                mark0 = true;
            } else {
                mark0 = fileUtils.uploadImagesToLocalDisk(request,
                    productDetails.getImages(), productDetailsImagesRegex);
            }
            if (mark0) {
                try {
                    mark = productService.updateDetailsByIdNoRedis(productDetails);
                } catch (Exception e) {
                    mark = false;
                }
            }
            if (mark) {
                map.put("msg", "商品更新成功");
            } else {
                map.put("msg", "商品更新失败");
            }
        } else {
            map.put("status", Constants.ERROR);
            map.put("msg", "权限不够或未登陆");
        }
        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }


}
