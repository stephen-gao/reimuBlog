package com.reimu.web;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.reimu.common.http.HttpResponse;
import com.reimu.entity.Special;
import com.reimu.model.page.SpecialPage;
import com.reimu.service.ISpecialService;
import org.springframework.beans.factory.annotation.Autowired;
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
 * @since 2019-11-16
 */
@Controller
@RequestMapping("/manage/special")
public class SpecialController {

    @Autowired
    private ISpecialService specialService;

    @RequestMapping("page")
    public ModelAndView page(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("manage/system/special");
        return mv;
    }

    @RequestMapping("list")
    @ResponseBody
    public HttpResponse list(@RequestBody SpecialPage specialPage){
        IPage page = new Page(specialPage.getPageNumber(),specialPage.getPageSize());
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.orderByAsc("sort");
        page = specialService.page(page,wrapper);
        return HttpResponse.getSuccess(page);
    }

    @RequestMapping("all")
    @ResponseBody
    public HttpResponse all(){
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.orderByAsc("sort");
        List<Special> list = specialService.list(wrapper);
        return HttpResponse.getSuccess(list);
    }

    @RequestMapping("add")
    @ResponseBody
    public HttpResponse save(@RequestBody Special special){
        specialService.add(special);
        return HttpResponse.defaultSuccess();
    }

    @RequestMapping("update")
    @ResponseBody
    public HttpResponse update(@RequestBody Special category){
        specialService.updateById(category);
        return HttpResponse.defaultSuccess();
    }
//
    @RequestMapping("delete/{id}")
    @ResponseBody
    public HttpResponse delete(@PathVariable("id") String id){
        specialService.removeById(id);
        return HttpResponse.defaultSuccess();
    }

}
