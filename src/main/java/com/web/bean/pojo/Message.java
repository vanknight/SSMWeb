package com.web.bean.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/12/19 12:16
 * @description:
 */
public class Message {
    private Long mid;
    private Long uid;
    private String msg;
    private Long type;
    private Long state;
    private String time;

    public Message() {
    }

    public Message(Long mid, Long uid, String msg, Long type, Long state, String time) {
        this.mid = mid;
        this.uid = uid;
        this.msg = msg;
        this.type = type;
        this.state = state;
        this.time = time;
    }

    public Long getMid() {
        return mid;
    }

    public void setMid(Long mid) {
        this.mid = mid;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Long getType() {
        return type;
    }

    public void setType(Long type) {
        this.type = type;
    }

    public Long getState() {
        return state;
    }

    public void setState(Long state) {
        this.state = state;
    }

    public void setTime(Date time) {
        this.time = String.valueOf(time.getTime());
    }

    public String getTime() {
        if (time == null) {
            return null;
        }
        Date date = new Date(Long.valueOf(this.time));
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = simpleDateFormat.format(date);
        return dateString;
    }
}
