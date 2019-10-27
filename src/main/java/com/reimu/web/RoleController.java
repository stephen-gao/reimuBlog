package com.reimu.web;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.reimu.common.Result;
import com.reimu.entity.Permission;
import com.reimu.entity.Role;
import com.reimu.model.vo.PermissionVO;
import com.reimu.model.vo.RoleVO;
import com.reimu.model.vo.UserVO;
import com.reimu.service.IRoleService;
import com.reimu.service.IUserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * <p>
 * 角色表  前端控制器
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-22
 */
@Controller
@RequestMapping("/role")
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
    public Result rolePageData(@RequestBody RoleVO vo){
        IPage page = new Page(vo.getPageNumber(), vo.getPageSize());
        page = roleService.page(page);
        return Result.getSuccess(page);
    }

    @RequestMapping("role-add")
    @ResponseBody
    public Result add(@RequestBody RoleVO vo){
        Role po = new Role();
        BeanUtils.copyProperties(vo,po);
        roleService.save(po);
        return Result.defaultSuccess();
    }

    @RequestMapping("role-edit")
    @ResponseBody
    public Result edit(@RequestBody RoleVO vo){
        Role po = new Role();
        BeanUtils.copyProperties(vo,po);
        roleService.updateById(po);
        return Result.defaultSuccess();
    }

    @RequestMapping("role-delete/{id}")
    @ResponseBody
    public Result delete(@PathVariable("id") String id){
        roleService.removeById(id);
        return Result.defaultSuccess();
    }
}
