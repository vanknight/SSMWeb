package com.web.bean.temp;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/12 13:25
 * @description:
 */
public class TokenModel {

    private String userId;
    private String token;
    private boolean remember;

    public TokenModel() {
    }

    public TokenModel(String userId, String token, boolean remember) {
        this.userId = userId;
        this.token = token;
        this.remember = remember;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public boolean isRemember() {
        return remember;
    }

    public void setRemember(boolean remember) {
        this.remember = remember;
    }

    @Override
    public String toString() {
        return "TokenModel{" +
            "userId='" + userId + '\'' +
            ", token='" + token + '\'' +
            ", remember=" + remember +
            '}';
    }
}
