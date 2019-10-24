package com.reimu.config;

import org.springframework.boot.web.server.ErrorPage;
import org.springframework.boot.web.server.ErrorPageRegistrar;
import org.springframework.boot.web.server.ErrorPageRegistry;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;

@Configuration
public class ErrorPageConfig implements ErrorPageRegistrar {

    /**
     * 错误页面配置
     *
     * @return
     */
    @Override
    public void registerErrorPages(ErrorPageRegistry registry) {
        ErrorPage errorPage400 = new ErrorPage(HttpStatus.BAD_REQUEST, "/400");
        ErrorPage errorPage403 = new ErrorPage(HttpStatus.FORBIDDEN, "/403");
        ErrorPage errorPage404 = new ErrorPage(HttpStatus.NOT_FOUND, "/404");
        ErrorPage errorPage500 = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/500");

        registry.addErrorPages(errorPage400, errorPage403, errorPage404, errorPage500);
    }
}