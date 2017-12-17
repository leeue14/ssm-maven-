package com.leeue.o2o.entity;

import java.util.Date;

/**
 * 
 * 功能: 这个是 微信账号 实体类 登录注册用
 * @author:李月
 * @Version:
 * @Date 2017年12月16日 下午8:28:11
 */
public class WechatAuth {
	private Long wechatAuthId; //id 
	
	private String openId; //
	
	private Date createTime;
	
	private PersonInfo personInfo;// 这个是 用户信息

	
	/**下面是get和set方法**/
	public Long getWechatAuthId() {
		return wechatAuthId;
	}

	public void setWechatAuthId(Long wechatAuthId) {
		this.wechatAuthId = wechatAuthId;
	}

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public PersonInfo getPersonInfo() {
		return personInfo;
	}

	public void setPersonInfo(PersonInfo personInfo) {
		this.personInfo = personInfo;
	}
	
	
	
	
}
