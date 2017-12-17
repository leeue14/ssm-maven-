package com.leeue.o2o.entity;

import java.util.Date;
/**
 * 
 * 功能: 详情图片的实体类
 * @author:李月
 * @Version:
 * @Date 2017年12月16日 下午10:17:51
 */
public class ProductImg {
	private Long productImgId;
	private String imgAddr;  //图片地址
	private String imgDesc;  //图片描述
	private Integer priority; //权重高 优先显示
	private Date createTime;
	private Long productId; // 它是属于哪个商品的详情图片
	
	

	
	/**下面是get和set方法**/
	public Long getProductImgId() {
		return productImgId;
	}

	public void setProductImgId(Long productImgId) {
		this.productImgId = productImgId;
	}

	public String getImgAddr() {
		return imgAddr;
	}

	public void setImgAddr(String imgAddr) {
		this.imgAddr = imgAddr;
	}

	public String getImgDesc() {
		return imgDesc;
	}

	public void setImgDesc(String imgDesc) {
		this.imgDesc = imgDesc;
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

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

}
