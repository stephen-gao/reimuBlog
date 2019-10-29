package com.reimu.web;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.reimu.common.Result;
import com.reimu.entity.Permission;
import com.reimu.entity.RolePermission;
import com.reimu.model.vo.PermissionVO;
import com.reimu.model.vo.RolePermissionVO;
import com.reimu.service.IPermissionService;
import com.reimu.service.IRolePermissionService;
import com.sun.org.apache.regexp.internal.RE;
import lombok.Data;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 角色权限表  前端控制器
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-22
 */
@Controller
@RequestMapping("/rolepermission")
public class RolePermissionController {

    @Autowired
    private IRolePermissionService rolePermissionService;

    @PostMapping("rp-save")
    @ResponseBody
    public Result saveRolePermission(@RequestBody RolePermissionVO vo){
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("role_id",vo.getRoleId());
        rolePermissionService.remove(wrapper);
        List<RolePermission> list = new ArrayList<>();
        if(!CollectionUtils.isEmpty(vo.getPermissionIds())){
            vo.getPermissionIds().forEach(p->{
                RolePermission po = new RolePermission();
                po.setRoleId(vo.getRoleId());
                po.setPermissionId(p);
                list.add(po);
            });
        }
        if(!CollectionUtils.isEmpty(list)){
            rolePermissionService.saveBatch(list);
        }
        return Result.defaultSuccess();
    }

    @GetMapping("rp-tree/{roleId}")
    @ResponseBody
    public Result getRPselected(@PathVariable("roleId") String roleId){

        List<PermissionVO> tree = rolePermissionService.initPermissionSelectTree(roleId);
        return Result.getSuccess(tree);
    }

}
