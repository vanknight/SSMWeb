package com.web.bean.temp;

import com.fasterxml.jackson.annotation.JsonProperty;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/5/19 13:50
 * @description:
 */
public class Traces {

    @JsonProperty("AcceptTime")
    private Date acceptTime;
    @JsonProperty("AcceptStation")
    private String acceptStation;

    @Override
    public String toString() {
        return "Traces{" +
            "acceptTime=" + getAcceptTime2() +
            ", acceptStation='" + acceptStation + '\'' +
            '}';
    }

    public Traces() {
    }

    public Traces(Date acceptTime, String acceptStation) {
        this.acceptTime = acceptTime;
        this.acceptStation = acceptStation;
    }

    public Date getAcceptTime() {
        return acceptTime;
    }

    public void setAcceptTime(Date acceptTime) {
        this.acceptTime = acceptTime;
    }

    public String getAcceptStation() {
        return acceptStation;
    }

    public void setAcceptStation(String acceptStation) {
        this.acceptStation = acceptStation;
    }

    public void setAcceptTime(String acceptTime) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            Date date = simpleDateFormat.parse(acceptTime);
            this.acceptTime = date;
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    public String getAcceptTime2() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = simpleDateFormat.format(this.acceptTime);
        return date;
    }
}
