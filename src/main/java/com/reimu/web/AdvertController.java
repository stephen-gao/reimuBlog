package com.reimu.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/coffee")
public class AdvertController {

    @RequestMapping("page")
    public ModelAndView articlePage(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("manage/system/advertisement");
        return mv;
    }
}
