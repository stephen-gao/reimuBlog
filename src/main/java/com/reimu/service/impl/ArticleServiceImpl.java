package com.reimu.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.reimu.dao.ArticleInfoMapper;
import com.reimu.dao.ArticleSrcMapper;
import com.reimu.dao.SpecialArticleMapper;
import com.reimu.entity.Article;
import com.reimu.dao.ArticleMapper;
import com.reimu.entity.ArticleInfo;
import com.reimu.entity.ArticleSrc;
import com.reimu.entity.SpecialArticle;
import com.reimu.model.request.ArticleSaveUpdateRequest;
import com.reimu.model.vo.ArticleVO;
import com.reimu.security.SysUser;
import com.reimu.service.IArticleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.reimu.utils.ShortIdUtil;
import com.reimu.utils.DateUtil;
import com.reimu.utils.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.List;

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

    @Autowired
    private SpecialArticleMapper specialArticleMapper;

    @Value("${default.url}")
    private String defaultUrl;

    @Value("${default.article}")
    private String articleUrl;

    @Override
    public void save(ArticleSaveUpdateRequest request) {

        SysUser user = UserUtil.getCurrentUser();

        String date = DateUtil.convert(new Date());
        ArticleInfo info = new ArticleInfo();
        ArticleSrc src = new ArticleSrc();
        Article article = new Article();
        info.setTitle(request.getTitle());
        info.setDescription(request.getDescription());
        info.setKeyword(request.getKeyword());
        info.setStatus(request.getStatus());
        info.setStarNum(0L);
        info.setViewsNum(0L);
        info.setCommentNum(0L);
        info.setCreateTime(date);
        info.setUpdateTime(date);
        info.setCategoryId(request.getCategoryId());
        //设置ID
        info.setId(createId());
        info.setUrl(defaultUrl+articleUrl+info.getId());
        info.setAuthorId(user.getId());
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
        //保存专题
        saveSA(request.getSpecials(),info.getId());
    }

    @Override
    public void update(ArticleSaveUpdateRequest request) {
        String date = DateUtil.convert(new Date());
        ArticleInfo info = new ArticleInfo();
        ArticleSrc src = new ArticleSrc();
        Article article = new Article();
        info.setTitle(request.getTitle());
        info.setDescription(request.getDescription());
        info.setKeyword(request.getKeyword());
        info.setStatus(request.getStatus());
        info.setStarNum(0L);
        info.setViewsNum(0L);
        info.setCommentNum(0L);
        info.setCreateTime(date);
        info.setUpdateTime(date);
        info.setCategoryId(request.getCategoryId());
        //id
        info.setId(request.getId());
        //info
        articleInfoMapper.updateById(info);
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("article_id",info.getId());
        src.setContentSrc(request.getContentSrc());
        src.setCreateTime(date);
        src.setUpdateTime(date);
        src.setArticleId(info.getId());
        article.setContent(request.getContent());
        article.setCreateTime(date);
        article.setUpdateTime(date);
        article.setArticleId(info.getId());
        articleSrcMapper.update(src,wrapper);
        articleMapper.update(article,wrapper);
        //保存专题
        deleteSAByAid(info.getId());
        saveSA(request.getSpecials(),info.getId());
    }

    @Override
    public ArticleVO getOneById(String id) {
        ArticleInfo info = articleInfoMapper.selectById(id);
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("article_id",id);
        ArticleSrc src = articleSrcMapper.selectOne(wrapper);
        ArticleVO vo = new ArticleVO();
        vo.setId(info.getId());
        vo.setDescription(info.getDescription());
        vo.setKeyword(info.getKeyword());
        vo.setTitle(info.getTitle());
        vo.setCategory(info.getCategoryId());
        vo.setContentSrc(src.getContentSrc());
        return vo;
    }

    private String createId(){
        String id = ShortIdUtil.getShortId();
        boolean b = true;
        while (b){
            ArticleInfo info = articleInfoMapper.selectById(id);
            if(info == null) {
                b = false;
            }else {
                id = ShortIdUtil.getShortId();
            }
        }
        return id;
    }

    private void deleteSAByAid(String articleId){
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("article_id",articleId);
        specialArticleMapper.delete(wrapper);
    }

    private void saveSA(List<String> specialIds ,String articleId){
        if(!CollectionUtils.isEmpty(specialIds)) {
            specialIds.forEach(s -> {
                SpecialArticle specialArticle = new SpecialArticle();
                specialArticle.setSpecialId(s);
                specialArticle.setArticleId(articleId);
                specialArticleMapper.insert(specialArticle);
            });
        }
    }
}
