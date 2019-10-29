package com.reimu.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-28
 */
@TableName("t_article_info")
public class ArticleInfo implements Serializable {

    private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId(type = IdType.UUID)
	private String id;

	/**
	 * 作者ID
	 */
	@TableField(value="author_id")
	private String authorId;

	/**
	 * 标题ID
	 */
	private String title;

	/**
	 * 关键字
	 */
	private String keyword;

	/**
	 * 描述
	 */
	private String description;

	/**
	 * 浏览量
	 */
	@TableField(value="views_num")
	private Long viewsNum;

	/**
	 * 评论数
	 */
	@TableField(value="comment_num")
	private Long commentNum;

	/**
	 * 点赞数
	 */
	@TableField(value="star_num")
	private Long starNum;

	/**
	 * 状态
	 */
	private Integer status;

	/**
	 * 创建时间
	 */
	@TableField(value="create_time")
	private Date createTime;

	/**
	 * 编辑时间
	 */
	@TableField(value="update_time")
	private Date updateTime;



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAuthorId() {
		return authorId;
	}

	public void setAuthorId(String authorId) {
		this.authorId = authorId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Long getViewsNum() {
		return viewsNum;
	}

	public void setViewsNum(Long viewsNum) {
		this.viewsNum = viewsNum;
	}

	public Long getCommentNum() {
		return commentNum;
	}

	public void setCommentNum(Long commentNum) {
		this.commentNum = commentNum;
	}

	public Long getStarNum() {
		return starNum;
	}

	public void setStarNum(Long starNum) {
		this.starNum = starNum;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

}
