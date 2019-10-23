package com.reimu.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

//    @RequestMapping("/login")
//    public String login(){
//        return "login.html";
//    }

//    @RequestMapping("/success")
//    public String success(){
//        return "success.html";
//    }

    @RequestMapping("/403")
    public String error(){
        return "403.html";
    }
}
