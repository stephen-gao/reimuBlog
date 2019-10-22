package com.reimu.service;

import com.reimu.entity.Permission;
import com.baomidou.mybatisplus.extension.service.IService;

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
}
