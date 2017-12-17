package com.leeue.o2o.entity;

import java.util.Date;

/**
 * 
 * 功能:  这个是 区域  实体类
 * @author:李月
 * @Version:1.0
 * @Date 2017年12月16日 下午5:45:29
 */
public class Area {
	
/**
 * 这里统一使用引用类型
 */
//	ID    
	private Integer areaId;  
//	区域名称
	private String areaName;
	
//	权重  权重越大排名 越靠前
	private Integer priority;
	
// 创建时间
	
	private Date createTime;
//	更新时间
	private Date lastEditTime;

	
	/**下面是get和set方法**/
	
	public Integer getAreaId() {
		return areaId;
	}
	public void setAreaId(Integer areaId) {
		this.areaId = areaId;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public Integer getPriority() {
		return priority;
	}
	public void setPriority(Integer priority) {
		this.priority = priority;
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
