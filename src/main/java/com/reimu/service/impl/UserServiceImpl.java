package com.reimu.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.reimu.entity.User;
import com.reimu.dao.UserMapper;
import com.reimu.model.vo.UserVO;
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

    @Override
    public IPage<User> userPage(UserVO vo) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.select("id","username","nickname","gender","email","photo");
        IPage<User> page = new Page(vo.getPageNumber(),vo.getPageSize());
        return this.page(page,wrapper);
    }
}
