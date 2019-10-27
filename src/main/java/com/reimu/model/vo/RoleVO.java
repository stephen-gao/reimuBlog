package com.reimu.model.vo;

import com.reimu.model.BaseVO;
import lombok.Data;

@Data
public class RoleVO extends BaseVO {

    /**
     * 角色ID
     */
    private String id;

    /**
     * 角色名称
     */
    private String name;

    /**
     * 角色描述
     */
    private String description;

    /**
     * 排序
     */
    private Integer sort;
}
