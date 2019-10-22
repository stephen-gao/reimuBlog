package com.reimu.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * <p>
 * 权限表
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-22
 */
@Data
@TableName("t_permission")
public class Permission implements Serializable {

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

}
