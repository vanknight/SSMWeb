package com.web.bean.pojo;

public class WishProduct {

    private Long wid;
    private Long uid;
    private String pid;
    private Product product;

    @Override
    public String toString() {
        return "WishProduct{" +
            "wid=" + wid +
            ", uid=" + uid +
            ", pid='" + pid + '\'' +
            ", product=" + product +
            '}';
    }

    public WishProduct() {
    }

    public WishProduct(Long wid, Long uid, String pid, Product product) {
        this.wid = wid;
        this.uid = uid;
        this.pid = pid;
        this.product = product;
    }

    public Long getWid() {
        return wid;
    }

    public void setWid(Long wid) {
        this.wid = wid;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
