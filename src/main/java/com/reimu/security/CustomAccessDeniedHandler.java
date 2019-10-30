package com.reimu.security;

import com.reimu.utils.HTTPUtils;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 自定义 403 返回信息
 *
 * @author: GaoSheng
 * @since: 2019/10/30 19:53
 * @version: 1.0
 **/
@Component
public class CustomAccessDeniedHandler implements AccessDeniedHandler {
    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException e) throws IOException, ServletException {
        if (HTTPUtils.isAjaxRequest(request)) {
            // AJAX请求,使用response发送403
            response.sendError(403);
        } else if (!response.isCommitted()) {
            // 非AJAX请求，跳转系统默认的403错误界面，在web.xml中配置
            response.sendError(HttpServletResponse.SC_FORBIDDEN, e.getMessage());
        }
    }
}
