package com.reimu.model.vo;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.reimu.entity.ArticleInfo;
import com.reimu.entity.Category;
import lombok.Data;

import java.util.List;

@Data
public class IndexVO {

    List<Category> categories;

    IPage<ArticleInfo> page;
}
