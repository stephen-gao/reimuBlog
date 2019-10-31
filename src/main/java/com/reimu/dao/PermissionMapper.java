package com.reimu.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.reimu.entity.Permission;
import com.reimu.model.vo.PermissionVO;
import com.reimu.security.SysPermission;

import java.util.List;


/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-22
 */
public interface PermissionMapper extends BaseMapper<Permission> {

    List<Permission> getListByUserId(String userId);

    List<SysPermission> getAllPermAndRole();

    List<PermissionVO> getList(IPage page);
}