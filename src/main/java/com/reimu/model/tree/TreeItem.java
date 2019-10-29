package com.reimu.model.tree;

import lombok.Data;

import java.util.List;

@Data
public class TreeItem {

    private String id;
    private String pid;

    /**
     * 面包屑文字
     */
    private String name;

    /**
     * 展示文字
     */
    private String text;

    /**
     * 跳转路径
     */
    private String code;

    /**
     * 类型 0叶子，1 非叶子
     */
    private Integer type;


    /**
     * 菜单图标
     */
    private String icon;

    private List<TreeItem> children;
}
