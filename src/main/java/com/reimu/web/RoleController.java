package com.reimu.web;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.reimu.common.http.HttpResponse;
import com.reimu.entity.Role;
import com.reimu.model.vo.RoleVO;
import com.reimu.service.IRoleService;
import org.springframework.beans.BeanUtils;
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
 * 角色表  前端控制器
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-22
 */
@Controller
@RequestMapping("manage/role")
public class RoleController {

    @Autowired
    private IRoleService roleService;

    @RequestMapping("role-page")
    public ModelAndView rolePage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("manage/system/role");
        return mv;
    }

    @RequestMapping("role-page-data")
    @ResponseBody
    public HttpResponse rolePageData(@RequestBody RoleVO vo){
        IPage page = new Page(vo.getPageNumber(), vo.getPageSize());
        page = roleService.page(page);
        return HttpResponse.getSuccess(page);
    }

    @RequestMapping("list/all")
    @ResponseBody
    public HttpResponse listAll(){
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.ne("id",0);
        List list = roleService.list(wrapper);
        return HttpResponse.getSuccess(list);
    }

    @RequestMapping("role-add")
    @ResponseBody
    public HttpResponse add(@RequestBody RoleVO vo){
        Role po = new Role();
        BeanUtils.copyProperties(vo,po);
        roleService.save(po);
        return HttpResponse.defaultSuccess();
    }

    @RequestMapping("role-edit")
    @ResponseBody
    public HttpResponse edit(@RequestBody RoleVO vo){
        Role po = new Role();
        BeanUtils.copyProperties(vo,po);
        roleService.updateById(po);
        return HttpResponse.defaultSuccess();
    }

    @RequestMapping("role-delete/{id}")
    @ResponseBody
    public HttpResponse delete(@PathVariable("id") String id){
        roleService.removeById(id);
        return HttpResponse.defaultSuccess();
    }
}
