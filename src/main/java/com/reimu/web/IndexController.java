package com.reimu.web;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.reimu.common.aspect.VisteLog;
import com.reimu.model.vo.ArticleVO;
import com.reimu.model.vo.ShowVO;
import com.reimu.service.IndexService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
@Log4j2
@Controller
public class IndexController {

    @Autowired
    private IndexService indexService;

    @Value("${default.url}")
    private String defaultUrl;

    @Value("${default.index}")
    private String indexUrl;

    @Value("${default.category}")
    private String categoryUrl;

    @Value("${default.special}")
    private String specialUrl;

    @VisteLog
    @RequestMapping("/")
    public ModelAndView index1() {
        log.info("进入首页");
        return getIndex();
    }

    @VisteLog
    @RequestMapping("index")
    public ModelAndView index2() {
        log.info("进入首页");
        return getIndex();
    }

    private ModelAndView getIndex() {
        log.info("查询首页数据");
        ModelAndView mv = new ModelAndView();
        IPage<ArticleVO> page = indexService.getIndexVO();
        setCommonData(mv);
        setPageData(mv, page, defaultUrl + indexUrl + "list/");
        mv.setViewName("blog/index");
        return mv;
    }

    @VisteLog
    @RequestMapping("p/list/{pageNo}")
    public ModelAndView All(@PathVariable("pageNo") Integer pageNo) {
        ModelAndView mv = new ModelAndView();
        IPage<ArticleVO> page = indexService.getPage(pageNo);
        setCommonData(mv);
        setPageData(mv, page, defaultUrl + indexUrl + "list/");
        mv.setViewName("blog/index");
        return mv;
    }

    @VisteLog
    @RequestMapping("c/{categoryId}/{pageNo}")
    public ModelAndView categoryPage(@PathVariable("categoryId") String categoryId, @PathVariable("pageNo") Integer pageNo) {
        ModelAndView mv = new ModelAndView();
        IPage<ArticleVO> page = indexService.getCategoryPage(pageNo, categoryId);
        setCommonData(mv);
        setPageData(mv, page, defaultUrl + categoryUrl);
        mv.setViewName("blog/index");
        return mv;
    }

    @VisteLog
    @RequestMapping("s/{specialId}/{pageNo}")
    public ModelAndView specialPage(@PathVariable("specialId") String specialId, @PathVariable("pageNo") Integer pageNo) {
        ModelAndView mv = new ModelAndView();
        IPage<ArticleVO> page = indexService.getSpecialPage(pageNo, specialId);
        setCommonData(mv);
        setPageData(mv, page, defaultUrl + specialUrl);
        mv.setViewName("blog/index");
        return mv;
    }

    @VisteLog
    @RequestMapping("a/{articleId}")
    public ModelAndView article(@PathVariable("articleId") String aeticleId) {
        ModelAndView mv = new ModelAndView();
        ArticleVO articleVO = indexService.getOneShowById(aeticleId);
        setCommonData(mv);
        mv.addObject("article", articleVO);
        mv.setViewName("blog/article");
        return mv;
    }


    private void setCommonData(ModelAndView mv) {
        mv.addObject("defaultUrl", defaultUrl);
        //专题分类
        mv.addObject("specials", indexService.getSpecials());
        //查询导航分类
        mv.addObject("categories", indexService.getCategorys());
        //查询热门文章
        mv.addObject("hots", indexService.getHotArticles());
        //查询最新文章
        mv.addObject("news", indexService.getNewArticles());
        //点击统计
        mv.addObject("allCount", indexService.allCount());
        //ip统计
        mv.addObject("ipCount", indexService.ipCount());
    }

    private void setPageData(ModelAndView mv, IPage page, String url) {
        if (page == null) {
            return;
        }
        mv.addObject("articles", page.getRecords());
        long current = page.getCurrent();
        long pages = page.getPages();
        String preUrl = "";
        String nextUrl = "";
        if (current == 1L && pages <= 1L) {
            preUrl = "#";
            nextUrl = "#";
        } else if (current == 1L && pages > 1L) {
            preUrl = "#";
            nextUrl = url + (current + 1L);
        } else if (current > 1 && current < pages) {
            preUrl = url + (current - 1L);
            nextUrl = url + (current + 1L);
        } else if (current > 1 && current == pages) {
            preUrl = url + (current - 1L);
            nextUrl = "#";
        }
        mv.addObject("nextUrl", nextUrl);
        mv.addObject("preUrl", preUrl);
    }
}
