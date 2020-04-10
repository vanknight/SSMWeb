package com.web.annotation.resolvers;


import com.web.annotation.CurrentUser;
import com.web.bean.pojo.User;
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
 * @date-Time: 2018/4/12 14:34
 * @description:
 */
@Component
public class CurrentUserMethodArgumentResolver implements HandlerMethodArgumentResolver {

    private Logger log = LoggerFactory.getLogger(CurrentUserMethodArgumentResolver.class);

    @Autowired
    private UserServiceImpl userService;

    @Override
    public boolean supportsParameter(MethodParameter methodParameter) {
        return methodParameter.getParameterType().isAssignableFrom(User.class) &&
            methodParameter.hasParameterAnnotation(CurrentUser.class);
    }

    @Nullable
    @Override
    public Object resolveArgument(
        MethodParameter methodParameter,
        @Nullable ModelAndViewContainer modelAndViewContainer,
        NativeWebRequest nativeWebRequest,
        @Nullable WebDataBinderFactory webDataBinderFactory
    ) throws Exception {
        String currentUserId = (String) nativeWebRequest
            .getAttribute(Constants.REQUEST_UID_NAME,
                RequestAttributes.SCOPE_REQUEST);

//        log.debug("通过request获取的UserId:" + currentUserId);

        if (currentUserId != null) {
            Object object = userService.findByUid(Long.valueOf(currentUserId));
//            log.debug("通过UserId获取的User:" + object);
            return object;
        }
        return null;
    }
}
