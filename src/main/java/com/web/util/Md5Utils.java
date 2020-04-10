package com.web.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/9 13:54
 * @description:
 */
public class Md5Utils {

    public static void main(String[] args) {
        String password = "123";

        System.out.println(Md5Utils.MD5(password));
    }

    //单向加密
    public static String MD5(String password) {

        byte[] secretBytes = null;
        try {
            secretBytes = java.security.MessageDigest.getInstance("md5")
                .digest(password.getBytes());
        } catch (java.security.NoSuchAlgorithmException e) {
            throw new RuntimeException("找不到源字符串");
        }
        String md5code = new BigInteger(1, secretBytes).toString(16);
        for (int i = 0; i < 32 - md5code.length(); i++) {
            md5code = "0" + md5code;
        }
        return md5code;
    }

    //base64加密
    public static String base64Encode(String str) {
        BASE64Encoder baseEncode = new BASE64Encoder();
        return baseEncode.encode(str.getBytes());//加密
    }

    //base64解密
    public static String base64Decode(String str) {
        BASE64Decoder baseDecoder = new BASE64Decoder();
        try {
            return new String(baseDecoder.decodeBuffer(str));//解密
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }


}
