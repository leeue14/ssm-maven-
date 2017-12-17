package com.leeue.o2o.entity;

import java.util.Date;
/**
 * 
 * 功能:  店铺分类 实体
 * @author:李月
 * @Version:
 * @Date 2017年12月16日 下午10:18:06
 */
public class ProductCategory {
	private Long productCategoryId;  //商品id
	private Long shopId; //店铺id
	private String productCategoryName;
	private String productCategoryDesc;
	private Integer priority; //商品的权重 排名
	private Date createTime;
	private Date lastEditTime;

	
	/**下面是get和set方法**/
	public Long getProductCategoryId() {
		return productCategoryId;
	}

	public void setProductCategoryId(Long productCategoryId) {
		this.productCategoryId = productCategoryId;
	}

	public Long getShopId() {
		return shopId;
	}

	public void setShopId(Long shopId) {
		this.shopId = shopId;
	}

	public String getProductCategoryName() {
		return productCategoryName;
	}

	public void setProductCategoryName(String productCategoryName) {
		this.productCategoryName = productCategoryName;
	}

	public String getProductCategoryDesc() {
		return productCategoryDesc;
	}

	public void setProductCategoryDesc(String productCategoryDesc) {
		this.productCategoryDesc = productCategoryDesc;
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

	public String toString() {
		return "[productCategoryId=" + productCategoryId
				+ ", productCategoryIdName=" + productCategoryName + "]";
	}

}
