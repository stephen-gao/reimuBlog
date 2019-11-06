package com.reimu.web;

import com.reimu.model.tree.TreeItem;
import com.reimu.security.SysUser;
import com.reimu.security.SysUserService;
import com.reimu.service.IRolePermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class ManageController {

    @Autowired
    private IRolePermissionService rolePermissionService;

    @Autowired
    private SysUserService sysUserService;

    @RequestMapping("/manage")
    public ModelAndView indexPage(){
        ModelAndView mv = new ModelAndView();
        SysUser sysUser = sysUserService.getSysUser();
        List<TreeItem> menuTree = rolePermissionService.initMenuTree(sysUser.getId());
        mv.addObject("menuTree",menuTree);
        mv.setViewName("manage/system/index");
        return mv;
    }

    @RequestMapping("/manage-main")
    public String mainPage(){

        return "manage/system/main";
    }
}
