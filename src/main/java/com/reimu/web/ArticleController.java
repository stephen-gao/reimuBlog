package com.reimu.web;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * ...
 *
 * @author: GaoSheng
 * @since: 2019/10/23 19:08
 * @version: 1.0
 **/
@Log4j2
@Controller
public class ArticleController {

    @RequestMapping("/a/{id}")
    public String getArtile(@PathVariable("id")String aId){
        log.info("文章ID {}",aId);
        return "您请求的文章ID " + aId;
    }
}
