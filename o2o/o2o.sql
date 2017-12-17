

-- 创建区域表

/**
不懂地方:

	1、UNIQUE 和 PRIMARY KEY 约束均为列或列集合提供了唯一性的保证。
	2、datetime 是数据库时间类型
	3、MYSQL有两种引擎：
		1、InnoDB 、
		2、MYISAM  只能是单线程操作，读的性能高
	UK_AREA是给这个area_name另起个名字
**/
USE o2o;
-- 创建区域表
CREATE TABLE `tb_area`(
	`area_id` INT(5) NOT NULL AUTO_INCREMENT,
	`area_name` VARCHAR(200) NOT NULL ,
	`priority` INT(2) NOT NULL,
	`create_time` DATETIME DEFAULT NULL,
	`last_edit_time` DATETIME DEFAULT NULL,
	PRIMARY KEY(`area_id`), 
	UNIQUE KEY `UK_AREA`(`area_name`)
	
)ENGINE = INNODB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;

-- 创建用户信息表


USE o2o;
CREATE TABLE `tb_person_info`(
  `user_id` INT(10) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) DEFAULT NULL,
  `profile)_img` VARCHAR(1024) DEFAULT NULL,
  `email` VARCHAR(1024) DEFAULT NULL,
  `gender` VARCHAR(2) DEFAULT NULL,
  `enable_status` INT(2) NOT NULL DEFAULT '0' COMMENT '0:禁止使用本商城,1:允许使用本商城',
  `user_type` INT(2) NOT NULL DEFAULT '1' COMMENT '1:顾客 2:店家 3:超级管理员',
  `create_time` DATETIME DEFAULT NULL,
  `last_edit_time` DATETIME DEFAULT NULL,
  PRIMARY KEY(`user_id`)
)ENGINE = INNODB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;


-- 创建使用微信 账号 信息  fk_wechartauth_profile 是这个外键的名称

-- 如果需要命名 FOREIGN KEY 约束，以及为多个列定义 FOREIGN KEY 约束，请使用下面的 SQL 语法：

USE o2o;
CREATE TABLE `tb_wechat_auth`(
  `wechat_auth_id` INT(10) NOT NULL AUTO_INCREMENT,
  `user_id` INT(10) NOT NULL COMMENT '外键关联',
  `open_id` VARCHAR (1024) NOT NULL,
  `create_time` DATETIME DEFAULT NULL,
  PRIMARY KEY(`wechat_auth_id`),
  CONSTRAINT `fk_wechartauth_profile` FOREIGN KEY(`user_id`) REFERENCES `tb_person_info`(`user_id`) 
)ENGINE = INNODB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;

-- 给tb_wechat_auth open_id增加唯一索引 索引过多 会影响数据库性能
ALTER TABLE tb_wechat_auth ADD UNIQUE INDEX(open_id);



USE o2o;
CREATE TABLE `tb_local_auth`(
  `local_auth_id` INT(10) NOT NULL AUTO_INCREMENT,
  `user_id` INT(10) NOT NULL,
  `username` VARCHAR(128) NOT NULL,
  `password` VARCHAR(128) NOT NULL,
  `create_time` DATETIME DEFAULT NULL,
  `last_edit_time` DATETIME DEFAULT NULL,
  PRIMARY KEY(`local_auth_id`),
  UNIQUE KEY `uk_local_profile` (`username`),
  CONSTRAINT `fk_wechatauth_profile` FOREIGN KEY(`user_id`) REFERENCES `tb_person_info`(`user_id`)
)ENGINE = INNODB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;


-- 创建头条表

USE o2o;
CREATE TABLE `tb_head_line` (
  `line_id` INT(100) NOT NULL AUTO_INCREMENT,
  `line_name` VARCHAR(1000) DEFAULT NULL,
  `line_link` VARCHAR(2000) NOT NULL,
  `line_img` VARCHAR(2000) NOT NULL,
  `priority` INT(2) DEFAULT NULL,
  `enable_status` INT(2) NOT NULL DEFAULT '0',
  `create_time` DATETIME DEFAULT NULL,
  `last_edit_time` DATETIME DEFAULT NULL,
  PRIMARY KEY (`line_id`)
) ENGINE = INNODB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;

-- 创建店铺 实体

/**
 CONSTRAINT `fk_shop_category_self` FOREIGN KEY (`parent_id`) REFERENCES `tb_shop_category` (`shop_category_id`)
 这里的外检连向自己，如果这个外键和shop_category_id相同的话就说名这个就是父店铺名
**/

CREATE TABLE `tb_shop_category` (
  `shop_category_id` INT(11) NOT NULL AUTO_INCREMENT,
  `shop_category_name` VARCHAR(100) NOT NULL DEFAULT '',
  `shop_category_desc` VARCHAR(1000) DEFAULT '',
  `shop_category_img` VARCHAR(2000) DEFAULT NULL,
  `priority` INT(2) NOT NULL DEFAULT '0',
  `create_time` DATETIME DEFAULT NULL,
  `last_edit_time` DATETIME DEFAULT NULL,
  `parent_id` INT(11) DEFAULT NULL,
  PRIMARY KEY (`shop_category_id`),
  KEY `fk_shop_category_self` (`parent_id`),
  CONSTRAINT `fk_shop_category_self` FOREIGN KEY (`parent_id`) REFERENCES `tb_shop_category` (`shop_category_id`)
) ENGINE = INNODB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;


/**
这里创建了三个外键
**/

-- 创建店铺 表
CREATE TABLE `tb_shop` (
  `shop_id` INT(10) NOT NULL AUTO_INCREMENT,
  `owner_id` INT(10) NOT NULL COMMENT '店铺创建人',
  `area_id` INT(5) DEFAULT NULL,
  `shop_category_id` INT(11) DEFAULT NULL,
  `parent_category_id` INT(11) DEFAULT NULL,
  `shop_name` VARCHAR(256) COLLATE utf8_unicode_ci NOT NULL,
  `shop_desc` VARCHAR(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shop_addr` VARCHAR(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` VARCHAR(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shop_img` VARCHAR(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` DOUBLE(16,12) DEFAULT NULL,
  `latitude` DOUBLE(16,12) DEFAULT NULL,
  `priority` INT(3) DEFAULT '0',
  `create_time` DATETIME DEFAULT NULL,
  `last_edit_time` DATETIME DEFAULT NULL,
  `enable_status` INT(2) NOT NULL DEFAULT '0',
  `advice` VARCHAR(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`shop_id`),
  KEY `fk_shop_profile` (`owner_id`),
  KEY `fk_shop_area` (`area_id`),
  KEY `fk_shop_shopcate` (`shop_category_id`),
  KEY `fk_shop_parentcate` (`parent_category_id`),
  CONSTRAINT `fk_shop_area` FOREIGN KEY (`area_id`) REFERENCES `tb_area` (`area_id`),
  CONSTRAINT `fk_shop_parentcate` FOREIGN KEY (`parent_category_id`) REFERENCES `tb_shop_category` (`shop_category_id`),
  CONSTRAINT `fk_shop_profile` FOREIGN KEY (`owner_id`) REFERENCES `tb_person_info` (`user_id`),
  CONSTRAINT `fk_shop_shopcate` FOREIGN KEY (`shop_category_id`) REFERENCES `tb_shop_category` (`shop_category_id`)
) ENGINE = INNODB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;

-- 创建商品商品 表
CREATE TABLE `tb_product_category` (
  `product_category_id` INT(11) NOT NULL AUTO_INCREMENT,
  `product_category_name` VARCHAR(100) NOT NULL,
  `product_category_desc` VARCHAR(500) DEFAULT NULL,
  `priority` INT(2) DEFAULT '0',
  `create_time` DATETIME DEFAULT NULL,
  `last_edit_time` DATETIME DEFAULT NULL,
  `shop_id` INT(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_category_id`),
  KEY `fk_procate_shop` (`shop_id`),
  CONSTRAINT `fk_procate_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`)
) ENGINE = INNODB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;

-- 商品实体类表

CREATE TABLE `tb_product` (
  `product_id` INT(100) NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(100) NOT NULL,
  `product_desc` VARCHAR(2000) DEFAULT NULL,
  `img_addr` VARCHAR(2000) DEFAULT '',
  `normal_price` VARCHAR(100) DEFAULT NULL,
  `promotion_price` VARCHAR(100) DEFAULT NULL,
  `priority` INT(2) NOT NULL DEFAULT '0',
  `create_time` DATETIME DEFAULT NULL,
  `last_edit_time` DATETIME DEFAULT NULL,
  `enable_status` INT(2) NOT NULL DEFAULT '0',
  `point` INT(10) DEFAULT NULL,
  `product_category_id` INT(11) DEFAULT NULL,
  `shop_id` INT(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`),
  KEY `fk_product_shop` (`shop_id`),
  KEY `fk_product_procate` (`product_category_id`),
  CONSTRAINT `fk_product_procate` FOREIGN KEY (`product_category_id`) REFERENCES `tb_product_category` (`product_category_id`),
  CONSTRAINT `fk_product_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`)
) ENGINE = INNODB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;


-- 商品详情图片 表

CREATE TABLE `tb_product_img` (
  `product_img_id` INT(20) NOT NULL AUTO_INCREMENT,
  `img_addr` VARCHAR(2000) NOT NULL,
  `img_desc` VARCHAR(2000) DEFAULT NULL,
  `priority` INT(2) DEFAULT '0',
  `create_time` DATETIME DEFAULT NULL,
  `product_id` INT(20) DEFAULT NULL,
  PRIMARY KEY (`product_img_id`),
  KEY `fk_proimg_product` (`product_id`),
  CONSTRAINT `fk_proimg_product` FOREIGN KEY (`product_id`) REFERENCES `tb_product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = INNODB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;

