package com.reimu.security;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * ...
 *
 * @author: GaoSheng
 * @since: 2019/10/23 15:07
 * @version: 1.0
 **/
@Data
public class SysPermission {


    private static final long serialVersionUID = 1L;

    /**
     * 权限ID
     */
    @TableId(type = IdType.UUID)
    private String id;

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
     * 角色名称
     */
    private String roleName;
}
