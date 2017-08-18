/*
Navicat MySQL Data Transfer

Source Server         : 192.168.3.100_3306
Source Server Version : 50527
Source Host           : 192.168.3.100:3306
Source Database       : logistics_cooperation

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2017-08-18 18:29:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cooperation_info
-- ----------------------------
DROP TABLE IF EXISTS `cooperation_info`;
CREATE TABLE `cooperation_info` (
  `id` char(50) NOT NULL COMMENT '企业编号',
  `cName` char(50) DEFAULT NULL COMMENT '企业名称',
  `contact` char(10) DEFAULT NULL COMMENT '联系人',
  `tel` char(15) DEFAULT NULL COMMENT '联系电话',
  `email` char(100) DEFAULT NULL COMMENT '邮箱',
  `addr` char(255) DEFAULT NULL COMMENT '地址',
  `cType` tinyint(4) DEFAULT '1' COMMENT '1:企业，2：个人',
  `cNum` char(20) DEFAULT NULL COMMENT '企业营业执照号或个人身份证号',
  `cImg` char(255) DEFAULT NULL COMMENT '企业营业执照照片或个人身份证照片（正面）',
  `available` tinyint(1) DEFAULT '1' COMMENT '冻结状态。0：冻结，1：可用（企业冻结，则下属车辆和司机都不可用）',
  `isdel` tinyint(1) DEFAULT '0' COMMENT '是否已删除(0:正常,1:已删除)',
  `createTime` date DEFAULT NULL COMMENT '加盟时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cooperation_info
-- ----------------------------
INSERT INTO `cooperation_info` VALUES ('a024f258cea3459785a9dbf66d117516', '0428', '0428', '0428', '0428', '0428', '0', '0428', 'UploadFile/b24f032e020f4d74b143238191071781.jpg', '0', '0', '2017-04-28');
INSERT INTO `cooperation_info` VALUES ('c200a9b43503404e969da9d54072e527', '申通物流', '申通', '23123', '213', '火星', '1', '213', null, '1', '0', '2017-04-20');
INSERT INTO `cooperation_info` VALUES ('CO120170120100001', '测试企业', '邸广照', '18330219027', '123@sina.com', '天津高新区', '0', '4355667879978', 'http://139.129.235.40/ztcms.qxsxstudio.com//pic/cooperation/5881703fca436.jpg', '1', '0', '2017-01-20');
INSERT INTO `cooperation_info` VALUES ('CO120170120100002', '阿里', '马云', '18330219027', '123@qq.com', '大学城', '1', '1230012300', null, '1', '0', '2016-12-07');
INSERT INTO `cooperation_info` VALUES ('CO120170120100003', '正通物流', '某某', '18000600060', '123@sina.com', '彩虹花园', '1', '54676886', 'http://139.129.235.40/ztcms.qxsxstudio.com//pic/cooperation/5882d042e0b04.jpg', '1', '0', '2017-01-21');
INSERT INTO `cooperation_info` VALUES ('CO120170120100004', '中科', 'cc', '123456789', '333@qq.com', '天津1111', '0', '123123', '', '1', '0', '2017-03-17');
INSERT INTO `cooperation_info` VALUES ('CO120170120100005', '企业', '朕', '18920729877', null, null, '2', '679592437849167549', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/idCardFrontImg/2017-01-20/58817999d899b.jpg', '1', '0', '0000-00-00');
INSERT INTO `cooperation_info` VALUES ('CO120170120100006', '企业2', '李金梁', '13821854123', '', '', '0', '120224199507081314', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/idCardFrontImg/2017-01-23/58855bcd96f43.jpg', '1', '0', '0000-00-00');

-- ----------------------------
-- Table structure for model_info
-- ----------------------------
DROP TABLE IF EXISTS `model_info`;
CREATE TABLE `model_info` (
  `id` char(1) NOT NULL COMMENT '车型id',
  `length` decimal(3,1) NOT NULL COMMENT '长度(米）',
  `bulk` decimal(4,1) NOT NULL COMMENT '体积（立方）',
  `refrigerate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:非冷藏；1：冷藏',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车型信息表（字典表)';

-- ----------------------------
-- Records of model_info
-- ----------------------------

-- ----------------------------
-- Table structure for vehicle_status(cache)
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_status(cache)`;
CREATE TABLE `vehicle_status(cache)` (
  `vehicleId` char(15) DEFAULT NULL COMMENT '车辆id',
  `vStatus` tinyint(1) DEFAULT NULL COMMENT '0:无货，1：有货（订单表来）',
  `GPSY` decimal(13,10) DEFAULT NULL COMMENT '纬度（每N秒更新，并写文本文件）',
  `GPSX` decimal(13,10) DEFAULT NULL COMMENT '经度（每N秒更新，并写文本文件）',
  `vihicleNum` char(18) DEFAULT NULL COMMENT '车牌号',
  `remainBulk` decimal(4,1) DEFAULT NULL COMMENT '剩余容量（从订单来）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vehicle_status(cache)
-- ----------------------------
