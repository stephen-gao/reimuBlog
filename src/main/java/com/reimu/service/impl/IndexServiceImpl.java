package com.reimu.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.reimu.dao.*;
import com.reimu.entity.Article;
import com.reimu.entity.ArticleInfo;
import com.reimu.entity.Category;
import com.reimu.entity.Special;
import com.reimu.model.QueryArticle;
import com.reimu.model.vo.ArticleVO;
import com.reimu.model.vo.ShowVO;
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
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.orderByAsc("sort");
        return specialMapper.selectList(wrapper);
    }

    @Override
    public List<Category> getCategorys() {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.orderByAsc("sort");
        List<Category> categories = categoryMapper.selectList(wrapper);
        return categories;
    }

    @Override
    public List<ArticleInfo> getHotArticles() {
        return getArticleInfos("views_num");
    }

    @Override
    public List<ArticleInfo> getNewArticles() {
        return getArticleInfos("create_time");
    }

    private List<ArticleInfo> getArticleInfos(String sort) {
        IPage<ArticleInfo> page = new Page<>(1, 5);
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("status", 0);
        wrapper.orderByDesc(sort);
        page = articleInfoMapper.selectPage(page, wrapper);
        List<ArticleInfo> hots = page.getRecords();
        return hots;
    }

    @Override
    public Integer allCount(){
        Integer allvistor = vistorLogMapper.countAllvistor();
        return allvistor;
    }

    @Override
    public Integer ipCount(){
        Integer countIp = vistorLogMapper.countIp();
        return countIp;
    }
}
