package com.reimu.common.aspect;

import com.google.gson.Gson;
import com.reimu.entity.VistorLog;
import com.reimu.service.IArticleInfoService;
import com.reimu.service.IVistorLogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Aspect
@Component
public class VistorLogAspect {

    @Autowired
    private IVistorLogService vistorLogService;

    @Autowired
    private IArticleInfoService articleInfoService;

    @Pointcut("@annotation(com.reimu.common.aspect.VisteLog)")
    public void visteLog() {}

    @Before("visteLog()")
    public void doBefore(JoinPoint joinPoint) {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        String method = joinPoint.getSignature().getName();
        String ua = request.getHeader("User-Agent");

        VistorLog vistorLog = new VistorLog();

        vistorLog.setVistorIp(getRemoteAddress(request));
        vistorLog.setVistorUrl(request.getRequestURL().toString());
        vistorLog.setVistorTime(new Date());
        vistorLog.setUserAgent(ua);
        //访问文章
        if ("article".equals(method)){
            String articleId = (String)joinPoint.getArgs()[0];
            vistorLog.setContentId(articleId);
            vistorLog.setType(4);
            articleInfoService.viewsNumAdd(articleId);
        }
        vistorLogService.save(vistorLog);

    }

    /**
     *
     * <p>Discription:HttpServletRequest获取客户端IP方法</p>
     * @param request
     * @return
     * @update [修改人] [修改时间] [变更描述]
     */
    public String getRemoteAddress(HttpServletRequest request){
        String ip = request.getHeader("x-forwarded-for");
        if (ip != null && ip.length() != 0 && !"unknown".equalsIgnoreCase(ip)) {
            // 多次反向代理后会有多个ip值，第一个ip才是真实ip
            if( ip.indexOf(",")!=-1 ){
                ip = ip.split(",")[0];
            }
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-Real-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }
}
