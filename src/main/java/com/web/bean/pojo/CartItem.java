package com.web.bean.pojo;

/**
 * @author Administrator
 */
public class CartItem {

    private String pid;
    private Long count;
    private Double subtotal;
    private Long uid;
    private Product product;

    @Override
    public String toString() {
        return "CartItem{" +
            "pid='" + pid + '\'' +
            ", count=" + count +
            ", subtotal=" + getSubtotal() +
            ", uid=" + uid +
            ", product=" + product +
            '}';
    }

    public CartItem() {
    }

    public CartItem(String pid, Long count, Double subtotal, Long uid) {
        this.pid = pid;
        this.count = count;
        this.subtotal = subtotal;
        this.uid = uid;
    }

    public CartItem(String pid, Long count, Double subtotal, Long uid, Product product) {
        this.pid = pid;
        this.count = count;
        this.subtotal = subtotal;
        this.uid = uid;
        this.product = product;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public Double getSubtotal() {
        if (product != null && count != null) {
            return product.getShopPrice() * count;
        } else {
            return 0.0;
        }
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

}
