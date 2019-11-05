package com.reimu.web;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.reimu.common.http.HttpResponse;
import com.reimu.entity.ArticleInfo;
import com.reimu.model.page.ArticlePage;
import com.reimu.model.request.ArticleSaveUpdateRequest;
import com.reimu.service.IArticleInfoService;
import com.reimu.service.IArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * <p>
 *   前端控制器
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-28
 */
@Controller
@RequestMapping("/article")
public class ArticleController {

    @Autowired
    private IArticleService articleService;

    @Autowired
    private IArticleInfoService articleInfoService;


    @RequestMapping("page")
    public ModelAndView articlePage(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("manage/system/article");
        return mv;
    }

    @RequestMapping("add-page")
    public ModelAndView addPage(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("manage/system/article-add");
        return mv;
    }

    @RequestMapping("edit-page/{id}")
    public ModelAndView editPage(@PathVariable("id")String id){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("manage/system/article-edit");
        return mv;
    }

    @RequestMapping("save")
    @ResponseBody
    public HttpResponse save(@RequestBody ArticleSaveUpdateRequest request){
        articleService.save(request);
        return HttpResponse.defaultSuccess();
    }

    @RequestMapping("list")
    @ResponseBody
    public HttpResponse list(@RequestBody ArticlePage articlePage){
        IPage page = new Page(articlePage.getPageNumber(),articlePage.getPageSize());
        page = articleInfoService.page(page);
        return HttpResponse.getSuccess(page);
    }

    @RequestMapping("delete/{id}")
    @ResponseBody
    public HttpResponse delete(@PathVariable("id") String id){
        ArticleInfo articleInfo = new ArticleInfo();
        articleInfo.setId(id);
        articleInfo.setStatus(2);
        articleInfoService.updateById(articleInfo);
        return HttpResponse.defaultSuccess();
    }


}
