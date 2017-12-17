package com.leeue.o2o.entity;

import java.util.Date;

/**
 * 
 * 功能:  这个是 用户信息 实体类
 * @author:李月
 * @Version:
 * @Date 2017年12月16日 下午8:27:48
 */
public class PersonInfo {

	private Long userId; //用户id
	private String name; //用户姓名
	private String profileImg; //用户图像地址
	private String email; //邮箱
	private String gender; //性别
	private Integer enableStatus; //用户状态
//	1、顾客 2、店家 3、超级管理员
	private Integer userType; //用户类型
	private Date createTime; 
	private Date lastEditTime; //最后编辑时间
	
	
	/**下面是get和set方法**/
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Integer getEnableStatus() {
		return enableStatus;
	}
	public void setEnableStatus(Integer enableStatus) {
		this.enableStatus = enableStatus;
	}
	public Integer getUserType() {
		return userType;
	}
	public void setUserType(Integer userType) {
		this.userType = userType;
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
