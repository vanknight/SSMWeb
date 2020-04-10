package com.web.bean.temp;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/27 12:04
 * @description:
 */
public class UrbanSelect {

    private String name;

    @Override
    public String toString() {
        return "UrbanSelect{" +
            "name='" + name + '\'' +
            '}';
    }

    public UrbanSelect() {
    }

    public UrbanSelect(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
