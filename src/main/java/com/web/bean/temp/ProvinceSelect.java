package com.web.bean.temp;

import java.util.List;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/27 11:20
 * @description:
 */
public class ProvinceSelect {

    private String name;
    private List<UrbanSelect> sub;

    @Override
    public String toString() {
        return "ProvinceSelect{" +
            "name='" + name + '\'' +
            ", sub=" + sub +
            '}';
    }

    public ProvinceSelect() {
    }

    public ProvinceSelect(String name, List<UrbanSelect> sub) {
        this.name = name;
        this.sub = sub;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<UrbanSelect> getSub() {
        return sub;
    }

    public void setSub(List<UrbanSelect> sub) {
        this.sub = sub;
    }
}
