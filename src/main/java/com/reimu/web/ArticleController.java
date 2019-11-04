package com.reimu.web;

import com.reimu.common.http.HttpResponse;
import com.reimu.model.request.ArticleSaveUpdateRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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


    @RequestMapping("page")
    public ModelAndView articlePage(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("manage/system/article");
        return mv;
    }

    @RequestMapping("edit-page")
    public ModelAndView articleEditPage(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("manage/system/article-edit");
        return mv;
    }

    @RequestMapping("save")
    public HttpResponse save(ArticleSaveUpdateRequest request){

        return HttpResponse.defaultSuccess();
    }
}
