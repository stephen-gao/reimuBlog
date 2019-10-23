package com.reimu.exception;

import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * ...
 *
 * @author: GaoSheng
 * @since: 2019/10/23 20:17
 * @version: 1.0
 **/
@Log4j2
@ControllerAdvice
public class GlobalExceptionHandler {


    @ExceptionHandler(Exception.class)
    public ModelAndView defaultErrorHandler(HttpServletRequest request, Exception e) {
        log.info("系统异常", e);
        ModelAndView mv = new ModelAndView();
        mv.addObject("exception", e);
        mv.addObject("url", request.getRequestURL());
        mv.setViewName("/404.html");
        return mv;
    }
}
