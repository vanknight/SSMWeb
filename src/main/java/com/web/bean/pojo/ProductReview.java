package com.web.bean.pojo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.xml.crypto.Data;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/12/19 17:01
 * @description:
 */
public class ProductReview {
    private Long id;
    private String images;
    private String content;
    private Double rating;
    private Date time;
    private String pid;
    private Long uid;

    private User user;

    @Override
    public String toString() {
        return "ProductReview{" +
            "id=" + id +
            ", images='" + images + '\'' +
            ", content='" + content + '\'' +
            ", rating=" + rating +
            ", time='" + time + '\'' +
            ", pid='" + pid + '\'' +
            ", uid=" + uid +
            ", user=" + user +
            '}';
    }

    public ProductReview() {
    }

    public ProductReview(Long id, String images, String content, Double rating, Date time, String pid, Long uid, User user) {
        this.id = id;
        this.images = images;
        this.content = content;
        this.rating = rating;
        this.time = time;//time.getTime();
        this.pid = pid;
        this.uid = uid;
        this.user = user;
    }

    public ProductReview(Long id, String images, String content, Double rating, Date time, String pid, Long uid) {
        this.id = id;
        this.images = images;
        this.content = content;
        this.rating = rating;
        this.time = time;//time.getTime();
        this.pid = pid;
        this.uid = uid;
    }

    public String getTime() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //return format.format(new Date(this.time));
        return format.format(this.time);
    }

    public void setTime(Date date) {
        this.time = date;//date.getTime();
    }
    public void setTime(String date) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date1 = null;
        try {
            date1 = format.parse(date);
            this.time = date1;//date1.getTime();
        } catch (ParseException e) {
            e.printStackTrace();
        }
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Double getRating() {
        return rating;
    }

    public void setRating(Double rating) {
        this.rating = rating;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}
