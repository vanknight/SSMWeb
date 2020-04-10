package com.web.bean.pojo;

public class Category {

    private String cid;
    private String cname;

    @Override
    public String toString() {
        return "Category{" +
            "cid='" + cid + '\'' +
            ", cname='" + cname + '\'' +
            '}';
    }

    public Category(String cid, String cname) {
        this.cid = cid;
        this.cname = cname;
    }

    public Category() {
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }
}
