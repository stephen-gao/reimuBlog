package com.reimu.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.reimu.entity.Special;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author gaosheng
 * @since 2019-11-16
 */
public interface ISpecialService extends IService<Special> {

    void add(Special special);

    List<Special> all();
}
