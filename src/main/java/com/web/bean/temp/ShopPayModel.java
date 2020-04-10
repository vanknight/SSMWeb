package com.web.bean.temp;

import java.util.List;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/5/5 11:29
 * @description:
 */
public class ShopPayModel {

    private String name;
    private String telephone;
    private String address;
    private String remarks;

    private String payMethod;

    @Override
    public String toString() {
        return "ShopPayModel{" +
            "name='" + name + '\'' +
            ", telephone='" + telephone + '\'' +
            ", address='" + address + '\'' +
            ", remarks='" + remarks + '\'' +
            ", payMethod='" + payMethod + '\'' +
            '}';
    }

    public ShopPayModel() {
    }

    public ShopPayModel(String name, String telephone, String address, String remarks,
        String payMethod) {
        this.name = name;
        this.telephone = telephone;
        this.address = address;
        this.remarks = remarks;
        this.payMethod = payMethod;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getPayMethod() {
        return payMethod;
    }

    public void setPayMethod(String payMethod) {
        this.payMethod = payMethod;
    }
}
