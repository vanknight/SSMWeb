package com.web.bean.extend;

import com.alipay.api.response.AlipayTradeFastpayRefundQueryResponse;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/5/18 15:24
 * @description:
 */
public class AlipayTradeRefundQueryExtend {

    private String oid;
    private String alipayOid;
    private Double refundAmount;
    private Double totalAmount;
    private String refundReason;

    public AlipayTradeRefundQueryExtend() {
    }


    public AlipayTradeRefundQueryExtend(AlipayTradeFastpayRefundQueryResponse response) {
        this.refundReason = response.getRefundReason();
        this.oid = response.getOutTradeNo();
        this.alipayOid = response.getTradeNo();
        this.refundAmount = Double.valueOf(response.getRefundAmount());
        this.totalAmount = Double.valueOf(response.getTotalAmount());
    }


    public AlipayTradeRefundQueryExtend(String oid, String alipayOid, Double refundAmount,
        Double totalAmount, String refundReason) {
        this.oid = oid;
        this.alipayOid = alipayOid;
        this.refundAmount = refundAmount;
        this.totalAmount = totalAmount;
        this.refundReason = refundReason;
    }


    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public String getAlipayOid() {
        return alipayOid;
    }

    public void setAlipayOid(String alipayOid) {
        this.alipayOid = alipayOid;
    }

    public Double getRefundAmount() {
        return refundAmount;
    }

    public void setRefundAmount(Double refundAmount) {
        this.refundAmount = refundAmount;
    }

    public Double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getRefundReason() {
        return refundReason;
    }

    public void setRefundReason(String refundResason) {
        this.refundReason = refundResason;
    }
}
