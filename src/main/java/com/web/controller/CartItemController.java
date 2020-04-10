package com.web.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.github.pagehelper.PageInfo;
import com.web.annotation.Authorization;
import com.web.annotation.CurrentUser;
import com.web.bean.pojo.CartItem;
import com.web.bean.pojo.User;
import com.web.service.CartItemService;
import com.web.util.Constants;
import com.web.util.JsonUtils;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/25 19:05
 * @description:
 */
@Controller
public class CartItemController {

    private Logger log = Logger.getLogger(getClass());

    @Autowired
    private JsonUtils jsonUtils;

    @Autowired
    private CartItemService cartItemService;

    /**
     * 登陆情况下，获取用户的购物车项
     *
     * @return 返回页面
     */
    @Authorization
    @RequestMapping(value = "/cartItem", method = RequestMethod.GET)
    public ModelAndView getCartViewByUid(
        @CurrentUser User user,
        @RequestParam(value = "pageNum", required = false, defaultValue = "1") Integer pageNum,
        @RequestParam(value = "pageSize", required = false, defaultValue = "5") Integer pageSize
    ) throws JsonProcessingException {

        ModelAndView mv = new ModelAndView("user/shop-shopping-cart");

        if (user != null) {
            List<CartItem> list2 = cartItemService.findByUid(user.getUid());
            Double allTotal = 0.0;
            for (CartItem c : list2) {
                allTotal += c.getSubtotal();
            }
            List<CartItem> list = cartItemService.findByUid(pageNum, pageSize, user.getUid());
            if (list == null || list.size() < 1) {
                mv.addObject("status", Constants.ERROR);
                mv.addObject("msg", "购物车为空");
            } else {
                PageInfo<CartItem> pageInfo = new PageInfo<>(list);
                mv.addObject("status", Constants.SUCCESS);
                mv.addObject("data", pageInfo);
                mv.addObject("allTotal", allTotal);
            }
        } else {
            mv.addObject("status", Constants.ERROR);
            mv.addObject("msg", "验证失效，请重新登陆");
        }
        return mv;

    }


    /**
     * 登录情况下，获取所有购物车项
     *
     * @return 返回json
     */
    @Authorization
    @RequestMapping(value = "/cartItem", method = RequestMethod.POST)
    public ResponseEntity getCarJsonByUid(
        @CurrentUser User user
    ) throws JsonProcessingException {
        Map<String, Object> map = new LinkedHashMap<>(3);

        if (user != null) {
            List<CartItem> list = cartItemService.findByUid(user.getUid());
            if (list == null || list.size() == 0) {
                map.put("status", Constants.ERROR);
                map.put("msg", "购物车什么都没有");
            } else {
                Double allTotal = 0.0;
                for (CartItem c : list) {
                    allTotal += c.getSubtotal();
                }
                map.put("status", Constants.SUCCESS);
                map.put("data", list);
                map.put("total", allTotal);
            }
        } else {
            map.put("status", Constants.ERROR);
            map.put("msg", "验证失效，请重新登陆");
        }
        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);

    }


    /**
     * 登录情况下，添加一个购物车项
     *
     * @return 返回json
     */
    @Authorization
    @RequestMapping(value = "/cartItem/{pid}/{count}", method = RequestMethod.GET)
    public ResponseEntity addCartItem(
        @CurrentUser User user,
        @PathVariable("pid") String pid,
        @PathVariable("count") Long count
    ) throws JsonProcessingException {
        Map<String, Object> map = new LinkedHashMap<>(3);
        if (user == null) {
            map.put("status", Constants.ERROR);
            map.put("msg", "你没有登陆");
        } else {
            boolean mark = cartItemService.addCartItem(user.getUid(), pid, count);
            if (mark) {
                map.put("status", Constants.SUCCESS);
                map.put("msg", "添加成功");
            } else {
                map.put("status", Constants.ERROR);
                map.put("msg", "添加失败");
            }
        }
        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }

    /**
     * 登录情况下，删除购物车项
     *
     * @return 返回json
     */
    @Authorization
    @RequestMapping(value = "/cartItem/{pid}", method = RequestMethod.DELETE)
    public ResponseEntity deleteCartItem(
        @CurrentUser User user,
        @PathVariable("pid") String pid
    ) throws JsonProcessingException {
        Map<String, Object> map = new LinkedHashMap<>(2);
        if (user == null) {
            map.put("status", Constants.ERROR);
            map.put("msg", "你没有登陆");

        } else {
            boolean mark = cartItemService.deleteCartItem(user.getUid(), pid);
            if (mark) {
                map.put("status", Constants.SUCCESS);
                map.put("msg", "刪除成功");
            } else {
                map.put("status", Constants.ERROR);
                map.put("msg", "刪除失敗");
            }
        }
        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }


    /**
     * 登录情况下，更新购物车项
     *
     * @return 返回json
     */
    @Authorization
    @RequestMapping(value = "/cartItem/{pid}/{count}", method = RequestMethod.PUT)
    public ResponseEntity updateCartItem(
        @CurrentUser User user,
        @PathVariable("pid") String pid,
        @PathVariable("count") Long count
    ) throws JsonProcessingException {
        Map<String, Object> map = new LinkedHashMap<>(2);
        if (user == null) {
            map.put("status", Constants.ERROR);
            map.put("msg", "你没有登陆");
        } else {
            boolean mark = cartItemService.updateCartItem(user.getUid(), pid, count, 0);
            if (mark) {
                map.put("status", Constants.SUCCESS);
                map.put("msg", "更新成功");
            } else {
                map.put("status", Constants.ERROR);
                map.put("msg", "更新失败");
            }
        }
        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }


}
