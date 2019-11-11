package com.reimu.service;

import com.reimu.entity.ArticleInfo;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-28
 */
public interface IArticleInfoService extends IService<ArticleInfo> {

    void viewsNumAdd(String articleId);
}
