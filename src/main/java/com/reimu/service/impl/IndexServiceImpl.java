package com.reimu.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.reimu.dao.ArticleInfoMapper;
import com.reimu.dao.ArticleMapper;
import com.reimu.dao.CategoryMapper;
import com.reimu.entity.Article;
import com.reimu.entity.ArticleInfo;
import com.reimu.entity.Category;
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


    @Override
    public ShowVO getIndexVO() {
        ShowVO vo = new ShowVO();
        //查询首页数据
        IPage<ArticleVO> page = getArticleInfoIPage(1, null);
        //查询导航分类
        List<Category> categories = getCategorys();
        //查询热门文章
        List<ArticleInfo> hots = getHotArticles();
        //查询最新文章
        List<ArticleInfo> news = getNewArticles();

        vo.setCategories(categories);
        vo.setPage(page);
        vo.setHots(hots);
        vo.setNews(news);
        return vo;
    }

    @Override
    public ShowVO getPage(Integer pageNo) {
        ShowVO vo = new ShowVO();
        //查询首页数据
        IPage<ArticleVO> page = getArticleInfoIPage(pageNo, null);
        //查询导航分类
        List<Category> categories = getCategorys();
        //查询热门文章
        List<ArticleInfo> hots = getHotArticles();
        //查询最新文章
        List<ArticleInfo> news = getNewArticles();
        vo.setCategories(categories);
        vo.setPage(page);
        vo.setHots(hots);
        vo.setNews(news);
        return vo;
    }

    @Override
    public ShowVO getCategoryPage(Integer pageNo,String categoryId) {
        ShowVO vo = new ShowVO();
        //查询首页数据
        IPage<ArticleVO> page = getArticleInfoIPage(pageNo,categoryId);
        //查询导航分类
        List<Category> categories = getCategorys();
        //查询热门文章
        List<ArticleInfo> hots = getHotArticles();
        //查询最新文章
        List<ArticleInfo> news = getNewArticles();
        vo.setCategories(categories);
        vo.setPage(page);
        vo.setHots(hots);
        vo.setNews(news);
        return vo;
    }

    private IPage<ArticleVO> getArticleInfoIPage(int i, String categoryId) {
        IPage<ArticleVO> page = new Page<>(i, 10);
        page = articleMapper.selectAPage(page,categoryId);
        return page;
    }


    @Override
    public ShowVO getOneShowById(String id) {
        ShowVO vo = new ShowVO();
        //查询文章
        ArticleVO article = getArticle(id);
        //查询导航分类
        List<Category> categories = getCategorys();
        //查询热门文章
        List<ArticleInfo> hots = getHotArticles();
        //查询最新文章
        List<ArticleInfo> news = getNewArticles();

        vo.setArticleVO(article);
        vo.setCategories(categories);
        vo.setHots(hots);
        vo.setNews(news);
        return vo;
    }

    private ArticleVO getArticle(String id) {
        ArticleVO articleVO = articleMapper.selectOneByAId(id);
        return articleVO;
    }


    private List<Category> getCategorys() {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.orderByAsc("sort");
        List<Category> categories = categoryMapper.selectList(wrapper);
        return categories;
    }

    private List<ArticleInfo> getHotArticles() {
        return getArticleInfos("views_num");
    }

    private List<ArticleInfo> getNewArticles() {
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
}
