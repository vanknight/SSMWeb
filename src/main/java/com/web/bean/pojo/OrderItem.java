package com.web.bean.pojo;

public class OrderItem {

    private String itemId;
    private Long count;
    private Double subtotal;
    private Long state;
    private String pid;
    private String oid;
    private Product product;

    @Override
    public String toString() {
        return "OrderItem{" +
            "itemId='" + itemId + '\'' +
            ", count=" + count +
            ", subtotal=" + subtotal +
            ", state=" + state +
            ", pid='" + pid + '\'' +
            ", oid='" + oid + '\'' +
            ", product=" + product +
            '}';
    }

    public OrderItem() {
    }

    public OrderItem(String itemId, Long count, Double subtotal, Long state, String pid, String oid) {
        this.itemId = itemId;
        this.count = count;
        this.subtotal = subtotal;
        this.state = state;
        this.pid = pid;
        this.oid = oid;
    }

    public OrderItem(String itemId, Long count, Double subtotal, Long state, String pid, String oid, Product product) {
        this.itemId = itemId;
        this.count = count;
        this.subtotal = subtotal;
        this.state = state;
        this.pid = pid;
        this.oid = oid;
        this.product = product;
    }

    public Long getState() {
        return state;
    }

    public void setState(Long state) {
        this.state = state;
    }

    public String getItemId() {
        return itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId;
    }

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
