package com.web.annotation.interceptors;

import com.web.annotation.Authorization;
import com.web.bean.temp.TokenModel;
import com.web.service.impl.UserServiceImpl;
import com.web.util.Constants;
import java.io.IOException;
import java.lang.reflect.Method;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/12 14:20
 * @description:
 */
@Component
public class AuthorizationInterceptor extends HandlerInterceptorAdapter {

    private Logger log = LoggerFactory.getLogger(AuthorizationInterceptor.class);

    @Autowired
    private UserServiceImpl userService;

    //存放鉴权信息的Header名称，默认是Authorization
    private String authHeaderName = Constants.AUTH_HEADER_NAME;

    //鉴权信息的无用前缀，默认为空
    private String authPrefix = Constants.AUTH_PREFIX;

    private String randomHeaderName = Constants.RANDOM_HEADER_NAME;

    private String randomPrefix = Constants.RANDOM_PREFIX;

    @Override
    public boolean preHandle(HttpServletRequest request,
        HttpServletResponse response, Object handler) throws IOException {
        if (!(handler instanceof HandlerMethod)) {
            return true;
        }

        HandlerMethod handlerMethod = (HandlerMethod) handler;
        Method method = handlerMethod.getMethod();

        if (method.getAnnotation(Authorization.class) != null) {

            String authorization = request.getHeader(authHeaderName);

            if (authorization == null || "".equals(authorization)) {
                Cookie[] cookies = request.getCookies();
                if (cookies != null && cookies.length > 0) {
                    for (Cookie c : cookies) {
                        if (c.getName().equals(Constants.COOKIE_JWT_NAME)) {
                            authorization = c.getValue().replace("-", " ");

                        }
                    }
                }
            }

//            if (authorization == null || "".equals(authorization)) {
//                authorization = (String) request.getAttribute(authHeaderName);
//            }
//
//            if (authorization == null || "".equals(authorization)) {
//                authorization = request.getParameter(authHeaderName);
//            }

            //验证token
//            log.debug("获取到的authorization : " + authorization);

            if (authorization != null && authorization.startsWith(authPrefix) &&
                authorization.length() > 0) {
                authorization = authorization.substring(authPrefix.length());

                TokenModel model = userService.getToken(authorization);
                if (userService.checkToken(model)) {
                    //验证成功，存放user的id到request
                    log.debug("authorization验证成功 : " + authorization);

                    Cookie cookie1 = new Cookie(Constants.COOKIE_JWT_NAME,
                        authPrefix.trim() + "-" + authorization);
                    cookie1.setHttpOnly(true);
                    cookie1.setPath("/");
                    cookie1.setMaxAge(Constants.REMEMBER_TIME);
                    response.addCookie(cookie1);

                    request.setAttribute(Constants.REQUEST_UID_NAME, model.getUserId());
                    request.setAttribute(Constants.REQUEST_TOKEN_NAME, model.getToken());
                    return true;
                }
            }
            log.debug("authorization验证失败 : " + authorization);

            request.setAttribute(Constants.REQUEST_UID_NAME, null);
            return true;
        }

//        log.debug("Auth拦截器randomValue : " + request.getHeader(randomHeaderName));

        String randomValue = request.getHeader(randomHeaderName);

        if (randomValue != null && randomValue.length() > 0 &&
            randomValue.startsWith(randomPrefix)) {

            randomValue = randomValue.substring(randomPrefix.length());

            request.setAttribute(Constants.REQUEST_RANDOM_NAME, randomValue);
        } else {
            request.setAttribute(Constants.REQUEST_RANDOM_NAME, null);
        }

        return true;
    }


}
