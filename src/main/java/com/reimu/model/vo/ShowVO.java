package com.reimu.model.vo;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.reimu.entity.ArticleInfo;
import com.reimu.entity.Category;
import lombok.Data;

import java.util.List;

/**
 * ...
 *
 * @author GaoSheng
 * @version 1.0
 * @blame GaoSheng
 * @since 2019/11/09 11:53
 **/
@Data
public class ShowVO {

    private ArticleVO articleVO;

    private List<Category> categories;

    private List<ArticleInfo> hots;

    private List<ArticleInfo> news;

    private IPage<ArticleVO> page;
}
