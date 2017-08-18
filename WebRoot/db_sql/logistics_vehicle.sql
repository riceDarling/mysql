/*
Navicat MySQL Data Transfer

Source Server         : 192.168.3.100_3306
Source Server Version : 50527
Source Host           : 192.168.3.100:3306
Source Database       : logistics_vehicle

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2017-08-18 18:29:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for foreignfaction
-- ----------------------------
DROP TABLE IF EXISTS `foreignfaction`;
CREATE TABLE `foreignfaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `takeCooperationId` varchar(50) DEFAULT NULL COMMENT '外借企业id',
  `receivedCooperationId` varchar(50) DEFAULT NULL COMMENT '接收企业Id',
  `vehicleId` varchar(50) DEFAULT NULL COMMENT '车辆Id',
  `startTime` date DEFAULT NULL COMMENT '开始时间',
  `endTime` date DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of foreignfaction
-- ----------------------------

-- ----------------------------
-- Table structure for model_info
-- ----------------------------
DROP TABLE IF EXISTS `model_info`;
CREATE TABLE `model_info` (
  `id` int(2) NOT NULL AUTO_INCREMENT COMMENT '车型id',
  `height` decimal(4,2) NOT NULL DEFAULT '1.60' COMMENT '高度(米)',
  `width` decimal(4,2) NOT NULL DEFAULT '1.60' COMMENT '宽度(米)',
  `length` decimal(4,2) NOT NULL DEFAULT '0.00' COMMENT '长度(米）',
  `bulk` decimal(4,1) NOT NULL COMMENT '体积（立方）',
  `volumeRate` decimal(4,2) DEFAULT '0.70' COMMENT '容积率',
  `capacity` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '载重(T)',
  `refrigerate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:非冷藏；1：冷藏',
  `desc` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='车型信息表（字典表)';

-- ----------------------------
-- Records of model_info
-- ----------------------------
INSERT INTO `model_info` VALUES ('2', '1.20', '1.40', '2.70', '4.5', '0.70', '1.00', '0', '轻型封闭货车');
INSERT INTO `model_info` VALUES ('3', '1.80', '1.80', '4.20', '13.6', '0.70', '1.50', '0', '4.2米厢货');
INSERT INTO `model_info` VALUES ('4', '1.50', '1.45', '2.90', '6.3', '0.70', '0.50', '1', '冷藏车');

-- ----------------------------
-- Table structure for specialtype
-- ----------------------------
DROP TABLE IF EXISTS `specialtype`;
CREATE TABLE `specialtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of specialtype
-- ----------------------------
INSERT INTO `specialtype` VALUES ('1', '集港物流');
INSERT INTO `specialtype` VALUES ('2', '危险品零售');
INSERT INTO `specialtype` VALUES ('3', '仓储配送');
INSERT INTO `specialtype` VALUES ('4', '冷链配送');
INSERT INTO `specialtype` VALUES ('5', '干线运输');
INSERT INTO `specialtype` VALUES ('6', '长途客车');
INSERT INTO `specialtype` VALUES ('7', '其它');

-- ----------------------------
-- Table structure for vehicle_history
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_history`;
CREATE TABLE `vehicle_history` (
  `vrhicleId` char(20) NOT NULL COMMENT '车辆id',
  `driverId` char(20) NOT NULL COMMENT '驾驶员id',
  `dName` char(20) NOT NULL COMMENT '驾驶员姓名',
  `lastEditor` char(20) DEFAULT NULL COMMENT '最后修改人员',
  `isdel` tinyint(1) DEFAULT '0' COMMENT '是否已删除(0:正常,1:已删除)',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `offlineTime` datetime DEFAULT NULL COMMENT '离线时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `useTime` varchar(20) DEFAULT NULL COMMENT '使用时间(单位:小时) ',
  `onlineTime` datetime NOT NULL COMMENT '上线时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vehicle_history
-- ----------------------------

-- ----------------------------
-- Table structure for vehicle_info
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_info`;
CREATE TABLE `vehicle_info` (
  `id` int(50) NOT NULL AUTO_INCREMENT COMMENT '车辆编号ID',
  `nickname` varchar(50) DEFAULT NULL COMMENT '车辆别名',
  `num` char(10) DEFAULT NULL COMMENT '车牌号',
  `simNo` char(32) DEFAULT '' COMMENT '北斗设备号',
  `cooperationId` char(50) DEFAULT NULL COMMENT '所属企业/个体编号',
  `isRead` int(2) unsigned zerofill DEFAULT NULL COMMENT '是否列入监控（超级管理用）',
  `teamId` varchar(50) DEFAULT NULL,
  `isforeignfaction` int(5) DEFAULT '0' COMMENT '是否处于外派状态，',
  `modelId` char(1) DEFAULT 'A' COMMENT '车型id',
  `engineNum` char(18) DEFAULT NULL COMMENT '发动机号',
  `VIN` char(18) DEFAULT NULL COMMENT '车架号',
  `vehicleImg` varchar(255) DEFAULT NULL COMMENT '车辆照片',
  `VMAvalidDate` date DEFAULT NULL COMMENT '车辆管理费有效期',
  `brandModel` char(32) DEFAULT '' COMMENT '厂牌型号',
  `vehicleLicenseImg` varchar(255) DEFAULT NULL COMMENT '行驶证照片',
  `operationLicenseImg` varchar(255) DEFAULT NULL COMMENT '营运证照片',
  `operationLicenseNum` char(20) DEFAULT '' COMMENT '营运证号',
  `operationLicenseDate` date DEFAULT NULL COMMENT '营运证有效期',
  `operationYearCheck` date DEFAULT NULL COMMENT '营运证定级年检',
  `rankCheckDate` date DEFAULT NULL COMMENT '车辆定级年检',
  `secondMaintainDate` int(12) DEFAULT NULL COMMENT '车辆二级维护月份',
  `TCICompany` varchar(100) DEFAULT NULL COMMENT '交强险承保公司',
  `TCINum` char(25) DEFAULT NULL COMMENT '车辆强制保险单号',
  `TCIValidDate` datetime DEFAULT NULL COMMENT '交强险有效期',
  `TCITel` char(12) DEFAULT NULL COMMENT '承保公司服务电话',
  `VCICompany` varchar(100) DEFAULT NULL COMMENT '商业险承保公司名称',
  `VCIValidDate` datetime DEFAULT NULL COMMENT '商业保险有效期',
  `VCINum` char(20) DEFAULT NULL COMMENT '商业险保险单号',
  `VCIType` int(11) DEFAULT NULL COMMENT '商业投保类型???',
  `VCITel` varchar(11) DEFAULT NULL COMMENT '商业险联系电话',
  `operationType` tinyint(1) DEFAULT '1' COMMENT '营运类型（企业?个体）:企业：1，个人：2',
  `reviewTime` datetime DEFAULT NULL COMMENT '审核时间',
  `reviewStatus` tinyint(2) DEFAULT NULL COMMENT '审核状态,0:待审核，1：通过，-1：拒绝',
  `reviewNote` varchar(255) DEFAULT NULL COMMENT '审核信息备注',
  `createTime` date DEFAULT NULL COMMENT '创建时间',
  `available` tinyint(1) DEFAULT '0' COMMENT '车辆状态：0：不可用（冻结），1：可用',
  `cooperationAvailable` tinyint(1) DEFAULT '1' COMMENT '企业可用状态，与企业表里保持一致',
  `vehicleLicenseImg2` varchar(255) DEFAULT NULL COMMENT '行驶证副本',
  `isdel` tinyint(1) DEFAULT '0' COMMENT '是否已删除(0:正常,1:已删除)',
  `receiveAutoSend` tinyint(1) DEFAULT '1' COMMENT '是否接收自动派单(0:不接收;1:接收)',
  `defaultDriverName` char(10) DEFAULT '' COMMENT '默认驾驶员姓名',
  `lastEditor` char(20) DEFAULT NULL COMMENT '最后修改人员',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `VMColor` varchar(20) DEFAULT NULL COMMENT '汽车颜色',
  `specialId` varchar(100) DEFAULT '1' COMMENT '特殊运营类型Id',
  `subordinateBusinessId` varchar(100) DEFAULT NULL COMMENT '所属业务Id',
  `fuelTank` varchar(50) DEFAULT NULL COMMENT '油箱类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `num` (`num`) USING BTREE,
  KEY `modelId` (`modelId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8 COMMENT='车辆库:车辆表';

-- ----------------------------
-- Records of vehicle_info
-- ----------------------------
INSERT INTO `vehicle_info` VALUES ('101', '102号车', '津A111', '98765432101666', 'c200a9b43503404e969da9d54072e527', '01', 'c4af462059914d8abe87f67744b140c6', '0', '2', '678', '456', 'UploadFile/9f9f25504f99476db1453025047c8800.jpg', '2017-03-24', '', 'UploadFile/eb0d0703ac0e4bc2b7cf15772ddecd27.jpg', 'UploadFile/eb0d0703ac0e4bc2b7cf15772ddecd27.jpg', '', '2018-01-27', '2017-03-30', '2018-01-26', '2', '123', '123', '2017-03-25 12:00:00', '123', '123', '2017-03-31 12:00:00', '123', '123', '123', '1', '2017-03-31 12:00:00', '0', '测试', '2017-01-20', '1', '2', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/vehicleLicenseImg2/2017-01-20/58817999db413.jpg', '0', '1', '123', 'admin', null, '白色', '2', '1', null);
INSERT INTO `vehicle_info` VALUES ('102', null, '津A12324', '98765432102', 'CO120170120100001', '01', '4', '0', '4', '1243124', '4312413', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/vehicleImg/2017-01-23/58855bcd97832.jpg', '2021-01-08', '', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/vehicleLicenseImg/2017-01-23/58855bcd98210.jpg', '', '3245325', '2020-01-09', '0000-00-00', '2019-01-03', null, '', '', '2019-01-03 00:00:00', '', '平安', '2019-01-10 00:00:00', '', '0', '', '2', '2017-01-23 09:31:25', '1', '', '2017-01-23', '1', '1', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/vehicleLicenseImg2/2017-01-23/58855bcd98aff.jpg', '0', '1', '', 'admin', '2017-02-06 09:57:21', '黄色', '2', '2', null);
INSERT INTO `vehicle_info` VALUES ('103', null, '津QL0966', '98765432103', 'CO120170120100001', '01', '5', '0', '4', '', '', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/vehicleImg/2017-01-25/58882436530ce.jpg', '2018-01-31', '', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/vehicleLicenseImg/2017-01-25/5888243653b48.jpg', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/operationLicenseImg/2017-01-25/5888243651a41.jpg', '', '2018-01-31', null, '2018-01-31', null, '', '', '2018-01-31 00:00:00', '', '', '0000-00-00 00:00:00', null, '0', '', '2', '2017-01-25 12:07:53', '1', null, '2017-01-25', '1', '1', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/vehicleLicenseImg2/2017-01-25/5888243654533.jpg', '0', '1', '', 'admin', null, '黑色', '3', '3', null);
INSERT INTO `vehicle_info` VALUES ('104', null, '津T00001', '98765432104', 'CO120170120100001', '01', '5', '0', '2', '566787097890', '45546792334', 'http://139.129.235.40/ztcms.qxsxstudio.com//pic/vehicleImg/588171af04f2b.jpg', '2018-01-31', '567', 'http://139.129.235.40/ztcms.qxsxstudio.com//pic/vehicleLicenseImg/588171bd13d64.jpg', 'http://139.129.235.40/ztcms.qxsxstudio.com//pic/operationLicenseImg/588171c32d54b.png', '567567578856', '2018-01-31', '2018-01-31', '2018-01-31', null, '水电费水电费', '4578590897', '2018-01-31 00:00:00', '4576897', '发现根本', '2018-01-31 00:00:00', '4354', '0', '789978', '1', '0000-00-00 00:00:00', '1', '测试', '2017-01-20', '1', '1', null, '0', '0', '邸广照', 'admin', null, '黑色', '4', '1', null);
INSERT INTO `vehicle_info` VALUES ('105', null, '津 A180', '98765432105', 'CO120170120100001', '01', '5', '0', '2', '123123', '321321', '', '2018-12-07', 'A', '', '', '123123123', '2018-12-07', '0000-00-00', '2018-12-07', null, '太平洋', '148148', '2018-12-07 00:00:00', '220002020', '平安', '2018-12-07 00:00:00', '', '0', '22123123', '1', '2017-01-20 14:22:32', '1', '测试', '2017-01-20', '1', '1', null, '0', '0', '王菲', 'admin', null, '黑色', '5', '2', null);
INSERT INTO `vehicle_info` VALUES ('106', null, '津 A181', '98765432106', 'CO120170120100002', '01', '1', '0', '3', '123124', '321322', '', '2018-12-07', 'A', '', '', '123123123', '2018-12-07', '0000-00-00', '2017-02-24', null, '太平洋', '148149', '2018-12-07 12:00:00', '220002020', '平安', '2018-12-07 12:00:00', '', '0', '22123123', '1', '2017-01-20 02:22:32', '1', '测试', '2017-01-20', '1', '1', null, '0', '0', '西停放', 'admin', null, '黑色', '6', '3', null);
INSERT INTO `vehicle_info` VALUES ('107', null, '津 T2017', '98765432107', 'CO120170120100002', '01', '1', '0', '3', '1233456567', '87654353412', 'http://139.129.235.40/ztcms.qxsxstudio.com//pic/vehicleImg/5881af112d512.jpg', '2018-01-31', '12345778', 'http://139.129.235.40/ztcms.qxsxstudio.com//pic/vehicleLicenseImg/5881af2443396.jpg', 'http://139.129.235.40/ztcms.qxsxstudio.com//pic/operationLicenseImg/5881af2a2edde.jpg', '8765534321', '2018-01-31', '2018-01-31', '2017-03-01', null, '5478436345', '6567998746', '2018-01-31 12:00:00', '543678234', '手动阀', '2018-01-31 12:00:00', '5665778', '0', '87554342', '1', '0000-00-00 12:00:00', '1', '测试', '2017-01-20', '1', '1', null, '0', '0', '皇上', 'admin', null, '红色', '5', '1', null);
INSERT INTO `vehicle_info` VALUES ('108', null, '津ADB025', '98765432108', 'CO120170120100002', '01', '2', '0', '3', '56568667', '45768989700987', 'http://139.129.235.40/ztcms.qxsxstudio.com//pic/vehicleImg/5882d06839297.jpg', '2018-01-19', 'C', 'http://139.129.235.40/ztcms.qxsxstudio.com//pic/vehicleLicenseImg/5882d073bb2c7.jpg', 'http://139.129.235.40/ztcms.qxsxstudio.com//pic/operationLicenseImg/5882d0786080d.jpg', '43755667', '2018-01-19', '2018-01-19', '2018-01-19', null, '放到', '8i905645', '2018-01-19 12:00:00', '544587856', '发生的', '2018-01-19 12:00:00', '455676', '0', '64555676', '1', '0000-00-00 12:00:00', '1', '', '2017-01-21', '1', '1', null, '0', '1', '', 'admin', null, '红色', '4', '2', null);
INSERT INTO `vehicle_info` VALUES ('109', null, '津JNE769', '98765432109', 'CO120170120100002', '01', '3', '0', '4', '1234567890', '1234567890', 'http://139.129.235.40/ztcms.qxsxstudio.com//pic/vehicleImg/588412e9d3b5e.png', '2018-01-03', '123456789', 'http://139.129.235.40/ztcms.qxsxstudio.com//pic/vehicleLicenseImg/588412f5c86e5.jpg', 'http://139.129.235.40/ztcms.qxsxstudio.com//pic/operationLicenseImg/5884130db71f3.jpg', '123456789', '2018-01-03', '2016-01-06', '2017-01-12', null, '324567', '4356786', '2019-01-17 12:00:00', '324567', '234564', '2018-01-18 12:00:00', '352345657', '127', '5346475', '1', '0000-00-00 12:00:00', '1', '', '2017-01-22', '1', '1', null, '0', '1', '李昂', 'admin', null, '红色', '3', '3', null);
INSERT INTO `vehicle_info` VALUES ('110', null, '津ALS270', '98765432110', 'CO120170120100002', '01', '3', '0', '5', 'GA6TSB0452', 'LS4ASB380FG157671', null, '2017-12-10', '长安牌SC5028XXYN4CNG', null, null, '120101104869', '1905-07-14', null, '2017-12-10', null, '中国人保', 'PDZA201612000000068234', '2017-08-27 12:00:00', '95518', '中国人保', '2018-01-10 12:00:00', null, '0', '95518', '1', '2017-01-23 09:02:18', '1', null, '2017-01-23', '1', '1', null, '0', '1', '汪学来', null, null, '红色', '2', '1', null);
INSERT INTO `vehicle_info` VALUES ('111', null, '津AVG989', '98765432111', 'CO120170120100003', '01', '6', '0', '3', '216555', 'LSYKFAAA8GG274536', '', '2017-01-23', '金杯牌SY5020XXY-K1SBW', '', '', '120101', '2017-05-04', '0000-00-00', '2017-01-23', null, '中国人保', 'PDZA201712000000000103', '2018-01-03 00:00:00', '95518', '中国人保', '2018-01-09 00:00:00', '', '0', '95518', '1', '2017-01-23 10:26:58', '1', '', '2017-01-23', '1', '1', null, '0', '1', '杜金柱', 'admin', null, '银色', '1', '2', null);
INSERT INTO `vehicle_info` VALUES ('112', null, '津 A280', '98765432112', 'CO120170120100003', '01', '6', '0', '3', '123123', '321321', null, '2018-12-07', 'A', null, null, '123123123', '2018-12-07', null, '2018-12-07', null, '太平洋', '148148', '2018-12-07 00:00:00', '220002020', '平安', '2018-12-07 00:00:00', null, '0', '22123123', '1', '2017-02-04 11:25:41', '1', null, '2017-02-04', '1', '1', null, '0', '1', '王菲', 'admin', '2017-02-04 11:25:41', '绿色', '6', '3', null);
INSERT INTO `vehicle_info` VALUES ('113', null, '津 A281', '98765432113', 'CO120170120100003', '01', '7', '0', '3', '123124', '321322', null, '2018-12-07', 'A', null, null, '123123123', '2018-12-07', null, '2018-12-07', null, '太平洋', '148149', '2018-12-07 00:00:00', '220002020', '平安', '2018-12-07 00:00:00', null, '0', '22123123', '1', '2017-02-04 11:25:41', '1', null, '2017-02-04', '1', '1', null, '0', '1', '西停放', 'admin', '2017-02-04 11:25:41', '银色', '1', '1', null);
INSERT INTO `vehicle_info` VALUES ('114', null, '津 M2018', '98765432114', 'CO120170120100003', '01', '7', '0', '2', '54364 56546', '5436346346', 'http://139.129.235.40/ztcms.qxsxstudio.com//pic/vehicleImg/58954f9a6a79c.jpg', '2019-02-28', '3', 'http://139.129.235.40/ztcms.qxsxstudio.com//pic/vehicleLicenseImg/58954fa95e679.jpg', 'http://139.129.235.40/ztcms.qxsxstudio.com//pic/operationLicenseImg/58954fb5df7b1.jpg', '547698667987', '2019-02-28', '2019-02-28', '2019-02-28', null, '而形成v', '4564756234435', '2019-02-28 00:00:00', '45645674567', '是大法官', '2019-02-28 00:00:00', '34563467', '0', '6557843453', '1', null, '1', null, '2017-02-04', '1', '1', null, '0', '0', '阿萨德', 'admin', '2017-02-04 11:52:07', '银色', '2', '2', null);
INSERT INTO `vehicle_info` VALUES ('115', null, '测试565', '64624504236', 'CO120170120100003', '01', '6', '0', '4', '1000000', '1000000', null, '2018-04-30', '', null, null, '', '2018-04-30', '2018-04-30', null, '3', '平安', '100000', '2018-04-30 00:00:00', '100000', '平安', '2018-04-30 00:00:00', '100000', '12', '231232', '1', null, '1', null, null, '1', '1', null, '0', '1', ' 测试司机', null, null, '白色', '7', '1', null);
INSERT INTO `vehicle_info` VALUES ('116', '0428一号', '0428-01', '0428', 'a024f258cea3459785a9dbf66d117516', '01', 'd84e934d309845e5a0650d975032b0b4', '0', '4', '0428', '0428', null, '2017-04-05', '', null, null, '', '2017-04-25', '2017-04-24', null, '1', '2', '34', '2017-04-25 00:00:00', '3435', '354', '2017-04-24 00:00:00', '3434', '23', '3434', '0', null, null, null, null, '0', '0', null, '0', '1', '张三', null, null, '白色', '4', '2', null);
INSERT INTO `vehicle_info` VALUES ('117', null, '空T342G', '6785478343', 'CO120170120100002', '01', '2', '0', '2', 'FGTYRTE-012', '64390GH', null, '2017-04-24', '', null, null, '', '2017-04-24', '2017-04-25', null, '12', '232', 'Bg65656', '2017-04-25 12:00:00', '34345', '54防化服', '2017-04-25 12:00:00', '435Gh', '34', '434', '0', null, null, null, null, '0', '0', null, '0', '1', '张三', null, null, '棕色', '5', '3', null);
INSERT INTO `vehicle_info` VALUES ('118', 'GT546', '火E657Y', '5454342', 'CO120170120100002', '01', '2', '0', '2', 'FH343', 'JH45', null, '2017-04-24', '', null, null, '', '2017-04-25', '2017-04-24', null, '23', '23是否', '2G6767', '2017-04-25 12:00:00', '243434', '2火星办事处', '2017-04-25 12:00:00', 'FG244', '2', '24343', '0', null, null, null, null, '0', '0', null, '0', '1', '完税', null, null, '蓝色', '2', '4', null);
INSERT INTO `vehicle_info` VALUES ('119', '454', '亿T454', '545454', 'CO120170120100002', '01', '2', '0', '3', '5453', '545', null, '2017-04-25', '', null, null, '', '2017-04-25', '2017-04-25', null, '23', '32', '343', '2017-04-26 12:00:00', '234343', '34343', '2017-04-25 12:00:00', '43434', '23', '43434', '0', null, null, null, null, '0', '0', null, '0', '1', '343', null, null, '个色', '4', '1', null);
INSERT INTO `vehicle_info` VALUES ('120', '', '月D8541V', '54546343', 'CO120170120100002', '01', '16', '0', '2', 'FGH4352', 'VG4545', null, '2017-04-25', '', null, null, '', '2017-04-25', '2017-04-24', null, '12', '44GF', 'FDV434', '2017-04-24 12:00:00', '34334', '434343', '2017-04-24 12:00:00', 'DFg343', '32', '3443434', '1', null, '-1', null, null, '1', '1', null, '0', '1', '方胜', null, null, '黄色', '3', '2', null);
INSERT INTO `vehicle_info` VALUES ('121', null, '测试12321', '4', 'CO120170120100004', '01', '8', '0', '4', '3', '2', '', '2017-03-18', '', '', '', '', '2017-03-24', '2017-03-30', null, '5', '6', '112', '2017-03-31 12:00:00', '123', '123', '2017-03-02 12:00:00', '6', '5', '56', '1', '2017-03-16 12:00:00', '1', '23423', null, '1', '2', null, '0', '0', '7', null, null, '白色', '1', '6', null);
INSERT INTO `vehicle_info` VALUES ('122', null, '啊A123', '01', 'CO120170120100004', '01', '10', '0', '4', '01', '01', null, '2017-03-05', '', null, null, '', '2017-03-13', '2017-03-13', null, '6', '00', '00', '2017-03-13 00:00:00', '12', '12', '2017-03-13 00:00:00', '22', '22', '22', '0', null, null, null, null, '0', '0', null, '0', '1', '14', null, null, '白色', '2', '2', null);
INSERT INTO `vehicle_info` VALUES ('123', null, '哈HG656', '12', 'CO120170120100004', '01', '9', '0', '3', 'as', 'as', null, '2017-03-14', '', null, null, '', '2017-03-23', '2017-03-22', null, '12', '12', '12', '2017-03-29 00:00:00', '12', '21', '2017-03-29 00:00:00', '12', '12', '1221', '0', null, null, null, null, '0', '0', null, '0', '1', '12', null, null, '白色', '7', '2', null);
INSERT INTO `vehicle_info` VALUES ('124', null, '汉A0001', '110', 'CO120170120100004', '01', '8', '0', '4', '32', '012', null, '2017-04-25', '', null, null, '', '2017-04-25', '2017-04-25', null, '12', '23', '23', '2017-04-25 00:00:00', '123', '2323', '2017-04-25 00:00:00', '2313', '12', '34434', '0', null, null, null, null, '0', '0', null, '0', '1', '23', null, null, '白色', '1', '1', null);
INSERT INTO `vehicle_info` VALUES ('125', '12121', '汉0002', '0123', 'CO120170120100001', '01', '10', '0', '3', '022', '022', null, '2017-04-25', '', null, null, '', '2017-04-25', '2017-04-25', null, '123', '23', '23', '2017-04-11 12:00:00', '23123', '32321', '2017-04-25 12:00:00', '231', '23', '323', '1', '2017-04-24 12:00:00', '1', '12', null, '1', '1', null, '0', '1', '323', null, null, '黑色', '5', '1', null);
INSERT INTO `vehicle_info` VALUES ('126', null, '京A111', '1234', 'CO120170120100005', '01', '12', '0', '4', '132', '123', null, '2017-04-25', '', null, null, '', '2017-04-25', '2017-04-25', null, '12', '23', '2323', '2017-04-25 12:00:00', '123', '23', '2017-04-26 12:00:00', '231', '12', '323', '0', null, null, null, null, '1', '0', null, '0', '1', '123', null, null, '紫色', '1', '1', null);
INSERT INTO `vehicle_info` VALUES ('127', null, '滨R12345', '23434', 'CO120170120100005', '01', '13', '0', '4', '2345', '12345', '', '2017-03-16', '', '', '', '', '2017-03-23', '2017-03-30', null, '3', '3234', '234234', '2017-03-25 00:00:00', '1234', '1234', null, '123', null, '123', '0', null, null, null, null, '0', '0', null, '0', '0', '2324', null, null, '白色', '7', '7', null);
INSERT INTO `vehicle_info` VALUES ('128', null, '塘E1233', '123', 'CO120170120100005', '01', '13', '0', '4', '123', '123', '', '2017-03-09', '', '', '', '', '2017-03-17', '2017-03-31', null, '2', '123', '123', '2017-03-18 12:00:00', '123', '123', null, '12', null, '123', '0', null, null, null, null, '0', '0', null, '0', '0', '123', null, null, '蓝色', '7', '7', null);
INSERT INTO `vehicle_info` VALUES ('129', null, '津666', '98765432101', 'CO120170120100006', '01', '14', '0', '4', '2', '3', '4', '2017-03-05', '6', '7', '9', '', '2017-03-05', '2017-03-05', '2017-03-05', '1', '14', '15', '2017-03-05 14:50:50', '17', '18', '2017-03-05 14:50:50', '20', '1', '21', '1', '2017-03-05 14:50:50', '1', '23', '2017-03-05', '1', '1', '24', '1', '1', '张三', '25', '2017-03-05 14:50:50', '蓝色', '7', '6', '30');
INSERT INTO `vehicle_info` VALUES ('130', null, '津6669', '98765432101', 'CO120170120100006', '01', '15', '0', '4', '2', '3', '4', '2017-03-05', '6', '7', '8', '9', '2017-03-05', '2017-03-05', '2017-03-05', '1', '14', '15', '2017-03-05 14:50:50', '17', '18', '2017-03-05 14:50:50', '20', '1', '21', '1', '2017-03-05 14:50:50', '1', '23', '2017-03-05', '1', '1', '24', '1', '1', '张三', '25', '2017-03-05 14:50:50', '蓝色', '7', '6', '30');
INSERT INTO `vehicle_info` VALUES ('131', '12', '12', '12', 'CO120170120100002', '01', '16', '0', '2', '12', '12', null, '2017-03-05', '', null, null, '', '2017-03-05', '2017-03-05', null, '5', '5', '12', '2017-03-05 14:50:50', '12', '12', '2017-03-05 14:50:50', '12', '12', '12', '0', null, null, null, '2017-05-10', '0', '0', null, '0', '1', '12', null, null, '12', '1', null, null);
INSERT INTO `vehicle_info` VALUES ('133', '113487', '津113487', '1113487', 'a024f258cea3459785a9dbf66d117516', '01', '18', '0', '2', '113487', '113487', null, '2017-05-26', '', null, null, '', '2018-05-26', '2018-05-26', null, '2', '113478', '113478', '2018-05-26 00:00:00', '113487', '113487', '2018-05-26 00:00:00', '1', '11', '113487', '0', null, null, null, '2017-05-10', '0', '0', null, '0', '1', '113487', null, null, '黑色', '1', null, null);
INSERT INTO `vehicle_info` VALUES ('134', '0510', '0510', '0510', 'a024f258cea3459785a9dbf66d117516', '01', '18', '0', '3', '0510', '0510', null, '2017-05-25', '', null, null, '', '2017-05-25', '2017-05-25', null, '2', '0510', '0510', '2017-05-25 00:00:00', '0510', '0510', '2017-05-31 00:00:00', '0510', '1', '0510', '0', null, null, null, '2017-05-10', '0', '0', null, '0', '0', '0510', null, null, '0510', '2', null, null);
INSERT INTO `vehicle_info` VALUES ('135', '66', '66', '66', 'a024f258cea3459785a9dbf66d117516', '01', '18', '0', '2', '66', '66', null, '2017-03-05', '', null, null, '', '2017-03-05', '2017-03-05', null, '5', '66', '66', '2017-03-05 14:50:50', '66', '66', '2017-03-05 14:50:50', '66', '66', '66', '0', null, null, null, '2017-05-10', '0', '0', null, '0', '1', '66', null, null, '绿色', '1', null, null);
INSERT INTO `vehicle_info` VALUES ('136', '789', '测Y789', '789', 'a024f258cea3459785a9dbf66d117516', '01', '18', '0', '2', '789', '789', null, '2017-05-31', '', null, null, '', '2017-05-31', '2017-05-30', null, '2', '3国服', '34', '2017-05-09 00:00:00', '3434', '3434', '2017-05-30 00:00:00', '343', '3', '343', '0', null, null, null, '2017-05-10', '0', '0', null, '0', '1', '45', null, null, '不知道', '1', null, null);
INSERT INTO `vehicle_info` VALUES ('137', '654', '哈Y654', '654', 'a024f258cea3459785a9dbf66d117516', '01', '18', '0', '2', '654', '654', null, '2017-05-30', '', null, null, '', '2017-05-30', '2017-05-16', null, '34', '3 父', '34', '2017-05-30 00:00:00', '34', '343', '2017-05-30 00:00:00', '3434', '34', '43434', '0', null, null, null, '2017-05-10', '0', '0', null, '0', '1', '35', null, null, '色', '1', null, null);
INSERT INTO `vehicle_info` VALUES ('139', '778', '红T778', '687', 'a024f258cea3459785a9dbf66d117516', '01', 'd84e934d309845e5a0650d975032b0b4', '0', '2', '787', '778', null, '2017-05-23', '', null, null, '', '2017-05-30', '2017-05-29', null, '34', '个', '3434', '2017-05-31 00:00:00', '34343', '国服', '2017-05-30 00:00:00', 'g565', '3', '54545', '0', null, null, null, '2017-05-10', '0', '0', null, '0', '1', '父', null, null, '色', '1', null, null);
INSERT INTO `vehicle_info` VALUES ('140', '787', '是Y787', '787', 'a024f258cea3459785a9dbf66d117516', '01', 'd84e934d309845e5a0650d975032b0b4', '0', '2', '787', '787', null, '2017-05-29', '', null, null, '', '2017-05-29', '2017-05-30', null, '3', '34国服', '34343', '2017-05-30 00:00:00', '454', '454个', '2017-05-30 00:00:00', '4545', '23', '3434', '0', null, null, null, '2017-05-10', '0', '0', null, '0', '1', '分隔', null, null, '色', '1', null, null);
INSERT INTO `vehicle_info` VALUES ('141', '433', '是R342', '343', 'a024f258cea3459785a9dbf66d117516', '01', 'd84e934d309845e5a0650d975032b0b4', '0', '2', '343', '3432', null, '2017-05-17', '', null, null, '', '2017-05-30', '2017-05-30', null, '23', '2父', '2324', '2017-05-30 00:00:00', '343', '3人', '2017-05-30 00:00:00', '3v', '34', '3434', '0', null, null, null, '2017-05-10', '0', '0', null, '0', '1', '父', null, null, '分隔', '1', null, null);
INSERT INTO `vehicle_info` VALUES ('146', '54', '父45', '45', 'a024f258cea3459785a9dbf66d117516', '01', '77181111418b4357b050c833a821e18d', '0', '2', '454', '45', null, '2017-05-29', '', null, null, '', '2017-05-29', '2017-05-31', null, '34', '35个', '34', '2017-05-17 00:00:00', '434', '43', '2017-05-30 00:00:00', '4343', '3', '3443', '0', null, null, null, '2017-05-10', '0', '0', null, '0', '1', '34', null, null, '个', '1', null, null);
INSERT INTO `vehicle_info` VALUES ('147', '45', '福45', '54', 'a024f258cea3459785a9dbf66d117516', '01', '77181111418b4357b050c833a821e18d', '0', '2', '54', '454', null, '2017-05-23', '', null, null, '', '2017-05-31', '2017-05-30', null, '34', '国服', '343', '2017-05-30 00:00:00', '34', '34', '2017-05-31 00:00:00', '343', '34', '3434', '0', null, null, null, '2017-05-10', '0', '0', null, '0', '1', '34', null, null, '5福福', '1', null, null);

-- ----------------------------
-- Table structure for vehicle_status(cache)
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_status(cache)`;
CREATE TABLE `vehicle_status(cache)` (
  `vehicleId` char(15) CHARACTER SET utf8 DEFAULT NULL COMMENT '车辆id',
  `vStatus` tinyint(1) DEFAULT NULL COMMENT '0:无货，1：有货（订单表来）',
  `GPSY` decimal(13,10) DEFAULT NULL COMMENT '纬度（每N秒更新，并写文本文件）',
  `GPSX` decimal(13,10) DEFAULT NULL COMMENT '经度（每N秒更新，并写文本文件）',
  `vihicleNum` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '车牌号',
  `remainBulk` decimal(4,1) DEFAULT NULL COMMENT '剩余容量（从订单来）'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vehicle_status(cache)
-- ----------------------------

-- ----------------------------
-- Table structure for vehicle_team
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_team`;
CREATE TABLE `vehicle_team` (
  `id` varchar(50) NOT NULL,
  `tName` varchar(50) NOT NULL COMMENT '车队名称',
  `cooperationId` varchar(50) NOT NULL COMMENT '企业id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vehicle_team
-- ----------------------------
INSERT INTO `vehicle_team` VALUES ('1', '申通车队', 'c200a9b43503404e969da9d54072e527');
INSERT INTO `vehicle_team` VALUES ('10', '中科客', 'CO120170120100004');
INSERT INTO `vehicle_team` VALUES ('11', '企业运', 'CO120170120100005');
INSERT INTO `vehicle_team` VALUES ('12', '企业货', 'CO120170120100005');
INSERT INTO `vehicle_team` VALUES ('13', '企业客', 'CO120170120100005');
INSERT INTO `vehicle_team` VALUES ('14', '企业2客', 'CO120170120100006');
INSERT INTO `vehicle_team` VALUES ('15', '企业2货', 'CO120170120100006');
INSERT INTO `vehicle_team` VALUES ('16', '阿里TEAM', 'CO120170120100002');
INSERT INTO `vehicle_team` VALUES ('17', '申通TEAM', 'c200a9b43503404e969da9d54072e527');
INSERT INTO `vehicle_team` VALUES ('18', '0428TEAM', 'a024f258cea3459785a9dbf66d117516');
INSERT INTO `vehicle_team` VALUES ('19', '中科TEAM', 'CO120170120100004');
INSERT INTO `vehicle_team` VALUES ('2', '阿里液压', 'CO120170120100002');
INSERT INTO `vehicle_team` VALUES ('20', '企业TEAM', 'CO120170120100005');
INSERT INTO `vehicle_team` VALUES ('21', '企业2TEAM', 'CO120170120100006');
INSERT INTO `vehicle_team` VALUES ('22', '测试企业TEAM', 'CO120170120100001');
INSERT INTO `vehicle_team` VALUES ('23', '正通物流TEAM', 'CO120170120100003');
INSERT INTO `vehicle_team` VALUES ('3', '阿里待报废', 'CO120170120100002');
INSERT INTO `vehicle_team` VALUES ('4', '测试企业常运', 'CO120170120100001');
INSERT INTO `vehicle_team` VALUES ('5', '测试企业大客', 'CO120170120100001');
INSERT INTO `vehicle_team` VALUES ('6', '正通物流卡车', 'CO120170120100003');
INSERT INTO `vehicle_team` VALUES ('7', '正通物流商务', 'CO120170120100003');
INSERT INTO `vehicle_team` VALUES ('77181111418b4357b050c833a821e18d', '0428货运', 'a024f258cea3459785a9dbf66d117516');
INSERT INTO `vehicle_team` VALUES ('8', '中科车', 'CO120170120100004');
INSERT INTO `vehicle_team` VALUES ('9', '中科货', 'CO120170120100004');
INSERT INTO `vehicle_team` VALUES ('c4af462059914d8abe87f67744b140c6', '申通一车队', 'c200a9b43503404e969da9d54072e527');
INSERT INTO `vehicle_team` VALUES ('d84e934d309845e5a0650d975032b0b4', '0428车队', 'a024f258cea3459785a9dbf66d117516');
