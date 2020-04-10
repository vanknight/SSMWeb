package com.web.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.web.annotation.Authorization;
import com.web.annotation.CurrentUser;
import com.web.annotation.FormIsInvalid;
import com.web.bean.temp.TokenModel;
import com.web.bean.pojo.User;
import com.web.service.EmailService;
import com.web.service.UserService;
import com.web.util.Constants;
import com.web.util.JsonUtils;
import com.web.util.Md5Utils;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/10 14:25
 * @description:
 */
@Controller
@RequestMapping("/user")
public class UserController {

    private Logger log = Logger.getLogger(getClass());

    @Autowired
    private JsonUtils jsonUtils;

    @Autowired
    private UserService userService;

    @Autowired
    private EmailService emailService;

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ResponseEntity register(
        @ModelAttribute("user") User user, HttpServletRequest request
    ) throws JsonProcessingException {
        Map<String, Object> map = new LinkedHashMap<>(2);

        log.debug("注册用户信息 : " + user);

        if (user != null) {

            String deCode = userService.createRegisterCode(user);
            boolean mark = true;
            if (deCode != null) {
                try {
                    String path = request.getContextPath();
                    String urlPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
                    mark = emailService
                        .registerSend(user.getUsername(), "一个小时后失效", user.getEmail(), deCode,urlPath);
                } catch (UnsupportedEncodingException | GeneralSecurityException | MessagingException e) {
                    e.printStackTrace();
                    mark = false;
                }
                if (mark) {
                    map.put("status", 0);
                    map.put("msg", "注册成功，请去邮箱激活");
                    return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
                } else {
                    map.put("status", 1);
                    map.put("msg", "邮件发送失败，请稍后重试");
                    return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
                }
            } else {
                map.put("status", 1);
                map.put("msg", "不可注册");
                return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
            }
        } else {
            map.put("status", 1);
            map.put("msg", "注册失败，请重新填写");
            return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
        }
    }

    @RequestMapping(value = "/register/{enCode}", method = RequestMethod.GET)
    public ModelAndView register(
        @PathVariable("enCode") String enCode
    ) throws JsonProcessingException {

        Map<String, Object> map = new LinkedHashMap<>(2);
        ModelAndView modelAndView = new ModelAndView("base/shop-msg");

        log.debug("注册enCode : " + enCode);
        Assert.notNull(enCode, "user can not be empty");
        boolean mark = userService.checkRegisterCode(enCode);
        if (mark) {
            modelAndView.addObject("msg", "激活成功，可以去登陆啦");
        } else {
            modelAndView.addObject("msg", "激活失效,请联系管理员");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/forget-password", method = RequestMethod.POST)
    public ResponseEntity forgetPasswordForm(
        @RequestParam("username") String username,
        @RequestParam("email") String email,
        HttpServletRequest request
    ) throws JsonProcessingException {
        Map<String, Object> map = new LinkedHashMap<>(2);

        log.debug("修改密码验证 : username:" + username + " email:" + email);

        User user = userService.findByUsernameAndEmail(username.trim(), email.trim());

        if (user != null) {

            String deCode = userService.createForgetPassWordCode(user);

            boolean mark = true;
            try {
                String path = request.getContextPath();
                String urlPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
                mark = emailService.forgetPasswordSend(user.getUsername(), "一个小时后失效", user.getEmail(), deCode,urlPath);
            } catch (UnsupportedEncodingException | GeneralSecurityException | MessagingException e) {
                e.printStackTrace();
                mark = false;
            }

            if (mark) {
                map.put("status", 0);
                map.put("msg", "已发送重置密码的邮件到邮箱，请去重置");
                return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
            } else {
                map.put("status", 1);
                map.put("msg", "邮箱不可使用");
                return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
            }
        } else {
            map.put("status", 1);
            map.put("msg", "验证失败，请重新填写");
            return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
        }
    }

    @RequestMapping(value = "/forget-password/{enCode}", method = RequestMethod.POST)
    public ResponseEntity forgetPassword(
        @PathVariable("enCode") String enCode,
        @RequestParam("password") String password
    ) throws JsonProcessingException {

        Map<String, Object> map = new LinkedHashMap<>(2);

        log.debug("注册enCode : " + enCode);
        Assert.notNull(enCode, "user can not be empty");
        boolean mark = userService.checkForgetPassWordCode(enCode, password);

        if (mark) {
            map.put("status",Constants.SUCCESS);
            map.put("msg", "重置密码成功，可以去登陆啦");
        } else {
            map.put("status",Constants.ERROR);
            map.put("msg", "重置失败，请联系管理员");
        }
        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);



    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ResponseEntity login(
        @RequestParam("username") String username,
        @RequestParam("password") String password,
        @RequestParam(value = "autoLogin", required = false, defaultValue = "false") boolean autoLogin,
        @FormIsInvalid String randomValue
    ) throws JsonProcessingException {
        log.debug("请求了login-PUT");

        Map<String, Object> map = new LinkedHashMap<>(2);

        Assert.notNull(username, "username can not be empty");
        Assert.notNull(password, "password can not be empty");

        log.info("randomValue : " + randomValue);

        if (randomValue.startsWith("ERROR")) {
            map.put("status", Constants.ERROR);
            map.put("msg", "表单失效，请刷新!");
            return new ResponseEntity<String>(jsonUtils.toJson(map), HttpStatus.OK);
        }

        User user = userService.findByUsername(username);

        if (user == null || user.getPassword() == null ||
            !user.getPassword().equals(Md5Utils.MD5(password))) {
            map.put("status", Constants.ERROR);
            map.put("msg", "密码或者用户名不正确");
        } else if (user.getState() == 0) {
            map.put("status", Constants.ERROR);
            map.put("msg", "用户未激活");
        } else {

            TokenModel model = userService.createToken(user.getUid(), autoLogin);

            map.put("status", Constants.SUCCESS);
            map.put("data", model);
            log.debug("\n一个用户验证成功 : " + jsonUtils.toJson(model) + "\n");
            if (randomValue.startsWith("OK")) {
                log.debug("sessionID值为 : " + randomValue.split("_")[1]);
                userService.removeRandomKey(randomValue.split("_")[1]);
            }
        }
        return new ResponseEntity<String>(jsonUtils.toJson(map), HttpStatus.OK);
    }

    @Authorization
    @RequestMapping(value = "/logout", method = RequestMethod.DELETE)
    public ResponseEntity logout(
        @CurrentUser User user
    ) throws JsonProcessingException {
        Map<String, Object> map = new LinkedHashMap<>(2);
        if (user == null) {
            map.put("status", Constants.ERROR);
            map.put("msg", "你没有登录");
            return new ResponseEntity<String>(jsonUtils.toJson(map), HttpStatus.OK);
        }
        userService.deleteToken(user.getUid());
        log.info("退出登陆："+user.getUid());
        map.put("status", Constants.SUCCESS);
        map.put("msg", "你已经退出登录");
        return new ResponseEntity<String>(jsonUtils.toJson(map), HttpStatus.OK);
    }


    @Authorization
    @RequestMapping(value = "/checkToken", method = {RequestMethod.GET, RequestMethod.POST})
    public ResponseEntity checkToken(
        @CurrentUser User user
    ) throws IOException, ServletException {

        Map<String, Object> map = new LinkedHashMap<>(2);
        if (user != null) {
            user.setPassword(null);
            map.put("status", Constants.SUCCESS);
            map.put("user", user);
            log.info("登陆用户:"+user.toString());
        } else {
            map.put("status", Constants.ERROR);
            map.put("msg", "验证失效，请重新登陆");
        }
        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }


    @RequestMapping(value = "/checkUserName/{username}", method = RequestMethod.GET)
    public ResponseEntity checkUserName(
        @PathVariable("username") String username
    ) throws JsonProcessingException {
        Map<String, Object> map = new LinkedHashMap<>(2);
        User user = userService.findByUsername(username);
        if (user != null) {
            map.put("status", Constants.ERROR);
            map.put("msg", "用户名不可用");
        } else {
            map.put("status", Constants.SUCCESS);
            map.put("msg", "用户名可用");
        }
        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }


    @RequestMapping(value = "/checkEmail/{email}", method = RequestMethod.GET)
    public ResponseEntity checkEmail(
        @PathVariable("email") String email
    ) throws JsonProcessingException {
        Map<String, Object> map = new LinkedHashMap<>(2);
        User user = userService.findByEmail(email);
        if (user != null) {
            map.put("status", Constants.ERROR);
            map.put("msg", "邮箱不可用");
        } else {
            map.put("status", Constants.SUCCESS);
            map.put("msg", "邮箱可用");
        }
        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }

}
