package com.web.annotation.resolvers;

import com.web.annotation.FormIsInvalid;
import com.web.service.impl.UserServiceImpl;
import com.web.util.Constants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.MethodParameter;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/13 11:20
 * @description:
 */
@Component
public class FormIsInvalidMethodArgumentResolver implements HandlerMethodArgumentResolver {

    private Logger log = LoggerFactory.getLogger(FormIsInvalidMethodArgumentResolver.class);
    @Autowired
    private UserServiceImpl userService;

    @Override
    public boolean supportsParameter(MethodParameter methodParameter) {
        return methodParameter.getParameterType().isAssignableFrom(String.class) &&
            methodParameter.hasParameterAnnotation(FormIsInvalid.class);
    }

    @Nullable
    @Override
    public Object resolveArgument(
        MethodParameter methodParameter,
        @Nullable ModelAndViewContainer modelAndViewContainer,
        NativeWebRequest nativeWebRequest,
        @Nullable WebDataBinderFactory webDataBinderFactory
    ) throws Exception {

        String sessionID = nativeWebRequest.getSessionId();
        String randomValue = (String) nativeWebRequest
            .getAttribute(Constants.REQUEST_RANDOM_NAME, RequestAttributes.SCOPE_REQUEST);

        log.debug("获取到的sessionID : " + sessionID);
        log.debug("获取到的randomValue : " + randomValue);

        if (userService.checkRandomValue(sessionID, randomValue)) {
            log.debug("randomKey验证成功");
            return "OK_" + sessionID;
        }
        return "ERROR_" + sessionID;
    }
}