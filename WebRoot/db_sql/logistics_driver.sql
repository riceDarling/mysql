/*
Navicat MySQL Data Transfer

Source Server         : 192.168.3.100_3306
Source Server Version : 50527
Source Host           : 192.168.3.100:3306
Source Database       : logistics_driver

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2017-08-18 18:29:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for driver_bank
-- ----------------------------
DROP TABLE IF EXISTS `driver_bank`;
CREATE TABLE `driver_bank` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `driverId` char(20) NOT NULL,
  `driverName` char(20) NOT NULL,
  `bankNum` bigint(19) NOT NULL,
  `bankName` char(30) NOT NULL,
  `branch` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `driverId` (`driverId`) USING BTREE,
  CONSTRAINT `driver_bank_ibfk_1` FOREIGN KEY (`driverId`) REFERENCES `driver_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of driver_bank
-- ----------------------------
INSERT INTO `driver_bank` VALUES ('1', 'DR20170120100002', '朕', '8373626282625373', '招商银行', '天津支行');

-- ----------------------------
-- Table structure for driver_info
-- ----------------------------
DROP TABLE IF EXISTS `driver_info`;
CREATE TABLE `driver_info` (
  `id` char(20) NOT NULL,
  `dName` char(20) DEFAULT NULL COMMENT '姓名',
  `tel` char(20) DEFAULT NULL COMMENT '司机手机',
  `password` char(32) DEFAULT NULL COMMENT '密码',
  `face` varchar(255) DEFAULT NULL COMMENT '头像',
  `driverType` tinyint(1) DEFAULT '0' COMMENT '司机类型（0：个人；1：企业）',
  `cooperationId` char(32) DEFAULT NULL COMMENT '企业ID',
  `idCardNum` char(18) DEFAULT NULL COMMENT '身份证号',
  `idCardFrontImg` varchar(255) DEFAULT NULL COMMENT '身份证正面',
  `idCardBackImg` varchar(255) DEFAULT NULL COMMENT '身份证反面',
  `idCardValidDate` datetime DEFAULT NULL COMMENT '身份证有效期',
  `addr` varchar(255) DEFAULT NULL COMMENT '现地址',
  `driverClass` char(2) DEFAULT NULL COMMENT '准驾车型',
  `DLNum` char(30) DEFAULT NULL COMMENT '驾驶证号',
  `DLImg2` varchar(255) DEFAULT NULL COMMENT '驾驶证副本',
  `DLImg` varchar(255) DEFAULT NULL COMMENT '驾驶证图片',
  `DLValidDate` datetime DEFAULT NULL COMMENT '驾驶证有效期',
  `CCBPNum` char(30) DEFAULT NULL COMMENT '上岗证号',
  `CCBPImg` varchar(255) DEFAULT NULL COMMENT '上岗证图片',
  `CCBPValidDate` datetime DEFAULT NULL COMMENT '上岗证有效期',
  `professionNum` char(30) DEFAULT NULL COMMENT '从业资格证编号',
  `professionImg` varchar(255) DEFAULT NULL COMMENT '从业资格证',
  `professionImg2` varchar(255) DEFAULT NULL COMMENT '从业资格证副本',
  `professionCount` int(11) DEFAULT '0' COMMENT '从业资格继续教育次数',
  `professionValidDate` datetime DEFAULT NULL COMMENT '从业资格证有效期',
  `professionYearCheck` datetime DEFAULT NULL COMMENT '从业资格定级年检',
  `reviewTime` datetime DEFAULT NULL COMMENT '审核时间（不管通过不通过，都记录审核时的时间）',
  `reviewStatus` tinyint(4) DEFAULT '0' COMMENT '审核状态。0：未审核，1：通过，-1：审核失败,2:待审核；3：重新提交审核',
  `reviewNote` varchar(255) DEFAULT NULL COMMENT '审核备注',
  `available` tinyint(1) DEFAULT '1' COMMENT '状态（1：正常；0：冻结）',
  `cooperationAvailable` tinyint(1) DEFAULT '1' COMMENT '可用状态。1，可用，0：不可用，与cooperation表保持一致',
  `registrationId` varchar(255) DEFAULT NULL,
  `EcontactTel` char(13) DEFAULT NULL,
  `Econtact` char(10) DEFAULT NULL,
  `iosCid` varchar(255) DEFAULT NULL COMMENT '安卓设备号',
  `androidCid` varchar(255) DEFAULT NULL COMMENT 'IOS设备号',
  `isdel` tinyint(1) DEFAULT '0' COMMENT '是否已删除(0:正常,1:已删除)',
  `defaultVehicleNum` char(10) DEFAULT '' COMMENT '默认车牌号',
  `imageForm` tinyint(1) DEFAULT '1' COMMENT '图片来源(默认CMS1，APP0)',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `lastEditor` char(20) DEFAULT NULL COMMENT '最后修改人员',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `institutionName` varchar(100) DEFAULT NULL COMMENT '发证机构名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tel` (`tel`) USING BTREE,
  KEY `professionId` (`professionNum`) USING BTREE,
  KEY `quasiDrivingType` (`driverClass`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of driver_info
-- ----------------------------
INSERT INTO `driver_info` VALUES ('DR120170123100008', '测试', '172625373846781789', 'e10adc3949ba59abbe56e057f20f883e', null, '1', 'CO120170120100001', '120104196203222789', '', '', '2017-05-30 19:00:00', '测试地址', 'B2', '120104196203222789', '', '', '2017-05-30 19:00:00', null, null, null, '120113002020901789', '', '', '1', '2017-05-30 19:00:00', '2017-05-30 19:00:00', null, '1', '', '1', '0', null, null, null, null, null, '0', '津JNE123', '1', '', 'admin', null, '测试');
INSERT INTO `driver_info` VALUES ('DR120170204100010', '老司机', '434657887', 'e10adc3949ba59abbe56e057f20f883e', null, '1', 'CO120170120100001', '546656575546455466', 'http://139.129.235.40/ztcms.qxsxstudio.com//pic/idCardFrontImg/58954c3247084.jpg', 'http://139.129.235.40/ztcms.qxsxstudio.com//pic/idCardBackImg/58954c371f5cf.jpg', '2019-02-28 00:00:00', '天津', 'C', '54676896789', null, 'http://139.129.235.40/ztcms.qxsxstudio.com//pic/DLImg/58954c509b903.jpg', '2019-02-23 00:00:00', null, null, null, '5643354467', 'http://139.129.235.40/ztcms.qxsxstudio.com//pic/professionImg/58954c549ed4e.jpg', 'http://139.129.235.40/ztcms.qxsxstudio.com//pic/professionImg2/58954c588f56b.jpg', '0', '2019-02-28 00:00:00', '2019-02-28 00:00:00', null, '1', '', '1', '0', null, null, null, null, null, '0', '津ADB025', '1', '', 'admin', null, '测试12');
INSERT INTO `driver_info` VALUES ('DR120170204100011', '新司机', '4556676848', 'e10adc3949ba59abbe56e057f20f883e', null, '1', 'CO120170120100001', '56508790-63442543', 'http://139.129.235.40/ztcms.qxsxstudio.com//pic/idCardFrontImg/58954d4e7c420.jpg', 'http://139.129.235.40/ztcms.qxsxstudio.com//pic/idCardBackImg/58954d5209896.jpg', '2019-02-28 00:00:00', '聚焦', 'C', '23453463532452345', null, 'UploadFile/c7e833de9d4e4759b473ad6419cdd4aa.jpg', '2019-02-28 00:00:00', null, null, null, '56756345345', 'http://139.129.235.40/ztcms.qxsxstudio.com//pic/professionImg/58954d6829d42.jpg', 'http://139.129.235.40/ztcms.qxsxstudio.com//pic/professionImg2/58954d6b7e2c1.jpg', '0', '2019-02-28 00:00:00', '2019-02-28 00:00:00', null, '1', '', '1', '0', null, null, null, null, null, '0', '津T00001', '1', '', 'admin', '2017-02-04 11:41:48', '是是是');
INSERT INTO `driver_info` VALUES ('DR20170120100001', '邸广照', '18330219027', 'e10adc3949ba59abbe56e057f20f883e', 'Driver/header/2017-01-20/588179f9d1c8e.jpg', '1', 'CO120170120100001', '158483349484884976', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/idCardFrontImg/2017-01-20/58817089ae91c.jpg', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/idCardBackImg/2017-01-20/58817089aec88.jpg', '2018-01-31 00:00:00', '房顶上的', 'C', '46345678', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/DLImg2/2017-01-20/58817089af047.jpg', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/DLImg/2017-01-20/58817089aee77.jpg', '2018-01-31 00:00:00', null, null, null, '634565437', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/professionImg/2017-01-20/58817089afc99.jpg', '', '0', '2018-01-31 00:00:00', '2018-01-20 00:00:00', '2017-01-20 10:13:24', '1', '', '1', '1', null, null, null, 'd60cf1bebd3a7182dd2993b6c70af1f9', '021e4f00843e3dc888a6add7ed691a90', '0', '津 A181', '0', '', 'admin', null, '网易');
INSERT INTO `driver_info` VALUES ('DR20170120100002', '朕', '18920729877', 'e10adc3949ba59abbe56e057f20f883e', 'Driver/header/2017-02-09/589c2e511924c.jpg', '0', 'CO120170120100002', '679592437849167549', 'UploadFile/35c814dd0bda498c9209169fe9988be2.jpg', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/idCardBackImg/2017-01-20/58817999d7b95.jpg', '2020-01-23 00:00:00', '天津 西青 海泰发展六道', '', '', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/DLImg2/2017-01-20/58817999d69fa.jpg', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/DLImg/2017-01-20/58817999d5eec.jpg', '2018-01-10 00:00:00', null, null, null, '', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/idCardFrontImg/2017-01-20/58817999d899b.jpg', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/idCardFrontImg/2017-01-20/58817999d899b.jpg', '0', '2018-01-20 00:00:00', '2018-01-20 00:00:00', '2017-01-20 11:04:15', '1', '', '1', '1', null, '12345678900', '朕', '6e9d44f49e0268faada1298fface8804', '', '0', '津ADB025', '0', '', 'admin', null, '发条');
INSERT INTO `driver_info` VALUES ('DR20170120100003', '王二小', '13888986677', '91dc677692dd596dd49cb67b820f6710', null, '1', 'CO120170120100002', '199929213123934000', null, null, '2017-11-28 00:00:00', '中南海', 'C1', '123321123', null, null, '2017-12-08 00:00:00', null, null, null, 'A123123', null, null, '0', '2017-12-08 00:00:00', '2017-12-08 00:00:00', '2017-01-20 14:24:10', '1', '', '1', '1', null, null, null, null, null, '0', '津JNE769', '1', '545437222', null, null, '天鹅湾');
INSERT INTO `driver_info` VALUES ('DR20170120100004', '你好', '18502621998', 'e10adc3949ba59abbe56e057f20f883e', null, '1', 'CO120170120100002', '188676645494888', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/idCardFrontImg/2017-01-20/5881bbb5ec4e6.jpg', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/idCardBackImg/2017-01-20/5881bbb5ecc34.jpg', '2020-01-10 00:00:00', '2020-01-10', '20', '2020-01-10', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/DLImg2/2017-01-20/5881bbb5eddb0.jpg', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/DLImg/2017-01-20/5881bbb5ed3ac.jpg', '2020-01-10 00:00:00', null, null, null, '2020-01-10', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/professionImg/2017-01-20/5881bbb5ee78f.jpg', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/professionImg2/2017-01-20/5881bbb5ef00a.jpg', '0', '2020-01-10 00:00:00', '0000-00-00 00:00:00', '2017-01-20 15:28:10', '1', '', '1', '1', null, null, null, '', '0f8bd13ae6f03ee0a0ab489c72faa113', '0', '津ALS270', '0', null, 'admin', null, '测试41');
INSERT INTO `driver_info` VALUES ('DR20170120100005', '常友', '18902621908', 'e10adc3949ba59abbe56e057f20f883e', null, '1', 'CO120170120100002', '341221198910303173', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/idCardFrontImg/2017-01-20/5881c110cb637.jpg', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/idCardBackImg/2017-01-20/5881c110cbff1.jpg', '2018-01-31 00:00:00', '但是', 'C', '2145452', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/DLImg2/2017-01-20/5881c110cd557.jpg', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/DLImg/2017-01-20/5881c110cc893.jpg', '2018-01-31 00:00:00', null, null, null, '54678', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/professionImg/2017-01-20/5881c110cdda7.jpg', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/professionImg2/2017-01-20/5881c110ce6b4.jpg', '0', '2018-01-31 00:00:00', '0000-00-00 00:00:00', '2017-01-20 16:06:01', '1', '', '1', '1', null, null, null, '', '0f8bd13ae6f03ee0a0ab489c72faa113', '0', '津 A280', '0', null, 'admin', null, '测试11');
INSERT INTO `driver_info` VALUES ('DR20170120100006', '张磊', '18502621888', 'e10adc3949ba59abbe56e057f20f883e', null, '1', 'CO120170120100003', '341221198910303173', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/idCardFrontImg/2017-01-20/5881c7a63bbe1.jpg', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/idCardBackImg/2017-01-20/5881c7a63c353.jpg', '2018-01-31 00:00:00', '手动阀', 'C', '3425678789', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/DLImg2/2017-01-20/5881c7a63d71d.jpg', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/DLImg/2017-01-20/5881c7a63cc91.jpg', '2018-01-31 00:00:00', null, null, null, '44572345', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/professionImg/2017-01-20/5881c7a63e0c9.jpg', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/professionImg2/2017-01-20/5881c7a63eaba.jpg', '0', '2018-01-31 00:00:00', '0000-00-00 00:00:00', '2017-01-20 16:18:32', '1', '', '1', '1', null, null, null, '', '0f8bd13ae6f03ee0a0ab489c72faa113', '0', '津 M2018', '0', null, 'admin', null, null);
INSERT INTO `driver_info` VALUES ('DR20170120100007', '掌权', '18502621908', 'e10adc3949ba59abbe56e057f20f883e', null, '1', 'CO120170120100003', '344122119891030317', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/idCardFrontImg/2017-01-20/5881c91b18978.jpg', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/idCardBackImg/2017-01-20/5881c91b193a4.jpg', '2018-01-31 00:00:00', '是大法官', 'C', '6734634567', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/DLImg2/2017-01-20/5881c91b1a7dc.jpg', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/DLImg/2017-01-20/5881c91b19d28.jpg', '2018-01-31 00:00:00', null, null, null, '56448758879', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/professionImg/2017-01-20/5881c91b1b657.jpg', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/professionImg2/2017-01-20/5881c91b1be8e.jpg', '0', '2018-01-31 00:00:00', '0000-00-00 00:00:00', '2017-01-20 16:25:15', '1', '123', '1', '1', null, null, null, '', '1624fe90463939947062b87b132313b3', '0', '津A1112', '0', null, 'admin', null, null);
INSERT INTO `driver_info` VALUES ('DR20170122100008', '驾驶员', '15122615761', '8aa910396ef7d50779bdbc2c828a0fb6', null, '0', 'CO120170120100003', null, null, null, null, null, null, null, null, null, '0000-00-00 00:00:00', null, null, null, null, null, null, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, '0', '驾驶证过期导致账号冻结', '0', '0', null, null, null, '', '1026ce86b8b1b06f254ac5191e3fd668', '0', '津A12324', '1', null, null, null, null);
INSERT INTO `driver_info` VALUES ('DR20170122100009', '李昂', '15922237298', 'e10adc3949ba59abbe56e057f20f883e', null, '1', 'CO120170120100004', '120103188029373222', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/idCardFrontImg/2017-01-22/588413ed66f3a.jpg', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/idCardBackImg/2017-01-22/588413ed66c0a.jpg', '2020-01-18 00:00:00', '', '', '', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/DLImg2/2017-01-22/588413ed6690b.jpg', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/DLImg/2017-01-22/588413ed665ab.jpg', '2021-01-29 00:00:00', null, null, null, '', '', '', '0', '2026-01-16 00:00:00', '2022-01-05 00:00:00', '2017-01-22 10:08:03', '1', null, '1', '1', null, null, null, 'eb672f8545813bd939ce2775f4427b8c', '0f8bd13ae6f03ee0a0ab489c72faa113', '0', '津QL0966', '0', '', 'admin', null, null);
INSERT INTO `driver_info` VALUES ('DR20170123100010', '李金梁', '13821854123', '25d55ad283aa400af464c76d713c07ad', null, '0', 'CO120170120100004', '120224199507081314', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/idCardFrontImg/2017-01-23/58855bcd96f43.jpg', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/idCardBackImg/2017-01-23/58855bcd963c6.jpg', '2018-01-04 00:00:00', '', '', '', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/DLImg2/2017-01-23/58855bcd9541e.jpg', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/DLImg/2017-01-23/58855bcd94775.jpg', '2021-01-07 00:00:00', null, null, null, '', '', '', '0', '2019-01-03 00:00:00', '0000-00-00 00:00:00', '2017-01-23 09:31:25', '1', null, '1', '1', null, null, null, '61d0721eafd0b8126bb46847949c6f6d', '', '0', '津JNE769', '0', null, 'admin', null, null);
INSERT INTO `driver_info` VALUES ('DR20170125100012', '张弓', '13682105048', 'e10adc3949ba59abbe56e057f20f883e', 'Driver/header/2017-01-25/588824db66f53.jpg', '0', 'CO120170120100005', '120104199003175113', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/idCardFrontImg/2017-01-25/5888243651038.jpg', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/idCardBackImg/2017-01-25/588824364fd5b.jpg', '2018-01-31 00:00:00', '天津', 'C1', '1201041990031755563', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/DLImg2/2017-01-25/588824364efa0.jpg', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/DLImg/2017-01-25/588824364e657.jpg', '2018-01-31 00:00:00', null, null, null, '', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/professionImg/2017-01-25/5888243651f42.jpg', 'http://139.129.235.40/ztif.qxsxstudio.com//pic/Driver/professionImg2/2017-01-25/5888243652364.jpg', '0', '2018-01-31 00:00:00', '0000-00-00 00:00:00', '2017-01-25 12:07:53', '1', null, '1', '1', null, null, null, 'd60cf1bebd3a7182dd2993b6c70af1f9', '', '0', '津 T2017', '0', null, 'admin', null, null);
INSERT INTO `driver_info` VALUES ('DR20170127100013', '驾驶员', '13341058675', 'e10adc3949ba59abbe56e057f20f883e', null, '0', 'CO120170120100005', null, null, null, null, null, null, null, null, null, '0000-00-00 00:00:00', null, null, null, null, null, null, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, '0', '驾驶证过期导致账号冻结', '0', '0', null, null, null, '0c699662b524d742d7322fce53e381f8', '', '0', '津ADB025', '1', null, null, null, null);
INSERT INTO `driver_info` VALUES ('DR20170204100014', '王二小最新', '16888986677', '91dc677692dd596dd49cb67b820f6710', null, '1', 'CO120170120100005', '199929213123934000', null, null, '2017-11-28 00:00:00', '中南海', 'C1', '123321123', null, null, '2017-12-08 00:00:00', null, null, null, 'A123123', null, null, '2', '2017-12-08 00:00:00', '2017-12-08 00:00:00', '2017-02-04 11:23:36', '1', null, '1', '1', null, null, null, null, null, '0', '津 测1001', '1', '545437222', 'admin', '2017-02-04 11:23:36', null);

-- ----------------------------
-- Table structure for driver_online
-- ----------------------------
DROP TABLE IF EXISTS `driver_online`;
CREATE TABLE `driver_online` (
  `driverId` char(20) NOT NULL COMMENT '司机Id',
  `vehicleId` char(17) NOT NULL DEFAULT '' COMMENT '车辆Id',
  `onlineTime` datetime NOT NULL COMMENT '上线时间',
  `driverStatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '上线状态（0:下线；1：上线；2：已上车；3：在途;）',
  `driverAvailable` tinyint(1) DEFAULT '1' COMMENT '司机可用状态（1:正常；0：冻结）',
  `cooprationAvailable` tinyint(1) DEFAULT '1' COMMENT '企业可用状态（1：正常：0：冻结）',
  `vTotalCapacity` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '总容量',
  `vRemainCapacity` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '剩余容量',
  `vehicleModel` char(1) NOT NULL DEFAULT '' COMMENT '车型',
  `receiveAutoSend` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否接收自动派单(0:不接收;1:接收)',
  `longitude` double DEFAULT NULL COMMENT '经度',
  `latitude` double DEFAULT NULL COMMENT '纬度',
  `positionUpdateTime` datetime DEFAULT NULL COMMENT '经纬度更新时间',
  `offlineTime` datetime NOT NULL COMMENT '下线时间',
  PRIMARY KEY (`driverId`),
  UNIQUE KEY `driver_vehicle` (`driverId`,`vehicleId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of driver_online
-- ----------------------------
INSERT INTO `driver_online` VALUES ('DR120170123100008', 'VE120170122100006', '2017-01-23 09:45:52', '2', '1', '1', '0.0000', '0.0000', '', '1', null, null, null, '0000-00-00 00:00:00');
INSERT INTO `driver_online` VALUES ('DR120170204100010', '', '2017-02-04 11:37:22', '1', '1', '1', '0.0000', '0.0000', '', '1', null, null, null, '0000-00-00 00:00:00');
INSERT INTO `driver_online` VALUES ('DR120170204100011', '', '2017-02-04 11:41:48', '1', '1', '1', '0.0000', '0.0000', '', '1', null, null, null, '0000-00-00 00:00:00');
INSERT INTO `driver_online` VALUES ('DR20170120100001', '', '0000-00-00 00:00:00', '0', '1', '1', '2.8000', '2.8000', '', '0', '117.1580374987', '39.073872920162', '2017-01-22 14:33:57', '0000-00-00 00:00:00');
INSERT INTO `driver_online` VALUES ('DR20170120100002', '', '2017-02-09 16:35:01', '1', '1', '1', '2.8000', '2.8000', 'A', '1', '117.11767903646', '39.055844184028', '2017-02-09 22:00:05', '0000-00-00 00:00:00');
INSERT INTO `driver_online` VALUES ('DR20170120100004', '', '0000-00-00 00:00:00', '0', '1', '1', '0.0000', '0.0000', '', '1', null, null, null, '0000-00-00 00:00:00');
INSERT INTO `driver_online` VALUES ('DR20170120100005', '', '2017-01-20 17:06:34', '1', '1', '1', '2.8000', '2.8000', '', '0', '117.094972', '39.076919', '2017-01-20 19:19:30', '0000-00-00 00:00:00');
INSERT INTO `driver_online` VALUES ('DR20170120100006', '', '0000-00-00 00:00:00', '0', '1', '1', '0.0000', '0.0000', '', '1', null, null, null, '0000-00-00 00:00:00');
INSERT INTO `driver_online` VALUES ('DR20170120100007', '', '0000-00-00 00:00:00', '1', '1', '1', '0.0000', '0.0000', 'A', '1', '117.096809', '39.077394', '2017-02-08 10:48:03', '0000-00-00 00:00:00');
INSERT INTO `driver_online` VALUES ('DR20170122100009', '', '0000-00-00 00:00:00', '1', '1', '1', '1.0000', '1.0000', 'A', '1', '117.15604329427', '39.108591308594', '2017-01-25 14:35:58', '0000-00-00 00:00:00');
INSERT INTO `driver_online` VALUES ('DR20170123100010', '', '0000-00-00 00:00:00', '0', '1', '1', '0.0000', '0.0000', '', '1', null, null, null, '0000-00-00 00:00:00');
INSERT INTO `driver_online` VALUES ('DR20170125100012', '', '2017-01-25 12:08:40', '1', '1', '1', '2.8000', '2.8000', '', '0', '117.10571061831', '39.054284999183', '2017-01-25 14:08:08', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for driver_verify
-- ----------------------------
DROP TABLE IF EXISTS `driver_verify`;
CREATE TABLE `driver_verify` (
  `tel` char(15) NOT NULL COMMENT '电话',
  `verifyNum` char(6) NOT NULL COMMENT '验证码',
  `genTime` int(11) NOT NULL COMMENT '时间戳',
  PRIMARY KEY (`tel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of driver_verify
-- ----------------------------
INSERT INTO `driver_verify` VALUES ('13341058675', '481101', '1485483588');
INSERT INTO `driver_verify` VALUES ('13682105048', '311678', '1485317057');
INSERT INTO `driver_verify` VALUES ('13821854123', '834124', '1485134611');
INSERT INTO `driver_verify` VALUES ('15122615761', '361233', '1485050655');
INSERT INTO `driver_verify` VALUES ('15922237298', '508332', '1485050742');
INSERT INTO `driver_verify` VALUES ('18330219027', '021863', '1484877820');
INSERT INTO `driver_verify` VALUES ('18502621908', '169088', '1484900519');
INSERT INTO `driver_verify` VALUES ('18920729877', '495101', '1484880134');

-- ----------------------------
-- Table structure for withdraw(todo:move)
-- ----------------------------
DROP TABLE IF EXISTS `withdraw(todo:move)`;
CREATE TABLE `withdraw(todo:move)` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `driverId` bigint(20) NOT NULL COMMENT '司机ID',
  `money` float(7,2) NOT NULL COMMENT '提现金额',
  `createTime` datetime NOT NULL COMMENT '申请时间',
  `doneTime` datetime DEFAULT NULL COMMENT '完成时间',
  PRIMARY KEY (`id`),
  KEY `driverId` (`driverId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of withdraw(todo:move)
-- ----------------------------

-- ----------------------------
-- Procedure structure for pr_add
-- ----------------------------
DROP PROCEDURE IF EXISTS `pr_add`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `pr_add`(
   a INT,
   b INT)
BEGIN
   DECLARE c INT;
   IF a IS NULL THEN
      SET a = 0;
   END IF;
   IF b IS NULL THEN
      SET b = 0;
   END IF;
   SET c = a + b;
   SELECT c AS SUM;
    END
;;
DELIMITER ;
