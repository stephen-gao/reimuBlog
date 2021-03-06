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
	 * 类型 0叶子，1 非叶子, 2 接口
	 */
	private Integer type;


	/**
	 * 菜单图标
	 */
	private String icon;

	/**
	 * 权限描述
	 */
	private String description;

	/**
	 * 排序
	 */
	private Integer sort;

}
