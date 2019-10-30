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
//        registry.addViewController("/manage-index").setViewName("manage/index");
//        registry.addViewController("/manage-head").setViewName("manage/common/head");
//        registry.addViewController("/login").setViewName("manage/system/login");
        registry.addViewController("/403").setViewName("error/403");
        registry.addViewController("/404").setViewName("error/404");
        registry.addViewController("/500").setViewName("error/500");
        registry.addRedirectViewController("/error-403","/403");
        registry.addRedirectViewController("/error-404","/404");
        registry.addRedirectViewController("/error-500","/500");
    }
}
