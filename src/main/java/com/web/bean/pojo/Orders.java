package com.web.bean.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Orders {

    private String oid;
    private String orderTime;
    private Double total;
    private Integer state;
    private String address;
    private String name;
    private String telephone;
    private Double expressFee;
    private Long uid;
    private List<OrderItem> list;

    @Override
    public String toString() {
        return "Orders{" +
            "oid='" + oid + '\'' +
            ", orderTime='" + orderTime + '\'' +
            ", total=" + total +
            ", state=" + state +
            ", address='" + address + '\'' +
            ", name='" + name + '\'' +
            ", telephone='" + telephone + '\'' +
            ", expressFee=" + expressFee +
            ", uid=" + uid +
            ", list=" + list +
            '}';
    }

    public Orders() {
    }

    public Orders(String oid, String orderTime, Double total, Integer state, String address, String name, String telephone, Double expressFee, Long uid) {
        this.oid = oid;
        this.orderTime = orderTime;
        this.total = total;
        this.state = state;
        this.address = address;
        this.name = name;
        this.telephone = telephone;
        this.expressFee = expressFee;
        this.uid = uid;
    }

    public Orders(String oid, String orderTime, Double total, Integer state, String address, String name, String telephone, Double expressFee, Long uid, List<OrderItem> list) {
        this.oid = oid;
        this.orderTime = orderTime;
        this.total = total;
        this.state = state;
        this.address = address;
        this.name = name;
        this.telephone = telephone;
        this.expressFee = expressFee;
        this.uid = uid;
        this.list = list;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = String.valueOf(orderTime.getTime());
    }

    public String getOrderTime() {
        if (orderTime == null) {
            return null;
        }
        Date date = new Date(Long.valueOf(orderTime));
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = simpleDateFormat.format(date);
        return dateString;
    }

    public Double getExpressFee() {
        return expressFee;
    }

    public void setExpressFee(Double expressFee) {
        this.expressFee = expressFee;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public List<OrderItem> getList() {
        return list;
    }

    public void setList(List<OrderItem> list) {
        this.list = list;
    }


}
