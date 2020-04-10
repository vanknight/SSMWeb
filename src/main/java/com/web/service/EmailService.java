package com.web.service;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/16 15:33
 * @description:
 */
public interface EmailService {

    public boolean registerSend(String username, String content, String toAddress, String key, String urlPath)
        throws UnsupportedEncodingException, GeneralSecurityException, MessagingException;


    public boolean forgetPasswordSend(String username, String content, String toAddress, String key, String urlPath)
        throws UnsupportedEncodingException, GeneralSecurityException, MessagingException;



}
