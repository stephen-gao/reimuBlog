package com.reimu.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.reimu.common.Result;
import com.reimu.common.ResultEnums;
import com.reimu.entity.User;
import com.reimu.dao.UserMapper;
import com.reimu.enums.UserStatusEnums;
import com.reimu.model.vo.UserVO;
import com.reimu.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.nio.file.Watchable;

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

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Value("${user.default.password}")
    private String defaultPassword;

    @Override
    public User getOneByName(String username) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("username",username);
        return baseMapper.selectOne(wrapper);
    }

    @Override
    public IPage<User> userPage(UserVO vo) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.select("id","username","nickname","gender","email","photo","information");
        wrapper.ne("status",9);
        wrapper.ne("id",0);
        IPage<User> page = new Page(vo.getPageNumber(),vo.getPageSize());
        return this.page(page,wrapper);
    }

    @Override
    public Result userAdd(UserVO vo) {
        if(StringUtils.isEmpty(vo.getUsername())){
            return Result.getResult(ResultEnums.FAILED,"用户名不能为空");
        }
        User one = getOneByName(vo.getUsername());
        if(one != null){
            return Result.getResult(ResultEnums.FAILED,"用户名已存在");
        }
        User po = getUser(vo);
        po.setStatus(UserStatusEnums.NORMAL.getStatus());
        po.setPassword(defaultPassword);
        po.setPassword(passwordEncoder.encode(po.getPassword()));
        baseMapper.insert(po);
        return Result.defaultSuccess();
    }

    @Override
    public Result userEdit(UserVO vo) {
        if(StringUtils.isEmpty(vo.getUsername())){
            return Result.getResult(ResultEnums.FAILED,"用户名不能为空");
        }
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("username",vo.getUsername());
        wrapper.ne("id",vo.getId());
        User one = baseMapper.selectOne(wrapper);
        if(one != null){
            return Result.getResult(ResultEnums.FAILED,"用户名已存在");
        }
        User po = getUser(vo);
        baseMapper.updateById(po);
        return Result.defaultSuccess();
    }

    @Override
    public Result userDelete(String id) {
        User po = new User();
        po.setId(id);
        po.setStatus(UserStatusEnums.DELETE.getStatus());
        baseMapper.updateById(po);
        return Result.defaultSuccess();
    }

    @Override
    public Result passChange(UserVO vo) {
        if(StringUtils.isEmpty(vo.getPassword())){
            return Result.getResult(ResultEnums.FAILED,"密码不能为空");
        }
        User po = new User();
        po.setPassword(vo.getPassword());
        po.setId(vo.getId());
        baseMapper.updateById(po);
        return Result.defaultSuccess();
    }

    private User getUser(UserVO vo) {
        User po = new User();
        BeanUtils.copyProperties(vo, po);
        return po;
    }

}
