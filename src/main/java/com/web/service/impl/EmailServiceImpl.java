package com.web.service.impl;

import com.sun.mail.util.MailSSLSocketFactory;
import com.web.service.EmailService;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.Executor;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.PropertySource;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;
import sun.font.TrueTypeFont;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/15 15:51
 * @description:
 */
@Service("emailService")
@PropertySource("classpath:props/email.properties")
public class EmailServiceImpl implements EmailService {

    @Value("${email.host}")
    private String host;

    @Value("${email.port}")
    private String port;

    @Value("${email.fromName}")
    private String fromName;

    @Value("${email.authUserName}")
    private String authUserName;

    @Value("${email.authPassWord}")
    private String authPassWord;

    @Autowired
    private FreeMarkerConfigurer freeMarkerConfigurer;

//    @Autowired
//    private Executor asyncExecutor;

    @Override
    public boolean registerSend(String username, String content, String toAddress, String key, String urlPath)
        throws UnsupportedEncodingException, GeneralSecurityException, MessagingException {
        final String to = toAddress;
        String text = "";
        Map<String, String> map = new HashMap<>();
        String url = "";
        if(urlPath != null) {
            url = urlPath+"/user/register";
        }
        map.put("url", url);

        map.put("username", username);
        map.put("content", content);
        map.put("register_key", key);
        try {
            Template template = freeMarkerConfigurer.getConfiguration()
                .getTemplate("registerMail.ftl");
            text = FreeMarkerTemplateUtils.processTemplateIntoString(template, map);

        } catch (IOException | TemplateException e) {
            e.printStackTrace();
        }
        final String finalText = text;

        sendEmail(finalText, to,"注册用户");
        return true;
    }

    @Override
    public boolean forgetPasswordSend(String username, String content, String toAddress, String key, String urlPath)
        throws UnsupportedEncodingException, GeneralSecurityException, MessagingException {
        final String to = toAddress;
        String text = "";
        Map<String, String> map = new HashMap<>();
        String url = "";
        if(urlPath != null) {
            url = urlPath+"/view/change-password-page";
        }
        map.put("url", url);
        map.put("username", username);
        map.put("content", content);
        map.put("forget_key", key);
        try {
            Template template = freeMarkerConfigurer.getConfiguration()
                .getTemplate("forgetPasswordMail.ftl");
            text = FreeMarkerTemplateUtils.processTemplateIntoString(template, map);

        } catch (IOException | TemplateException e) {
            e.printStackTrace();
        }
        final String finalText = text;

        sendEmail(finalText, to,"重置密码");
        return true;
    }

    @Async
    public void sendEmail(String text, String toAddress,String sub)
        throws GeneralSecurityException, UnsupportedEncodingException, MessagingException {
        // 收件人电子邮箱
        String to = toAddress;
        // 发件人电子邮箱
        System.out.println(authUserName + "--" + authPassWord);
        final String from = authUserName;
        final String fromPwd = authPassWord;

        // 获取系统属性
        Properties properties = System.getProperties();

        // 设置邮件服务器
        properties.setProperty("mail.smtp.host", this.host);
        properties.setProperty("mail.smtp.port", this.port);
        properties.put("mail.smtp.auth", "true");

        MailSSLSocketFactory sf = new MailSSLSocketFactory();
        sf.setTrustAllHosts(true);
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.ssl.socketFactory", sf);

        // 获取默认session对象
        Session session = Session.getDefaultInstance(properties, new Authenticator() {

            @Override
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, fromPwd);
                //发件人邮件用户名、密码
            }
        });

        // 创建默认的 MimeMessage 对象
        MimeMessage message = new MimeMessage(session);

        // Set From: 头部头字段
        message.setFrom(new InternetAddress(from,
            MimeUtility.encodeText("VanKnight", "UTF-8", "b")));

        // Set To: 头部头字段
        message.addRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        message.addRecipients(MimeMessage.RecipientType.CC, InternetAddress.parse(authUserName));

        // Set Subject: 头部头字段
        message.setSubject(sub);

        // 设置消息体
        message.setContent(text, "text/html;charset=UTF-8");

        final Message message_ = message;

        Transport.send(message_);
        // 发送消息
//        asyncExecutor.execute(() -> {
//            try {
//            } catch (MessagingException e) {
//                e.printStackTrace();
//            }
//
//        });

    }
}
