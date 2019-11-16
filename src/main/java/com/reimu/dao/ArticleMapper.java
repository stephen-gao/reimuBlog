package com.reimu.dao;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.reimu.entity.Article;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.reimu.model.QueryArticle;
import com.reimu.model.vo.ArticleVO;

/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-28
 */
public interface ArticleMapper extends BaseMapper<Article> {

    ArticleVO selectOneByAId(String articleId);

    IPage<ArticleVO> selectAPage(IPage page,String categoryId);

    IPage<ArticleVO> selectSAPage(IPage page,String specialId);
}