package com.reimu.model.request;

import lombok.Data;

import java.util.List;

@Data
public class ArticleSaveUpdateRequest {

    /**
     *
     */
    private String id;

    /**
     * 作者ID
     */
    private String authorId;

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
     * 文章内容
     */
    private String content;

    /**
     * 分类
     */
    private String categoryId;

    /**
     * 原始内容
     */
    private String contentSrc;
    /**
     * 状态 0 草稿 1发布 2删除
     */
    private Integer status;

    /**
     * 专题
     */
    private List<String> specials;

}
