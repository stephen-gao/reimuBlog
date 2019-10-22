package com.reimu.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * <p>
 * 角色权限表
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-22
 */
@Data
@TableName("t_role_permission")
public class RolePermission implements Serializable {

    private static final long serialVersionUID = 1L;

	/**
	 * 角色权限表ID
	 */
	@TableId(type = IdType.UUID)
	private String id;

	/**
	 * 角色ID
	 */
	@TableField(value="role_id")
	private String roleId;

	/**
	 * 权限ID
	 */
	@TableField(value="permission_id")
	private String permissionId;


}
