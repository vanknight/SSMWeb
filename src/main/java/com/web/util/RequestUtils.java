package com.web.util;

import javax.servlet.http.HttpServletRequest;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/30 11:59
 * @description:
 */
public class RequestUtils {

    /**
     * 获取ip地址
     */
    public String getIpAddress(HttpServletRequest request) {
        String ip = null;
        try {
            ip = request.getHeader("x-forwarded-for");
            if (isBlankIp(ip)) { ip = request.getHeader("Proxy-Client-IP"); }
            if (isBlankIp(ip)) { ip = request.getHeader("WL-Proxy-Client-IP"); }
            if (isBlankIp(ip)) { ip = request.getHeader("HTTP_CLIENT_IP"); }
            if (isBlankIp(ip)) { ip = request.getHeader("HTTP_X_FORWARDED_FOR"); }
            if (isBlankIp(ip)) { ip = request.getRemoteAddr(); }
            // 使用代理，则获取第一个IP地址
            if (!isBlankIp(ip) && ip.length() > 15) { ip = ip.split(",")[0]; }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ip;
    }

    private boolean isBlankIp(String str) {
        return str == null || str.trim().isEmpty() || "unknown".equalsIgnoreCase(str);
    }

}
