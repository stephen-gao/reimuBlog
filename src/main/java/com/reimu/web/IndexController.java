package com.reimu.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    @RequestMapping("/manage-index")
    public String indexPage(){

        return "manage/index";
    }

    @RequestMapping("/manage-main")
    public String mainPage(){

        return "manage/main";
    }
}
