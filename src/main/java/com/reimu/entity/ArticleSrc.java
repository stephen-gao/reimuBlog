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
@TableName("t_article_src")
public class ArticleSrc implements Serializable {

    private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId(type = IdType.UUID)
	private String id;

	/**
	 * 文章ID
	 */
	@TableField(value="article_id")
	private String articleId;

	/**
	 * 原始内容
	 */
	@TableField(value="content_src")
	private String contentSrc;

	/**
	 * 创建时间
	 */
	@TableField(value="create_time")
	private String createTime;

	/**
	 * 更新时间
	 */
	@TableField(value="update_time")
	private String updateTime;



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getArticleId() {
		return articleId;
	}

	public void setArticleId(String articleId) {
		this.articleId = articleId;
	}

	public String getContentSrc() {
		return contentSrc;
	}

	public void setContentSrc(String contentSrc) {
		this.contentSrc = contentSrc;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
}
