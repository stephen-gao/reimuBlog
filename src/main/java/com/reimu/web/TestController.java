package com.reimu.web;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("test")
public class TestController {

    @GetMapping("a")
    public String test(){

        return "success";
    }
    @PreAuthorize("hasRole('b')")
    @GetMapping("b")
    public String testb(){

        return "successb";
    }

    @PreAuthorize("hasRole('c')")
    @GetMapping("c")
    public String testc(){

        return "successc";
    }
}
