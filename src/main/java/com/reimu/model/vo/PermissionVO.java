package com.reimu.model.vo;

import com.reimu.model.BaseVO;
import lombok.Data;

import java.util.List;

@Data
public class PermissionVO extends BaseVO {
    /**
     * 权限ID
     */
    private String id;

    /**
     * 父权限ID
     */
    private String pid;

    /**
     * 权限编码
     */
    private String code;

    /**
     * 权限名称
     */
    private String name;

    /**
     * 权限描述
     */
    private String description;

    /**
     * 排序
     */
    private Integer sort;

    /**
     * 排序
     */
    private Boolean checked;

    /**
     * 子节点
     */
    private List<PermissionVO> list;

}
