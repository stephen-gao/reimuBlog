package com.reimu.web;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.reimu.common.http.HttpResponse;
import com.reimu.entity.ArticleInfo;
import com.reimu.entity.Category;
import com.reimu.entity.Special;
import com.reimu.entity.SpecialArticle;
import com.reimu.model.page.ArticlePage;
import com.reimu.model.request.ArticleSaveUpdateRequest;
import com.reimu.model.vo.ArticleVO;
import com.reimu.model.vo.SpecialVO;
import com.reimu.service.*;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *   前端控制器
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-28
 */
@Controller
@RequestMapping("manage/article")
public class ArticleController {

    @Autowired
    private IArticleService articleService;

    @Autowired
    private IArticleInfoService articleInfoService;

    @Autowired
    private ICategoryService categoryService;

    @Autowired
    private ISpecialService specialService;

    @Autowired
    private ISpecialArticleService specialArticleService;


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
        ArticleVO vo = articleService.getOneById(id);
        List<Category> categories = categoryService.list();
        List<SpecialVO> specials = getCheckedList(id);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("manage/system/article-edit");
        mv.addObject("articleVO",vo);
        mv.addObject("categories",categories);
        mv.addObject("specials",specials);
        return mv;
    }

    private List<SpecialVO> getCheckedList(String articleId){
        List<Special> specials = specialService.all();
        QueryWrapper<SpecialArticle> wrapper = new QueryWrapper();
        wrapper.eq("article_id",articleId);
        List<SpecialArticle> salist = specialArticleService.list(wrapper);
        List<SpecialVO> vos = new ArrayList<>();
        specials.forEach(s->{
            SpecialVO vo = new SpecialVO();
            BeanUtils.copyProperties(s,vo);
            vo.setChecked(wasChecked(s,salist));
            vos.add(vo);
        });
        return vos;
    }

    private boolean wasChecked(Special special,List<SpecialArticle> salist){
        for(SpecialArticle sa :salist){
            if(special.getId().equals(sa.getSpecialId())){
                return true;
            }
        }
        return false;
    }

    @RequestMapping("save")
    @ResponseBody
    public HttpResponse save(@RequestBody ArticleSaveUpdateRequest request){
        request.setStatus(0);
        articleService.save(request);
        return HttpResponse.defaultSuccess();
    }

    @RequestMapping("publish")
    @ResponseBody
    public HttpResponse saveAndPublish(@RequestBody ArticleSaveUpdateRequest request){
        request.setStatus(1);
        articleService.save(request);
        return HttpResponse.defaultSuccess();
    }

    @RequestMapping("update")
    @ResponseBody
    public HttpResponse update(@RequestBody ArticleSaveUpdateRequest request){
        request.setStatus(0);
        articleService.update(request);
        return HttpResponse.defaultSuccess();
    }

    @RequestMapping("updpublish")
    @ResponseBody
    public HttpResponse updateAndPublish(@RequestBody ArticleSaveUpdateRequest request){
        request.setStatus(1);
        articleService.update(request);
        return HttpResponse.defaultSuccess();
    }

    @RequestMapping("list")
    @ResponseBody
    public HttpResponse list(@RequestBody ArticlePage articlePage){
        IPage page = new Page(articlePage.getPageNumber(),articlePage.getPageSize());
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.orderByDesc("create_time");
        page = articleInfoService.page(page,wrapper);
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
