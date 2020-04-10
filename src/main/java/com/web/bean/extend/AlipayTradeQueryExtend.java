package com.web.bean.extend;

import com.alipay.api.response.AlipayTradeQueryResponse;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/5/18 9:18
 * @description:
 */
public class AlipayTradeQueryExtend {

    private String buyerLoginID;
    private String buyerUserID;
    private Double buyerPayAmount;
    private Double invoiceAmount;
    private String oid;
    private Double pointAmount;
    private Double receiptAmount;
    private Date sendPayDate;
    private Double totalAmount;
    private String alipayOid;
    private String tradeStatus;

    @Override
    public String toString() {
        return "AlipayTradeQueryExtend{" +
            "buyerLoginID='" + buyerLoginID + '\'' +
            ", buyerUserID='" + buyerUserID + '\'' +
            ", buyerPayAmount=" + buyerPayAmount +
            ", invoiceAmount=" + invoiceAmount +
            ", oid='" + oid + '\'' +
            ", pointAmount=" + pointAmount +
            ", receiptAmount=" + receiptAmount +
            ", sendPayDate=" + sendPayDate +
            ", totalAmount=" + totalAmount +
            ", alipayOid='" + alipayOid + '\'' +
            ", tradeStatus='" + tradeStatus + '\'' +
            '}';
    }

    public AlipayTradeQueryExtend() {
    }

    public AlipayTradeQueryExtend(String buyerLoginID, String buyerUserID,
        Double buyerPayAmount, boolean buyerUserType, Double invoiceAmount, String oid,
        Double pointAmount, Double receiptAmount, Date sendPayDate, Double totalAmount,
        String alipayOid, String tradeStatus) {
        this.buyerLoginID = buyerLoginID;
        this.buyerUserID = buyerUserID;
        this.buyerPayAmount = buyerPayAmount;
        this.invoiceAmount = invoiceAmount;
        this.oid = oid;
        this.pointAmount = pointAmount;
        this.receiptAmount = receiptAmount;
        this.sendPayDate = sendPayDate;
        this.totalAmount = totalAmount;
        this.alipayOid = alipayOid;
        this.tradeStatus = tradeStatus;
    }

    public AlipayTradeQueryExtend(AlipayTradeQueryResponse response) {
        this.buyerLoginID = response.getBuyerLogonId();
        this.buyerUserID = response.getBuyerUserId();
        this.buyerPayAmount = Double.valueOf(response.getBuyerPayAmount());
        this.invoiceAmount = Double.valueOf(response.getInvoiceAmount());
        this.oid = response.getOutTradeNo();
        this.pointAmount = Double.valueOf(response.getPointAmount());
        this.receiptAmount = Double.valueOf(response.getReceiptAmount());
        this.sendPayDate = response.getSendPayDate();
        this.totalAmount = Double.valueOf(response.getTotalAmount());
        this.alipayOid = response.getTradeNo();
        this.tradeStatus = response.getTradeStatus();

    }

    public String getBuyerLoginID() {
        return buyerLoginID;
    }

    public void setBuyerLoginID(String buyerLoginID) {
        this.buyerLoginID = buyerLoginID;
    }

    public String getBuyerUserID() {
        return buyerUserID;
    }

    public void setBuyerUserID(String buyerUserID) {
        this.buyerUserID = buyerUserID;
    }

    public Double getBuyerPayAmount() {
        return buyerPayAmount;
    }

    public void setBuyerPayAmount(Double buyerPayAmount) {
        this.buyerPayAmount = buyerPayAmount;
    }

    public Double getInvoiceAmount() {
        return invoiceAmount;
    }

    public void setInvoiceAmount(Double invoiceAmount) {
        this.invoiceAmount = invoiceAmount;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public Double getPointAmount() {
        return pointAmount;
    }

    public void setPointAmount(Double pointAmount) {
        this.pointAmount = pointAmount;
    }

    public Double getReceiptAmount() {
        return receiptAmount;
    }

    public void setReceiptAmount(Double receiptAmount) {
        this.receiptAmount = receiptAmount;
    }

    public String getSendPayDate() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = format.format(this.sendPayDate);
        return date;
    }

    public void setSendPayDate(Date sendPayDate) {
        this.sendPayDate = sendPayDate;
    }

    public Double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getAlipayOid() {
        return alipayOid;
    }

    public void setAlipayOid(String alipayOid) {
        this.alipayOid = alipayOid;
    }

    public String getTradeStatus() {
        return tradeStatus;
    }

    public void setTradeStatus(String tradeStatus) {
        this.tradeStatus = tradeStatus;
    }


}

