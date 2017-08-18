/*
Navicat MySQL Data Transfer

Source Server         : 192.168.3.100_3306
Source Server Version : 50527
Source Host           : 192.168.3.100:3306
Source Database       : account

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2017-08-18 18:26:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account_arrival
-- ----------------------------
DROP TABLE IF EXISTS `account_arrival`;
CREATE TABLE `account_arrival` (
  `id` varchar(64) NOT NULL COMMENT '主键自增',
  `ordernum` varchar(64) DEFAULT NULL COMMENT '到货单号',
  `contract_id` varchar(64) NOT NULL COMMENT '合同ID',
  `material_id` varchar(64) NOT NULL COMMENT '采购物资ID',
  `arrival_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '到货时间',
  `tobe_num` int(64) NOT NULL COMMENT '应到数量',
  `arrival_num` int(64) NOT NULL COMMENT '实到数量',
  `arrivalstatus` varchar(64) DEFAULT NULL COMMENT '是否送检 0 未送检 1送检',
  `del_flag` char(1) NOT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_arrival
-- ----------------------------
INSERT INTO `account_arrival` VALUES ('2046ea24e16f4a42a27b35411ee67210', '30-20170812-10456', 'b276f81b15ab49a1ad5bf4e0e5b2203e', '163aca909c2648e1bfc9cf8e1cc1a745', '2017-08-31 00:00:00', '20', '20', '1', '0');

-- ----------------------------
-- Table structure for account_contract
-- ----------------------------
DROP TABLE IF EXISTS `account_contract`;
CREATE TABLE `account_contract` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `purchaseNum` varchar(255) NOT NULL COMMENT '采购单号',
  `supplierNum` varchar(64) DEFAULT NULL COMMENT '供应商编号',
  `contractNum` varchar(37) NOT NULL COMMENT '合同编号',
  `contractTitle` varchar(255) NOT NULL COMMENT '合同名称',
  `caigouname` varchar(64) DEFAULT NULL COMMENT '乙方',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `money` double(64,2) DEFAULT NULL COMMENT '应付金额',
  `company` varchar(64) DEFAULT NULL COMMENT '公司',
  `status` int(1) DEFAULT '0' COMMENT '合同状态(0:未完成  1:完成)',
  `remarks` varchar(255) NOT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_contract
-- ----------------------------
INSERT INTO `account_contract` VALUES ('b276f81b15ab49a1ad5bf4e0e5b2203e', '13-20170818-y7sv4', 'gy-20170810-1e2zy', '30-20170812-10425', '测试合同', '可口可乐（天津）', '2017-08-18 17:25:28', '89.00', null, '1', '', '0');

-- ----------------------------
-- Table structure for account_input
-- ----------------------------
DROP TABLE IF EXISTS `account_input`;
CREATE TABLE `account_input` (
  `id` varchar(64) NOT NULL,
  `inputNum` varchar(37) NOT NULL COMMENT '入库单号',
  `inspectionnum` varchar(37) NOT NULL COMMENT '送检单号',
  `inputdate` datetime DEFAULT NULL COMMENT '入库日期',
  `category` varchar(255) DEFAULT NULL COMMENT '入库类别',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_input
-- ----------------------------
INSERT INTO `account_input` VALUES ('51321cfd64dc4e35af1f3398ecb32c49', '30-20170818-67220', '42626faf509f4f9294a0b9c9822a9068', '2017-08-23 00:00:00', '无', '888', '0');

-- ----------------------------
-- Table structure for account_input_detail
-- ----------------------------
DROP TABLE IF EXISTS `account_input_detail`;
CREATE TABLE `account_input_detail` (
  `id` varchar(64) NOT NULL,
  `parent_Id` varchar(64) NOT NULL COMMENT '主表id',
  `materialName` varchar(35) DEFAULT NULL COMMENT '物资名称',
  `wareHouse` varchar(37) DEFAULT NULL COMMENT '仓库',
  `location` varchar(255) DEFAULT NULL COMMENT '货位编码',
  `size` varchar(35) DEFAULT NULL COMMENT '规格型号',
  `quantity` int(11) DEFAULT '0' COMMENT '入库数量',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_input_detail
-- ----------------------------
INSERT INTO `account_input_detail` VALUES ('6e18a78d9ad44dafa37166a4e89c8725', '30-20170818-67220', '阿三', null, '货位2', '撒旦', '20', '66', '0');

-- ----------------------------
-- Table structure for account_inquiry
-- ----------------------------
DROP TABLE IF EXISTS `account_inquiry`;
CREATE TABLE `account_inquiry` (
  `id` varchar(64) NOT NULL,
  `inquiryNum` varchar(64) NOT NULL COMMENT '询价单号',
  `orderNum` varchar(17) NOT NULL COMMENT '单据编号',
  `validDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '询价有效期限',
  `inquiry` varchar(255) DEFAULT NULL COMMENT '询价人',
  `requisition` varchar(255) DEFAULT NULL COMMENT '申请单号',
  `maker` varchar(35) NOT NULL COMMENT '制单人',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `del_flag` char(1) NOT NULL COMMENT '删除标记',
  `status` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_inquiry
-- ----------------------------
INSERT INTO `account_inquiry` VALUES ('ad47a098b09b4ac49eb6e977887b8281', 'xj-20170818-k8kd8', '13-20170818-y7sv4', '2017-08-18 15:26:43', '2', 'f481a393f4b34b668fd4d961a6420c21', 'zongjingli', '2', '2017-08-18 15:31:04', null, '0000-00-00 00:00:00', '0', '2', '电子产品');

-- ----------------------------
-- Table structure for account_inquiry_detail
-- ----------------------------
DROP TABLE IF EXISTS `account_inquiry_detail`;
CREATE TABLE `account_inquiry_detail` (
  `id` varchar(64) CHARACTER SET utf8 NOT NULL,
  `inquiryDetailNum` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '询价单号',
  `orderNum` varchar(17) CHARACTER SET utf8 NOT NULL COMMENT '单据编号',
  `validDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '询价有效期限',
  `supplier` varchar(35) CHARACTER SET utf8 NOT NULL COMMENT '供应商名称',
  `materialName` varchar(35) CHARACTER SET utf8 NOT NULL COMMENT '物资名称',
  `size` varchar(35) CHARACTER SET utf8 NOT NULL COMMENT '规格型号',
  `unit` varchar(35) CHARACTER SET utf8 NOT NULL COMMENT '计量单位',
  `unitPrice` decimal(10,2) NOT NULL COMMENT '单价(自动计算（保留两位）',
  `requisition` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '申请单号',
  `maker` varchar(35) CHARACTER SET utf8 NOT NULL COMMENT '制单人',
  `create_by` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建者',
  `create_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '更新者',
  `update_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 NOT NULL COMMENT '删除标记',
  `brand` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `suppliercode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `inquiry_time` timestamp NULL DEFAULT NULL,
  `materialcode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `state` int(2) DEFAULT NULL COMMENT '是否选中进行审批',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of account_inquiry_detail
-- ----------------------------
INSERT INTO `account_inquiry_detail` VALUES ('4ca728bdfa1645baac248945934d9230', 'ad47a098b09b4ac49eb6e977887b8281', '13-20170818-y7sv4', '2017-08-23 00:00:00', '天天五金', '笔记本显示器', '3*4', '17', '799.99', null, 'caigou', '2', '2017-08-18 15:29:01', null, null, '', '0', null, 'gy-20170810-9i6ne', null, '25-20170721-33256', '0');
INSERT INTO `account_inquiry_detail` VALUES ('5a08a789ac3f42dd94f145c2d71d54fa', 'ad47a098b09b4ac49eb6e977887b8281', '13-20170818-y7sv4', '2017-08-31 00:00:00', 'ABC企业', 'LenovoThinkPad', 'XP-12H23', '17', '987.99', null, 'caigou', '2', '2017-08-18 15:30:22', null, null, '', '0', null, 'gy-20170810-r05rs', null, '25-20170721-65050', '0');
INSERT INTO `account_inquiry_detail` VALUES ('71e9caeff32244dcbcc98bc7026b871d', 'ad47a098b09b4ac49eb6e977887b8281', '13-20170818-y7sv4', '2017-08-23 00:00:00', '阿里巴巴', 'LenovoThinkPad', 'XP-12H23', '17', '899.99', null, 'caigou', '2', '2017-08-18 15:30:22', null, null, '', '0', null, 'gy-20170707-639873', null, '25-20170721-65050', '1');
INSERT INTO `account_inquiry_detail` VALUES ('727d5049f36346aeb8ea802418480ba7', 'ad47a098b09b4ac49eb6e977887b8281', '13-20170818-y7sv4', '2017-08-24 00:00:00', 'SONY', '笔记本显示器', '3*4', '17', '1099.99', null, 'caigou', '2', '2017-08-18 15:30:22', null, null, '', '0', null, 'gy-20170810-1e2zy', null, '25-20170721-33256', '1');
INSERT INTO `account_inquiry_detail` VALUES ('99b9b7f2c2f540f3a4422d0e5a56cd57', 'ad47a098b09b4ac49eb6e977887b8281', '13-20170818-y7sv4', '2017-08-23 00:00:00', '小米', '笔记本显示器', '3*4', '17', '999.99', null, 'caigou', '2', '2017-08-18 15:29:01', null, null, '', '0', null, 'gy-20170707-929826', null, '25-20170721-33256', '0');

-- ----------------------------
-- Table structure for account_inspection
-- ----------------------------
DROP TABLE IF EXISTS `account_inspection`;
CREATE TABLE `account_inspection` (
  `id` varchar(64) NOT NULL,
  `orderNum` varchar(64) NOT NULL COMMENT '单据编号',
  `arrivalNum` varchar(64) NOT NULL COMMENT '到货单编号',
  `inspectionMan` varchar(64) DEFAULT NULL COMMENT '送检人',
  `checker` varchar(64) DEFAULT NULL COMMENT '检验人',
  `inspectionDate` date NOT NULL DEFAULT '0000-00-00' COMMENT '送检日期',
  `status` int(1) DEFAULT '0' COMMENT '检验状态 0:创建 1:不合格2:合格3:免检4:已入库',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_inspection
-- ----------------------------
INSERT INTO `account_inspection` VALUES ('42626faf509f4f9294a0b9c9822a9068', '30-20170818-16584', '2046ea24e16f4a42a27b35411ee67210', null, null, '2017-08-16', '1', '666', '0');
INSERT INTO `account_inspection` VALUES ('cd12f6980f924951a48dd641d82f9000', '30-20170818-09583', '2046ea24e16f4a42a27b35411ee67210', null, null, '2017-08-24', '1', '55', '0');

-- ----------------------------
-- Table structure for account_inspection_detail
-- ----------------------------
DROP TABLE IF EXISTS `account_inspection_detail`;
CREATE TABLE `account_inspection_detail` (
  `id` varchar(64) NOT NULL,
  `parent_Id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主表ID',
  `materialName` varchar(64) NOT NULL COMMENT '物资名称',
  `ingredient` varchar(64) DEFAULT NULL COMMENT '成分含量',
  `size` varchar(64) DEFAULT NULL COMMENT '规格型号',
  `inspectionMode` int(11) DEFAULT NULL COMMENT '检验方式',
  `granularity` decimal(10,0) unsigned DEFAULT NULL COMMENT '粒度',
  `appearance` varchar(64) DEFAULT NULL COMMENT '外观',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '检验状态 0:创建 1:不合格2:合格3:免检4:已入库',
  `remarks` varchar(64) DEFAULT NULL,
  `del_flag` char(1) NOT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_inspection_detail
-- ----------------------------
INSERT INTO `account_inspection_detail` VALUES ('71e081dfe43742c09c55a4044391b6bf', '42626faf509f4f9294a0b9c9822a9068', '阿三', '11', '撒旦', '15', '22', '55', '4', '66', '0');
INSERT INTO `account_inspection_detail` VALUES ('9289a62782ca498d90be392b7ccc3f0d', 'cd12f6980f924951a48dd641d82f9000', '阿三', '111', '撒旦', '14', '22', '33', '1', '44', '0');

-- ----------------------------
-- Table structure for account_location
-- ----------------------------
DROP TABLE IF EXISTS `account_location`;
CREATE TABLE `account_location` (
  `id` int(32) NOT NULL,
  `location` varchar(64) DEFAULT NULL COMMENT '货位',
  `warehouseId` varchar(64) DEFAULT NULL COMMENT '仓库Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_location
-- ----------------------------
INSERT INTO `account_location` VALUES ('1', '货位1', '389d98f8e2174ab09a55f338fe88923d');
INSERT INTO `account_location` VALUES ('2', '货位2', '389d98f8e2174ab09a55f338fe88923d');
INSERT INTO `account_location` VALUES ('4', '货位1', '47baa5cfeed94bf9abd43c7c04a8dd0c');
INSERT INTO `account_location` VALUES ('5', '货位2', '47baa5cfeed94bf9abd43c7c04a8dd0c');
INSERT INTO `account_location` VALUES ('6', '货位1', '7de722b240544460bd970b05e252ae28');
INSERT INTO `account_location` VALUES ('7', '货位2', '7de722b240544460bd970b05e252ae28');
INSERT INTO `account_location` VALUES ('8', '货位1', '547eead51e1f677824576');
INSERT INTO `account_location` VALUES ('9', '货位2', '547eead51e1f677824576');
INSERT INTO `account_location` VALUES ('10', '货位1', 'c182e830ed2043f5913217a8922836f1');
INSERT INTO `account_location` VALUES ('11', '货位1', 'c182e830ed2043f5913217a8922836f1');
INSERT INTO `account_location` VALUES ('12', '货位1', 'db1ea78c5f2941f68775f4296ebd73af');
INSERT INTO `account_location` VALUES ('13', '货位2', 'db1ea78c5f2941f68775f4296ebd73af');

-- ----------------------------
-- Table structure for account_material
-- ----------------------------
DROP TABLE IF EXISTS `account_material`;
CREATE TABLE `account_material` (
  `id` varchar(64) CHARACTER SET utf8 NOT NULL,
  `materialNum` varchar(37) COLLATE utf8_bin NOT NULL COMMENT '物资编码',
  `materialName` varchar(35) COLLATE utf8_bin NOT NULL COMMENT '物资名称',
  `size` varchar(35) CHARACTER SET utf8 NOT NULL COMMENT '规格型号',
  `ingredient` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '成分含量',
  `unit` varchar(35) COLLATE utf8_bin DEFAULT NULL COMMENT '计量单位',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `remarks` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 NOT NULL COMMENT '删除标记0:存在,1:删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of account_material
-- ----------------------------
INSERT INTO `account_material` VALUES ('163aca909c2648e1bfc9cf8e1cc1a745', '25-20170811-k4cgi', '阿三', '撒旦', '成分', '是', '2017-08-01 10:52:18', '撒啊', '0');
INSERT INTO `account_material` VALUES ('16b50e1787e5427d933ffe7a0817122f', '25-20170809-o9ep5', '巧克力', '007', '成分', '袋', '2017-08-16 10:52:18', '213', '0');
INSERT INTO `account_material` VALUES ('2e1929de1b7b4be680cf934fa5349f8q', '25-20170721-54392', '鼠标垫111', '2*3', '成分', '个', '2017-08-08 10:52:18', '鼠标垫', '0');
INSERT INTO `account_material` VALUES ('2ff2051757624710afd2727b1552f721', '25-20170724-u59oo', '测试1', '2434', '成分', '测', '2017-08-17 16:41:06', '214', '0');
INSERT INTO `account_material` VALUES ('343f00348f3e415588ae2bc0564dc07d', '25-20170721-19048', '烤鸭', '20*25', '成分', '只', '2017-08-03 10:52:18', '北京烤鸭', '0');
INSERT INTO `account_material` VALUES ('4dcc8520f0f44f8681777dbd5d90d070', '25-20170809-hmupt', '牛奶', '007', '成分', '瓶', '2017-08-04 10:52:18', '444', '0');
INSERT INTO `account_material` VALUES ('523a3a333e4445d78d286c6ea50ad216', '25-20170721-39445', '芬达', '1', '成分', '瓶', '2017-08-08 10:52:18', '饮料', '0');
INSERT INTO `account_material` VALUES ('59bc252535fa4b89af7ac508a568bade', '25-20170721-28312', '可乐', '450ml', '成分', '瓶', '2017-08-13 10:52:18', '饮料', '0');
INSERT INTO `account_material` VALUES ('7562837c418f4a78a091ccc727845c40', '25-20170721-41231', '吾皇万睡抱枕', '50*50', '成分', '个', '2017-08-15 10:52:18', '吾皇万睡周边', '0');
INSERT INTO `account_material` VALUES ('797d48c0a3b8415f94b9e2b404289a8a', '25-20170721-59156', '胶水', '3*4', '成分', '瓶', '2017-08-28 10:52:18', '胶水', '0');
INSERT INTO `account_material` VALUES ('85e491892a944db3878941438a950ecb', '25-20170812-sbb2y', 'Ni60AA', '153', '成分', 'KG', '2017-08-23 10:52:18', '', '0');
INSERT INTO `account_material` VALUES ('9d4c182a1a71468887e9fa0003d60d47', '25-20170721-65050', 'LenovoThinkPad', 'XP-12H23', '成分', '台', '2017-08-25 10:52:18', '笔记本', '0');
INSERT INTO `account_material` VALUES ('d216f6dfab7846c390f2eb2daabb638g', '25-20170721-33256', '笔记本显示器', '3*4', '成分', '台', '2017-08-26 19:47:28', '笔记本显示器1111111', '0');

-- ----------------------------
-- Table structure for account_para
-- ----------------------------
DROP TABLE IF EXISTS `account_para`;
CREATE TABLE `account_para` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '参数名称',
  `del_flag` char(1) NOT NULL COMMENT '删除标记0:删除1:存在',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_para
-- ----------------------------
INSERT INTO `account_para` VALUES ('3', '计量单位', '0');
INSERT INTO `account_para` VALUES ('4', '包装方式', '0');
INSERT INTO `account_para` VALUES ('5', '付款方式', '0');
INSERT INTO `account_para` VALUES ('6', '运输方式', '0');
INSERT INTO `account_para` VALUES ('7', '检验方式', '0');
INSERT INTO `account_para` VALUES ('8', '供货种类', '0');
INSERT INTO `account_para` VALUES ('9', '付款银行', '0');
INSERT INTO `account_para` VALUES ('10', '发票类别', '0');

-- ----------------------------
-- Table structure for account_para_info
-- ----------------------------
DROP TABLE IF EXISTS `account_para_info`;
CREATE TABLE `account_para_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) NOT NULL COMMENT '参数名id（父id）',
  `name` varchar(50) DEFAULT NULL COMMENT '参数项名称',
  `del_flag` char(1) NOT NULL COMMENT '删除标记0:删除1:存在',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_para_info
-- ----------------------------
INSERT INTO `account_para_info` VALUES ('1', '3', '公斤', '0');
INSERT INTO `account_para_info` VALUES ('6', '4', '密封', '0');
INSERT INTO `account_para_info` VALUES ('7', '4', '半密封', '0');
INSERT INTO `account_para_info` VALUES ('8', '5', '支付宝', '0');
INSERT INTO `account_para_info` VALUES ('9', '5', '银行', '0');
INSERT INTO `account_para_info` VALUES ('11', '5', '现金', '0');
INSERT INTO `account_para_info` VALUES ('12', '6', '货运', '0');
INSERT INTO `account_para_info` VALUES ('13', '6', '空运', '0');
INSERT INTO `account_para_info` VALUES ('14', '7', '高温检验', '0');
INSERT INTO `account_para_info` VALUES ('15', '7', '硬度检验', '0');
INSERT INTO `account_para_info` VALUES ('16', '7', '低温检验', '0');
INSERT INTO `account_para_info` VALUES ('17', '3', '件', '0');
INSERT INTO `account_para_info` VALUES ('18', '3', '箱', '0');
INSERT INTO `account_para_info` VALUES ('19', '3', '瓶', '0');
INSERT INTO `account_para_info` VALUES ('20', '8', '食品饮料', '0');
INSERT INTO `account_para_info` VALUES ('21', '8', '日用品', '0');
INSERT INTO `account_para_info` VALUES ('22', '8', '五金', '0');
INSERT INTO `account_para_info` VALUES ('23', '8', '电子产品', '0');
INSERT INTO `account_para_info` VALUES ('24', '3', '听', '0');
INSERT INTO `account_para_info` VALUES ('26', '3', '吨', '0');
INSERT INTO `account_para_info` VALUES ('41', '5', '电汇', '0');
INSERT INTO `account_para_info` VALUES ('42', '5', '银承', '0');
INSERT INTO `account_para_info` VALUES ('43', '5', '商承', '0');
INSERT INTO `account_para_info` VALUES ('44', '5', '网银', '0');
INSERT INTO `account_para_info` VALUES ('45', '9', '工商银行', '0');
INSERT INTO `account_para_info` VALUES ('46', '9', '农业银行', '0');
INSERT INTO `account_para_info` VALUES ('47', '10', '普票', '0');
INSERT INTO `account_para_info` VALUES ('48', '10', '专票', '0');

-- ----------------------------
-- Table structure for account_payment
-- ----------------------------
DROP TABLE IF EXISTS `account_payment`;
CREATE TABLE `account_payment` (
  `id` varchar(64) NOT NULL,
  `orderNum` varchar(64) DEFAULT NULL COMMENT '单据编号',
  `supplier` varchar(64) DEFAULT NULL COMMENT '供应商名称',
  `payAmount` double(64,2) DEFAULT NULL COMMENT '付款金额',
  `payWay` varchar(64) DEFAULT NULL COMMENT '付款方式(电汇/银承/商承/现金/网银)',
  `payBank` varchar(35) DEFAULT NULL COMMENT '付款银行',
  `payBankNum` varchar(35) DEFAULT NULL COMMENT '付款银行账号',
  `payCategory` varchar(64) DEFAULT NULL COMMENT '付款类别',
  `contractNum` varchar(255) DEFAULT NULL COMMENT '合同编号',
  `create_date` datetime DEFAULT NULL COMMENT '制单日期',
  `payDate` varchar(255) DEFAULT '0000-00-00 00:00:00' COMMENT '付款日期',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_payment
-- ----------------------------
INSERT INTO `account_payment` VALUES ('dac27e63c61147e39e13dcfd1ae703f9', '30-20170818-61414', '999', '888.00', '现金', '农业银行', '777', '666', '30-20170812-10425', '2017-08-01 00:00:00', '4444', '333', '1');
INSERT INTO `account_payment` VALUES ('fef775a0176442d9b7208c92f510ab2f', '30-20170818-61414', '999', '888.00', '现金', '农业银行', '77', '66', '30-20170812-10425', '2017-08-01 00:00:00', '22', '111', '0');

-- ----------------------------
-- Table structure for account_purchase
-- ----------------------------
DROP TABLE IF EXISTS `account_purchase`;
CREATE TABLE `account_purchase` (
  `id` varchar(64) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `orderNum` varchar(17) NOT NULL COMMENT '单据编号',
  `inquiryNum` varchar(37) NOT NULL COMMENT '询价单号',
  `maker` varchar(35) NOT NULL COMMENT '制单人',
  `checker` varchar(35) DEFAULT NULL COMMENT '审核人',
  `proc_ins_id` varchar(64) DEFAULT NULL COMMENT '流程节点状态',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `del_flag` char(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_purchase
-- ----------------------------
INSERT INTO `account_purchase` VALUES ('08bffe6bce0b42fa8ff66a3207da0f15', '电子产品订货单', '06-20170818-jzruh', '13-20170818-y7sv4', '4', null, 'end', '2', '2017-08-18 18:19:39', '2', '2017-08-18 18:18:34', '0');

-- ----------------------------
-- Table structure for account_purchase_detail
-- ----------------------------
DROP TABLE IF EXISTS `account_purchase_detail`;
CREATE TABLE `account_purchase_detail` (
  `id` varchar(64) CHARACTER SET utf8 NOT NULL,
  `parent_Id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '主表id',
  `supplierCode` varchar(35) CHARACTER SET utf8 NOT NULL COMMENT '供应商编号',
  `materialCode` varchar(35) CHARACTER SET utf8 NOT NULL COMMENT '物资编号',
  `packWay` int(3) DEFAULT NULL COMMENT '包装方式',
  `transport` int(3) DEFAULT NULL COMMENT '运输方式',
  `freightFee` decimal(10,2) DEFAULT NULL COMMENT '运费金额',
  `unitPrice` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `quantity` int(11) NOT NULL COMMENT '数量',
  `receivedate` datetime DEFAULT NULL COMMENT '预计到货日期',
  `totlemoney` decimal(10,2) DEFAULT NULL COMMENT '总价',
  `create_by` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建者',
  `create_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '更新者',
  `update_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of account_purchase_detail
-- ----------------------------
INSERT INTO `account_purchase_detail` VALUES ('2b1d860731824a0684717277f6432880', '08bffe6bce0b42fa8ff66a3207da0f15', 'gy-20170707-639873', '25-20170721-65050', '6', '12', '89.00', '899.99', '8', '2017-08-22 16:00:00', '7288.92', '2', '2017-08-18 18:18:43', null, null, '备注', '0');
INSERT INTO `account_purchase_detail` VALUES ('f32a19f6e0284423845f2fb5986d3c7b', '08bffe6bce0b42fa8ff66a3207da0f15', 'gy-20170810-1e2zy', '25-20170721-33256', '7', '13', '96.00', '1099.99', '9', '2017-08-23 16:00:00', '9995.91', '2', '2017-08-18 18:18:43', null, null, '', '0');

-- ----------------------------
-- Table structure for account_purchase_supplier
-- ----------------------------
DROP TABLE IF EXISTS `account_purchase_supplier`;
CREATE TABLE `account_purchase_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_Id` varchar(64) DEFAULT NULL,
  `supplier` varchar(255) DEFAULT NULL COMMENT '供应商名称',
  `deadline` datetime DEFAULT NULL COMMENT '付款期限',
  `payway` int(11) DEFAULT NULL COMMENT ' 付款方式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_purchase_supplier
-- ----------------------------
INSERT INTO `account_purchase_supplier` VALUES ('18', '08bffe6bce0b42fa8ff66a3207da0f15', '阿里巴巴', '2017-08-22 16:00:00', '8');
INSERT INTO `account_purchase_supplier` VALUES ('19', '08bffe6bce0b42fa8ff66a3207da0f15', 'SONY', '2017-08-23 16:00:00', '9');

-- ----------------------------
-- Table structure for account_receipt
-- ----------------------------
DROP TABLE IF EXISTS `account_receipt`;
CREATE TABLE `account_receipt` (
  `id` varchar(64) NOT NULL,
  `supplier` varchar(64) NOT NULL COMMENT '供应商名称',
  `billingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '开票日期',
  `materialName` varchar(64) NOT NULL COMMENT '物资名称',
  `size` varchar(64) NOT NULL COMMENT '规格型号',
  `priceFee` decimal(10,2) NOT NULL COMMENT '含税单价	自动生成（保留两位）',
  `priceNotFee` decimal(10,2) NOT NULL COMMENT '不含税单价 自动生成（保留两位）',
  `quantity` int(64) NOT NULL COMMENT '数量',
  `moneyFee` decimal(10,2) NOT NULL COMMENT '含税金额',
  `moneyNotFee` decimal(10,2) NOT NULL COMMENT '不含税金额',
  `taxRte` decimal(10,2) NOT NULL COMMENT '税率',
  `tax` decimal(10,2) NOT NULL COMMENT '税款',
  `receiptNum` varchar(64) NOT NULL COMMENT '发票号码',
  `category` varchar(64) NOT NULL COMMENT '发票类别',
  `orderNum` varchar(64) NOT NULL COMMENT '单据编号(17位编码区分普票和专票)',
  `arrivalNum` varchar(64) NOT NULL COMMENT '到货单号',
  `maker` varchar(64) NOT NULL COMMENT '制单人',
  `auditor` varchar(64) NOT NULL COMMENT '审核人',
  `remarks` varchar(255) NOT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_receipt
-- ----------------------------
INSERT INTO `account_receipt` VALUES ('06b9fc83a8004b899a02b3d8bf6ce1d4', '华天地产', '2017-08-18 17:56:38', '鼠标垫111', '1110', '222.00', '33.00', '53', '11766.00', '1749.00', '60.00', '10017.00', '0070', '专票', '30-20170818-41927', '30-20170812-10456', '8880', '999', '00000', '0');

-- ----------------------------
-- Table structure for account_reject
-- ----------------------------
DROP TABLE IF EXISTS `account_reject`;
CREATE TABLE `account_reject` (
  `id` varchar(64) NOT NULL,
  `orderNum` varchar(17) NOT NULL COMMENT '单据编号',
  `wareHouse` varchar(35) NOT NULL COMMENT '仓库',
  `materialName` varchar(35) NOT NULL COMMENT '物资名称',
  `size` varchar(35) NOT NULL COMMENT '规格型号',
  `ingredient` varchar(35) NOT NULL COMMENT '成分含量',
  `quantity` int(11) NOT NULL COMMENT '退货数量',
  `locationCode` varchar(17) NOT NULL COMMENT '货位编码',
  `batch` varchar(255) NOT NULL COMMENT '批次',
  `supplier` varchar(35) NOT NULL COMMENT '供应商名称',
  `purchaseNum` varchar(37) NOT NULL COMMENT '采购订货编号',
  `arrivalNum` varchar(37) NOT NULL COMMENT '到货单号',
  `maker` varchar(35) NOT NULL COMMENT '制单人',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_reject
-- ----------------------------
INSERT INTO `account_reject` VALUES ('25bed4a1edcf4498b442592b9501a437', '22-20170707-08427', '保定仓库', '烤鸭', '2', '2', '2', '2', '2', '万科房产', '20-20170707-ffprs', '21-20170707-62860', '系统管理员', '1', '2017-07-18 16:25:52', '1', '2017-07-18 16:25:46', 'test', '0');
INSERT INTO `account_reject` VALUES ('33aa43f3d89b4c55926db9176259bc07', '22-20170707-33974', '昊天宜家', '可乐', '3*4', '无', '12', '1', '1', '阿里巴巴', '20-20170707-62fxt', '21-20170707-85898', '系统管理员', '1', '2017-07-07 23:41:37', '1', '2017-07-07 23:44:54', '1', '0');
INSERT INTO `account_reject` VALUES ('34f9cb7e9776443fac66d74fcf370cb9', '01-20170721-00996', '昊天宜家', '99', '99', '9', '99', '99', '99', '阿里巴巴', '20-20170707-ffprs', '21-20170707-68784', '系统管理员', '1', '2017-07-21 10:39:17', '1', '2017-07-21 10:39:17', '99', '0');
INSERT INTO `account_reject` VALUES ('3d495765db2c4cb980cc77ecb1d9a14b', '01-20170721-12185', '昊天宜家', 'LenovoThinkPad', '111', '111', '33', '33', '33', '阿里巴巴', '20-20170707-ffprs', '21-20170707-68784', '系统管理员', '1', '2017-07-21 10:39:15', '1', '2017-07-21 10:39:15', '33', '0');
INSERT INTO `account_reject` VALUES ('75c0afaa65524ce5b97dbd53a5d8708c', '01-20170718-50545', '石家庄仓库', '可乐', '3*4', '无', '333', '33', '33', '小米', '20-20170707-62fxt', '21-20170707-85898', '系统管理员', '1', '2017-07-18 17:07:13', '1', '2017-07-18 17:06:13', '333', '1');
INSERT INTO `account_reject` VALUES ('e719d646cd5f4960acbc458af34d5c95', '01-20170718-64357', '石家庄仓库', '7', '8', '9', '10', '11', '12', '小米', '20-20170707-62fxt', '21-20170707-85898', '系统管理员', '1', '2017-07-18 17:07:10', '1', '2017-07-18 17:06:56', '13', '1');

-- ----------------------------
-- Table structure for account_reject_detail
-- ----------------------------
DROP TABLE IF EXISTS `account_reject_detail`;
CREATE TABLE `account_reject_detail` (
  `id` varchar(64) NOT NULL,
  `orderNum` varchar(17) NOT NULL COMMENT '单据编号',
  `parent_Id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `wareHouse` varchar(35) NOT NULL COMMENT '仓库',
  `materialName` varchar(35) NOT NULL COMMENT '物资名称',
  `size` varchar(35) NOT NULL COMMENT '规格型号',
  `ingredient` varchar(35) NOT NULL COMMENT '成分含量',
  `quantity` int(11) NOT NULL COMMENT '退货数量',
  `locationCode` varchar(17) NOT NULL COMMENT '货位编码',
  `batch` varchar(255) NOT NULL COMMENT '批次',
  `supplier` varchar(35) NOT NULL COMMENT '供应商名称',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_reject_detail
-- ----------------------------

-- ----------------------------
-- Table structure for account_requisition
-- ----------------------------
DROP TABLE IF EXISTS `account_requisition`;
CREATE TABLE `account_requisition` (
  `id` varchar(64) NOT NULL,
  `orderNum` varchar(17) NOT NULL COMMENT '单据编号',
  `title` varchar(60) DEFAULT NULL COMMENT '标题',
  `receiveDate` date NOT NULL DEFAULT '0000-00-00' COMMENT '期望到货日期',
  `reason` varchar(255) DEFAULT NULL COMMENT '申请原因',
  `OFFICE_ID` varchar(64) DEFAULT NULL COMMENT '申请部门',
  `proc_ins_id` varchar(64) DEFAULT NULL COMMENT '流程节点状态',
  `checker` varchar(35) DEFAULT NULL COMMENT '审核人',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `del_flag` char(1) NOT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `orderNum` (`orderNum`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_requisition
-- ----------------------------
INSERT INTO `account_requisition` VALUES ('f481a393f4b34b668fd4d961a6420c21', '04-20170818-uvrfu', '电子产品', '2017-08-22', '测试', '测试', 'end', '2', '2', '2017-08-18 15:26:47', '4', '2017-08-18 15:26:43', '0');
INSERT INTO `account_requisition` VALUES ('f836451393bd40dba092f8a2905f4e0d', '04-20170818-jnju1', '牛奶', '2017-08-30', '测试', '测试', 'examine', '', '2', '2017-08-18 18:25:55', '3', '2017-08-18 18:25:50', '0');

-- ----------------------------
-- Table structure for account_requisition_act
-- ----------------------------
DROP TABLE IF EXISTS `account_requisition_act`;
CREATE TABLE `account_requisition_act` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `requisition_id` varchar(64) DEFAULT NULL COMMENT '申请单id',
  `requisition_name` varchar(64) DEFAULT NULL COMMENT '申请人',
  `checker_name` varchar(64) DEFAULT NULL COMMENT '办理人',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `state` int(2) DEFAULT '0' COMMENT '状态0未处理，1已处理',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `conclusion` int(11) DEFAULT NULL COMMENT '0不同意，1同意',
  `remarks` varchar(255) DEFAULT NULL COMMENT '结论说明（备注）',
  `step` int(11) DEFAULT NULL COMMENT '步骤',
  `actindex` int(11) DEFAULT NULL COMMENT '流程标识（第几个流程）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_requisition_act
-- ----------------------------
INSERT INTO `account_requisition_act` VALUES ('153', 'f481a393f4b34b668fd4d961a6420c21', '2', '2', '2017-08-18 15:24:43', '1', '2017-08-18 15:24:43', '1', '提交申请', '0', '0');
INSERT INTO `account_requisition_act` VALUES ('154', 'f481a393f4b34b668fd4d961a6420c21', '2', '2', '2017-08-18 15:24:43', '1', '2017-08-18 15:25:03', '1', '重申', '1', '0');
INSERT INTO `account_requisition_act` VALUES ('155', 'f481a393f4b34b668fd4d961a6420c21', '2', '2', '2017-08-18 15:25:03', '1', '2017-08-18 15:25:03', '1', '提交申请', '0', '0');
INSERT INTO `account_requisition_act` VALUES ('156', 'f481a393f4b34b668fd4d961a6420c21', '2', '3', '2017-08-18 15:25:03', '1', '2017-08-18 15:25:35', '0', '驳回修改', '1', '0');
INSERT INTO `account_requisition_act` VALUES ('157', 'f481a393f4b34b668fd4d961a6420c21', '3', '2', '2017-08-18 15:25:35', '1', '2017-08-18 15:25:56', '1', '重申', '0', '0');
INSERT INTO `account_requisition_act` VALUES ('158', 'f481a393f4b34b668fd4d961a6420c21', '2', '2', '2017-08-18 15:25:56', '1', '2017-08-18 15:25:56', '1', '提交申请', '0', '0');
INSERT INTO `account_requisition_act` VALUES ('159', 'f481a393f4b34b668fd4d961a6420c21', '2', '3', '2017-08-18 15:25:56', '1', '2017-08-18 15:26:18', '1', '通过', '1', '0');
INSERT INTO `account_requisition_act` VALUES ('160', 'f481a393f4b34b668fd4d961a6420c21', '3', '4', '2017-08-18 15:26:18', '1', '2017-08-18 15:26:43', '1', '完成', '2', '0');
INSERT INTO `account_requisition_act` VALUES ('161', 'ad47a098b09b4ac49eb6e977887b8281', '4', '2', '2017-08-18 15:26:43', '1', '2017-08-18 15:28:11', '1', '提交询价申请', '0', '1');
INSERT INTO `account_requisition_act` VALUES ('162', 'ad47a098b09b4ac49eb6e977887b8281', '2', '2', '2017-08-18 15:28:11', '1', '2017-08-18 15:28:56', '1', '提交询价申请', '1', '1');
INSERT INTO `account_requisition_act` VALUES ('163', 'ad47a098b09b4ac49eb6e977887b8281', '2', '3', '2017-08-18 15:28:56', '1', '2017-08-18 15:29:35', '0', '', '1', '1');
INSERT INTO `account_requisition_act` VALUES ('164', 'ad47a098b09b4ac49eb6e977887b8281', '3', '2', '2017-08-18 15:29:35', '1', '2017-08-18 15:30:18', '1', '提交询价申请', '0', '1');
INSERT INTO `account_requisition_act` VALUES ('165', 'ad47a098b09b4ac49eb6e977887b8281', '2', '3', '2017-08-18 15:30:18', '1', '2017-08-18 15:30:39', '1', '通过', '1', '1');
INSERT INTO `account_requisition_act` VALUES ('166', 'ad47a098b09b4ac49eb6e977887b8281', '3', '4', '2017-08-18 15:30:39', '1', '2017-08-18 15:30:59', '1', '', '2', '1');
INSERT INTO `account_requisition_act` VALUES ('167', '08bffe6bce0b42fa8ff66a3207da0f15', '4', '2', '2017-08-18 15:30:59', '1', '2017-08-18 17:20:13', '1', '提交申请', '0', '2');
INSERT INTO `account_requisition_act` VALUES ('168', '08bffe6bce0b42fa8ff66a3207da0f15', '2', '2', '2017-08-18 17:20:13', '1', '2017-08-18 17:20:13', '1', '提交申请', '0', '2');
INSERT INTO `account_requisition_act` VALUES ('169', '08bffe6bce0b42fa8ff66a3207da0f15', '2', '2', '2017-08-18 17:20:13', '1', '2017-08-18 17:40:20', '1', '提交申请', '1', '2');
INSERT INTO `account_requisition_act` VALUES ('170', '08bffe6bce0b42fa8ff66a3207da0f15', '2', '2', '2017-08-18 17:40:20', '1', '2017-08-18 17:40:20', '1', '提交申请', '0', '2');
INSERT INTO `account_requisition_act` VALUES ('171', '08bffe6bce0b42fa8ff66a3207da0f15', '2', '2', '2017-08-18 17:40:20', '1', '2017-08-18 17:47:11', '1', '提交申请', '1', '2');
INSERT INTO `account_requisition_act` VALUES ('172', '08bffe6bce0b42fa8ff66a3207da0f15', '2', '2', '2017-08-18 17:47:11', '1', '2017-08-18 17:47:11', '1', '提交申请', '0', '2');
INSERT INTO `account_requisition_act` VALUES ('173', '08bffe6bce0b42fa8ff66a3207da0f15', '2', '2', '2017-08-18 17:47:11', '1', '2017-08-18 18:12:37', '1', '提交申请', '1', '2');
INSERT INTO `account_requisition_act` VALUES ('174', '08bffe6bce0b42fa8ff66a3207da0f15', '2', '2', '2017-08-18 18:14:25', '1', '2017-08-18 18:14:37', '1', '提交申请', '0', '2');
INSERT INTO `account_requisition_act` VALUES ('175', '08bffe6bce0b42fa8ff66a3207da0f15', '2', '2', '2017-08-18 18:14:42', '1', '2017-08-18 18:18:34', '1', '提交申请', '1', '2');
INSERT INTO `account_requisition_act` VALUES ('176', '08bffe6bce0b42fa8ff66a3207da0f15', '2', '2', '2017-08-18 18:18:43', '1', '2017-08-18 18:18:43', '1', '提交申请', '0', '2');
INSERT INTO `account_requisition_act` VALUES ('177', '08bffe6bce0b42fa8ff66a3207da0f15', '2', '1', '2017-08-18 18:18:43', '0', null, null, null, '1', '2');
INSERT INTO `account_requisition_act` VALUES ('178', 'f836451393bd40dba092f8a2905f4e0d', '2', '2', '2017-08-18 18:25:28', '1', '2017-08-18 18:25:28', '1', '提交申请', '0', '0');
INSERT INTO `account_requisition_act` VALUES ('179', 'f836451393bd40dba092f8a2905f4e0d', '2', '3', '2017-08-18 18:25:28', '1', '2017-08-18 18:25:50', '1', '', '1', '0');
INSERT INTO `account_requisition_act` VALUES ('180', 'f836451393bd40dba092f8a2905f4e0d', '3', '4', '2017-08-18 18:25:50', '0', null, null, null, '2', '0');

-- ----------------------------
-- Table structure for account_requisition_detail
-- ----------------------------
DROP TABLE IF EXISTS `account_requisition_detail`;
CREATE TABLE `account_requisition_detail` (
  `id` varchar(64) CHARACTER SET utf8 NOT NULL,
  `parent_Id` varchar(64) COLLATE utf8_bin NOT NULL,
  `materialCode` varchar(35) CHARACTER SET utf8 NOT NULL COMMENT '物资编码',
  `quantitiy` int(11) NOT NULL COMMENT '申请数量',
  `units` int(11) DEFAULT NULL COMMENT '计量单位',
  `remarks` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 NOT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of account_requisition_detail
-- ----------------------------
INSERT INTO `account_requisition_detail` VALUES ('89518ae5176b43eea5800750defba4ee', 'f481a393f4b34b668fd4d961a6420c21', '25-20170721-65050', '8', '17', '', '0');
INSERT INTO `account_requisition_detail` VALUES ('9c29714152e341b4bc352cbc6cc00efb', 'f481a393f4b34b668fd4d961a6420c21', '25-20170721-33256', '8', '17', '', '0');
INSERT INTO `account_requisition_detail` VALUES ('ae07298d54644a8eb6440ca4d27ba599', 'f481a393f4b34b668fd4d961a6420c21', '25-20170721-65050', '7', '17', '', '1');
INSERT INTO `account_requisition_detail` VALUES ('b43d6813df0e4a0195e082d6098ef6e2', 'f481a393f4b34b668fd4d961a6420c21', '25-20170721-33256', '7', '17', '', '1');
INSERT INTO `account_requisition_detail` VALUES ('dd6334ee935c4a66993964dbfe9239fb', 'f836451393bd40dba092f8a2905f4e0d', '25-20170809-hmupt', '8', '18', '', '0');
INSERT INTO `account_requisition_detail` VALUES ('e0aba939b4b340a68539f8af9eebd084', 'f481a393f4b34b668fd4d961a6420c21', '25-20170721-33256', '7', '17', '', '1');
INSERT INTO `account_requisition_detail` VALUES ('e4a22dd89a8e4592bea94782334a0b07', 'f481a393f4b34b668fd4d961a6420c21', '25-20170721-65050', '6', '17', '', '1');

-- ----------------------------
-- Table structure for account_supplier
-- ----------------------------
DROP TABLE IF EXISTS `account_supplier`;
CREATE TABLE `account_supplier` (
  `id` varchar(64) NOT NULL,
  `supplierNum` varchar(37) NOT NULL COMMENT '供应商编号',
  `supplier` varchar(35) NOT NULL COMMENT '供应商名称',
  `address` varchar(120) DEFAULT NULL COMMENT '地址',
  `category` varchar(11) DEFAULT NULL COMMENT '分类',
  `link_man` varchar(35) DEFAULT NULL COMMENT '联系人',
  `phone` varchar(35) DEFAULT NULL COMMENT '电话',
  `weixin` varchar(35) DEFAULT NULL COMMENT '微信',
  `qq` varchar(35) DEFAULT NULL COMMENT 'QQ号码',
  `license` varchar(255) DEFAULT NULL COMMENT '营业执照',
  `certificate` varchar(255) DEFAULT NULL COMMENT '资质证书',
  `credit` decimal(10,2) DEFAULT NULL COMMENT '信用额度',
  `deadLine` int(255) DEFAULT NULL COMMENT '付款期限',
  `information` varchar(255) DEFAULT NULL COMMENT '开票信息',
  `bank` varchar(35) DEFAULT NULL COMMENT '开户银行',
  `supply_category` varchar(255) DEFAULT NULL COMMENT '主要供货种类',
  `bank_num` varchar(35) DEFAULT NULL COMMENT '银行账号',
  `maker` varchar(35) DEFAULT NULL COMMENT '制单人',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL COMMENT '删除标记0:删除1:存在',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_supplier
-- ----------------------------
INSERT INTO `account_supplier` VALUES ('6ea62ff2db954148a8f8021549788d41', 'gy-20170707-546220', '装修公司1', '北京市', '0', '啧啧啧', '412421124', '211241234', '234234234', '/jeesite/userfiles/1/images/license/2017/07/Capture001(2).png', '/jeesite/userfiles/1/images/certificate/2017/07/Capture001(2).png', '1111111.00', '54', '111', '中国银行', '家庭装饰', '434234234234234', '系统管理员', '2017-08-17 16:43:41', 'testtesttest', '0');
INSERT INTO `account_supplier` VALUES ('75a740bf45824a179b35fc1028989753', 'gy-20170810-9i6ne', '天天五金', '天津', '', '天天', '432423432', '312312314', '421124124', '|/jeesite/userfiles/1/files/erp/accountSupplier/2017/08/ninxian.png', '', '100011.00', '50', '342', 'back', '五金', '3545435435435', 'e23645693b364b5db3cbb28c60dc0b0a', '2017-08-16 16:38:24', '特请问', '0');
INSERT INTO `account_supplier` VALUES ('97d891c715f74be58a0a82f51d4497f5', 'gy-20170707-639873', '阿里巴巴', '杭州', '8', '111', '111', '111', '111', '/jeesite/userfiles/1/images/license/2017/07/Capture001(2).png', '/jeesite/userfiles/1/images/certificate/2017/07/Capture001(2).png', '111.00', '32', '111', '2', '日用品', '111', '系统管理员', '2017-08-03 16:38:24', '111', '0');
INSERT INTO `account_supplier` VALUES ('9b8509bde16a476f870835b0890ae7a1', 'gy-20170707-284749', '华天地产', '天津市', '8', '华龙经', '143432432', '123', '213', '/jeesite/userfiles/1/images/license/2017/07/05.jpg', '/jeesite/userfiles/1/images/license/2017/07/05.jpg', '9999999.00', '21', '234214', '3', '五金', '2342434', '系统管理员', '2017-08-29 16:38:24', '243', '0');
INSERT INTO `account_supplier` VALUES ('a84ab3bc66684eb09101e753eac74c17', 'gy-20170707-237347', '可口可乐（天津）', '天津市区', '1', '测试', '12432423', '123213', '14324', '1234324', '124331', '124324.00', '16', '2142', '324325', '电子产品', '4254356', 'admin', '2017-08-16 16:38:24', '备注', '0');
INSERT INTO `account_supplier` VALUES ('bb2288ce3061465cb6e75151fb134911', 'gy-20170707-929826', '小米', '北京市', '0', '111', '111', '111', '111', '/jeesite/userfiles/1/images/license/2017/07/Capture001(2).png', '/jeesite/userfiles/1/images/certificate/2017/07/Capture001(1).png', '111.00', '18', '111', '2', '日用品', '111', '系统管理员', '2017-08-16 16:38:24', '111', '0');
INSERT INTO `account_supplier` VALUES ('cff5eae10bf04bf78e223a0767dd540c', 'gy-20170707-180920', '万科房产', '上海市', '8', '111', '111', '111', '111', '/jeesite/userfiles/1/images/license/2017/07/Capture001(2).png', '/jeesite/userfiles/1/images/certificate/2017/07/Capture001(2).png', '111.00', '21', '111', '0', '电子产品', '111', '系统管理员', '2017-08-08 16:38:24', '111', '0');
INSERT INTO `account_supplier` VALUES ('deacdb504ba44ffb87d2cd32878678ce', 'gy-20170810-1e2zy', 'SONY', '韩国首尔', '', 'tom', '0456145', '', '', '|||/jeesite/userfiles/1fc7afc68ba94455a26f0daf5c2782f3/files/erp/accountSupplier/2017/08/ninxian.png', '', '1000.00', '365', '142423', 'back', '电子产品', '12434324', 'e23645693b364b5db3cbb28c60dc0b0a', '2017-08-16 16:38:24', '', '0');
INSERT INTO `account_supplier` VALUES ('e6fa9720e41248088e301fe102712aa8', 'gy-20170810-r05rs', 'ABC企业', '测试', '', '434', '2434353', '656', '46565', '|/jeesite/userfiles/1fc7afc68ba94455a26f0daf5c2782f3/files/erp/accountSupplier/2017/08/QQ%E6%88%AA%E5%9B%BE20170802144646.png', '|/jeesite/userfiles/1fc7afc68ba94455a26f0daf5c2782f3/files/erp/accountSupplier/2017/08/QQ%E6%88%AA%E5%9B%BE20170802144646.png', '1009.00', '56', '测试', '工业', '食品饮料', '6576576876', 'admin', '2017-08-12 16:38:24', '测试', '0');

-- ----------------------------
-- Table structure for account_supplier_input
-- ----------------------------
DROP TABLE IF EXISTS `account_supplier_input`;
CREATE TABLE `account_supplier_input` (
  `id` varchar(64) NOT NULL COMMENT 'id编号',
  `supplier_num` varchar(37) NOT NULL COMMENT '供应商编号',
  `supplier` varchar(35) NOT NULL COMMENT '供应商名称',
  `begin_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '期初日期',
  `begin_money` decimal(10,2) NOT NULL COMMENT '期初余额',
  `maker` varchar(35) DEFAULT NULL COMMENT '制单人',
  `create_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `remarks` varchar(255) NOT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL COMMENT '删除标记0:删除1:存在',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_supplier_input
-- ----------------------------
INSERT INTO `account_supplier_input` VALUES ('347aa4d845ca4d60bf1ccc14efc89114', 'gy-20170707-230672', 'test111', '2017-07-07 16:31:15', '87.00', '系统管理员', '2017-08-17 16:42:47', '87', '0');
INSERT INTO `account_supplier_input` VALUES ('3eb4c4bdae7d4473b342c9b4c421f34d', 'gy-20170707-284749', '华天地产1111', '2017-07-31 11:08:58', '300000.00', 'shichang', '2017-08-17 16:43:24', '期初余额66666', '0');
INSERT INTO `account_supplier_input` VALUES ('42aac7700795499284eac52aa0dee4da', 'gy-20170707-237347', '可口可乐（天津）', '2017-08-09 16:22:41', '2000.00', 'shichang', '2017-08-16 16:38:40', 'fffff', '0');
INSERT INTO `account_supplier_input` VALUES ('4b836a01f4b84f33a7c43eceadc528be', 'gy-20170707-237316', 'ABC企业', '2017-09-01 16:21:47', '1000.00', '系统管理员', '2017-08-16 16:38:40', '33', '0');
INSERT INTO `account_supplier_input` VALUES ('995669b3ebc145e98f14d7449b4622f8', 'gy-20170707-639873', '阿里巴巴', '2017-08-31 16:43:32', '33.00', '系统管理员', '2017-08-16 16:38:40', '22', '0');
INSERT INTO `account_supplier_input` VALUES ('bb8f6bf900934a8c8c8767053e7e9160', 'gy-20170707-180920', '万科房产', '2017-07-07 17:33:05', '500.00', '系统管理员', '2017-08-16 16:38:40', 'test', '0');

-- ----------------------------
-- Table structure for account_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `account_warehouse`;
CREATE TABLE `account_warehouse` (
  `id` varchar(64) CHARACTER SET utf8 NOT NULL,
  `housename` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '仓库名称',
  `size` decimal(10,0) NOT NULL COMMENT '仓库面积',
  `address` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '仓库地址',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `remarks` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 NOT NULL COMMENT '删除标记0:删除1:存在',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of account_warehouse
-- ----------------------------
INSERT INTO `account_warehouse` VALUES ('389d98f8e2174ab09a55f338fe88923d', '上海仓库', '3000', '华兴东路201号', '2017-08-01 16:38:54', '提前儿童气而去', '0');
INSERT INTO `account_warehouse` VALUES ('47baa5cfeed94bf9abd43c7c04a8dd0c', '天津仓库', '200', '范德萨范德萨', '2017-08-04 16:38:54', '1', '0');
INSERT INTO `account_warehouse` VALUES ('7de722b240544460bd970b05e252ae28', '保定仓库', '500', '保定市区', '2017-08-12 16:38:54', '52', '0');
INSERT INTO `account_warehouse` VALUES ('82b03bfd8f8547eead51e1f677824576', '北京仓库', '200', '33', '2017-08-20 16:38:54', '2', '0');
INSERT INTO `account_warehouse` VALUES ('c182e830ed2043f5913217a8922836f1', '石家庄仓库', '800', '重点是干了', '2017-08-16 16:38:54', '3', '0');
INSERT INTO `account_warehouse` VALUES ('da8adba4eed3467dab5ff829f5e01dfb', '北京2号库', '10000', '北京燕郊', '2017-08-15 16:38:54', '123', '0');
INSERT INTO `account_warehouse` VALUES ('db1ea78c5f2941f68775f4296ebd73af', '唐山仓库', '450', '4.0', '2017-08-21 16:38:54', '4', '0');
INSERT INTO `account_warehouse` VALUES ('dba3caa68eca4b37b017a64cd4917353', '华南仓库', '200', '华南地区', '2017-08-29 16:38:54', '华南地区仓库', '0');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '默认为空',
  `aType` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '管理员类型。0：普通，1：超级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '0', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '2017-08-13 14:52:14', '2017-08-14 14:52:16', '2017-08-13 14:52:22', '1');
INSERT INTO `admin` VALUES ('2', '1', 'caigou', 'e10adc3949ba59abbe56e057f20f883e', '2017-08-15 17:42:30', '2017-08-31 17:42:34', '2017-08-15 17:42:40', '0');
INSERT INTO `admin` VALUES ('3', '1', 'jingli', 'e10adc3949ba59abbe56e057f20f883e', '2017-08-15 17:42:49', '2017-09-08 17:42:53', '2017-08-15 17:42:58', '0');
INSERT INTO `admin` VALUES ('4', '1', 'zongjingli', 'e10adc3949ba59abbe56e057f20f883e', '2017-08-15 17:43:06', '2017-08-31 17:43:08', '2017-08-15 17:43:13', '0');

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `adminId` int(11) NOT NULL COMMENT '管理员ID',
  `menuId` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`),
  KEY `adminId` (`adminId`) USING BTREE,
  KEY `menuId` (`menuId`) USING BTREE,
  CONSTRAINT `admin_menu_ibfk_1` FOREIGN KEY (`adminId`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `admin_menu_ibfk_2` FOREIGN KEY (`menuId`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `time` time NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `mSort` int(11) DEFAULT NULL COMMENT '栏目排序，越大越靠前',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
