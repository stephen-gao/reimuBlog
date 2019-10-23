package com.reimu.dao;

import com.reimu.entity.Role;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-22
 */
public interface RoleMapper extends BaseMapper<Role> {

    List<Role> getListByUserId(String userId);
}