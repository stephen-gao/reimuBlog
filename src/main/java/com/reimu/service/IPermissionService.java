package com.reimu.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.reimu.entity.Permission;
import com.baomidou.mybatisplus.extension.service.IService;
import com.reimu.model.vo.PermissionVO;
import com.reimu.security.SysPermission;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-22
 */
public interface IPermissionService extends IService<Permission> {
    List<Permission> getListByUserId(String userId);

    List<SysPermission> getAllPermAndRole();

    IPage<PermissionVO> getList(IPage page);
}
