package com.leeue.o2o.entity;

import java.util.Date;
/**
 * 
 * 功能: 头条实体类
 * @author:李月
 * @Version:
 * @Date 2017年12月16日 下午9:46:41
 */
public class HeadLine {
	private Long lineId;
	private String lineName;
	private String lineLink;
	private String lineImg;
	private Integer priority; //权重 优先级 从大到小优先展示
	// 1 就是可用 0 就是不可用
	private Integer enableStatus;
	private Date createTime;
	private Date lastEditTime;

	
	
	
	
	/**下面是get和set方法**/
	public Long getLineId() {
		return lineId;
	}

	public void setLineId(Long lineId) {
		this.lineId = lineId;
	}

	public String getLineName() {
		return lineName;
	}

	public void setLineName(String lineName) {
		this.lineName = lineName;
	}

	public String getLineLink() {
		return lineLink;
	}

	public void setLineLink(String lineLink) {
		this.lineLink = lineLink;
	}

	public String getLineImg() {
		return lineImg;
	}

	public void setLineImg(String lineImg) {
		this.lineImg = lineImg;
	}

	public Integer getPriority() {
		return priority;
	}

	public void setPriority(Integer priority) {
		this.priority = priority;
	}

	public Integer getEnableStatus() {
		return enableStatus;
	}

	public void setEnableStatus(Integer enableStatus) {
		this.enableStatus = enableStatus;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getLastEditTime() {
		return lastEditTime;
	}

	public void setLastEditTime(Date lastEditTime) {
		this.lastEditTime = lastEditTime;
	}

}
