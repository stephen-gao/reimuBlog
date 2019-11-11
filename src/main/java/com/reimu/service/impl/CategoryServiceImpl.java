package com.reimu.service.impl;

import com.reimu.entity.Category;
import com.reimu.dao.CategoryMapper;
import com.reimu.service.ICategoryService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.reimu.utils.ShortIdUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

/**
 * <p>
 *   服务实现类
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-28
 */
@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements ICategoryService {


    @Value("${default.url}")
    private String defaultUrl;

    @Value("${default.category}")
    private String categoryUrl;

    @Override
    public void add(Category category) {
        category.setId(ShortIdUtil.getUUID_8());
        category.setUrl(defaultUrl+categoryUrl+category.getId());
        baseMapper.insert(category);
    }
}
