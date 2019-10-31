package com.reimu.dao;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.reimu.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.reimu.model.vo.UserVO;

import java.util.List;

/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-22
 */
public interface UserMapper extends BaseMapper<User> {

    List<UserVO> pageList(IPage page);
}