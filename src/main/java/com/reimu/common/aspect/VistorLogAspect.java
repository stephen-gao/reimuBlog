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

        System.out.println("==================Start=================");
        System.out.println("URL：" + request.getRequestURL().toString());
        System.out.println("Method：" + request.getMethod().toString());
        System.out.println("URI：" + request.getRequestURI());
        System.out.println("URL：" + request.getRequestURL());

        //打印controller全路径及method
        System.out.println("Class Method：" + joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName());
        System.out.println("客户端IP：" + getRemoteAddress(request));


        String method = joinPoint.getSignature().getName();

        VistorLog vistorLog = new VistorLog();

        vistorLog.setVistorIp(getRemoteAddress(request));
        vistorLog.setVistorUrl(request.getRequestURL().toString());
        vistorLog.setVistorTime(new Date());
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
        if(ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) ip = request.getHeader("Proxy-Client-IP");
        if(ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) ip = request.getHeader("WL-Proxy-Client-IP");
        if(ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) ip = request.getRemoteAddr();
        return ip;
    }
}
