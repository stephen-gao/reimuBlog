package com.reimu.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * <p>
 * 角色表
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-22
 */
@Data
@TableName("t_role")
public class Role implements Serializable {

    private static final long serialVersionUID = 1L;

	/**
	 * 角色ID
	 */
	@TableId(type = IdType.UUID)
	private String id;

	/**
	 * 角色名称
	 */
	private String name;

	/**
	 * 角色描述
	 */
	private String description;



}
