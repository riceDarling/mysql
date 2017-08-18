/*
Navicat MySQL Data Transfer

Source Server         : 192.168.3.100_3306
Source Server Version : 50527
Source Host           : 192.168.3.100:3306
Source Database       : db_ar_car_devolop

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2017-08-18 18:27:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `admin_nID` int(11) NOT NULL AUTO_INCREMENT,
  `admin_nType` int(11) DEFAULT NULL COMMENT '管理员类型',
  `admin_cCode` varchar(16) DEFAULT NULL COMMENT '账户',
  `admin_cPwd` varchar(200) DEFAULT NULL COMMENT '密码',
  `admin_cPhone` varchar(20) DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`admin_nID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', '100', 'admin', '21232f297a57a5a743894a0e4a801fc3', '13000000000');

-- ----------------------------
-- Table structure for t_car spot
-- ----------------------------
DROP TABLE IF EXISTS `t_car spot`;
CREATE TABLE `t_car spot` (
  `car_nspotID` int(11) NOT NULL AUTO_INCREMENT,
  `car_cS_STATE` int(11) DEFAULT NULL COMMENT '状态，是否启用',
  `car_cS_BG_IMG` varchar(200) DEFAULT NULL COMMENT '背景图',
  `car_cS_DESCRIBE_COLOR` varchar(20) DEFAULT NULL COMMENT '描述颜色',
  `car_cS_DESCRIBE` varchar(200) DEFAULT NULL COMMENT '亮点描述',
  `car_cS_IMG` varchar(200) DEFAULT NULL COMMENT '图片',
  `car_cS_MV` varchar(200) DEFAULT NULL COMMENT '短视频',
  `car_cS_HDLC` varchar(200) DEFAULT NULL COMMENT '超链路协议',
  `car_cS_SELECTED_PARAMETER` varchar(100) DEFAULT NULL COMMENT '选中的参数',
  `car_nC_ID` int(11) NOT NULL COMMENT '车辆ID',
  PRIMARY KEY (`car_nspotID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_car spot
-- ----------------------------

-- ----------------------------
-- Table structure for t_carinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_carinfo`;
CREATE TABLE `t_carinfo` (
  `car_nID` int(11) NOT NULL AUTO_INCREMENT,
  `car_cNAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `car_cBRAND` varchar(30) DEFAULT NULL COMMENT '品牌',
  `car_cVERSION` varchar(30) DEFAULT NULL COMMENT '版本',
  `car_cSDK_VERSION` varchar(50) DEFAULT NULL COMMENT 'SDK版本',
  `car_dUPDATATIME` datetime DEFAULT NULL COMMENT '更新时间',
  `car_cDOENLOAD_BG_IMG` varchar(200) DEFAULT NULL COMMENT '下载背景图片',
  `car_cDOENLOAD_SPEAK` varchar(200) DEFAULT NULL COMMENT '下载话术',
  PRIMARY KEY (`car_nID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_carinfo
-- ----------------------------
INSERT INTO `t_carinfo` VALUES ('7', '', '', '', '', '2017-08-08 18:25:40', null, null);
INSERT INTO `t_carinfo` VALUES ('8', 'ceshi ', 'ceshi ', '1', '1', '2017-08-09 10:56:27', null, '');
INSERT INTO `t_carinfo` VALUES ('9', 'test', 'test', '1.1', '12', '2017-08-09 11:46:45', null, null);

-- ----------------------------
-- Table structure for t_car_hub
-- ----------------------------
DROP TABLE IF EXISTS `t_car_hub`;
CREATE TABLE `t_car_hub` (
  `car_nhubID` int(11) NOT NULL AUTO_INCREMENT,
  `car_cH_NAME` varchar(100) DEFAULT NULL COMMENT '名称',
  `car_cH_ICON` varchar(200) DEFAULT NULL COMMENT '图标',
  `car_C_ID` int(11) NOT NULL COMMENT '车辆ID',
  PRIMARY KEY (`car_nhubID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_car_hub
-- ----------------------------

-- ----------------------------
-- Table structure for t_car_paint
-- ----------------------------
DROP TABLE IF EXISTS `t_car_paint`;
CREATE TABLE `t_car_paint` (
  `car_npaintID` int(11) NOT NULL AUTO_INCREMENT,
  `car_cP_NAME` varchar(50) DEFAULT NULL COMMENT '车漆名称',
  `car_cP_ICON` varchar(200) DEFAULT NULL COMMENT '车漆图标',
  `car_cP_PAINT` varchar(20) DEFAULT NULL COMMENT '车漆颜色',
  `car_nC_ID` int(11) NOT NULL COMMENT '车辆ID',
  PRIMARY KEY (`car_npaintID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_car_paint
-- ----------------------------
