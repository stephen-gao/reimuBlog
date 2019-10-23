package com.reimu.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * ...
 *
 * @author: GaoSheng
 * @since: 2019/10/23 17:42
 * @version: 1.0
 **/
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("index.html");
        registry.addViewController("/index").setViewName("index.html");
        registry.addViewController("/login").setViewName("login.html");
        registry.addViewController("/login-error").setViewName("login-error.html");
        registry.addViewController("/success").setViewName("success.html");
        registry.addViewController("/403").setViewName("forward:403.html");
        registry.addViewController("/404").setViewName("forward:404.html");
        registry.addViewController("/error").setViewName("forward:404.html");
        registry.addViewController("/500").setViewName("forward:500.html");
    }
}
