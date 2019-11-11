package com.reimu.web;

import com.reimu.model.vo.ShowVO;
import com.reimu.service.IArticleService;
import com.reimu.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.websocket.server.PathParam;

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
        ShowVO vo = indexService.getIndexVO();
        setCommonData(mv, vo);
        setPageData(mv, vo);
        mv.setViewName("blog/index");
        return mv;
    }


    @RequestMapping("p/list/{pageNo}")
    public ModelAndView All(@PathVariable("pageNo") Integer pageNo) {
        ModelAndView mv = new ModelAndView();
        ShowVO vo = indexService.getPage(pageNo);
        setCommonData(mv, vo);
        setPageData(mv, vo);
        mv.setViewName("blog/index");
        return mv;
    }

    @RequestMapping("c/{categoryId}/{pageNo}")
    public ModelAndView categoryAll(@PathVariable("categoryId") String categoryId, @PathVariable("pageNo") Integer pageNo) {
        ModelAndView mv = new ModelAndView();
        ShowVO vo = indexService.getCategoryPage(pageNo, categoryId);
        setCommonData(mv, vo);
        setPageData(mv, vo);
        mv.setViewName("blog/index");
        return mv;
    }

    @RequestMapping("a/{articleId}")
    public ModelAndView article(@PathVariable("articleId") String aeticleId) {
        ModelAndView mv = new ModelAndView();
        ShowVO vo = indexService.getOneShowById(aeticleId);
        setCommonData(mv, vo);
        mv.addObject("article", vo.getArticleVO());
        mv.setViewName("blog/article");
        return mv;
    }


    private void setCommonData(ModelAndView mv, ShowVO vo) {
        mv.addObject("categorys", vo.getCategories());
        mv.addObject("hots", vo.getHots());
        mv.addObject("news", vo.getNews());
    }

    private void setPageData(ModelAndView mv, ShowVO vo) {
        mv.addObject("articles", vo.getPage().getRecords());
        long current = vo.getPage().getCurrent();
        long pages = vo.getPage().getPages();
        String preUrl = "";
        String nextUrl = "";
        if (current == 1L && pages == 1L) {
            preUrl = "#";
            nextUrl = "#";
        } else if (current == 1L && pages > 1L) {
            preUrl = "#";
            nextUrl = "http://localhost:8080/p/list/" + (current + 1L);
        } else if (current > 1 && current < pages) {
            preUrl = "http://localhost:8080/p/list/" + (current - 1L);
            nextUrl = "http://localhost:8080/p/list/" + (current + 1L);
        } else if (current > 1 && current == pages) {
            preUrl = "http://localhost:8080/p/list/" + (current - 1L);
            nextUrl = "#";
        }
        mv.addObject("nextUrl", nextUrl);
        mv.addObject("preUrl", preUrl);
    }
}
