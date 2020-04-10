package com.web.bean.pojo;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/12/20 12:37
 * @description:
 */
public class ProductDetails {
    private Long id;
    private String images;
    private String pid;

    @Override
    public String toString() {
        return "ProductDetails{" +
            "id=" + id +
            ", images='" + images + '\'' +
            ", pid='" + pid + '\'' +
            '}';
    }

    public ProductDetails() {
    }

    public ProductDetails(Long id, String images, String pid) {
        this.id = id;
        this.images = images;
        this.pid = pid;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }
}
