package com.reimu.model.request;

import lombok.Data;

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
     * 原始内容
     */
    private String contentSrc;

}
