package com.web.service;

import com.web.bean.temp.Logistics;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/5/19 13:37
 * @description:
 */
public interface KdApiService {

    public Logistics getOrderTracesByJson(String shipperCode, String logisticCode) throws Exception;
}
