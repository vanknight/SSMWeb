package com.web.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/5/10 14:13
 * @description:
 */
//@Configurable
@Component
public class AlipayConfiguration {

    public static String serverUrl;
    public static String appId;
    public static String privateKey;
    public static String format;
    public static String signType;
    public static String alipayPublicKey;
    public static String charset;

    @Value("${alipay.open_api_domain}")
    public void setServerUrl(String serverUrl) {
        AlipayConfiguration.serverUrl = serverUrl;
    }

    @Value("${alipay.appid}")
    public void setAppId(String appId) {
        AlipayConfiguration.appId = appId;
    }

    @Value("${alipay.private_key}")
    public void setPrivateKey(String privateKey) {
        AlipayConfiguration.privateKey = privateKey;
    }

    @Value("${alipay.format}")
    public void setFormat(String format) {
        AlipayConfiguration.format = format;
    }

    @Value("${alipay.sign_type}")
    public void setSignType(String signType) {
        AlipayConfiguration.signType = signType;
    }

    @Value("${alipay.alipay_public_key}")
    public void setAlipayPublicKey(String alipayPublicKey) {
        AlipayConfiguration.alipayPublicKey = alipayPublicKey;
    }

    @Value("${alipay.charset}")
    public void setCharset(String charset) {
        AlipayConfiguration.charset = charset;
    }
}
