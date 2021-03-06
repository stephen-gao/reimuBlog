package com.reimu.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.reimu.entity.Permission;
import com.reimu.dao.PermissionMapper;
import com.reimu.model.vo.PermissionVO;
import com.reimu.security.SysPermission;
import com.reimu.service.IPermissionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 权限表  服务实现类
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-22
 */
@Service
public class PermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements IPermissionService {

    @Autowired
    private PermissionMapper permissionMapper;


    @Override
    public List<Permission> getListByUserId(String userId) {
        return permissionMapper.getListByUserId(userId);
    }

    @Override
    public List<SysPermission> getAllPermAndRole() {
        return permissionMapper.getAllPermAndRole();
    }

    @Override
    public IPage<PermissionVO> getList(IPage page) {
        List list = permissionMapper.getList(page);
        page.setRecords(list);
        return page;
    }
}
