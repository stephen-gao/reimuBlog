package com.reimu.web;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.reimu.common.Result;
import com.reimu.entity.Permission;
import com.reimu.model.tree.TreeItem;
import com.reimu.model.vo.PermissionVO;
import com.reimu.model.vo.UserVO;
import com.reimu.service.IPermissionService;
import com.reimu.service.IRolePermissionService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 权限表  前端控制器
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-22
 */
@Controller
@RequestMapping("/permission")
public class PermissionController {

    @Autowired
    private IPermissionService permissionService;

    @RequestMapping("permission-page")
    public ModelAndView permissionPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("manage/system/permission");
        return mv;
    }

    @RequestMapping("permission-page-data")
    @ResponseBody
    public Result permissionPageData(@RequestBody PermissionVO vo) {
        IPage page = new Page(vo.getPageNumber(), vo.getPageSize());
//        QueryWrapper wrapper = new QueryWrapper();
//        wrapper.orderByAsc("type");
//        wrapper.orderByAsc("sort");
//        page = permissionService.page(page,wrapper);
        page = permissionService.getList(page);
        return Result.getSuccess(page);
    }

    @RequestMapping("permission-parent")
    @ResponseBody
    public Result permissionParent() {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("pid","root");
        List<Permission> list = permissionService.list(wrapper);
        QueryWrapper subWapper = new QueryWrapper();
        subWapper.eq("type","1");
        subWapper.orderByAsc("sort");
        List subs = permissionService.list(subWapper);
        list.addAll(subs);
        return Result.getSuccess(list);
    }

    @RequestMapping("permission-add")
    @ResponseBody
    public Result add(@RequestBody PermissionVO vo){
        Permission po = new Permission();
        BeanUtils.copyProperties(vo,po);
        permissionService.save(po);
        return Result.defaultSuccess();
    }

    @RequestMapping("permission-edit")
    @ResponseBody
    public Result edit(@RequestBody PermissionVO vo){
        Permission po = new Permission();
        BeanUtils.copyProperties(vo,po);
        permissionService.updateById(po);
        return Result.defaultSuccess();
    }

    @RequestMapping("permission-delete/{id}")
    @ResponseBody
    public Result delete(@PathVariable("id") String id){
        permissionService.removeById(id);
        return Result.defaultSuccess();
    }
}
