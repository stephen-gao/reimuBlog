package com.reimu.dao;

import com.reimu.entity.ArticleInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-28
 */
public interface ArticleInfoMapper extends BaseMapper<ArticleInfo> {
    void viewsNumAdd(String articleId);
}