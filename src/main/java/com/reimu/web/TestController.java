package com.reimu.web;

import com.reimu.service.IRoleService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;

@Log4j2
@Controller
@RequestMapping("test")
public class TestController {

    @Autowired
    private IRoleService roleService;

    @GetMapping("a")
    public String test(HttpServletRequest request){
        Enumeration<String> names = request.getHeaderNames();
        String name = "";
        while (names.hasMoreElements()){
            name = names.nextElement();
            log.info("请求头参数->{}：{}",name ,request.getHeader(name));
        }
        return "success";
    }

    @GetMapping("b")
    public String testb(){

        return "success";
    }


    @GetMapping("c")
    public String testc(){

        return "success";
    }
}
