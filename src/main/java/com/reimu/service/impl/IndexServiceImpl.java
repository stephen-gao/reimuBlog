package com.reimu.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.reimu.cache.CacheKeys;
import com.reimu.cache.CacheService;
import com.reimu.dao.*;
import com.reimu.entity.ArticleInfo;
import com.reimu.entity.Category;
import com.reimu.entity.Special;
import com.reimu.model.vo.ArticleVO;
import com.reimu.service.IndexService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j2
@Service
public class IndexServiceImpl implements IndexService {

    @Autowired
    private CategoryMapper categoryMapper;

    @Autowired
    private ArticleInfoMapper articleInfoMapper;

    @Autowired
    private ArticleMapper articleMapper;

    @Autowired
    VistorLogMapper vistorLogMapper;

    @Autowired
    private SpecialMapper specialMapper;

    @Autowired
    private CacheService cacheService;


    @Override
    public IPage<ArticleVO> getIndexVO() {
        //查询首页数据
        IPage<ArticleVO> page = getArticleInfoIPage(1, null);
        return page;
    }

    @Override
    public IPage<ArticleVO> getPage(Integer pageNo) {
        //查询首页数据
        IPage<ArticleVO> page = getArticleInfoIPage(pageNo, null);
        return page;
    }

    @Override
    public IPage<ArticleVO> getCategoryPage(Integer pageNo,String categoryId) {
        //查询首页数据
        IPage<ArticleVO> page = getArticleInfoIPage(pageNo,categoryId);
        return page;
    }

    private IPage<ArticleVO> getArticleInfoIPage(int i, String categoryId) {
        IPage<ArticleVO> page = new Page<>(i, 10);
        page = articleMapper.selectAPage(page,categoryId);
        return page;
    }

    @Override
    public IPage<ArticleVO> getSpecialPage(Integer pageNo, String specialId) {
        IPage<ArticleVO> page = new Page<>(pageNo, 10);
        page = articleMapper.selectSAPage(page,specialId);
        return page;
    }


    @Override
    public ArticleVO getOneShowById(String id) {
        //查询文章
        ArticleVO article = getArticle(id);
        return article;
    }


    private ArticleVO getArticle(String id) {
        ArticleVO articleVO = articleMapper.selectOneByAId(id);
        return articleVO;
    }

    @Override
    public List<Special> getSpecials() {
        Object o =  cacheService.get(CacheKeys.SPECIAL_CACHE);
        if(o == null) {
            QueryWrapper wrapper = new QueryWrapper();
            wrapper.orderByAsc("sort");
            List list = specialMapper.selectList(wrapper);
            cacheService.put(CacheKeys.SPECIAL_CACHE,list,CacheService.halfHour);
            return list;
        }
        return (List)o;
    }

    @Override
    public List<Category> getCategorys() {
        Object o = cacheService.get(CacheKeys.CATEGORY_CACHE);
        if(o == null){
            QueryWrapper wrapper = new QueryWrapper();
            wrapper.orderByAsc("sort");
            List<Category> categories = categoryMapper.selectList(wrapper);
            cacheService.put(CacheKeys.CATEGORY_CACHE,categories,CacheService.halfHour);
            return categories;
        }
        return (List)o;
    }

    @Override
    public List<ArticleInfo> getHotArticles() {
        Object o = cacheService.get(CacheKeys.HOT_ARTICLE_CACHE);
        if(o == null) {
            List<ArticleInfo> list = getArticleInfos("views_num");
            cacheService.put(CacheKeys.HOT_ARTICLE_CACHE,list,CacheService.halfHour);
            return list;
        }
        return (List)o;
    }

    @Override
    public List<ArticleInfo> getNewArticles() {
        Object o = cacheService.get(CacheKeys.NEW_ARTICLE_CACHE);
        if(o == null) {
            List<ArticleInfo> list = getArticleInfos("create_time");
            cacheService.put(CacheKeys.NEW_ARTICLE_CACHE,list,CacheService.halfHour);
            return list;
        }
        return (List)o;
    }

    private List<ArticleInfo> getArticleInfos(String sort) {
        IPage<ArticleInfo> page = new Page<>(1, 5);
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("status", 1);
        wrapper.orderByDesc(sort);
        page = articleInfoMapper.selectPage(page, wrapper);
        List<ArticleInfo> hots = page.getRecords();
        return hots;
    }

    @Override
    public Integer allCount(){
        Object o = cacheService.get(CacheKeys.ALL_COUNT_CACHE);
        if(o == null) {
            Integer allvistor = vistorLogMapper.countAllvistor();
            cacheService.put(CacheKeys.ALL_COUNT_CACHE,allvistor,CacheService.halfHour);
            return allvistor;
        }
        return (Integer) o;
    }

    @Override
    public Integer ipCount(){
        Object o = cacheService.get(CacheKeys.IP_COUNT_CACHE);
        if(o == null) {
            Integer countIp = vistorLogMapper.countIp();
            cacheService.put(CacheKeys.IP_COUNT_CACHE,countIp,CacheService.halfHour);
            return countIp;
        }
        return (Integer) o;
    }
}
