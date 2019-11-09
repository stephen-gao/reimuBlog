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

    /**
     * 原始内容
     */
    private String content;

    private String author;
    private String authorId;

    /**
     * 访问路径
     */
    private String url;

    /**
     * 浏览量
     */
    private Long viewsNum;

    /**
     * 评论数
     */
    private Long commentNum;

    /**
     * 点赞数
     */
    private Long starNum;

    /**
     * 状态 0 草稿 1发布 2删除
     */
    private Integer status;

    private String createTime;
    /**
     * 分类
     */
    private String category;
}
