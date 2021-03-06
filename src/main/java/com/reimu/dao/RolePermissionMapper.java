package com.reimu.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.reimu.entity.RolePermission;

import java.util.List;

/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-22
 */
public interface RolePermissionMapper extends BaseMapper<RolePermission> {


    List<RolePermission> getRPByUserId(String userId);
}