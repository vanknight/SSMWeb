package com.web.config;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/3 11:15
 * @description:
 */

@Configurable
//@EnableWebMvc
@Component
@ComponentScan(basePackages = {"com.web.controller"})
@PropertySource("classpath:props/version.properties")
public class SpringConfiguration {

    @Value("${version.ver}")
    private String version;

    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        if (this.version == null || this.version.length() < 1) {
            this.version = "v2";
        }

        viewResolver.setPrefix("/WEB-INF/" + this.version + "/");
        viewResolver.setSuffix(".jsp");
        viewResolver.setOrder(0);
        return viewResolver;
    }

    @Bean
    public MultipartResolver multipartResolver() {
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();

        return multipartResolver;
    }


}
