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
@TableName("t_vistor_log")
public class VistorLog implements Serializable {

    private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId(type = IdType.UUID)
	private String id;

	/**
	 * 类型
	 */
	private Integer type;

	/**
	 * 被访内容ID
	 */
	@TableField(value="content_id")
	private String contentId;

	/**
	 * 访问链接
	 */
	@TableField(value="vistor_url")
	private String vistorUrl;

	/**
	 * 来访IP
	 */
	@TableField(value="vistor_ip")
	private String vistorIp;

	/**
	 * 来访时间
	 */
	@TableField(value="vistor_time")
	private Date vistorTime;

	@TableField(value = "user_agent")
	private String userAgent;



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getContentId() {
		return contentId;
	}

	public void setContentId(String contentId) {
		this.contentId = contentId;
	}

	public String getVistorUrl() {
		return vistorUrl;
	}

	public void setVistorUrl(String vistorUrl) {
		this.vistorUrl = vistorUrl;
	}

	public String getVistorIp() {
		return vistorIp;
	}

	public void setVistorIp(String vistorIp) {
		this.vistorIp = vistorIp;
	}

	public Date getVistorTime() {
		return vistorTime;
	}

	public void setVistorTime(Date vistorTime) {
		this.vistorTime = vistorTime;
	}

	public String getUserAgent() {
		return userAgent;
	}

	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}
}
