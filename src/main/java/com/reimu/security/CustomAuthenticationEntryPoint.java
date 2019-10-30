package com.reimu.security;

import com.reimu.utils.HTTPUtils;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * ...
 *
 * @author: GaoSheng
 * @since: 2019/10/30 20:19
 * @version: 1.0
 **/
@Component
public class CustomAuthenticationEntryPoint implements AuthenticationEntryPoint {

    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException e) throws IOException, ServletException {
        if (HTTPUtils.isAjaxRequest(request)) {
            // AJAX请求,使用response发送403
            response.sendRedirect("/login-error");
        } else if (!response.isCommitted()) {
            // 非AJAX请求，跳转系统默认的403错误界面，在web.xml中配置
            response.sendRedirect("/login");
        }
    }
}
