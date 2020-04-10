package com.web.bean.pojo;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author Administrator
 */
public class Product {

    private String pid;
    private String name;
    private Double marketPrice;
    private Double shopPrice;
    private String image;
    private Long date;
    private Long isHot;
    private Double rating;
    private String desc;
    private Long stock;
    private String cid;
    private Integer state;
    private List<ProductReview> listReview;
    private ProductDetails details;


    @Override
    public String toString() {
        return "Product{\n" +
            "pid='" + pid + '\'' +
            ", name='" + name + '\'' +
            ", marketPrice=" + marketPrice +
            ", shopPrice=" + shopPrice +
            ", image='" + image + '\'' +
            ", date=" + date +
            ", isHot=" + isHot +
            ", rating=" + rating +
            ", desc='" + desc + '\'' +
            ", stock=" + stock +
            ", cid='" + cid + '\'' +
            ", state=" + state +
            ", \nlistReview=" + listReview +
            ", \ndetails=" + details +
            "\n}";
    }

    public Product(String pid, String name, Double marketPrice, Double shopPrice, String image, Date date, Long isHot, Double rating, String desc, Long stock, String cid, Integer state, List<ProductReview> listReview) {
        this.pid = pid;
        this.name = name;
        this.marketPrice = marketPrice;
        this.shopPrice = shopPrice;
        this.image = image;
        this.date = date.getTime();
        this.isHot = isHot;
        this.rating = rating;
        this.desc = desc;
        this.stock = stock;
        this.cid = cid;
        this.state = state;
        this.listReview = listReview;
    }

    public Product(String pid, String name, Double marketPrice, Double shopPrice, String image, Date date, Long isHot, Double rating, String desc, Long stock, String cid, Integer state) {
        this.pid = pid;
        this.name = name;
        this.marketPrice = marketPrice;
        this.shopPrice = shopPrice;
        this.image = image;
        this.date = date.getTime();
        this.isHot = isHot;
        this.rating = rating;
        this.desc = desc;
        this.stock = stock;
        this.cid = cid;
        this.state = state;
    }

    public Double getRating() {
        return rating;
    }

    public void setRating(Double rating) {
        this.rating = rating;
    }

    public Product() {
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getMarketPrice() {
        return marketPrice;
    }

    public void setMarketPrice(Double marketPrice) {
        this.marketPrice = marketPrice;
    }

    public Double getShopPrice() {
        return shopPrice;
    }

    public void setShopPrice(Double shopPrice) {
        this.shopPrice = shopPrice;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }


    public String getDate() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        return format.format(new Date(this.date));
    }
    public void setDate(Date date) {
        this.date = date.getTime();
    }
    public void setDate(String date) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date1 = null;
        try {
            date1 = format.parse(date);
            this.date = date1.getTime();
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    public Long getIsHot() {
        return isHot;
    }

    public void setIsHot(Long isHot) {
        this.isHot = isHot;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Long getStock() {
        return stock;
    }

    public void setStock(Long stock) {
        this.stock = stock;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public List<ProductReview> getListReview() {
        return listReview;
    }

    public ProductDetails getDetails() {
        return details;
    }

    public void setDetails(ProductDetails details) {
        this.details = details;
    }

    public void setListReview(List<ProductReview> listReview) {
        this.listReview = listReview;
    }
}
