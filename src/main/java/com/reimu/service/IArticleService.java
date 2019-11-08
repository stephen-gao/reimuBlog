package com.reimu.service;

import com.reimu.entity.Article;
import com.baomidou.mybatisplus.extension.service.IService;
import com.reimu.model.request.ArticleSaveUpdateRequest;
import com.reimu.model.vo.ArticleVO;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-28
 */
public interface IArticleService extends IService<Article> {

    void save(ArticleSaveUpdateRequest request);

    void update(ArticleSaveUpdateRequest request);

    ArticleVO getOneById(String id);

    ArticleVO getOneShowById(String id);
}
