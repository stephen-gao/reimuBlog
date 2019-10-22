package com.reimu.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.reimu.entity.User;
import com.reimu.dao.UserMapper;
import com.reimu.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户表  服务实现类
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-22
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    @Override
    public User getOneByName(String username) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("username",username);
        return baseMapper.selectOne(wrapper);
    }
}
