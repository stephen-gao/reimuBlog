package com.reimu.web;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.reimu.common.http.HttpResponse;
import com.reimu.entity.Category;
import com.reimu.model.page.CategoryPage;
import com.reimu.service.ICategoryService;
import com.reimu.utils.ShortIdUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
@RequestMapping("manage/category")
public class CategoryController {

    @Autowired
    private ICategoryService categoryService;

    @RequestMapping("page")
    public ModelAndView page(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("manage/system/category");
        return mv;
    }

    @RequestMapping("list")
    @ResponseBody
    public HttpResponse list(@RequestBody CategoryPage categoryPage){
        IPage page = new Page(categoryPage.getPageNumber(),categoryPage.getPageSize());
        page = categoryService.page(page);
        return HttpResponse.getSuccess(page);
    }

    @RequestMapping("all")
    @ResponseBody
    public HttpResponse all(){
        List<Category> list = categoryService.list();
        return HttpResponse.getSuccess(list);
    }

    @RequestMapping("add")
    @ResponseBody
    public HttpResponse save(@RequestBody Category category){
        categoryService.add(category);
        return HttpResponse.defaultSuccess();
    }

    @RequestMapping("update")
    @ResponseBody
    public HttpResponse update(@RequestBody Category category){
        categoryService.updateById(category);
        return HttpResponse.defaultSuccess();
    }

    @RequestMapping("delete/{id}")
    @ResponseBody
    public HttpResponse delete(@PathVariable("id") String id){
        categoryService.removeById(id);
        return HttpResponse.defaultSuccess();
    }


}
