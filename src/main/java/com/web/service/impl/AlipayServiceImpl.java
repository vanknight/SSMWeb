package com.web.service.impl;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.domain.AlipayTradeFastpayRefundQueryModel;
import com.alipay.api.domain.AlipayTradePagePayModel;
import com.alipay.api.domain.AlipayTradePrecreateModel;
import com.alipay.api.domain.AlipayTradeQueryModel;
import com.alipay.api.domain.AlipayTradeRefundModel;
import com.alipay.api.domain.GoodsDetail;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradeFastpayRefundQueryRequest;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.request.AlipayTradePrecreateRequest;
import com.alipay.api.request.AlipayTradeQueryRequest;
import com.alipay.api.request.AlipayTradeRefundRequest;
import com.alipay.api.response.AlipayTradeFastpayRefundQueryResponse;
import com.alipay.api.response.AlipayTradePagePayResponse;
import com.alipay.api.response.AlipayTradePrecreateResponse;
import com.alipay.api.response.AlipayTradeQueryResponse;
import com.alipay.api.response.AlipayTradeRefundResponse;
import com.web.bean.pojo.Orders;
import com.web.config.AlipayConfiguration;
import com.web.service.AlipayService;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by liuyangkly on 15/8/9. 简单main函数，用于测试当面付api sdk和demo的意见和问题反馈请联系：liuyang.kly@alipay.com
 */
@Service("alipayService")
public class AlipayServiceImpl implements AlipayService {

    private static Logger log = Logger.getLogger(AlipayServiceImpl.class);

    @Autowired
    private AlipayClient alipayClient;


    /**
     * 传入商户的订单bean,和商品list，构建AlipayTradePagePayModel
     */
    @Override
    public AlipayTradePagePayResponse shopTradePay(Orders orders, List<GoodsDetail> goodsDetails,
        String returnURL, String... notifyURL)
        throws AlipayApiException {
        AlipayTradePagePayModel alipayModel = new AlipayTradePagePayModel();
        alipayModel.setOutTradeNo(orders.getOid());
        alipayModel.setTotalAmount(String.valueOf(orders.getTotal()));
        alipayModel.setProductCode("FAST_INSTANT_TRADE_PAY");
        alipayModel.setSubject(orders.getOid());
        alipayModel.setBody(orders.getOid());
        alipayModel.setGoodsDetail(goodsDetails);
        alipayModel.setTimeoutExpress("1c");
        return alipayTradePay(alipayModel, returnURL, notifyURL);
    }

    /**
     * 订单查询
     */
    @Override
    public AlipayTradeQueryResponse shopTradeQuery(String oid)
        throws AlipayApiException {
        AlipayTradeQueryModel alipayModel = new AlipayTradeQueryModel();
        alipayModel.setOutTradeNo(oid);
        return alipayTradeQuery(alipayModel);
    }

    /**
     * 二维码生成
     */
    @Override
    public AlipayTradePrecreateResponse shopTradePrecreate(Orders orders,
        List<GoodsDetail> goodsDetails)
        throws AlipayApiException {
        AlipayTradePrecreateModel alipayModel = new AlipayTradePrecreateModel();
        alipayModel.setOutTradeNo(orders.getOid());
        alipayModel.setSubject(orders.getOid());
        alipayModel.setBody(orders.getOid());
        alipayModel.setStoreId(orders.getOid());

        alipayModel.setTotalAmount(String.valueOf(orders.getTotal()));
        alipayModel.setGoodsDetail(goodsDetails);
        alipayModel.setTimeoutExpress("90m");
        return alipayTradePrecreate(alipayModel);
    }

    /**
     * 验证传入参数是否正确--验签
     */
    @Override
    public boolean rsaCheckV1(Map<String, String> params) throws AlipayApiException {
        return AlipaySignature.rsaCheckV1(params,
            AlipayConfiguration.alipayPublicKey,
            AlipayConfiguration.charset, AlipayConfiguration.signType);

    }

    /**
     * xxx
     */
    @Override
    public AlipayTradeRefundResponse shopTradeRefund(Orders orders, String reason)
        throws AlipayApiException {

        AlipayTradeRefundModel alipayModel = new AlipayTradeRefundModel();
        alipayModel.setOutTradeNo(orders.getOid());
        alipayModel.setRefundReason(reason);

        alipayModel.setRefundAmount(String.valueOf(orders.getTotal()));
        return alipayTradeRefund(alipayModel);
    }

    @Override
    public AlipayTradeFastpayRefundQueryResponse shopTradeRefundQuery(String oid)
        throws AlipayApiException {
        AlipayTradeFastpayRefundQueryModel alipayModel = new AlipayTradeFastpayRefundQueryModel();
        alipayModel.setOutTradeNo(oid);
        alipayModel.setOutRequestNo(oid);
        return alipayTradeRefundQuery(alipayModel);
    }


    @Override
    public AlipayTradePagePayResponse alipayTradePay(AlipayTradePagePayModel alipayModel,
        String returnURL, String... notifyURL)
        throws AlipayApiException {
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(returnURL);
        alipayRequest.setBizModel(alipayModel);
        if (notifyURL != null && notifyURL.length > 0 && notifyURL[0].length() > 0) {
            alipayRequest.setNotifyUrl(notifyURL[0]);
        }
        AlipayTradePagePayResponse response = alipayClient.pageExecute(alipayRequest);
        return response;
    }

    @Override
    public AlipayTradeQueryResponse alipayTradeQuery(AlipayTradeQueryModel model)
        throws AlipayApiException {
        AlipayTradeQueryRequest alipayRequest = new AlipayTradeQueryRequest();
        alipayRequest.setBizModel(model);
        AlipayTradeQueryResponse response = alipayClient.execute(alipayRequest);
        return response;
    }

    @Override
    public AlipayTradeRefundResponse alipayTradeRefund(AlipayTradeRefundModel model)
        throws AlipayApiException {
        AlipayTradeRefundRequest alipayRequest = new AlipayTradeRefundRequest();
        alipayRequest.setBizModel(model);
        AlipayTradeRefundResponse response = alipayClient.execute(alipayRequest);
        return response;
    }

    @Override
    public AlipayTradePrecreateResponse alipayTradePrecreate(AlipayTradePrecreateModel model)
        throws AlipayApiException {
        AlipayTradePrecreateRequest alipayRequest = new AlipayTradePrecreateRequest();
        alipayRequest.setBizModel(model);
        AlipayTradePrecreateResponse response = alipayClient.execute(alipayRequest);
        return response;
    }

    @Override
    public AlipayTradeFastpayRefundQueryResponse alipayTradeRefundQuery(
        AlipayTradeFastpayRefundQueryModel alipayModel) throws AlipayApiException {
        AlipayTradeFastpayRefundQueryRequest alipayRequest = new AlipayTradeFastpayRefundQueryRequest();
        alipayRequest.setBizModel(alipayModel);
        AlipayTradeFastpayRefundQueryResponse response = alipayClient.execute(alipayRequest);
        return response;
    }


}
