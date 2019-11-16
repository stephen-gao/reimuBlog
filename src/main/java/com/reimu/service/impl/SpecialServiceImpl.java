package com.reimu.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.reimu.dao.SpecialMapper;
import com.reimu.entity.Special;
import com.reimu.service.ISpecialService;
import com.reimu.utils.ShortIdUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *   服务实现类
 * </p>
 *
 * @author gaosheng
 * @since 2019-11-16
 */
@Service
public class SpecialServiceImpl extends ServiceImpl<SpecialMapper, Special> implements ISpecialService {

    @Value("${default.url}")
    private String defaultUrl;

    @Value("${default.special}")
    private String specialUrl;

    @Override
    public void add(Special special) {
        special.setId(ShortIdUtil.getUUID_8());
        special.setUrl(defaultUrl+specialUrl+special.getId());
        baseMapper.insert(special);
    }

    @Override
    public List<Special> all() {
        QueryWrapper<Special> wrapper = new QueryWrapper();
        wrapper.orderByAsc("sort");
        List<Special> list = baseMapper.selectList(wrapper);
        return list;
    }
}
