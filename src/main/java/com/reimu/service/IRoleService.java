package com.reimu.service;

import com.reimu.entity.Role;
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
public interface IRoleService extends IService<Role> {

    List<Role> getListByUserId(String userId);
}
