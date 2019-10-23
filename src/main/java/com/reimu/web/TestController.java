package com.reimu.web;

import com.reimu.entity.Role;
import com.reimu.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("test")
public class TestController {

    @Autowired
    private IRoleService roleService;

    @GetMapping("a")
    public String test(){
        return "successa";
    }

    @GetMapping("b")
    public String testb(){

        return "successb";
    }


    @GetMapping("c")
    public String testc(){

        return "successc";
    }
}
