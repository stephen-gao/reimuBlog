package com.reimu.service.impl;

import com.reimu.dao.ArticleInfoMapper;
import com.reimu.dao.ArticleSrcMapper;
import com.reimu.entity.Article;
import com.reimu.dao.ArticleMapper;
import com.reimu.entity.ArticleInfo;
import com.reimu.entity.ArticleSrc;
import com.reimu.model.request.ArticleSaveUpdateRequest;
import com.reimu.service.IArticleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.omg.CORBA.DATA_CONVERSION;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * <p>
 *   服务实现类
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-28
 */
@Service
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article> implements IArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Autowired
    private ArticleInfoMapper articleInfoMapper;

    @Autowired
    private ArticleSrcMapper articleSrcMapper;

    @Override
    public void save(ArticleSaveUpdateRequest request) {
        Date date = new Date();
        ArticleInfo info = new ArticleInfo();
        ArticleSrc src = new ArticleSrc();
        Article article = new Article();
        info.setTitle(request.getTitle());
        info.setDescription(request.getDescription());
        info.setKeyword(request.getKeyword());
        info.setStarNum(0L);
        info.setViewsNum(0L);
        info.setCommentNum(0L);
        info.setStatus(0);
        info.setCreateTime(date);
        info.setUpdateTime(date);
        //info
        articleInfoMapper.insert(info);
        src.setContentSrc(request.getContentSrc());
        src.setCreateTime(date);
        src.setUpdateTime(date);
        src.setArticleId(info.getId());
        article.setContent(request.getContent());
        article.setCreateTime(date);
        article.setUpdateTime(date);
        article.setArticleId(info.getId());
        articleSrcMapper.insert(src);
        articleMapper.insert(article);
    }
}
