package com.reimu.service.impl;

import com.reimu.entity.ArticleInfo;
import com.reimu.dao.ArticleInfoMapper;
import com.reimu.service.IArticleInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
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
public class ArticleInfoServiceImpl extends ServiceImpl<ArticleInfoMapper, ArticleInfo> implements IArticleInfoService {

    @Autowired
    private ArticleInfoMapper articleInfoMapper;

    @Override
    public void viewsNumAdd(String articleId){
        articleInfoMapper.viewsNumAdd(articleId);
    }
}
