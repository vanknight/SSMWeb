package com.web.util;

import java.util.Properties;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/12 13:58
 * @description:
 */
@Component
public class Constants {

    //controller
    public static int ERROR = 1;
    public static int SUCCESS = 0;

    //serivce
    public static String REDIS_TOKEN_PREFIX = "JwtRedis";
    public static String REDIS_USER_PREFIX = "VanKnight";
    public static String REDIS_FILE_PREFIX = "VanKnightFile";
    public static String REGISTER_CODE_PREFIX = "RegisterCode";
    public static String FORGETPASSWORD_CODE_PREFIX = "ForgetPasswordCode";

    //interceptor
    public static String AUTH_PREFIX = "Bearer ";
    public static String RANDOM_PREFIX = "Random ";
    public static String AUTH_HEADER_NAME = "Authorization";
    public static String RANDOM_HEADER_NAME = "RandomNumber";

    public static String COOKIE_JWT_NAME = "JwtCookie";

    //temp-临时
    public static String REQUEST_UID_NAME = "UserID";
    public static String REQUEST_TOKEN_NAME = "Jwt";
    public static String REQUEST_RANDOM_NAME = "Random";

    public static String PUBLIC_KEY = "VanKnight";

    //业务
    public static Integer REMEMBER_TIME = 36000000;
    public static Integer UN_REMEMBER_TIME = 3600;

    public static Integer UN_PAY = 0;
    public static Integer ALREADY_PAY = 1;
    public static Integer RECEIPTED = 2;
    public static Integer REFUNDED = 3;


    public static Integer PRO_DOWN = 1;
    public static Integer PRO_UP = 0;

}
