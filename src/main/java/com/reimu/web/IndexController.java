package com.reimu.web;

import com.reimu.model.vo.ArticleVO;
import com.reimu.model.vo.IndexVO;
import com.reimu.service.IArticleService;
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

    @Autowired
    private IArticleService articleService;

    @RequestMapping("index")
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView();
        IndexVO vo = indexService.getIndexVO(1);
        setIndexData(mv, vo);
        mv.setViewName("blog/index");
        return mv;
    }



    @RequestMapping("p/list/{pageNo}")
    public ModelAndView All(@PathVariable("pageNo") Integer pageNo) {
        ModelAndView mv = new ModelAndView();
        IndexVO vo = indexService.getIndexVO(pageNo);
        setIndexData(mv, vo);
        mv.setViewName("blog/index");
        return mv;
    }

    @RequestMapping("a/{articleId}")
    public ModelAndView article(@PathVariable("articleId") String aeticleId){
        ModelAndView mv = new ModelAndView();
        ArticleVO vo = articleService.getOneShowById(aeticleId);
        mv.addObject("article",vo);
        mv.setViewName("blog/article/article");
        return mv;
    }


    private void setIndexData(ModelAndView mv, IndexVO vo) {
        mv.addObject("categorys", vo.getCategories());
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
