package com.reimu.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.reimu.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;
import com.reimu.model.vo.UserVO;

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

    IPage<User> userPage(UserVO vo);
}
