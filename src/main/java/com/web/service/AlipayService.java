package com.web.service;

import com.alipay.api.AlipayApiException;
import com.alipay.api.domain.AlipayTradeFastpayRefundQueryModel;
import com.alipay.api.domain.AlipayTradePagePayModel;
import com.alipay.api.domain.AlipayTradePrecreateModel;
import com.alipay.api.domain.AlipayTradeQueryModel;
import com.alipay.api.domain.AlipayTradeRefundModel;
import com.alipay.api.domain.GoodsDetail;
import com.alipay.api.response.AlipayTradeFastpayRefundQueryResponse;
import com.alipay.api.response.AlipayTradePagePayResponse;
import com.alipay.api.response.AlipayTradePrecreateResponse;
import com.alipay.api.response.AlipayTradeQueryResponse;
import com.alipay.api.response.AlipayTradeRefundResponse;
import com.web.bean.pojo.Orders;
import java.util.List;
import java.util.Map;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/5/5 14:16
 * @description:
 */
public interface AlipayService {

    /**
     * 对于商户而封装的支付方法
     */
    AlipayTradePagePayResponse shopTradePay(Orders orders, List<GoodsDetail> goodsDetails,
        String returnURL, String... notifyURL)
        throws AlipayApiException;

    /**
     * 订单查询
     */
    AlipayTradeQueryResponse shopTradeQuery(String oid)
        throws AlipayApiException;

    /**
     * 二维码生成
     */
    AlipayTradePrecreateResponse shopTradePrecreate(Orders orders, List<GoodsDetail> goodsDetails)
        throws AlipayApiException;

    /**
     * 对支付宝传入参数的验证
     */
    boolean rsaCheckV1(Map<String, String> params)
        throws AlipayApiException;

    /**
     * xxx
     */
    AlipayTradeRefundResponse shopTradeRefund(Orders orders, String reason)
        throws AlipayApiException;

    AlipayTradeFastpayRefundQueryResponse shopTradeRefundQuery(String oid)
        throws AlipayApiException;


    AlipayTradePagePayResponse alipayTradePay(AlipayTradePagePayModel alipayModel,
        String returnURL, String... notifyURL)
        throws AlipayApiException;

    AlipayTradeQueryResponse alipayTradeQuery(AlipayTradeQueryModel model)
        throws AlipayApiException;

    AlipayTradeRefundResponse alipayTradeRefund(AlipayTradeRefundModel model)
        throws AlipayApiException;

    AlipayTradePrecreateResponse alipayTradePrecreate(AlipayTradePrecreateModel model)
        throws AlipayApiException;

    AlipayTradeFastpayRefundQueryResponse alipayTradeRefundQuery(
        AlipayTradeFastpayRefundQueryModel alipayModel) throws AlipayApiException;

}
