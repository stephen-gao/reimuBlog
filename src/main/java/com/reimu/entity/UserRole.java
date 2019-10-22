package com.reimu.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * <p>
 * 用户角色表
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-22
 */
@Data
@TableName("t_user_role")
public class UserRole implements Serializable {

    private static final long serialVersionUID = 1L;

	/**
	 * 用户角色表ID
	 */
	@TableId(type = IdType.UUID)
	private String id;

	/**
	 * 用户ID
	 */
	@TableField(value="user_id")
	private String userId;

	/**
	 * 角色ID
	 */
	@TableField(value="role_id")
	private String roleId;


}
