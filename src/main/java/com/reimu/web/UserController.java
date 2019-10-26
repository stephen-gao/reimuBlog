package com.reimu.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * <p>
 * 用户表  前端控制器
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-22
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @RequestMapping("user-page")
    public ModelAndView userPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("manage/user/user");
        return mv;
    }
}
