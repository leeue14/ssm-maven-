package com.leeue.o2o.dao;

import java.util.List;

import com.leeue.o2o.entity.Area;

/**
 * 
 * 功能: 这个是AreaDao 区域的接口类 做增删查改    ----- ssm不需要实现，所以直接在在resources/mapper/中创建
 * AreaDao.xml映射文件
 * @author:李月
 * @Version:
 * @Date 2017年12月16日 下午11:55:32
 */
public interface AreaDao {
	
	/**
	 * 查询所有的区域并返回 
	 * @return
	 */
	List<Area> queryArea();
}
