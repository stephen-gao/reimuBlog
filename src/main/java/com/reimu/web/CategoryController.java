package com.reimu.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * <p>
 *   前端控制器
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-28
 */
@Controller
@RequestMapping("/category")
public class CategoryController {


    @RequestMapping("page")
    public ModelAndView articlePage(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("manage/system/category");
        return mv;
    }
}
