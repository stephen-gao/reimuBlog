package com.reimu.service;

import com.reimu.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-22
 */
public interface IUserService extends IService<User> {

    User getOneByName(String username);
}
