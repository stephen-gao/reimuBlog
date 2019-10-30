package com.reimu.web;

import com.reimu.common.Result;
import com.reimu.common.ResultEnums;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

    /**
     * 功能: 跳转登录页
     *
     * @param
     * @author: GaoSheng
     * @since: 2019/10/30
     * @return: org.springframework.web.servlet.ModelAndView
     */
    @RequestMapping("/login")
    public ModelAndView login(){
        ModelAndView mv= new ModelAndView();
        mv.setViewName("manage/system/login");
        return mv;
    }

    /**
     * 功能: 返回未登录信息
     *
     * @param
     * @author: GaoSheng
     * @since: 2019/10/30
     * @return: com.reimu.common.Result
     */
    @RequestMapping("/login-error")
    @ResponseBody
    public Result loginError(){

        return Result.getResult(ResultEnums.NOT_LOGIN,"请前往登录");
    }

}



