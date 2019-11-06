package com.reimu.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * ...
 *
 * @author GaoSheng
 * @version 1.0
 * @blame GaoSheng
 * @since 2019/11/06 19:51
 **/
@Controller
public class IndexController {

    @RequestMapping("index")
    public ModelAndView index(){
        ModelAndView mv  = new ModelAndView();
        mv.setViewName("blog/index");
        return mv;
    }
}
