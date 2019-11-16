package com.reimu.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.reimu.entity.ArticleInfo;
import com.reimu.entity.Category;
import com.reimu.entity.Special;
import com.reimu.model.vo.ArticleVO;
import com.reimu.model.vo.ShowVO;

import java.util.List;

public interface IndexService {

    IPage<ArticleVO> getIndexVO();

    IPage<ArticleVO> getPage(Integer pageNo);

    IPage<ArticleVO> getCategoryPage(Integer pageNo, String categoryId);

    IPage<ArticleVO> getSpecialPage(Integer pageNo, String specialId);

    ArticleVO getOneShowById(String id);

    List<Special> getSpecials();

    List<Category> getCategorys();

    List<ArticleInfo> getHotArticles();

    List<ArticleInfo> getNewArticles();

    Integer allCount();

    Integer ipCount();
}
