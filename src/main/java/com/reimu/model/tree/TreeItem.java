package com.reimu.model.tree;

import lombok.Data;

import java.util.List;

@Data
public class TreeItem {

    private String id;
    private String name;
    private String text;
    private String type;
    private String additionalParameters;

    private List<TreeItem> children;
}
