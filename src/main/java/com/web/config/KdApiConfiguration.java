package com.web.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/5/19 13:26
 * @description:
 */
@Component
public class KdApiConfiguration {

    //电商ID
    public static String EBusinessID;
    //电商加密私钥，快递鸟提供，注意保管，不要泄漏
    public static String AppKey;
    //请求url, 正式环境地址：http://api.kdniao.cc/api/Eorderservice    测试环境地址：http://testapi.kdniao.cc:8081/api/EOrderService
    public static String ReqURL;


    @Value("${kdapi.appKey}")
    public void setAppKey(String appKey) {
        KdApiConfiguration.AppKey = appKey;
    }

    @Value("${kdapi.eBusinessID}")
    public void setEBusinessID(String EBusinessID) {
        KdApiConfiguration.EBusinessID = EBusinessID;
    }

    @Value("${kdapi.reqURL}")
    public void setReqURL(String reqURL) {
        KdApiConfiguration.ReqURL = reqURL;
    }
}
