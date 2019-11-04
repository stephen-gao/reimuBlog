package com.reimu.service;

import com.reimu.entity.Article;
import com.baomidou.mybatisplus.extension.service.IService;
import com.reimu.model.request.ArticleSaveUpdateRequest;

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
}
