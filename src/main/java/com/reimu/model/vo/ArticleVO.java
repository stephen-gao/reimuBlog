package com.reimu.model.vo;

import lombok.Data;

@Data
public class ArticleVO {

    /**
     *
     */
    private String id;

    /**
     * 标题ID
     */
    private String title;

    /**
     * 关键字
     */
    private String keyword;

    /**
     * 描述
     */
    private String description;

    /**
     * 原始内容
     */
    private String contentSrc;
}
