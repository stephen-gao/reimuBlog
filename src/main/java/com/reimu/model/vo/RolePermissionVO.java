package com.reimu.model.vo;

import lombok.Data;

import java.util.List;

/**
 * ...
 *
 * @author: GaoSheng
 * @since: 2019/10/28 16:01
 * @version: 1.0
 **/
@Data
public class RolePermissionVO {

    /**
     * 角色ID
     */
    private String roleId;

    /**
     * 权限ID列表
     */
    private List<String> permissionIds;
}
