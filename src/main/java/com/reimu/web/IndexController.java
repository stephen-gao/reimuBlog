package com.reimu.web;

import com.reimu.model.vo.IndexVO;
import com.reimu.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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

    @Autowired
    private IndexService indexService;

    @RequestMapping("index")
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView();
        IndexVO vo = indexService.getIndexVO(1);
        mv.addObject("categorys", vo.getCategories());
        mv.addObject("articles", vo.getPage().getRecords());
        long current = vo.getPage().getCurrent();
        long pages = vo.getPage().getPages();
        String preUrl = "";
        String nextUrl = "";
        if (current == 1L && pages == 1L) {
            preUrl = "#";
            nextUrl = "#";
        }else if(current == 1L && pages >1L){
            preUrl = "#";
            nextUrl = "http://localhost:8080/a/all/"+(current+1L);
        }else if(current >1 && current < pages){
            preUrl = "http://localhost:8080/a/all/"+(current-1L);
            nextUrl = "http://localhost:8080/a/all/"+(current+1L);
        }else if(current >1 && current == pages){
            preUrl = "http://localhost:8080/a/all/"+(current-1L);
            nextUrl = "#";
        }
        mv.addObject("nextUrl", preUrl);
        mv.addObject("preUrl", nextUrl);
        mv.setViewName("blog/index");
        return mv;
    }

    @RequestMapping("a/all/{pageNo}")
    public ModelAndView All(@PathVariable("pageNo") Integer pageNo) {
        ModelAndView mv = new ModelAndView();
        IndexVO vo = indexService.getIndexVO(pageNo);
        mv.addObject("categorys", vo.getCategories());
        mv.addObject("articles", vo.getPage().getRecords());
        long current = vo.getPage().getCurrent();
        long pages = vo.getPage().getPages();
        String preUrl = "";
        String nextUrl = "";
        if (current == 1L && pages == 1L) {
            preUrl = "#";
            nextUrl = "#";
        }else if(current == 1L && pages >1L){
            preUrl = "#";
            nextUrl = "http://localhost:8080/a/all/"+(current+1L);
        }else if(current >1 && current < pages){
            preUrl = "http://localhost:8080/a/all/"+(current-1L);
            nextUrl = "http://localhost:8080/a/all/"+(current+1L);
        }else if(current >1 && current == pages){
            preUrl = "http://localhost:8080/a/all/"+(current-1L);
            nextUrl = "#";
        }
        mv.addObject("nextUrl", preUrl);
        mv.addObject("preUrl", nextUrl);
        mv.setViewName("blog/index");
        return mv;
    }
}
