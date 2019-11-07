package com.reimu.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.reimu.dao.ArticleInfoMapper;
import com.reimu.dao.CategoryMapper;
import com.reimu.entity.ArticleInfo;
import com.reimu.entity.Category;
import com.reimu.model.vo.IndexVO;
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


    @Override
    public IndexVO getIndexVO(Integer pageNo) {
        IndexVO vo = new IndexVO();
        List<Category> categories = categoryMapper.selectList(null);
        IPage<ArticleInfo> page = new Page<>(pageNo,10);
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("status",0);
        page = articleInfoMapper.selectPage(page,wrapper);
        vo.setCategories(categories);
        vo.setPage(page);
        return vo;
    }
}
