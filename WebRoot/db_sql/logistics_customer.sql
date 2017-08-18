/*
Navicat MySQL Data Transfer

Source Server         : 192.168.3.100_3306
Source Server Version : 50527
Source Host           : 192.168.3.100:3306
Source Database       : logistics_customer

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2017-08-18 18:29:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for common_deliver
-- ----------------------------
DROP TABLE IF EXISTS `common_deliver`;
CREATE TABLE `common_deliver` (
  `company` varchar(20) NOT NULL COMMENT '公司名称',
  `customerId` char(20) NOT NULL COMMENT '客户编号',
  `dName` varchar(20) NOT NULL COMMENT '发货人姓名',
  `provance` char(10) DEFAULT NULL COMMENT '发货地',
  `addr` varchar(255) DEFAULT NULL COMMENT '发货地址',
  `location` char(30) NOT NULL DEFAULT '0,0' COMMENT '发货地址经纬度',
  `tel` varchar(15) NOT NULL COMMENT '联系电话',
  `isDel` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否删除（1：正常；0删除）',
  UNIQUE KEY `company` (`company`,`customerId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_deliver
-- ----------------------------
INSERT INTO `common_deliver` VALUES ('天津市南开区罗平道12号', 'CU1100004', '正通物流', '天津市', '天津市南开区罗平道|12号', '117.133686,39.119556', '12434534456', '1');
INSERT INTO `common_deliver` VALUES ('测试公司1', 'CU1100002', '测试1', '天津市', '天津市西青区中北镇', '117.091798,39.126226', '13245678654', '1');

-- ----------------------------
-- Table structure for common_receipt
-- ----------------------------
DROP TABLE IF EXISTS `common_receipt`;
CREATE TABLE `common_receipt` (
  `company` varchar(20) NOT NULL COMMENT '公司名称',
  `customerId` char(20) NOT NULL COMMENT '客户编号',
  `rName` varchar(20) NOT NULL COMMENT '收货人姓名',
  `provance` char(10) DEFAULT NULL COMMENT '收货地',
  `location` char(30) NOT NULL DEFAULT '0,0' COMMENT '地址经纬度',
  `addr` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `tel` varchar(15) NOT NULL COMMENT '联系电话',
  `isDel` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否删除（1：正常；0删除）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_receipt
-- ----------------------------
INSERT INTO `common_receipt` VALUES ('测试公司2', 'CU1100002', '测试2', '天津市', '117.114543,39.055000', '天津市西青区景福花园', '18765432456', '1');
INSERT INTO `common_receipt` VALUES ('天津市和平区西安到93号', 'CU1100004', '滴滴滴', '天津市', '117.220483,39.082456', '天津市和平区西安道|93号', '13445768654', '1');

-- ----------------------------
-- Table structure for customer_bank_card
-- ----------------------------
DROP TABLE IF EXISTS `customer_bank_card`;
CREATE TABLE `customer_bank_card` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customerId` char(20) NOT NULL,
  `bandName` varchar(255) NOT NULL,
  `bandNum` varchar(255) NOT NULL,
  `createTime` int(11) NOT NULL,
  `useTime` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customerId` (`customerId`) USING BTREE,
  CONSTRAINT `customer_bank_card_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customer_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_bank_card
-- ----------------------------

-- ----------------------------
-- Table structure for customer_info
-- ----------------------------
DROP TABLE IF EXISTS `customer_info`;
CREATE TABLE `customer_info` (
  `id` char(20) NOT NULL COMMENT '客户id',
  `cName` varchar(20) DEFAULT NULL COMMENT '客户名称',
  `tel` varchar(15) DEFAULT NULL COMMENT '电话号码',
  `contactName` varchar(20) DEFAULT NULL COMMENT '联系人',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `face` varchar(255) DEFAULT NULL COMMENT '头像',
  `addr` varchar(255) DEFAULT NULL COMMENT '地址',
  `email` varchar(20) DEFAULT NULL COMMENT '邮件地址',
  `wechatAccount` varchar(40) DEFAULT NULL COMMENT '微信',
  `qqAccount` varchar(40) DEFAULT NULL COMMENT 'qq',
  `isDel` tinyint(1) DEFAULT '1' COMMENT '是否删除（1：正常；0：为删除）',
  `androidCid` varchar(255) DEFAULT NULL COMMENT '安卓设备号',
  `iosCid` varchar(255) DEFAULT NULL COMMENT 'ios设备号',
  `gender` tinyint(1) DEFAULT '1' COMMENT '性别',
  `createTime` date DEFAULT NULL COMMENT '加入时间',
  `cType` tinyint(1) DEFAULT '1' COMMENT '客户类型(1:后台添加,2:用户端注册)',
  `balance` decimal(7,2) DEFAULT '0.00' COMMENT '余额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_info
-- ----------------------------
INSERT INTO `customer_info` VALUES ('CU100001', '朕', '123789', '', 'e10adc3949ba59abbe56e057f20f883e', null, '18920729877', '天津高新区', '876548667', '876543247', '1', 'f40cb4426e85ea0b1b2c2ab49b411e4d', 'db612a6bc126df1cd9c7917fe3ab4db7', '1', '2017-01-20', '2', '0.00');
INSERT INTO `customer_info` VALUES ('CU100006', '朕', '18330219027', '', 'e10adc3949ba59abbe56e057f20f883e', 'Customer/header/2017-01-21/5882c3f821412.jpg', '天津高新区', '123453223@sina.com', 'w312123', '871234667', '0', 'b163350f0a11b8f986db4602add6cb34', '', '1', '2017-01-20', '2', '0.00');
INSERT INTO `customer_info` VALUES ('CU100007', '李正元', '15122615761', '', 'e10adc3949ba59abbe56e057f20f883e', null, '天津高新区', '123243@sina.com', 'we123123', '876352667', '1', '0ac1918ea7a6c029ea88bbae2ea67ff7', '', '1', '2017-01-22', '2', '0.00');
INSERT INTO `customer_info` VALUES ('CU100010', '', '13682105048', '', 'e10adc3949ba59abbe56e057f20f883e', 'Customer/header/2017-01-22/58842c5f3436e.jpg', '天津市河西区大沽南路', '1234234@sina.com', 'wfds23123', '6546548667', '1', '', 'e85f693eaba38255b0682c2ce6df85a5', '1', '2017-01-22', '2', '0.00');
INSERT INTO `customer_info` VALUES ('CU100011', '', '15922237298', '', 'e10adc3949ba59abbe56e057f20f883e', null, '天津市河西区大沽南路', '123124@sina.com', 'we1223', '245548667', '1', '1fbab83bbdb057abf0b924003bf480a6', 'b8abe7db0f1529ea86b974277759161e', '1', '2017-01-22', '2', '0.00');
INSERT INTO `customer_info` VALUES ('CU100015', '', '18502621908', '', 'e10adc3949ba59abbe56e057f20f883e', null, '天津市河西区大沽南路', '876548667@qq.com', 'wegs123', '1345548667', '1', '1fbab83bbdb057abf0b924003bf480a6', '', '1', '2017-02-07', '2', '0.00');
INSERT INTO `customer_info` VALUES ('CU1100002', '测试吴', '13721456734', '吴吴', null, null, '天津市河西区大沽南路', '876548667@qq.com', '876548667', '876548667', '1', null, null, '1', '2017-01-20', '1', '0.00');
INSERT INTO `customer_info` VALUES ('CU1100003', '大客户·1', '6346719', '邸广照', null, null, '天津高新区', '123@sina.com', '1232355346', '12345674', '1', null, null, '1', '2017-01-20', '1', '0.00');
INSERT INTO `customer_info` VALUES ('CU1100004', '大客户1', '18330219100', '大王1', null, null, '大学城', '123@qq.com', 'wei123', '123321', '1', null, null, '1', '2016-12-07', '1', '0.00');
INSERT INTO `customer_info` VALUES ('CU1100005', '大客户2', '18330219101', '大王1', null, null, '大学城', '123@qq.com', 'wei123', '123321', '1', null, null, '1', '2016-12-07', '1', '0.00');
INSERT INTO `customer_info` VALUES ('CU1100008', '太平医药有限公司', '13820854120', '任家瑞', null, null, '南开区罗平道12号', '309303798@qq.com', 'duhuiwei1984', '309303798', '0', null, null, '1', '2017-01-22', '1', '0.00');
INSERT INTO `customer_info` VALUES ('CU1100009', '太平医药有限公司', '13820854120', '任家瑞', null, null, '南开区罗平道54号', '309303798@qq.com', 'duhuiwei1984', '309303798', '0', null, null, '1', '2017-01-22', '1', '0.00');
INSERT INTO `customer_info` VALUES ('CU1100012', '北辰运管所', '13622032659', '小赵', null, null, '北辰双街运管所', '309303798@qq.com', 'duhuiwei1984', '309303798', '0', null, null, '1', '2017-01-22', '1', '0.00');
INSERT INTO `customer_info` VALUES ('CU1100013', '测试2', '测试2', '测试2', null, null, '测试2', '32456@qq.com', '223232', '2322332', '0', null, null, '1', '2017-01-22', '1', '0.00');
INSERT INTO `customer_info` VALUES ('CU1100014', '汽配城', '13820854120', '杜慧玮', null, null, '测试', '测试', '测试', '测试', '0', null, null, '1', '2017-01-24', '1', '0.00');
INSERT INTO `customer_info` VALUES ('CU170331151145100009', '13', '23123', '323', 'e10adc3949ba59abbe56e057f20f883e', null, '23', '323', null, null, '1', null, null, '0', '2017-03-31', '1', '0.00');
INSERT INTO `customer_info` VALUES ('CU170408161525100010', '', '', '', 'e10adc3949ba59abbe56e057f20f883e', null, '', '', null, null, '1', null, null, '0', '2017-04-08', '1', '0.00');
INSERT INTO `customer_info` VALUES ('CU170408161802100011', '', '', '', 'e10adc3949ba59abbe56e057f20f883e', null, '', '', null, null, '1', null, null, '0', '2017-04-08', '1', '0.00');
INSERT INTO `customer_info` VALUES ('CU170408170746100012', 'qqqqq', 'qqqq', 'qqqq', 'e10adc3949ba59abbe56e057f20f883e', null, 'qqqqq', 'qqqqq', null, null, '1', null, null, '0', '2017-04-08', '1', '0.00');
INSERT INTO `customer_info` VALUES ('CU170408170746100013', 'wwwww', 'wwwww', 'wwwww', 'e10adc3949ba59abbe56e057f20f883e', null, 'wwwww', 'wwww', null, null, '1', null, null, '0', '2017-04-08', '1', '0.00');
INSERT INTO `customer_info` VALUES ('CU20170324100015', '123', '13534324434', '111', 'e10adc3949ba59abbe56e057f20f883e', null, 'cssdf', 'vsfa', 'wer32', '1231412', '0', null, null, '0', '2017-03-24', '1', '0.00');
INSERT INTO `customer_info` VALUES ('CU20170809100016', '', '18920798206', 'zylceshi', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, null, '1', null, null, '1', null, '1', '0.00');

-- ----------------------------
-- Table structure for customer_verify
-- ----------------------------
DROP TABLE IF EXISTS `customer_verify`;
CREATE TABLE `customer_verify` (
  `tel` char(13) NOT NULL,
  `verifyNum` char(10) DEFAULT NULL,
  `genTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`tel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_verify
-- ----------------------------
INSERT INTO `customer_verify` VALUES ('13682105048', '807174', '1485053351');
INSERT INTO `customer_verify` VALUES ('15122615761', '852305', '1485050818');
INSERT INTO `customer_verify` VALUES ('15922237298', '255279', '1485055093');
INSERT INTO `customer_verify` VALUES ('18330219027', '782822', '1484894470');
INSERT INTO `customer_verify` VALUES ('18502621908', '906850', '1486459575');
INSERT INTO `customer_verify` VALUES ('18920729877', '492471', '1484882952');

-- ----------------------------
-- Table structure for reservation_service
-- ----------------------------
DROP TABLE IF EXISTS `reservation_service`;
CREATE TABLE `reservation_service` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customerId` char(20) NOT NULL COMMENT '客户ID',
  `describe` varchar(255) NOT NULL COMMENT '描述',
  `reservationTime` datetime NOT NULL COMMENT '预约时间',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `isHandle` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否处理（0未处理；1：已处理）',
  PRIMARY KEY (`id`),
  KEY `customerId` (`customerId`) USING BTREE,
  CONSTRAINT `reservation_service_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customer_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reservation_service
-- ----------------------------
INSERT INTO `reservation_service` VALUES ('1', 'CU100006', '你猜啊', '2017-01-20 00:00:00', '2017-01-20 14:41:45', '1');
INSERT INTO `reservation_service` VALUES ('2', 'CU100006', '你才笨', '2017-01-20 00:00:00', '2017-01-20 14:46:23', '1');
INSERT INTO `reservation_service` VALUES ('3', 'CU100001', '    \n\n预约1月30日送货 取货地址  送货地址', '2017-01-24 00:00:00', '2017-01-24 10:02:04', '1');
