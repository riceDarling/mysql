/*
Navicat MySQL Data Transfer

Source Server         : 192.168.3.100_3306
Source Server Version : 50527
Source Host           : 192.168.3.100:3306
Source Database       : infection

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2017-08-18 18:27:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for examination_grade
-- ----------------------------
DROP TABLE IF EXISTS `examination_grade`;
CREATE TABLE `examination_grade` (
  `gradeId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `schoolId` int(11) NOT NULL COMMENT '学校Id',
  `gradeNo` int(11) NOT NULL COMMENT '年级',
  `num` int(1) NOT NULL COMMENT '班级数量',
  PRIMARY KEY (`gradeId`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of examination_grade
-- ----------------------------
INSERT INTO `examination_grade` VALUES ('140', '154', '1', '6');
INSERT INTO `examination_grade` VALUES ('141', '154', '2', '4');
INSERT INTO `examination_grade` VALUES ('142', '154', '3', '5');
INSERT INTO `examination_grade` VALUES ('143', '154', '4', '6');
INSERT INTO `examination_grade` VALUES ('144', '154', '5', '5');
INSERT INTO `examination_grade` VALUES ('145', '154', '7', '7');
INSERT INTO `examination_grade` VALUES ('146', '154', '8', '11');
INSERT INTO `examination_grade` VALUES ('147', '154', '9', '8');
INSERT INTO `examination_grade` VALUES ('148', '154', '10', '7');
INSERT INTO `examination_grade` VALUES ('149', '154', '11', '12');
INSERT INTO `examination_grade` VALUES ('150', '154', '12', '11');
INSERT INTO `examination_grade` VALUES ('151', '154', '13', '15');
INSERT INTO `examination_grade` VALUES ('170', '153', '1', '5');
INSERT INTO `examination_grade` VALUES ('171', '153', '2', '4');
INSERT INTO `examination_grade` VALUES ('172', '153', '3', '4');
INSERT INTO `examination_grade` VALUES ('173', '153', '4', '4');
INSERT INTO `examination_grade` VALUES ('174', '153', '5', '5');
INSERT INTO `examination_grade` VALUES ('175', '153', '6', '5');
INSERT INTO `examination_grade` VALUES ('182', '157', '8', '9');
INSERT INTO `examination_grade` VALUES ('183', '157', '9', '9');
INSERT INTO `examination_grade` VALUES ('185', '157', '12', '9');
INSERT INTO `examination_grade` VALUES ('186', '157', '13', '9');
INSERT INTO `examination_grade` VALUES ('187', '156', '1', '2');
INSERT INTO `examination_grade` VALUES ('188', '156', '2', '3');
INSERT INTO `examination_grade` VALUES ('189', '156', '3', '4');
INSERT INTO `examination_grade` VALUES ('190', '156', '4', '5');
INSERT INTO `examination_grade` VALUES ('191', '156', '5', '4');
INSERT INTO `examination_grade` VALUES ('192', '156', '7', '3');
INSERT INTO `examination_grade` VALUES ('193', '156', '8', '3');
INSERT INTO `examination_grade` VALUES ('194', '156', '9', '2');

-- ----------------------------
-- Table structure for examination_items
-- ----------------------------
DROP TABLE IF EXISTS `examination_items`;
CREATE TABLE `examination_items` (
  `itemId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '检测项目列表ID',
  `itemName` varchar(50) NOT NULL COMMENT '项目名称',
  `unit` varchar(50) NOT NULL COMMENT '测量单位',
  `isTest` int(1) NOT NULL DEFAULT '0' COMMENT '是否在测（0：不；1：在测）',
  `allowDel` int(1) NOT NULL DEFAULT '0' COMMENT '是否可以删除(0:不可删除;1：可删除)',
  `isDel` int(1) NOT NULL DEFAULT '0' COMMENT '是否删除（0：删除；1：存在）',
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of examination_items
-- ----------------------------
INSERT INTO `examination_items` VALUES ('1', '体重', 'kg', '1', '0', '1');
INSERT INTO `examination_items` VALUES ('2', '身高', 'cm', '1', '0', '1');
INSERT INTO `examination_items` VALUES ('3', '血压', 'mmhg', '1', '0', '1');
INSERT INTO `examination_items` VALUES ('8', '视力', '度数', '1', '0', '1');
INSERT INTO `examination_items` VALUES ('9', '胸围', 'CM', '0', '0', '1');
INSERT INTO `examination_items` VALUES ('10', '腰围', 'CM', '0', '0', '1');
INSERT INTO `examination_items` VALUES ('11', '心率', '心率单位', '0', '0', '1');
INSERT INTO `examination_items` VALUES ('12', '痤疮', '痤疮单位', '0', '0', '1');
INSERT INTO `examination_items` VALUES ('13', '听力', '听力单位', '1', '0', '1');
INSERT INTO `examination_items` VALUES ('14', '色盲', '色盲单位', '0', '0', '1');

-- ----------------------------
-- Table structure for examination_measure
-- ----------------------------
DROP TABLE IF EXISTS `examination_measure`;
CREATE TABLE `examination_measure` (
  `measureId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '测量表',
  `studentNo` varchar(50) NOT NULL COMMENT '学籍号',
  `studentId` bigint(20) NOT NULL COMMENT '学生Id',
  `schoolId` int(11) NOT NULL COMMENT '学校Id',
  `age` int(11) NOT NULL COMMENT '年龄',
  `createTime` date NOT NULL COMMENT '体检日期',
  `gradeNo` int(11) NOT NULL COMMENT '年级',
  `classNo` int(11) NOT NULL COMMENT '班级',
  PRIMARY KEY (`measureId`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of examination_measure
-- ----------------------------
INSERT INTO `examination_measure` VALUES ('48', '001', '37', '157', '23', '2017-08-02', '8', '1');
INSERT INTO `examination_measure` VALUES ('49', '001', '37', '157', '23', '2018-08-07', '8', '1');
INSERT INTO `examination_measure` VALUES ('50', 'zz1122', '34', '153', '17', '2017-08-14', '6', '1');
INSERT INTO `examination_measure` VALUES ('51', '9787121128035', '41', '153', '19', '2017-08-14', '1', '1');
INSERT INTO `examination_measure` VALUES ('54', '0000198000', '42', '154', '16', '2017-08-14', '1', '1');

-- ----------------------------
-- Table structure for examination_measure_items
-- ----------------------------
DROP TABLE IF EXISTS `examination_measure_items`;
CREATE TABLE `examination_measure_items` (
  `measureId` bigint(20) NOT NULL,
  `itemId` bigint(20) NOT NULL,
  `value` decimal(7,2) NOT NULL COMMENT '测量所得数据',
  KEY `fk_measure_item01` (`measureId`),
  KEY `fk_measure_item02` (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of examination_measure_items
-- ----------------------------
INSERT INTO `examination_measure_items` VALUES ('48', '10', '22.00');
INSERT INTO `examination_measure_items` VALUES ('48', '8', '11.00');
INSERT INTO `examination_measure_items` VALUES ('48', '3', '66.00');
INSERT INTO `examination_measure_items` VALUES ('48', '2', '181.00');
INSERT INTO `examination_measure_items` VALUES ('48', '1', '66.00');
INSERT INTO `examination_measure_items` VALUES ('49', '10', '0.00');
INSERT INTO `examination_measure_items` VALUES ('49', '8', '12.00');
INSERT INTO `examination_measure_items` VALUES ('49', '3', '0.00');
INSERT INTO `examination_measure_items` VALUES ('49', '2', '181.00');
INSERT INTO `examination_measure_items` VALUES ('49', '1', '70.00');
INSERT INTO `examination_measure_items` VALUES ('50', '1', '12.00');
INSERT INTO `examination_measure_items` VALUES ('51', '1', '45.00');
INSERT INTO `examination_measure_items` VALUES ('51', '2', '160.00');
INSERT INTO `examination_measure_items` VALUES ('51', '11', '80.00');
INSERT INTO `examination_measure_items` VALUES ('54', '11', '90.00');
INSERT INTO `examination_measure_items` VALUES ('54', '1', '45.00');
INSERT INTO `examination_measure_items` VALUES ('54', '2', '165.00');

-- ----------------------------
-- Table structure for examination_student
-- ----------------------------
DROP TABLE IF EXISTS `examination_student`;
CREATE TABLE `examination_student` (
  `studentId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '学生Id',
  `studentNo` varchar(50) NOT NULL COMMENT '学籍号',
  `idCard` varchar(50) NOT NULL COMMENT '身份证',
  `studentName` varchar(100) NOT NULL COMMENT '学生姓名',
  `sex` tinyint(1) NOT NULL COMMENT '性别: 0 男，1 女',
  `birthDay` date NOT NULL COMMENT '出生日期',
  `nationality` varchar(50) NOT NULL COMMENT '民族',
  `EnrollmentTime` date NOT NULL COMMENT '入学年份',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `parentName` varchar(255) DEFAULT NULL COMMENT '家长姓名',
  `related` varchar(255) DEFAULT NULL COMMENT '跟学生的关系',
  `isTianjin` varchar(255) DEFAULT NULL COMMENT '判断是否为外地学生，如果该字段为空则为本地，否则为外地',
  PRIMARY KEY (`studentId`),
  UNIQUE KEY `studentNo` (`studentNo`,`idCard`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of examination_student
-- ----------------------------
INSERT INTO `examination_student` VALUES ('34', 'zz1122', '4123124124', '霍雨浩', '0', '2000-08-08', '汉族', '2010-09-09', '12312319', '你太热情温泉', null, null, null);
INSERT INTO `examination_student` VALUES ('35', 'xx1111', '412412312312312', '南宋晚', '1', '2001-09-09', '汉族', '2011-09-01', '312309120', '计入我IRQ', null, null, null);
INSERT INTO `examination_student` VALUES ('36', '123123', '142455666666666666', 'www', '0', '1998-02-02', '壮族', '2004-04-04', '353454', '住址', null, null, null);
INSERT INTO `examination_student` VALUES ('37', '001', '12010827711', '小何', '0', '1993-11-11', '壮族', '2000-01-01', '11111', '1111', null, null, null);
INSERT INTO `examination_student` VALUES ('38', '002', '111', '小凯', '0', '1999-09-09', '汉族', '2000-08-31', '66', '77', null, null, null);
INSERT INTO `examination_student` VALUES ('39', '003', '122', '小虎', '1', '2005-05-05', '汉族', '2000-05-05', '333', '33', null, null, null);
INSERT INTO `examination_student` VALUES ('40', '005', '12322', '小库', '1', '2001-01-01', '汉族', '2000-01-01', '12', '12', null, null, null);
INSERT INTO `examination_student` VALUES ('41', '9787121128035', '142211111111332222', '王丽丽', '1', '1998-06-06', '壮族', '2008-05-05', '15255566325', '天津', null, null, null);
INSERT INTO `examination_student` VALUES ('42', '0000198000', '142455666322215221', '李彬', '0', '2001-02-05', '哈萨克族', '2016-05-06', '13526566654', '天津市', null, null, null);

-- ----------------------------
-- Table structure for examination_student_school
-- ----------------------------
DROP TABLE IF EXISTS `examination_student_school`;
CREATE TABLE `examination_student_school` (
  `studentId` int(32) NOT NULL COMMENT '学生id',
  `schoolId` int(11) NOT NULL COMMENT '学校Id',
  `startTime` date NOT NULL COMMENT '开始时间',
  `endTime` date DEFAULT NULL COMMENT '结束时间',
  `classNum` int(11) NOT NULL COMMENT '班级',
  `gradeNo` int(11) NOT NULL COMMENT '年级'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of examination_student_school
-- ----------------------------
INSERT INTO `examination_student_school` VALUES ('34', '153', '2010-09-09', null, '1', '6');
INSERT INTO `examination_student_school` VALUES ('35', '154', '2011-09-01', null, '1', '5');
INSERT INTO `examination_student_school` VALUES ('36', '153', '2004-04-04', null, '1', '1');
INSERT INTO `examination_student_school` VALUES ('37', '157', '2000-01-01', null, '1', '8');
INSERT INTO `examination_student_school` VALUES ('38', '157', '2000-08-31', '2017-08-14', '1', '13');
INSERT INTO `examination_student_school` VALUES ('39', '157', '2000-05-05', '2017-08-14', '1', '9');
INSERT INTO `examination_student_school` VALUES ('40', '157', '2000-01-01', null, '1', '12');
INSERT INTO `examination_student_school` VALUES ('41', '153', '2008-05-05', null, '1', '1');
INSERT INTO `examination_student_school` VALUES ('42', '154', '2016-05-06', null, '1', '1');

-- ----------------------------
-- Table structure for infection_account
-- ----------------------------
DROP TABLE IF EXISTS `infection_account`;
CREATE TABLE `infection_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '账号',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) DEFAULT NULL COMMENT '姓名',
  `level` int(10) DEFAULT NULL COMMENT '0:学校,1:管理员,2:录入,3:学生',
  `schoolId` int(11) DEFAULT NULL COMMENT '账号关联ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infection_account
-- ----------------------------
INSERT INTO `infection_account` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '超管', '1', null);
INSERT INTO `infection_account` VALUES ('126', 'qqq111', 'e10adc3949ba59abbe56e057f20f883e', '浮点数', '0', '153');
INSERT INTO `infection_account` VALUES ('127', 'www111', 'e10adc3949ba59abbe56e057f20f883e', '张志浩', '0', '154');
INSERT INTO `infection_account` VALUES ('128', 'zz1122', 'e10adc3949ba59abbe56e057f20f883e', '霍雨浩', '3', '34');
INSERT INTO `infection_account` VALUES ('129', 'xx1111', 'e10adc3949ba59abbe56e057f20f883e', '南宋晚', '3', '35');
INSERT INTO `infection_account` VALUES ('130', 'wyy', '96e79218965eb72c92a549dd5a330112', 'wyy', '2', null);
INSERT INTO `infection_account` VALUES ('131', '123123', 'e10adc3949ba59abbe56e057f20f883e', 'www', '3', '36');
INSERT INTO `infection_account` VALUES ('132', 'eee111', 'e10adc3949ba59abbe56e057f20f883e', '六合学校', '0', '156');
INSERT INTO `infection_account` VALUES ('133', '001', 'e10adc3949ba59abbe56e057f20f883e', '122', '0', '157');
INSERT INTO `infection_account` VALUES ('134', '001', 'e10adc3949ba59abbe56e057f20f883e', '小何', '3', '37');
INSERT INTO `infection_account` VALUES ('135', '002', 'e10adc3949ba59abbe56e057f20f883e', '小凯', '3', '38');
INSERT INTO `infection_account` VALUES ('136', '003', 'e10adc3949ba59abbe56e057f20f883e', '小虎', '3', '39');
INSERT INTO `infection_account` VALUES ('137', '005', 'e10adc3949ba59abbe56e057f20f883e', '小库', '3', '40');
INSERT INTO `infection_account` VALUES ('138', '9787121128035', 'e10adc3949ba59abbe56e057f20f883e', '王丽丽', '3', '41');
INSERT INTO `infection_account` VALUES ('139', '0000198000', 'e10adc3949ba59abbe56e057f20f883e', '李彬', '3', '42');

-- ----------------------------
-- Table structure for infection_infection
-- ----------------------------
DROP TABLE IF EXISTS `infection_infection`;
CREATE TABLE `infection_infection` (
  `infectionId` int(11) NOT NULL AUTO_INCREMENT,
  `infectionName` varchar(100) NOT NULL COMMENT '传染病名称',
  `insulateTime` int(11) NOT NULL COMMENT '隔离时间',
  `type` int(11) NOT NULL COMMENT '类型',
  `isDel` int(1) NOT NULL DEFAULT '1' COMMENT '是否删除1:存在0:删除',
  PRIMARY KEY (`infectionId`),
  UNIQUE KEY `infectionName` (`infectionName`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infection_infection
-- ----------------------------
INSERT INTO `infection_infection` VALUES ('2', '鼠疫', '10', '1', '1');
INSERT INTO `infection_infection` VALUES ('10', '霍乱', '0', '1', '1');
INSERT INTO `infection_infection` VALUES ('11', '传染性非典型肺炎', '0', '2', '1');
INSERT INTO `infection_infection` VALUES ('12', '艾滋病', '0', '2', '1');
INSERT INTO `infection_infection` VALUES ('13', '病毒性肝炎', '0', '2', '1');
INSERT INTO `infection_infection` VALUES ('14', '脊髓灰质炎', '40', '2', '1');
INSERT INTO `infection_infection` VALUES ('15', '人感染高致病性禽流感', '0', '2', '1');
INSERT INTO `infection_infection` VALUES ('16', '人感染H7N9禽流感', '0', '2', '1');
INSERT INTO `infection_infection` VALUES ('17', '麻疹', '5', '2', '1');
INSERT INTO `infection_infection` VALUES ('19', '狂犬病', '0', '2', '1');
INSERT INTO `infection_infection` VALUES ('20', '流行性乙型脑炎', '0', '2', '1');
INSERT INTO `infection_infection` VALUES ('21', '登革热', '0', '2', '1');
INSERT INTO `infection_infection` VALUES ('22', '炭疽', '0', '2', '1');
INSERT INTO `infection_infection` VALUES ('23', '细菌性和阿米巴性痢疾', '7', '2', '1');
INSERT INTO `infection_infection` VALUES ('24', '肺结核', '0', '2', '1');
INSERT INTO `infection_infection` VALUES ('25', '伤寒和副伤寒', '0', '2', '1');
INSERT INTO `infection_infection` VALUES ('26', '流行性脑脊髓膜炎', '7', '2', '1');
INSERT INTO `infection_infection` VALUES ('27', '百日咳', '30', '2', '1');
INSERT INTO `infection_infection` VALUES ('28', '白喉', '14', '2', '1');
INSERT INTO `infection_infection` VALUES ('29', '新生儿破伤风', '0', '2', '1');
INSERT INTO `infection_infection` VALUES ('30', '猩红热', '7', '2', '1');
INSERT INTO `infection_infection` VALUES ('31', '布鲁氏菌病', '0', '2', '1');
INSERT INTO `infection_infection` VALUES ('32', '淋病', '0', '2', '1');
INSERT INTO `infection_infection` VALUES ('33', '梅毒', '0', '2', '1');
INSERT INTO `infection_infection` VALUES ('34', '钩端螺旋体病', '0', '2', '1');
INSERT INTO `infection_infection` VALUES ('35', '血吸虫病', '0', '2', '1');
INSERT INTO `infection_infection` VALUES ('36', '疟疾', '0', '2', '1');
INSERT INTO `infection_infection` VALUES ('37', '流行性感冒', '7', '3', '1');
INSERT INTO `infection_infection` VALUES ('38', '甲型H1N1流感', '0', '3', '1');
INSERT INTO `infection_infection` VALUES ('39', '流行性腮腺炎', '14', '3', '1');
INSERT INTO `infection_infection` VALUES ('40', '风疹', '5', '3', '1');
INSERT INTO `infection_infection` VALUES ('41', '急性出血性结膜炎', '7', '3', '1');
INSERT INTO `infection_infection` VALUES ('42', '麻风病', '0', '3', '1');
INSERT INTO `infection_infection` VALUES ('43', '流行性和地方性斑疹伤寒', '0', '3', '1');
INSERT INTO `infection_infection` VALUES ('44', '黑热病', '0', '3', '1');
INSERT INTO `infection_infection` VALUES ('45', '包虫病', '0', '3', '1');
INSERT INTO `infection_infection` VALUES ('46', '丝虫病', '0', '3', '1');
INSERT INTO `infection_infection` VALUES ('47', '手足口病', '10', '3', '1');
INSERT INTO `infection_infection` VALUES ('48', '除霍乱', '0', '3', '1');
INSERT INTO `infection_infection` VALUES ('54', '细菌性和阿米巴性', '0', '3', '1');
INSERT INTO `infection_infection` VALUES ('55', '伤寒和副伤寒以外的感染性腹泻病', '5', '3', '1');
INSERT INTO `infection_infection` VALUES ('57', '寨卡病毒病', '0', '4', '1');
INSERT INTO `infection_infection` VALUES ('58', '鼻疽和类鼻疽', '0', '4', '1');
INSERT INTO `infection_infection` VALUES ('59', '人兽共患病', '0', '4', '1');
INSERT INTO `infection_infection` VALUES ('60', '基孔肯雅热', '0', '4', '1');
INSERT INTO `infection_infection` VALUES ('61', '广州管圆线虫病', '0', '4', '1');
INSERT INTO `infection_infection` VALUES ('62', '阿米巴性痢疾', '0', '4', '1');
INSERT INTO `infection_infection` VALUES ('63', '人猪重症链球菌感染', '0', '4', '1');
INSERT INTO `infection_infection` VALUES ('64', '德国肠出血性大肠杆菌O104感染', '0', '4', '1');
INSERT INTO `infection_infection` VALUES ('65', '美洲锥虫病', '0', '4', '1');
INSERT INTO `infection_infection` VALUES ('66', '诺如病毒急性胃肠炎', '0', '4', '1');
INSERT INTO `infection_infection` VALUES ('67', '颚口线虫病', '0', '4', '1');
INSERT INTO `infection_infection` VALUES ('68', '西尼罗病毒', '0', '4', '1');
INSERT INTO `infection_infection` VALUES ('69', '马尔堡出血热', '0', '4', '1');
INSERT INTO `infection_infection` VALUES ('70', '拉沙热', '0', '4', '1');
INSERT INTO `infection_infection` VALUES ('71', '黄热病', '0', '4', '1');
INSERT INTO `infection_infection` VALUES ('72', '裂谷病', '0', '4', '1');
INSERT INTO `infection_infection` VALUES ('73', '埃博拉出血热', '0', '4', '1');
INSERT INTO `infection_infection` VALUES ('74', '中东呼吸综合征', '0', '4', '1');
INSERT INTO `infection_infection` VALUES ('75', '甲型肝炎病毒', '15', '1', '1');

-- ----------------------------
-- Table structure for infection_notices
-- ----------------------------
DROP TABLE IF EXISTS `infection_notices`;
CREATE TABLE `infection_notices` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `schoolId` int(11) NOT NULL COMMENT '学校ID',
  `content` varchar(255) NOT NULL COMMENT '通知内容',
  `createTime` datetime NOT NULL COMMENT '通知时间',
  `isRead` int(1) NOT NULL COMMENT '是否存在1:已读0:未读',
  `type` int(1) DEFAULT '0' COMMENT '0:学校；1：党员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=508 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infection_notices
-- ----------------------------
INSERT INTO `infection_notices` VALUES ('1', '3', '请尽快上传文件', '2017-05-27 11:11:11', '1', '0');
INSERT INTO `infection_notices` VALUES ('2', '3', '请尽快上传文件', '2017-05-27 11:11:31', '1', '0');
INSERT INTO `infection_notices` VALUES ('3', '22', '请尽快上传文件', '2017-05-27 11:44:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('4', '22', '请尽快上传文件', '2017-05-27 11:45:20', '0', '0');
INSERT INTO `infection_notices` VALUES ('5', '4', '请尽快上传文件', '2017-05-31 09:44:16', '0', '0');
INSERT INTO `infection_notices` VALUES ('6', '30', '请尽快上传文件', '2017-05-31 11:23:34', '0', '0');
INSERT INTO `infection_notices` VALUES ('7', '30', '请尽快上传文件', '2017-05-31 11:23:37', '0', '0');
INSERT INTO `infection_notices` VALUES ('8', '30', '请尽快上传文件', '2017-05-31 11:23:39', '0', '0');
INSERT INTO `infection_notices` VALUES ('9', '30', '请尽快上传文件', '2017-05-31 11:23:41', '0', '0');
INSERT INTO `infection_notices` VALUES ('10', '30', '请尽快上传文件', '2017-05-31 11:23:42', '0', '0');
INSERT INTO `infection_notices` VALUES ('11', '30', '请尽快上传文件', '2017-05-31 11:23:43', '0', '0');
INSERT INTO `infection_notices` VALUES ('12', '30', '请尽快上传文件', '2017-05-31 11:23:44', '0', '0');
INSERT INTO `infection_notices` VALUES ('13', '30', '请尽快上传文件', '2017-05-31 11:23:45', '0', '0');
INSERT INTO `infection_notices` VALUES ('14', '30', '请尽快上传文件', '2017-05-31 11:23:46', '0', '0');
INSERT INTO `infection_notices` VALUES ('15', '30', '请尽快上传文件', '2017-05-31 11:23:47', '0', '0');
INSERT INTO `infection_notices` VALUES ('16', '30', '请尽快上传文件', '2017-05-31 11:23:48', '0', '0');
INSERT INTO `infection_notices` VALUES ('17', '33', '请尽快上传文件', '2017-05-31 11:29:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('18', '3', '请尽快上传文件', '2017-05-31 11:29:26', '1', '0');
INSERT INTO `infection_notices` VALUES ('19', '33', '请尽快上传文件', '2017-05-31 11:29:28', '0', '0');
INSERT INTO `infection_notices` VALUES ('20', '33', '请尽快上传文件', '2017-05-31 11:29:29', '0', '0');
INSERT INTO `infection_notices` VALUES ('21', '33', '请尽快上传文件', '2017-05-31 11:29:30', '0', '0');
INSERT INTO `infection_notices` VALUES ('22', '33', '请尽快上传文件', '2017-05-31 11:29:31', '0', '0');
INSERT INTO `infection_notices` VALUES ('23', '33', '请尽快上传文件', '2017-05-31 11:29:32', '0', '0');
INSERT INTO `infection_notices` VALUES ('24', '33', '请尽快上传文件', '2017-05-31 11:29:33', '0', '0');
INSERT INTO `infection_notices` VALUES ('25', '33', '请尽快上传文件', '2017-05-31 11:29:34', '0', '0');
INSERT INTO `infection_notices` VALUES ('26', '33', '请尽快上传文件', '2017-05-31 11:29:35', '0', '0');
INSERT INTO `infection_notices` VALUES ('27', '33', '请尽快上传文件', '2017-05-31 11:29:36', '0', '0');
INSERT INTO `infection_notices` VALUES ('28', '3', '请尽快上传文件', '2017-06-05 14:09:48', '1', '0');
INSERT INTO `infection_notices` VALUES ('29', '4', '请尽快上传文件', '2017-06-05 14:09:48', '0', '0');
INSERT INTO `infection_notices` VALUES ('30', '5', '请尽快上传文件', '2017-06-05 14:09:48', '0', '0');
INSERT INTO `infection_notices` VALUES ('31', '22', '请尽快上传文件', '2017-06-05 14:09:48', '0', '0');
INSERT INTO `infection_notices` VALUES ('32', '23', '请尽快上传文件', '2017-06-05 14:09:48', '0', '0');
INSERT INTO `infection_notices` VALUES ('33', '25', '请尽快上传文件', '2017-06-05 14:09:48', '0', '0');
INSERT INTO `infection_notices` VALUES ('34', '26', '请尽快上传文件', '2017-06-05 14:09:48', '0', '0');
INSERT INTO `infection_notices` VALUES ('35', '27', '请尽快上传文件', '2017-06-05 14:09:48', '0', '0');
INSERT INTO `infection_notices` VALUES ('36', '28', '请尽快上传文件', '2017-06-05 14:09:48', '0', '0');
INSERT INTO `infection_notices` VALUES ('37', '29', '请尽快上传文件', '2017-06-05 14:09:48', '0', '0');
INSERT INTO `infection_notices` VALUES ('38', '30', '请尽快上传文件', '2017-06-05 14:09:48', '0', '0');
INSERT INTO `infection_notices` VALUES ('39', '31', '请尽快上传文件', '2017-06-05 14:09:48', '0', '0');
INSERT INTO `infection_notices` VALUES ('40', '32', '请尽快上传文件', '2017-06-05 14:09:48', '0', '0');
INSERT INTO `infection_notices` VALUES ('41', '33', '请尽快上传文件', '2017-06-05 14:09:48', '0', '0');
INSERT INTO `infection_notices` VALUES ('42', '34', '请尽快上传文件', '2017-06-05 14:09:48', '0', '0');
INSERT INTO `infection_notices` VALUES ('43', '3', '请尽快上传文件', '2017-06-05 14:17:05', '1', '0');
INSERT INTO `infection_notices` VALUES ('44', '4', '请尽快上传文件', '2017-06-05 14:17:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('45', '5', '请尽快上传文件', '2017-06-05 14:17:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('46', '22', '请尽快上传文件', '2017-06-05 14:17:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('47', '23', '请尽快上传文件', '2017-06-05 14:17:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('48', '25', '请尽快上传文件', '2017-06-05 14:17:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('49', '26', '请尽快上传文件', '2017-06-05 14:17:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('50', '27', '请尽快上传文件', '2017-06-05 14:17:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('51', '28', '请尽快上传文件', '2017-06-05 14:17:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('52', '29', '请尽快上传文件', '2017-06-05 14:17:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('53', '30', '请尽快上传文件', '2017-06-05 14:17:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('54', '31', '请尽快上传文件', '2017-06-05 14:17:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('55', '32', '请尽快上传文件', '2017-06-05 14:17:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('56', '33', '请尽快上传文件', '2017-06-05 14:17:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('57', '34', '请尽快上传文件', '2017-06-05 14:17:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('58', '3', '请尽快上传文件', '2017-06-05 14:36:25', '1', '0');
INSERT INTO `infection_notices` VALUES ('59', '4', '请尽快上传文件', '2017-06-05 14:36:25', '0', '0');
INSERT INTO `infection_notices` VALUES ('60', '5', '请尽快上传文件', '2017-06-05 14:36:25', '0', '0');
INSERT INTO `infection_notices` VALUES ('61', '22', '请尽快上传文件', '2017-06-05 14:36:25', '0', '0');
INSERT INTO `infection_notices` VALUES ('62', '23', '请尽快上传文件', '2017-06-05 14:36:25', '0', '0');
INSERT INTO `infection_notices` VALUES ('63', '25', '请尽快上传文件', '2017-06-05 14:36:25', '0', '0');
INSERT INTO `infection_notices` VALUES ('64', '26', '请尽快上传文件', '2017-06-05 14:36:25', '0', '0');
INSERT INTO `infection_notices` VALUES ('65', '27', '请尽快上传文件', '2017-06-05 14:36:25', '0', '0');
INSERT INTO `infection_notices` VALUES ('66', '28', '请尽快上传文件', '2017-06-05 14:36:25', '0', '0');
INSERT INTO `infection_notices` VALUES ('67', '29', '请尽快上传文件', '2017-06-05 14:36:25', '0', '0');
INSERT INTO `infection_notices` VALUES ('68', '30', '请尽快上传文件', '2017-06-05 14:36:25', '0', '0');
INSERT INTO `infection_notices` VALUES ('69', '31', '请尽快上传文件', '2017-06-05 14:36:25', '0', '0');
INSERT INTO `infection_notices` VALUES ('70', '32', '请尽快上传文件', '2017-06-05 14:36:25', '0', '0');
INSERT INTO `infection_notices` VALUES ('71', '33', '请尽快上传文件', '2017-06-05 14:36:25', '0', '0');
INSERT INTO `infection_notices` VALUES ('72', '34', '请尽快上传文件', '2017-06-05 14:36:25', '0', '0');
INSERT INTO `infection_notices` VALUES ('73', '3', '请尽快上传文件', '2017-06-22 11:02:20', '1', '0');
INSERT INTO `infection_notices` VALUES ('74', '23', '请尽快上传文件', '2017-06-26 15:56:06', '0', '0');
INSERT INTO `infection_notices` VALUES ('75', '5', '请尽快上传文件', '2017-06-29 16:03:38', '0', '0');
INSERT INTO `infection_notices` VALUES ('76', '22', '请尽快上传文件', '2017-06-29 16:03:38', '0', '0');
INSERT INTO `infection_notices` VALUES ('77', '23', '请尽快上传文件', '2017-06-29 16:03:38', '0', '0');
INSERT INTO `infection_notices` VALUES ('78', '25', '请尽快上传文件', '2017-06-29 16:03:38', '0', '0');
INSERT INTO `infection_notices` VALUES ('79', '26', '请尽快上传文件', '2017-06-29 16:03:38', '0', '0');
INSERT INTO `infection_notices` VALUES ('80', '27', '请尽快上传文件', '2017-06-29 16:03:38', '0', '0');
INSERT INTO `infection_notices` VALUES ('81', '28', '请尽快上传文件', '2017-06-29 16:03:38', '0', '0');
INSERT INTO `infection_notices` VALUES ('82', '29', '请尽快上传文件', '2017-06-29 16:03:38', '0', '0');
INSERT INTO `infection_notices` VALUES ('83', '30', '请尽快上传文件', '2017-06-29 16:03:38', '0', '0');
INSERT INTO `infection_notices` VALUES ('84', '31', '请尽快上传文件', '2017-06-29 16:03:38', '0', '0');
INSERT INTO `infection_notices` VALUES ('85', '32', '请尽快上传文件', '2017-06-29 16:03:38', '0', '0');
INSERT INTO `infection_notices` VALUES ('86', '33', '请尽快上传文件', '2017-06-29 16:03:38', '0', '0');
INSERT INTO `infection_notices` VALUES ('87', '34', '请尽快上传文件', '2017-06-29 16:03:38', '0', '0');
INSERT INTO `infection_notices` VALUES ('88', '35', '请尽快上传文件', '2017-06-29 16:03:38', '0', '0');
INSERT INTO `infection_notices` VALUES ('89', '36', '请尽快上传文件', '2017-06-29 16:03:38', '0', '0');
INSERT INTO `infection_notices` VALUES ('90', '37', '请尽快上传文件', '2017-06-29 16:03:38', '0', '0');
INSERT INTO `infection_notices` VALUES ('91', '38', '请尽快上传文件', '2017-06-29 16:03:38', '0', '0');
INSERT INTO `infection_notices` VALUES ('92', '39', '请尽快上传文件', '2017-06-29 16:03:38', '0', '0');
INSERT INTO `infection_notices` VALUES ('93', '40', '请尽快上传文件', '2017-06-29 16:03:38', '0', '0');
INSERT INTO `infection_notices` VALUES ('94', '41', '请尽快上传文件', '2017-06-29 16:03:38', '0', '0');
INSERT INTO `infection_notices` VALUES ('95', '5', '请尽快上传文件', '2017-06-29 16:34:39', '0', '0');
INSERT INTO `infection_notices` VALUES ('96', '5', '请尽快上传文件', '2017-06-29 17:34:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('97', '22', '请尽快上传文件', '2017-06-29 17:34:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('98', '23', '请尽快上传文件', '2017-06-29 17:34:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('99', '25', '请尽快上传文件', '2017-06-29 17:34:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('100', '26', '请尽快上传文件', '2017-06-29 17:34:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('101', '27', '请尽快上传文件', '2017-06-29 17:34:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('102', '28', '请尽快上传文件', '2017-06-29 17:34:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('103', '29', '请尽快上传文件', '2017-06-29 17:34:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('104', '30', '请尽快上传文件', '2017-06-29 17:34:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('105', '31', '请尽快上传文件', '2017-06-29 17:34:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('106', '32', '请尽快上传文件', '2017-06-29 17:34:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('107', '33', '请尽快上传文件', '2017-06-29 17:34:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('108', '34', '请尽快上传文件', '2017-06-29 17:34:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('109', '35', '请尽快上传文件', '2017-06-29 17:34:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('110', '36', '请尽快上传文件', '2017-06-29 17:34:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('111', '37', '请尽快上传文件', '2017-06-29 17:34:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('112', '38', '请尽快上传文件', '2017-06-29 17:34:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('113', '39', '请尽快上传文件', '2017-06-29 17:34:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('114', '40', '请尽快上传文件', '2017-06-29 17:34:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('115', '41', '请尽快上传文件', '2017-06-29 17:34:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('116', '3', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('117', '4', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('118', '5', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('119', '22', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('120', '23', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('121', '25', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('122', '26', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('123', '27', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('124', '28', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('125', '29', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('126', '30', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('127', '31', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('128', '32', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('129', '33', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('130', '34', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('131', '35', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('132', '36', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('133', '37', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('134', '38', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('135', '39', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('136', '40', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('137', '41', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('138', '42', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('139', '43', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('140', '44', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('141', '45', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('142', '46', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('143', '48', '请尽快上传文件', '2017-07-03 15:43:57', '1', '0');
INSERT INTO `infection_notices` VALUES ('144', '49', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('145', '50', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('146', '51', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('147', '52', '请尽快上传文件', '2017-07-03 15:43:57', '1', '0');
INSERT INTO `infection_notices` VALUES ('148', '53', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('149', '54', '请尽快上传文件', '2017-07-03 15:43:57', '1', '0');
INSERT INTO `infection_notices` VALUES ('150', '55', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('151', '56', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('152', '57', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('153', '58', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('154', '59', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('155', '60', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('156', '61', '请尽快上传文件', '2017-07-03 15:43:57', '1', '0');
INSERT INTO `infection_notices` VALUES ('157', '62', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('158', '63', '请尽快上传文件', '2017-07-03 15:43:57', '1', '0');
INSERT INTO `infection_notices` VALUES ('159', '64', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('160', '65', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('161', '66', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('162', '67', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('163', '68', '请尽快上传文件', '2017-07-03 15:43:57', '1', '0');
INSERT INTO `infection_notices` VALUES ('164', '69', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('165', '70', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('166', '71', '请尽快上传文件', '2017-07-03 15:43:57', '0', '0');
INSERT INTO `infection_notices` VALUES ('167', '50', '请尽快上传文件', '2017-07-03 15:44:09', '0', '0');
INSERT INTO `infection_notices` VALUES ('168', '49', '请尽快上传文件', '2017-07-03 15:44:12', '0', '0');
INSERT INTO `infection_notices` VALUES ('169', '48', '请尽快上传文件', '2017-07-03 15:44:20', '1', '0');
INSERT INTO `infection_notices` VALUES ('170', '46', '请尽快上传文件', '2017-07-03 15:44:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('171', '45', '请尽快上传文件', '2017-07-03 15:44:25', '0', '0');
INSERT INTO `infection_notices` VALUES ('172', '50', '请尽快上传文件', '2017-07-03 15:45:04', '0', '0');
INSERT INTO `infection_notices` VALUES ('173', '3', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('174', '4', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('175', '5', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('176', '22', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('177', '23', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('178', '25', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('179', '26', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('180', '27', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('181', '28', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('182', '29', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('183', '30', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('184', '31', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('185', '32', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('186', '33', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('187', '34', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('188', '35', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('189', '36', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('190', '37', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('191', '38', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('192', '39', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('193', '40', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('194', '41', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('195', '42', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('196', '43', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('197', '44', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('198', '45', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('199', '46', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('200', '48', '请尽快上传文件', '2017-07-03 15:45:07', '1', '0');
INSERT INTO `infection_notices` VALUES ('201', '49', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('202', '50', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('203', '51', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('204', '52', '请尽快上传文件', '2017-07-03 15:45:07', '1', '0');
INSERT INTO `infection_notices` VALUES ('205', '53', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('206', '54', '请尽快上传文件', '2017-07-03 15:45:07', '1', '0');
INSERT INTO `infection_notices` VALUES ('207', '55', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('208', '56', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('209', '57', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('210', '58', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('211', '59', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('212', '60', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('213', '61', '请尽快上传文件', '2017-07-03 15:45:07', '1', '0');
INSERT INTO `infection_notices` VALUES ('214', '62', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('215', '63', '请尽快上传文件', '2017-07-03 15:45:07', '1', '0');
INSERT INTO `infection_notices` VALUES ('216', '64', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('217', '65', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('218', '66', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('219', '67', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('220', '68', '请尽快上传文件', '2017-07-03 15:45:07', '1', '0');
INSERT INTO `infection_notices` VALUES ('221', '69', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('222', '70', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('223', '71', '请尽快上传文件', '2017-07-03 15:45:07', '0', '0');
INSERT INTO `infection_notices` VALUES ('224', '3', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('225', '4', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('226', '5', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('227', '22', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('228', '23', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('229', '25', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('230', '26', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('231', '27', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('232', '28', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('233', '29', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('234', '30', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('235', '31', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('236', '32', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('237', '33', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('238', '34', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('239', '35', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('240', '36', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('241', '37', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('242', '38', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('243', '39', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('244', '40', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('245', '41', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('246', '42', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('247', '43', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('248', '44', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('249', '45', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('250', '46', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('251', '48', '请尽快上传文件', '2017-07-03 15:45:14', '1', '0');
INSERT INTO `infection_notices` VALUES ('252', '49', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('253', '50', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('254', '51', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('255', '52', '请尽快上传文件', '2017-07-03 15:45:14', '1', '0');
INSERT INTO `infection_notices` VALUES ('256', '53', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('257', '54', '请尽快上传文件', '2017-07-03 15:45:14', '1', '0');
INSERT INTO `infection_notices` VALUES ('258', '55', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('259', '56', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('260', '57', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('261', '58', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('262', '59', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('263', '60', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('264', '61', '请尽快上传文件', '2017-07-03 15:45:14', '1', '0');
INSERT INTO `infection_notices` VALUES ('265', '62', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('266', '63', '请尽快上传文件', '2017-07-03 15:45:14', '1', '0');
INSERT INTO `infection_notices` VALUES ('267', '64', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('268', '65', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('269', '66', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('270', '67', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('271', '68', '请尽快上传文件', '2017-07-03 15:45:14', '1', '0');
INSERT INTO `infection_notices` VALUES ('272', '69', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('273', '70', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('274', '71', '请尽快上传文件', '2017-07-03 15:45:14', '0', '0');
INSERT INTO `infection_notices` VALUES ('275', '3', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('276', '4', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('277', '5', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('278', '22', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('279', '23', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('280', '25', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('281', '26', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('282', '27', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('283', '28', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('284', '29', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('285', '30', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('286', '31', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('287', '32', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('288', '33', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('289', '34', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('290', '35', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('291', '36', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('292', '37', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('293', '38', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('294', '39', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('295', '40', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('296', '41', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('297', '42', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('298', '43', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('299', '44', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('300', '45', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('301', '46', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('302', '48', '请尽快上传文件', '2017-07-03 15:45:18', '1', '0');
INSERT INTO `infection_notices` VALUES ('303', '49', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('304', '50', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('305', '51', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('306', '52', '请尽快上传文件', '2017-07-03 15:45:18', '1', '0');
INSERT INTO `infection_notices` VALUES ('307', '53', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('308', '54', '请尽快上传文件', '2017-07-03 15:45:18', '1', '0');
INSERT INTO `infection_notices` VALUES ('309', '55', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('310', '56', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('311', '57', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('312', '58', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('313', '59', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('314', '60', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('315', '61', '请尽快上传文件', '2017-07-03 15:45:18', '1', '0');
INSERT INTO `infection_notices` VALUES ('316', '62', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('317', '63', '请尽快上传文件', '2017-07-03 15:45:18', '1', '0');
INSERT INTO `infection_notices` VALUES ('318', '64', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('319', '65', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('320', '66', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('321', '67', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('322', '68', '请尽快上传文件', '2017-07-03 15:45:18', '1', '0');
INSERT INTO `infection_notices` VALUES ('323', '69', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('324', '70', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('325', '71', '请尽快上传文件', '2017-07-03 15:45:18', '0', '0');
INSERT INTO `infection_notices` VALUES ('326', '3', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('327', '4', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('328', '5', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('329', '22', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('330', '23', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('331', '25', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('332', '26', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('333', '27', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('334', '28', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('335', '29', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('336', '30', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('337', '31', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('338', '32', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('339', '33', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('340', '34', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('341', '35', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('342', '36', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('343', '37', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('344', '38', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('345', '39', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('346', '40', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('347', '41', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('348', '42', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('349', '43', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('350', '44', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('351', '45', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('352', '46', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('353', '48', '请尽快上传文件', '2017-07-03 15:45:23', '1', '0');
INSERT INTO `infection_notices` VALUES ('354', '49', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('355', '50', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('356', '51', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('357', '52', '请尽快上传文件', '2017-07-03 15:45:23', '1', '0');
INSERT INTO `infection_notices` VALUES ('358', '53', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('359', '54', '请尽快上传文件', '2017-07-03 15:45:23', '1', '0');
INSERT INTO `infection_notices` VALUES ('360', '55', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('361', '56', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('362', '57', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('363', '58', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('364', '59', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('365', '60', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('366', '61', '请尽快上传文件', '2017-07-03 15:45:23', '1', '0');
INSERT INTO `infection_notices` VALUES ('367', '62', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('368', '63', '请尽快上传文件', '2017-07-03 15:45:23', '1', '0');
INSERT INTO `infection_notices` VALUES ('369', '64', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('370', '65', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('371', '66', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('372', '67', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('373', '68', '请尽快上传文件', '2017-07-03 15:45:23', '1', '0');
INSERT INTO `infection_notices` VALUES ('374', '69', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('375', '70', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('376', '71', '请尽快上传文件', '2017-07-03 15:45:23', '0', '0');
INSERT INTO `infection_notices` VALUES ('377', '46', '请尽快上传文件', '2017-07-03 15:55:32', '0', '0');
INSERT INTO `infection_notices` VALUES ('378', '48', '请尽快上传文件', '2017-07-03 15:55:32', '1', '0');
INSERT INTO `infection_notices` VALUES ('379', '49', '请尽快上传文件', '2017-07-03 15:55:32', '0', '0');
INSERT INTO `infection_notices` VALUES ('380', '50', '请尽快上传文件', '2017-07-03 15:55:32', '0', '0');
INSERT INTO `infection_notices` VALUES ('381', '51', '请尽快上传文件', '2017-07-03 15:55:32', '0', '0');
INSERT INTO `infection_notices` VALUES ('382', '52', '请尽快上传文件', '2017-07-03 15:55:32', '1', '0');
INSERT INTO `infection_notices` VALUES ('383', '53', '请尽快上传文件', '2017-07-03 15:55:32', '0', '0');
INSERT INTO `infection_notices` VALUES ('384', '54', '请尽快上传文件', '2017-07-03 15:55:32', '1', '0');
INSERT INTO `infection_notices` VALUES ('385', '55', '请尽快上传文件', '2017-07-03 15:55:32', '0', '0');
INSERT INTO `infection_notices` VALUES ('386', '56', '请尽快上传文件', '2017-07-03 15:55:32', '0', '0');
INSERT INTO `infection_notices` VALUES ('387', '57', '请尽快上传文件', '2017-07-03 15:55:32', '0', '0');
INSERT INTO `infection_notices` VALUES ('388', '58', '请尽快上传文件', '2017-07-03 15:55:32', '0', '0');
INSERT INTO `infection_notices` VALUES ('389', '59', '请尽快上传文件', '2017-07-03 15:55:32', '0', '0');
INSERT INTO `infection_notices` VALUES ('390', '60', '请尽快上传文件', '2017-07-03 15:55:32', '0', '0');
INSERT INTO `infection_notices` VALUES ('391', '61', '请尽快上传文件', '2017-07-03 15:55:32', '1', '0');
INSERT INTO `infection_notices` VALUES ('392', '62', '请尽快上传文件', '2017-07-03 15:55:32', '0', '0');
INSERT INTO `infection_notices` VALUES ('393', '63', '请尽快上传文件', '2017-07-03 15:55:32', '1', '0');
INSERT INTO `infection_notices` VALUES ('394', '64', '请尽快上传文件', '2017-07-03 15:55:32', '0', '0');
INSERT INTO `infection_notices` VALUES ('395', '65', '请尽快上传文件', '2017-07-03 15:55:32', '0', '0');
INSERT INTO `infection_notices` VALUES ('396', '66', '请尽快上传文件', '2017-07-03 15:55:32', '0', '0');
INSERT INTO `infection_notices` VALUES ('397', '67', '请尽快上传文件', '2017-07-03 15:55:32', '0', '0');
INSERT INTO `infection_notices` VALUES ('398', '68', '请尽快上传文件', '2017-07-03 15:55:32', '1', '0');
INSERT INTO `infection_notices` VALUES ('399', '69', '请尽快上传文件', '2017-07-03 15:55:32', '0', '0');
INSERT INTO `infection_notices` VALUES ('400', '70', '请尽快上传文件', '2017-07-03 15:55:32', '0', '0');
INSERT INTO `infection_notices` VALUES ('401', '71', '请尽快上传文件', '2017-07-03 15:55:32', '0', '0');
INSERT INTO `infection_notices` VALUES ('402', '46', '请尽快上传文件', '2017-07-03 15:55:36', '0', '0');
INSERT INTO `infection_notices` VALUES ('403', '46', '请尽快上传文件', '2017-07-03 15:57:56', '0', '0');
INSERT INTO `infection_notices` VALUES ('404', '48', '请尽快上传文件', '2017-07-03 15:57:56', '1', '0');
INSERT INTO `infection_notices` VALUES ('405', '49', '请尽快上传文件', '2017-07-03 15:57:56', '0', '0');
INSERT INTO `infection_notices` VALUES ('406', '50', '请尽快上传文件', '2017-07-03 15:57:56', '0', '0');
INSERT INTO `infection_notices` VALUES ('407', '51', '请尽快上传文件', '2017-07-03 15:57:56', '0', '0');
INSERT INTO `infection_notices` VALUES ('408', '52', '请尽快上传文件', '2017-07-03 15:57:56', '1', '0');
INSERT INTO `infection_notices` VALUES ('409', '53', '请尽快上传文件', '2017-07-03 15:57:56', '0', '0');
INSERT INTO `infection_notices` VALUES ('410', '54', '请尽快上传文件', '2017-07-03 15:57:56', '1', '0');
INSERT INTO `infection_notices` VALUES ('411', '55', '请尽快上传文件', '2017-07-03 15:57:56', '0', '0');
INSERT INTO `infection_notices` VALUES ('412', '56', '请尽快上传文件', '2017-07-03 15:57:56', '0', '0');
INSERT INTO `infection_notices` VALUES ('413', '57', '请尽快上传文件', '2017-07-03 15:57:56', '0', '0');
INSERT INTO `infection_notices` VALUES ('414', '58', '请尽快上传文件', '2017-07-03 15:57:56', '0', '0');
INSERT INTO `infection_notices` VALUES ('415', '59', '请尽快上传文件', '2017-07-03 15:57:56', '0', '0');
INSERT INTO `infection_notices` VALUES ('416', '60', '请尽快上传文件', '2017-07-03 15:57:56', '0', '0');
INSERT INTO `infection_notices` VALUES ('417', '61', '请尽快上传文件', '2017-07-03 15:57:56', '1', '0');
INSERT INTO `infection_notices` VALUES ('418', '62', '请尽快上传文件', '2017-07-03 15:57:56', '0', '0');
INSERT INTO `infection_notices` VALUES ('419', '63', '请尽快上传文件', '2017-07-03 15:57:56', '1', '0');
INSERT INTO `infection_notices` VALUES ('420', '64', '请尽快上传文件', '2017-07-03 15:57:56', '0', '0');
INSERT INTO `infection_notices` VALUES ('421', '65', '请尽快上传文件', '2017-07-03 15:57:56', '0', '0');
INSERT INTO `infection_notices` VALUES ('422', '66', '请尽快上传文件', '2017-07-03 15:57:56', '0', '0');
INSERT INTO `infection_notices` VALUES ('423', '67', '请尽快上传文件', '2017-07-03 15:57:56', '0', '0');
INSERT INTO `infection_notices` VALUES ('424', '68', '请尽快上传文件', '2017-07-03 15:57:56', '1', '0');
INSERT INTO `infection_notices` VALUES ('425', '69', '请尽快上传文件', '2017-07-03 15:57:56', '0', '0');
INSERT INTO `infection_notices` VALUES ('426', '70', '请尽快上传文件', '2017-07-03 15:57:56', '0', '0');
INSERT INTO `infection_notices` VALUES ('427', '71', '请尽快上传文件', '2017-07-03 15:57:56', '0', '0');
INSERT INTO `infection_notices` VALUES ('428', '46', '请尽快上传文件', '2017-07-03 15:58:01', '0', '0');
INSERT INTO `infection_notices` VALUES ('429', '48', '请尽快上传文件', '2017-07-03 15:58:01', '1', '0');
INSERT INTO `infection_notices` VALUES ('430', '49', '请尽快上传文件', '2017-07-03 15:58:01', '0', '0');
INSERT INTO `infection_notices` VALUES ('431', '50', '请尽快上传文件', '2017-07-03 15:58:01', '0', '0');
INSERT INTO `infection_notices` VALUES ('432', '51', '请尽快上传文件', '2017-07-03 15:58:01', '0', '0');
INSERT INTO `infection_notices` VALUES ('433', '52', '请尽快上传文件', '2017-07-03 15:58:01', '1', '0');
INSERT INTO `infection_notices` VALUES ('434', '53', '请尽快上传文件', '2017-07-03 15:58:01', '0', '0');
INSERT INTO `infection_notices` VALUES ('435', '54', '请尽快上传文件', '2017-07-03 15:58:01', '1', '0');
INSERT INTO `infection_notices` VALUES ('436', '55', '请尽快上传文件', '2017-07-03 15:58:01', '0', '0');
INSERT INTO `infection_notices` VALUES ('437', '56', '请尽快上传文件', '2017-07-03 15:58:01', '0', '0');
INSERT INTO `infection_notices` VALUES ('438', '57', '请尽快上传文件', '2017-07-03 15:58:01', '0', '0');
INSERT INTO `infection_notices` VALUES ('439', '58', '请尽快上传文件', '2017-07-03 15:58:01', '0', '0');
INSERT INTO `infection_notices` VALUES ('440', '59', '请尽快上传文件', '2017-07-03 15:58:01', '0', '0');
INSERT INTO `infection_notices` VALUES ('441', '60', '请尽快上传文件', '2017-07-03 15:58:01', '0', '0');
INSERT INTO `infection_notices` VALUES ('442', '61', '请尽快上传文件', '2017-07-03 15:58:01', '1', '0');
INSERT INTO `infection_notices` VALUES ('443', '62', '请尽快上传文件', '2017-07-03 15:58:01', '0', '0');
INSERT INTO `infection_notices` VALUES ('444', '63', '请尽快上传文件', '2017-07-03 15:58:01', '1', '0');
INSERT INTO `infection_notices` VALUES ('445', '64', '请尽快上传文件', '2017-07-03 15:58:01', '1', '0');
INSERT INTO `infection_notices` VALUES ('446', '65', '请尽快上传文件', '2017-07-03 15:58:01', '0', '0');
INSERT INTO `infection_notices` VALUES ('447', '66', '请尽快上传文件', '2017-07-03 15:58:01', '0', '0');
INSERT INTO `infection_notices` VALUES ('448', '67', '请尽快上传文件', '2017-07-03 15:58:01', '0', '0');
INSERT INTO `infection_notices` VALUES ('449', '68', '请尽快上传文件', '2017-07-03 15:58:01', '1', '0');
INSERT INTO `infection_notices` VALUES ('450', '69', '请尽快上传文件', '2017-07-03 15:58:01', '0', '0');
INSERT INTO `infection_notices` VALUES ('451', '70', '请尽快上传文件', '2017-07-03 15:58:01', '0', '0');
INSERT INTO `infection_notices` VALUES ('452', '71', '请尽快上传文件', '2017-07-03 15:58:01', '0', '0');
INSERT INTO `infection_notices` VALUES ('453', '46', '请尽快上传文件', '2017-07-03 15:58:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('454', '48', '请尽快上传文件', '2017-07-03 15:58:05', '1', '0');
INSERT INTO `infection_notices` VALUES ('455', '49', '请尽快上传文件', '2017-07-03 15:58:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('456', '50', '请尽快上传文件', '2017-07-03 15:58:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('457', '51', '请尽快上传文件', '2017-07-03 15:58:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('458', '52', '请尽快上传文件', '2017-07-03 15:58:05', '1', '0');
INSERT INTO `infection_notices` VALUES ('459', '53', '请尽快上传文件', '2017-07-03 15:58:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('460', '54', '请尽快上传文件', '2017-07-03 15:58:05', '1', '0');
INSERT INTO `infection_notices` VALUES ('461', '55', '请尽快上传文件', '2017-07-03 15:58:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('462', '56', '请尽快上传文件', '2017-07-03 15:58:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('463', '57', '请尽快上传文件', '2017-07-03 15:58:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('464', '58', '请尽快上传文件', '2017-07-03 15:58:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('465', '59', '请尽快上传文件', '2017-07-03 15:58:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('466', '60', '请尽快上传文件', '2017-07-03 15:58:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('467', '61', '请尽快上传文件', '2017-07-03 15:58:05', '1', '0');
INSERT INTO `infection_notices` VALUES ('468', '62', '请尽快上传文件', '2017-07-03 15:58:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('469', '63', '请尽快上传文件', '2017-07-03 15:58:05', '1', '0');
INSERT INTO `infection_notices` VALUES ('470', '64', '请尽快上传文件', '2017-07-03 15:58:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('471', '65', '请尽快上传文件', '2017-07-03 15:58:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('472', '66', '请尽快上传文件', '2017-07-03 15:58:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('473', '67', '请尽快上传文件', '2017-07-03 15:58:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('474', '68', '请尽快上传文件', '2017-07-03 15:58:05', '1', '0');
INSERT INTO `infection_notices` VALUES ('475', '69', '请尽快上传文件', '2017-07-03 15:58:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('476', '70', '请尽快上传文件', '2017-07-03 15:58:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('477', '71', '请尽快上传文件', '2017-07-03 15:58:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('478', '46', '请尽快上传文件', '2017-07-03 16:31:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('479', '48', '请尽快上传文件', '2017-07-03 16:31:05', '1', '0');
INSERT INTO `infection_notices` VALUES ('480', '49', '请尽快上传文件', '2017-07-03 16:31:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('481', '50', '请尽快上传文件', '2017-07-03 16:31:05', '1', '0');
INSERT INTO `infection_notices` VALUES ('482', '51', '请尽快上传文件', '2017-07-03 16:31:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('483', '52', '请尽快上传文件', '2017-07-03 16:31:05', '1', '0');
INSERT INTO `infection_notices` VALUES ('484', '53', '请尽快上传文件', '2017-07-03 16:31:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('485', '54', '请尽快上传文件', '2017-07-03 16:31:05', '1', '0');
INSERT INTO `infection_notices` VALUES ('486', '55', '请尽快上传文件', '2017-07-03 16:31:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('487', '56', '请尽快上传文件', '2017-07-03 16:31:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('488', '57', '请尽快上传文件', '2017-07-03 16:31:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('489', '58', '请尽快上传文件', '2017-07-03 16:31:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('490', '59', '请尽快上传文件', '2017-07-03 16:31:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('491', '60', '请尽快上传文件', '2017-07-03 16:31:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('492', '61', '请尽快上传文件', '2017-07-03 16:31:05', '1', '0');
INSERT INTO `infection_notices` VALUES ('493', '62', '请尽快上传文件', '2017-07-03 16:31:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('494', '63', '请尽快上传文件', '2017-07-03 16:31:05', '1', '0');
INSERT INTO `infection_notices` VALUES ('495', '64', '请尽快上传文件', '2017-07-03 16:31:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('496', '65', '请尽快上传文件', '2017-07-03 16:31:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('497', '66', '请尽快上传文件', '2017-07-03 16:31:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('498', '67', '请尽快上传文件', '2017-07-03 16:31:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('499', '68', '请尽快上传文件', '2017-07-03 16:31:05', '1', '0');
INSERT INTO `infection_notices` VALUES ('500', '69', '请尽快上传文件', '2017-07-03 16:31:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('501', '70', '请尽快上传文件', '2017-07-03 16:31:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('502', '71', '请尽快上传文件', '2017-07-03 16:31:05', '0', '0');
INSERT INTO `infection_notices` VALUES ('503', '48', '请尽快上传文件', '2017-07-04 09:59:26', '0', '0');
INSERT INTO `infection_notices` VALUES ('504', '50', '请尽快上传文件', '2017-07-04 09:59:29', '0', '0');
INSERT INTO `infection_notices` VALUES ('505', '47', '请尽快上传文件', '2017-07-21 09:53:35', '0', '0');
INSERT INTO `infection_notices` VALUES ('506', '48', '请尽快上传文件', '2017-07-21 09:53:38', '0', '0');
INSERT INTO `infection_notices` VALUES ('507', '52', '请尽快上传文件', '2017-07-21 09:53:45', '0', '0');

-- ----------------------------
-- Table structure for infection_plan
-- ----------------------------
DROP TABLE IF EXISTS `infection_plan`;
CREATE TABLE `infection_plan` (
  `planId` int(11) NOT NULL AUTO_INCREMENT,
  `planName` varchar(255) DEFAULT NULL COMMENT '预案（制度）名称',
  PRIMARY KEY (`planId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infection_plan
-- ----------------------------
INSERT INTO `infection_plan` VALUES ('1', '突发卫生公共事件应急预案');
INSERT INTO `infection_plan` VALUES ('2', '传染病防控工作方案');
INSERT INTO `infection_plan` VALUES ('3', '传染病防控管理制度');
INSERT INTO `infection_plan` VALUES ('4', '晨午检制度');
INSERT INTO `infection_plan` VALUES ('5', '疫情上报制度');
INSERT INTO `infection_plan` VALUES ('6', '隔离制度');
INSERT INTO `infection_plan` VALUES ('7', '复课制度');
INSERT INTO `infection_plan` VALUES ('8', '消毒制度');
INSERT INTO `infection_plan` VALUES ('9', '消毒药品管理制度');
INSERT INTO `infection_plan` VALUES ('10', '紫外线消毒管理制度');
INSERT INTO `infection_plan` VALUES ('11', '通风制度');
INSERT INTO `infection_plan` VALUES ('12', '预防接种证查验制度');

-- ----------------------------
-- Table structure for infection_report
-- ----------------------------
DROP TABLE IF EXISTS `infection_report`;
CREATE TABLE `infection_report` (
  `cardId` int(11) NOT NULL AUTO_INCREMENT COMMENT '报卡编号',
  `schoolId` int(11) NOT NULL COMMENT '报告学校',
  `parentName` varchar(20) DEFAULT NULL COMMENT '家长姓名',
  `patientName` varchar(20) DEFAULT NULL COMMENT '患者姓名',
  `classes` varchar(50) DEFAULT NULL COMMENT '所在班级',
  `idNumber` varchar(50) DEFAULT NULL COMMENT '有效证件号',
  `sex` int(1) unsigned zerofill DEFAULT NULL COMMENT '性别: 0 男，1 女',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `birthDay` datetime DEFAULT NULL COMMENT '出生日期',
  `type` int(1) unsigned zerofill DEFAULT NULL COMMENT '病历类型',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `area` int(11) DEFAULT NULL COMMENT '所属区域',
  `telephone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `onsetTime` datetime DEFAULT NULL COMMENT '发病日期',
  `infectionId` int(11) DEFAULT NULL COMMENT '传染病id',
  `diagnosisTime` datetime DEFAULT NULL COMMENT '诊断日期',
  `result` varchar(50) DEFAULT NULL COMMENT '最终诊断结果',
  `deathTime` datetime DEFAULT NULL COMMENT '死亡日期',
  `reporter` varchar(50) DEFAULT NULL COMMENT '报告人',
  `fillTime` datetime NOT NULL COMMENT '填卡日期',
  `isInfectionnum` int(11) DEFAULT NULL COMMENT '密切接触者数量',
  `isInfection` int(1) unsigned zerofill DEFAULT NULL COMMENT '密切接触这有无相似症状',
  `isPass` int(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '审核1:通过0:未通过',
  `note` text COMMENT '备注',
  `isDel` int(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '是否删除0:存在1:删除',
  `diagnosisImg` text COMMENT '诊断病例图片（多个用，隔开）',
  `revisedTime` datetime DEFAULT NULL COMMENT '订正日期',
  `auditTime` datetime DEFAULT NULL COMMENT '审核日期',
  `restore` int(1) DEFAULT '0' COMMENT '复课状态 0:未复课，1:已复课',
  `restoreImg` text COMMENT '复课证明图片',
  `iszero` int(1) unsigned zerofill DEFAULT '0' COMMENT '是否是0报告 1:是，0:否',
  `keeptuneimg` text COMMENT '留调报告图片',
  `implementationimg` text COMMENT '整改落实情况图片',
  `end` int(1) unsigned zerofill DEFAULT '0' COMMENT '结案',
  PRIMARY KEY (`cardId`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infection_report
-- ----------------------------
INSERT INTO `infection_report` VALUES ('2', '3', '周润发', '小红', '五年五班', '1', '0', '5', '1995-06-09 00:00:00', '1', '天津市河西区政府大院', '4', '1', '2000-05-16 00:00:00', '10', '2015-06-04 00:00:00', '1', '2015-06-04 00:00:00', '1', '2016-06-07 00:00:00', null, '0', '1', '发发发付付df', '1', '', '2017-05-26 15:24:51', '2017-05-26 15:25:30', '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('3', '29', '', '小明', '三年六班', '1', '1', '6', '1995-06-09 00:00:00', '1', '天津市河西区政府大院', null, '1', '2000-05-16 00:00:00', '10', '2015-06-04 00:00:00', '1', '2015-06-04 00:00:00', '1', '2015-09-25 00:00:00', null, '1', '1', '1', '0', null, null, '2017-05-26 17:45:30', '1', '', '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('4', '3', '', '小刚', '四年二班', '1', '1', '7', '1995-06-09 00:00:00', '1', '天津市河西区政府大院', null, '1', '2000-05-16 00:00:00', '10', '2015-06-04 00:00:00', '1', '2015-06-04 00:00:00', '1', '2017-06-29 00:00:00', null, '1', '1', '1', '1', null, null, '2017-05-26 17:45:36', '1', '', '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('5', '4', '', '小李', '一年一班', '1', '0', '8', '1995-06-09 12:00:00', '1', '天津市河西区政府大院', null, '1350123456', '2000-05-16 12:00:00', '10', '2017-02-03 12:00:00', '测试结果', '2017-04-05 12:00:00', '1231', '2015-07-24 12:00:00', '12', '1', '0', '3454', '1', '', '2017-06-13 11:32:14', null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('6', '29', '', '王刚', '三年二班', '1', '0', '9', '1995-06-09 00:00:00', '1', '天津市武清区', null, '1350123456', '2000-05-16 00:00:00', '10', '2017-02-03 00:00:00', '测试结果', '2017-04-05 00:00:00', '1231', '2017-04-01 00:00:00', '15', '1', '0', '1', '0', null, null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('7', '4', '', '和珅', '九年二班', '1', '1', '11', '1999-12-12 00:00:00', '1', '天津市武清区', null, '1350123456', '2000-05-16 00:00:00', '10', '2015-06-04 00:00:00', '测试结果', '2017-04-05 00:00:00', '1231', '2016-09-20 00:00:00', '11', '1', '0', '1', '0', null, null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('8', '27', '', '纪晓岚', '八年一班', '1', '0', '11', '1999-12-12 00:00:00', '1', '天津市武清区', null, '1350123456', '2000-05-16 00:00:00', '10', '2015-06-04 00:00:00', '测试结果', '2017-04-05 00:00:00', '1231', '2016-09-22 00:00:00', '13', '1', '0', '1', '0', null, null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('9', '5', '', '张无忌', '七年七班', '1', '1', '10', '1999-12-12 00:00:00', '2', '天津市武清区', null, '1350123456', '2000-05-16 00:00:00', '11', '2017-06-07 00:00:00', '测试结果', '2017-04-05 00:00:00', '1231', '2016-01-22 00:00:00', '12', '1', '0', '1', '0', null, null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('11', '5', '', '周芷若', '六年十二班', '1', '0', '10', '1999-12-12 00:00:00', '2', '天津市武清区', null, '1350123456', '2000-05-16 00:00:00', '11', '2017-06-07 00:00:00', '测试结果', '2015-06-04 00:00:00', '1231', '2017-06-26 00:00:00', null, '1', '0', '1', '0', null, null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('13', '30', '', '赵敏', '六年七班', '1', '1', '8', '1999-12-12 00:00:00', '2', '天津市武清区', '4', '1350123456', '2000-05-16 00:00:00', '11', '2015-06-04 00:00:00', '测试结果', '2017-04-05 00:00:00', '1231', '2016-03-22 00:00:00', null, '1', '0', '1', '0', null, null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('14', '4', '', '灭绝师太', '六年十班', '1', '0', '9', '1999-12-12 00:00:00', '2', '天津市武清区', null, '1350123456', '2000-05-16 00:00:00', '11', '2017-12-03 00:00:00', '测试结果', '2017-04-05 00:00:00', '1231', '2017-06-25 00:00:00', null, '1', '0', '12', '0', '', '2017-05-26 15:24:41', null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('15', '22', '', '张三丰', '七年三班', '1', '0', '7', '1999-12-12 00:00:00', '2', '天津市北辰区xx道', null, '1350123456', '2000-05-16 00:00:00', '11', '2015-06-04 00:00:00', '测试结果', '2017-04-05 00:00:00', '1231', '2017-06-17 00:00:00', null, '0', '0', '1', '0', null, null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('16', '23', '', '丁明君', '五年五班', '1', '1', '5', '1999-12-12 00:00:00', '2', '天津市北辰区xx道', null, '1350123456', '2000-05-16 00:00:00', '11', '2017-12-03 00:00:00', '测试结果', '2017-04-05 00:00:00', '1231', '2017-02-14 00:00:00', null, '0', '0', '1', '0', null, null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('17', '26', '', '乔峰', '二年二班', '1', '0', '6', '1999-12-12 00:00:00', '2', '天津市北辰区xx道', null, '1350123456', '2016-10-12 00:00:00', '11', '2015-06-04 00:00:00', '测试结果', '2015-06-04 00:00:00', '1231', '2017-06-23 00:00:00', null, '0', '0', '1', '0', null, null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('18', '25', '', '宋远桥', '四年四班', '1', '1', '6', '1999-12-12 00:00:00', '2', '天津市北辰区xx道', null, '1350123456', '2016-10-12 00:00:00', '11', '2017-12-03 00:00:00', '测试结果', '2017-04-05 00:00:00', '1231', '2016-01-15 00:00:00', null, '0', '0', '1', '0', null, null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('19', '4', '', '邓超', '三年三班', '1', '0', '6', '1999-12-12 00:00:00', '2', '天津市北辰区xx道', null, '1350123456', '2016-10-12 00:00:00', '12', '2015-06-04 00:00:00', '测试结果', '2015-06-04 00:00:00', '1231', '2017-06-29 00:00:00', null, '0', '0', '1', '0', null, null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('20', '22', '', '周星驰', '一年四班', '1', '0', '6', '1999-12-12 00:00:00', '2', '天津市北辰区xx道', null, '1350123456', '2016-10-12 00:00:00', '12', '2017-12-03 00:00:00', '测试结果', '2017-04-05 00:00:00', '1231', '2017-06-30 00:00:00', null, '0', '0', '1', '0', null, null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('21', '30', '', '成龙', '九年一班', '1', '1', '6', '1999-12-12 00:00:00', '2', '天津市静海县xx镇某村', null, '1350123456', '2016-10-12 00:00:00', '12', '2015-06-04 00:00:00', '测试结果', '2015-06-04 00:00:00', '1231', '2016-08-13 00:00:00', null, '0', '0', '1', '0', null, null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('22', '23', '', '习近平', '二年一班', '1', '1', '5', '1999-12-12 12:00:00', '1', '天津市静海县xx镇某村', null, '1350123456', '2017-06-18 00:00:00', '14', '2017-06-19 00:00:00', '测试结果', '2017-04-05 00:00:00', '1231', '2015-11-17 00:00:00', null, '0', '1', '1', '0', '', '2017-06-19 15:27:47', '2017-06-19 15:28:24', '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('23', '4', '', '奥巴马', '三年二班', '1', '1', '8', '1999-12-12 00:00:00', '2', '天津市静海县xx镇某村', null, '1350123456', '2016-10-12 00:00:00', '12', '2017-12-03 00:00:00', '测试结果', '2017-04-05 00:00:00', '1231', '2017-06-30 00:00:00', null, '0', '0', '1', '0', null, null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('24', '5', '', '朴景惠', '六年四班', '1', '0', '10', '1999-12-12 00:00:00', '2', '天津市静海县xx镇某村', null, '1350123456', '2016-10-12 00:00:00', '12', '2017-12-03 00:00:00', '测试结果', '2017-04-05 00:00:00', '1231', '2016-08-17 00:00:00', null, '0', '0', '1', '0', null, null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('25', '31', '', '普京', '八年三班', '1', '1', '12', '1999-12-12 00:00:00', '2', '天津市静海县xx镇某村', null, '1350123456', '2016-10-12 00:00:00', '12', '2017-12-03 00:00:00', '测试结果', '2017-04-05 00:00:00', '1231', '2016-10-12 00:00:00', null, '0', '0', '1', '0', null, null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('26', '5', '', '马云', '七年二班', '1', '0', '20', '1999-12-12 00:00:00', '1', '天津市静海县xx镇某村', null, '1350123456', '2016-10-12 00:00:00', '2', '2017-12-03 00:00:00', '测试结果', '2017-04-05 00:00:00', '1231', '2015-10-21 00:00:00', null, '0', '0', '1', '0', null, null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('27', '29', '', '马化腾', '六年一班', '1', '1', '20', '2000-05-16 00:00:00', '1', '天津市静海县xx镇某村', null, '1350123456', '2017-03-30 15:28:49', '2', '2017-12-03 00:00:00', '测试结果', '2017-04-05 00:00:00', '1231', '2016-02-10 00:00:00', null, '0', '0', '1', '0', null, null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('28', '32', '', '乔布斯', '五年二班', '1', '0', '2', '2000-05-16 00:00:00', '1', '天津市静海县xx镇某村', null, '1350123456', '2017-03-30 15:28:49', '2', '2017-12-03 00:00:00', '测试结果', '2017-05-25 15:44:15', '1231', '2017-06-03 00:00:00', null, '0', '0', '1', '0', null, null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('29', '29', '', '李彦宏', '四年一班', '1', '1', '22', '2000-05-16 00:00:00', '1', '天津市静海县xx镇某村', null, '1350123456', '2017-03-30 15:28:49', '2', '2017-12-03 00:00:00', '测试结果', '2017-04-05 00:00:00', '1231', '2015-07-16 00:00:00', null, '0', '0', '1', '0', null, null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('30', '28', '', '扎克伯格', '三年四班', '1', '0', '21', '2000-05-16 00:00:00', '1', '天津市静海县xx镇某村', null, '1350123456', '2017-03-30 15:28:49', '2', '2017-12-03 00:00:00', '测试结果', '2017-04-05 00:00:00', '1231', '2016-12-22 00:00:00', null, '0', '0', '1', '0', null, null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('31', '27', '', '柳传志', '二年三班', '1', '1', '2', '2000-05-16 00:00:00', '2', '天津市红桥区芥园道56号', null, '1350123456', '2017-03-30 15:28:49', '11', '2017-12-03 00:00:00', '测试结果', '2017-05-25 15:40:42', '1231', '2016-11-22 00:00:00', null, '0', '0', '1', '0', null, null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('32', '22', '', '雍正', '一年二班', '1', '0', '52', '2000-05-16 00:00:00', '2', '天津市红桥区芥园道56号', null, '1350123456', '2017-03-30 15:28:49', '11', '2017-12-03 00:00:00', '测试结果', '2017-05-25 15:35:23', '1231', '2017-06-08 00:00:00', null, '0', '1', '1', '0', null, null, '2017-06-19 15:26:23', '1', '192.168.3.5:8080/Infection/UploadFile/2b68a8c6e59a4d2ab86b1659c273e29d.jpg,', '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('33', '31', '', '康熙', '中班', '1', '1', '10', '2000-05-16 00:00:00', '2', '天津市红桥区芥园道56号', null, '1350123456', '2017-03-30 15:28:49', '11', '2017-12-03 00:00:00', '测试结果', '2017-04-05 00:00:00', '1231', '2016-12-22 00:00:00', null, '0', '0', '1', '0', null, null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('34', '31', '', '乾隆', '大班', '1', '0', '62', '2000-05-16 00:00:00', '2', '天津市红桥区芥园道56号', null, '1350123456', '2017-03-30 15:28:49', '11', '2017-12-03 00:00:00', '测试结果', '2017-04-05 00:00:00', '1231', '2015-11-11 00:00:00', null, '0', '0', '1', '0', null, null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('35', '31', '', '慈禧', '小班', '1', '1', '45', '2000-05-16 00:00:00', '2', '天津市红桥区芥园道56号', null, '1350123456', '2017-03-30 15:28:49', '11', '2017-12-03 00:00:00', '测试结果', '2017-04-05 00:00:00', '1231', '2016-02-09 00:00:00', null, '0', '0', '1', '0', null, null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('36', '30', '', '张三', '二班', '12323', '0', '78', '2000-05-16 00:00:00', '1', '天津市红桥区芥园道56号', null, '1232323', '2017-05-25 15:29:05', '2', '1998-06-05 00:00:00', null, '2015-06-04 00:00:00', '地方', '2016-06-15 00:00:00', null, '1', '0', null, '0', null, null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('39', '31', '李四她爸', '李四', '三年二班', '123456', '1', '25', '2000-05-16 00:00:00', '1', '天津市红桥区芥园道56号', '2', '123456', '2017-05-25 15:29:09', '2', '2015-06-04 00:00:00', null, '2015-06-04 00:00:00', '高斯', '2015-07-09 00:00:00', null, '0', '0', '备注阿斯顿', '0', null, null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('40', '22', '王五姐', '王五', '四年5班', '123456', '0', '21', '2000-05-16 00:00:00', '1', '天津市', '3', '123456', '2017-05-25 15:29:11', '10', '1545-09-04 00:00:00', null, '2015-06-04 00:00:00', '都是', '2016-06-19 00:00:00', null, '1', '0', '下方123456', '0', null, null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('41', '23', '三胖', 'wuli韬韬', '三年二班', '66696966966', '0', '35', '1948-05-20 00:00:00', '1', '朝鲜大不列颠日不落共和国', '5', '6666666', '1987-05-27 00:00:00', '2', '1993-05-18 00:00:00', null, '0000-00-00 00:00:00', '金馆长', '2015-01-12 00:00:00', null, '1', '1', '疯牛病', '0', null, null, '2017-06-19 15:23:51', '1', '192.168.3.5:8080/Infection/UploadFile/af69abb357c3454da993bc32015e20e8.jpg,', '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('42', '30', '万三爷', '万三', '五年三班', '58976441', '1', '12', '2017-05-26 00:00:00', '1', '火星', '3', '4578451', null, '10', null, null, null, 'admin', '2017-05-26 00:00:00', null, '1', '1', '未死亡', '0', null, null, '2017-06-19 10:30:31', '1', '192.168.3.5:8080/Infection/UploadFile/6c5cfbbec3384418b9ff56255f57533c.jpg,', '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('43', '4', '林正英', '张学友', '八年一班', '897878', '0', '12', '2017-05-26 00:00:00', '2', '月球', '4', '4578451', null, '11', null, null, null, 'admin', '2017-08-03 00:00:00', null, '0', '1', '未死亡', '0', null, null, '2017-06-13 16:14:10', '1', '', '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('44', '4', '林正英', '张学友', '八年一班', '897878', '0', '12', '2017-05-26 00:00:00', '2', '月球', '4', '4578451', null, '11', null, null, null, 'admin', '2017-05-26 00:00:00', null, '0', '1', '未死亡', '0', null, null, '2017-06-13 15:41:33', '1', null, '0', '', null, '0');
INSERT INTO `infection_report` VALUES ('45', '27', '三鹿', '哇哈哈', '一班', '65656554', '0', '15', '2017-05-24 00:00:00', '1', '北京大厦', '2', '123457844', '2017-05-30 00:00:00', '2', '2017-05-31 00:00:00', null, null, 'admin', '2017-11-10 00:00:00', null, '0', '1', '美赞臣', '0', null, null, '2017-05-26 15:25:34', '1', null, '0', '', null, '1');
INSERT INTO `infection_report` VALUES ('46', '27', '三鹿', '贝因美', '大班', '4512578', '1', '1', '2017-05-01 00:00:00', '1', '冰火岛', '1', '12454521', '2017-05-15 00:00:00', '10', '2017-05-23 00:00:00', null, null, 'admin', '2017-07-07 00:00:00', null, '0', '1', '皇家美素佳儿', '0', '', '2017-05-26 15:25:51', '2017-06-13 16:19:37', '1', null, '0', '', '', '1');
INSERT INTO `infection_report` VALUES ('47', '28', '美赞臣', '雀巢', '留学班', '4578412265', '0', '1', '2017-05-01 12:00:00', '2', '水星', '5', '124578455', '2017-05-15 12:00:00', '13', '2017-05-16 12:00:00', null, null, 'admin', '2017-05-24 12:00:00', null, '0', '1', '雅培亲护低乳糖配方粉', '0', '', '2017-06-13 16:36:48', '2017-06-13 16:35:02', '1', '', '0', '', '', '1');
INSERT INTO `infection_report` VALUES ('48', '3', '李斯', '李四', '三年四班', '54564', '0', '12', '2017-05-17 00:00:00', '2', '天假滨海新区塘沽大道651号', '5', '124511', '2017-05-09 00:00:00', '11', '2017-05-17 00:00:00', null, null, '司马光', '2017-05-17 00:00:00', null, '0', '1', '李四的病例', '0', '', null, '2017-06-13 15:50:54', '1', '', '0', '', '', '1');
INSERT INTO `infection_report` VALUES ('49', '3', '李穗', '李四', '五年2班', '160710', '0', '13', '2004-06-09 12:00:00', '0', '天津静海', '0', '110120119', '2017-06-12 12:00:00', '21', '2017-06-14 12:00:00', null, null, 'lisi', '2017-06-14 12:00:00', '5', null, '1', '李四登革热', '0', '', '2017-06-19 10:05:57', '2017-06-14 11:03:11', '1', '', '0', '', '', '0');
INSERT INTO `infection_report` VALUES ('51', '3', '张志全', '张琳发', '二年一班', '1234324213', '0', '8', '2009-06-16 00:00:00', '1', '天津津南', '1', '13878432345', '2017-06-04 00:00:00', '37', '2017-06-23 00:00:00', null, null, '李四', '2015-02-04 00:00:00', '0', null, '0', '刚发现', '1', '', null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('56', '3', '李军', '李启文', '三年五班', '1231232', '0', '8', '2009-06-02 12:00:00', '0', '天津市西青区中北镇', '1', '1356454545', '2017-06-01 12:00:00', '22', '2017-06-02 12:00:00', null, null, '李四', '2017-06-15 12:00:00', '11', null, '1', '赶紧的', '0', '', '2017-06-22 15:54:34', '2017-06-22 10:07:37', '1', '', '0', null, null, '1');
INSERT INTO `infection_report` VALUES ('57', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-06-19 09:23:53', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('58', '3', '王景明', '王德刚', '三年二班', '23123123', '0', '8', '2009-06-08 00:00:00', '1', '天津西青区', '1', '136786782', '2017-06-01 00:00:00', '30', '2017-06-02 00:00:00', null, null, '李四', '2015-10-27 00:00:00', '11', null, '0', '赶紧的', '0', '', null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('59', '33', '康家富', '康乐天', '一年三班', '231231231', '0', '6', '2011-06-25 00:00:00', '1', '天津津南区', '1', '13477889723', '2017-06-05 00:00:00', '30', '2017-06-07 00:00:00', null, null, '钟爱国', '2017-06-08 00:00:00', '0', null, '0', '手动将付款了', '0', '192.168.0.196:8080/Infection/UploadFile/25eb101c3d814d8fbfbf17b5c88ddb3f.jpg,', null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('62', '3', '测试', '测试', '测试', '321321', '0', '6', '2011-06-15 00:00:00', '1', '测试', '1', '1354365434', '2017-06-07 00:00:00', '10', '2017-06-09 00:00:00', null, '2017-06-22 17:20:45', '李四', '2017-06-22 00:00:00', '0', null, '0', '测试', '0', '192.168.3.5:8080/Infection/UploadFile/00d576765c8845379f91a0c61641e19f.jpg,', null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('63', '3', '测试233', '测试22', '测试2', '13123', '1', '6', '2011-06-13 00:00:00', '1', '测试312', '1', '1231414', '2017-06-11 00:00:00', '2', '2017-06-12 00:00:00', null, '2017-06-22 17:20:47', '测试324', '2017-06-22 17:19:17', '0', null, '0', '', '0', '', null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('64', '38', '张铁柱', '张亮', '五年级', '20170608', '0', '13', '2004-06-22 12:00:00', '0', '天津市西青区海泰发展六道', '1', '18920204689', '2017-06-01 12:00:00', '39', '2017-06-08 12:00:00', null, null, '李老师', '2017-06-26 04:15:01', '5', null, '1', '疑似患有流行性腮腺炎，请留意观察，提高关注', '0', '192.168.0.142:8080/Infection/UploadFile/2c1c80dcc79b4cd49eec1eb5ebc86f71.jpg,', '2017-06-26 16:29:28', '2017-06-26 17:28:26', '1', '192.168.0.142:8080/Infection/UploadFile/8587d5b523314752907b669437413cf6.png,', '0', null, null, '1');
INSERT INTO `infection_report` VALUES ('65', '39', '小老命', '小明', '一年一班', '30021', '0', '5', '2012-06-04 00:00:00', '1', '天津市东丽区跃进路', '0', '13112018772', '2017-06-01 00:00:00', '57', '2017-06-01 00:00:00', null, null, '小虎', '2017-06-26 16:30:59', '2', null, '1', '', '0', '192.168.0.146:8080/Infection/UploadFile/a99e2f4289aa457c8f966ea9936fb4c4.png,null,', null, '2017-06-26 16:58:43', '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('66', '39', '李大白', '李白', '二年一班', '3222233', '0', '11', '2006-06-01 00:00:00', '1', '天津市东丽区跃进路', '0', '13245687234', '2017-06-01 00:00:00', '12', '2017-06-02 00:00:00', null, null, '小白', '2017-06-26 16:36:28', '4', null, '1', '打败', '0', 'localhost:8080/Infection/UploadFile/98b90cb1f4e249d99724ae58f6d8c5aa.jpg,', null, '2017-06-26 16:59:31', '0', null, '0', 'localhost:8080/Infection/UploadFile/2418b3796c06464fa3e79e3199bb8881.jpg,', 'localhost:8080/Infection/UploadFile/ef4ee94cc2f44751a1e6990ea67a44b8.jpg,', '0');
INSERT INTO `infection_report` VALUES ('67', '38', '李励', ' 李晓杰', '八年级', '20160406', '1', '15', '2002-06-04 12:00:00', '1', '天津市红桥区勤俭道', '0', '13505060890', '2017-06-02 12:00:00', '40', '2017-06-03 12:00:00', null, null, '刘老师', '2017-06-26 04:37:25', '3', null, '1', '发烧流鼻涕，伴随着咳嗽', '0', '', '2017-06-26 17:17:26', '2017-06-26 17:24:38', '1', '', '0', '', '', '1');
INSERT INTO `infection_report` VALUES ('68', '38', '李思雨', '李明', '九年级', '20170608', '0', '16', '2001-06-12 12:00:00', '1', '天津市东丽区', '1', '17820051120', '2017-06-20 12:00:00', '10', '2017-06-21 12:00:00', null, null, '赵安东', '2017-06-26 04:45:20', '1', null, '1', '', '0', '192.168.0.142:8080/Infection/UploadFile/69d1f8eb02f04b318b98b5038c51bc6a.jpg,', '2017-06-26 17:33:01', '2017-06-26 17:28:09', '0', null, '0', null, '', '0');
INSERT INTO `infection_report` VALUES ('69', '39', 'xukai', 'xukai', 'jjjjj', '123', '0', '31', '1986-04-17 12:00:00', '0', 'tjs', '0', '1111111111', '2016-06-08 12:00:00', '74', '2017-06-01 12:00:00', null, null, '', '2017-06-26 05:21:30', '0', null, '0', '', '1', 'localhost:8080/Infection/UploadFile/f3a1c55afa4b4871b1532861d96581cd.jpg,', '2017-06-26 17:21:39', null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('70', '41', '叶惠美', '周杰伦', ' 三年二班', '12113215', '0', '31', '1986-06-12 12:00:00', '1', 'dddddd ', '4', '6666', '2017-05-05 12:00:00', '37', '2017-06-01 12:00:00', null, null, '11515', '2017-06-26 05:40:33', '0', null, '0', '1', '0', 'localhost:8080/Infection/UploadFile/54377367c9e74a0bb3ea0bac2b47c9f3.jpg,', '2017-06-28 10:04:33', null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('72', '3', 'a', 'a', 'a', 'a', '0', '5', '2012-06-13 00:00:00', '0', 'ss', '0', 'eeeee', null, '2', null, null, null, 'dddd', '2017-06-28 11:50:02', null, null, '0', '', '0', '', null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('73', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-06-29 16:03:28', null, null, '0', null, '1', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('74', '25', '张山峰', '张安顺', '三年级', '20160202', '0', '14', '2003-06-04 00:00:00', '0', '西青', '2', '18920602602', '2017-06-01 00:00:00', '10', '2017-06-02 00:00:00', null, null, '刘老师', '2017-06-29 17:39:35', '2', null, '0', '疑似患有霍乱，请进一步确认', '1', '', null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('75', '30', '老明', '小明', '一年级一班', '30211233', '0', '10', '2007-06-01 00:00:00', '1', '2222', '0', '121212121212', '2017-06-14 00:00:00', '12', '2017-06-28 00:00:00', null, null, '老明，in', '2017-06-29 17:50:10', '22', null, '0', '', '1', '182.92.107.180:8080/Infection/UploadFile/83a121695a0d4a20b5ba8e9948e7e2fc.png,', null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('76', '3', '22', '11', '七年级', '222', '0', '0', '2017-06-06 12:00:00', '1', '22', '0', '222', '2017-06-01 12:00:00', '38', '2017-06-03 12:00:00', null, null, '2', '2017-06-29 05:51:25', '2', null, '1', '', '0', '182.92.107.180:8080/Infection/UploadFile/6e136e8518aa4d1fbe9d847c3038054f.png,', '2017-06-29 17:51:34', '2017-06-29 17:51:19', '1', '182.92.107.180:8080/Infection/UploadFile/7995c8b19e7b4dbd8c9844929e3d446c.png,', '0', '182.92.107.180:8080/Infection/UploadFile/229c9cd438d14dc0b604c07fcf9c7544.png,', null, '1');
INSERT INTO `infection_report` VALUES ('77', '3', '2', '老明', '三年一班', '2222', '0', '5', '2012-06-01 00:00:00', '0', '222', '0', '2222', '2017-06-01 00:00:00', '13', null, null, null, '22', '2017-06-29 18:02:04', '2', null, '0', '', '1', '182.92.107.180:8080/Infection/UploadFile/b0ce411c9c224c2fb75040f58080c042.png,', null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('78', '45', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-06-30 10:16:45', null, null, '0', null, '1', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('79', '53', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-06-30 10:17:14', null, null, '0', null, '1', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('80', '45', '测试', '测试', '小一班', '3222', '0', '4', '2013-06-01 12:00:00', '0', '对对对', '0', '1321234433', '2017-06-01 12:00:00', '37', null, null, null, '测试', '2017-06-30 10:18:49', '0', null, '1', '', '1', '', '2017-06-30 10:19:10', '2017-06-30 10:22:32', '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('81', '47', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-03 12:23:19', null, null, '0', null, '1', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('82', '47', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-03 12:27:59', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('83', '49', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-03 16:31:33', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('84', '69', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-03 16:38:56', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('85', '62', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-03 16:39:31', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('86', '63', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-03 16:50:13', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('87', '64', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-03 16:53:12', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('88', '52', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-03 16:59:35', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('89', '61', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-03 17:14:19', null, null, '0', null, '1', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('90', '55', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-03 17:18:35', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('91', '59', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-03 17:59:59', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('92', '71', 'ceshi', 'ceshi', 'ceshi', 'ceshi', '1', '2', '2015-07-01 00:00:00', '0', 'ceshi', '0', 'ceshi', '2017-07-01 00:00:00', '37', null, null, null, '0', '2017-07-03 18:20:40', null, null, '0', '', '0', '', null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('93', '54', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-03 18:37:03', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('94', '48', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-03 18:52:40', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('95', '61', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-04 08:44:49', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('96', '52', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-04 08:48:23', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('97', '54', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-04 09:09:39', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('98', '46', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-04 09:24:17', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('99', '47', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-04 09:27:02', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('100', '57', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-04 09:27:25', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('101', '49', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-04 09:27:47', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('102', '55', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-04 09:33:38', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('103', '46', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-10 09:29:41', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('104', '57', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-10 09:29:55', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('105', '46', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-11 09:00:37', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('106', '57', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-11 09:00:48', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('107', '52', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-12 08:52:48', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('108', '46', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-12 09:01:12', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('109', '57', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-12 09:01:25', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('110', '63', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-12 17:12:37', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('111', '46', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-14 09:29:31', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('112', '57', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-14 09:29:43', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('113', '46', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-17 09:21:19', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('114', '57', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-17 09:21:36', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('115', '62', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-17 11:40:24', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('116', '51', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-18 08:54:07', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('117', '46', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-18 08:59:49', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('118', '57', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-18 09:00:12', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('119', '62', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-18 09:19:59', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('120', '69', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-18 09:39:48', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('121', '68', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-18 09:41:30', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('122', '63', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-18 10:46:04', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('123', '49', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-18 15:33:45', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('124', '51', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-19 09:02:47', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('125', '49', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-19 09:11:24', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('126', '68', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-19 09:19:27', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('127', '46', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-19 09:23:24', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('128', '57', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-19 09:23:35', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('129', '62', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-19 17:13:23', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('130', '63', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-19 17:25:18', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('131', '68', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-20 08:24:35', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('132', '49', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-20 09:07:28', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('133', '46', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-20 09:07:33', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('134', '57', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-20 09:07:46', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('135', '62', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-20 09:29:55', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('136', '51', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-20 09:55:59', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('137', '68', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-21 08:16:15', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('138', '49', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-21 08:38:21', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('139', '46', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-21 08:56:36', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('140', '57', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-21 08:57:01', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('141', '62', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-21 09:38:26', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('142', '51', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-21 10:20:08', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('143', '46', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-31 08:56:37', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('144', '57', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-31 08:57:04', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('145', '68', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-31 09:16:28', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('146', '51', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-31 10:29:50', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('147', '62', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-07-31 15:32:44', null, null, '0', null, '0', null, null, null, '0', null, '0', null, null, '0');
INSERT INTO `infection_report` VALUES ('148', '68', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-08-01 08:23:02', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('149', '62', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-08-01 09:08:22', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('150', '46', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-08-01 09:10:40', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('151', '57', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-08-01 09:10:59', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('152', '49', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-08-01 09:12:06', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('153', '51', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-08-01 10:33:28', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('154', '62', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-08-02 09:15:27', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('155', '49', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-08-02 09:46:23', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('156', '51', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-08-02 10:28:41', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');
INSERT INTO `infection_report` VALUES ('157', '51', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-08-10 09:47:13', null, null, '0', null, '0', null, null, null, '0', null, '1', null, null, '0');

-- ----------------------------
-- Table structure for infection_report_tracking
-- ----------------------------
DROP TABLE IF EXISTS `infection_report_tracking`;
CREATE TABLE `infection_report_tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cardId` int(11) DEFAULT NULL COMMENT '报告卡id',
  `trackingtime` datetime DEFAULT NULL COMMENT '追踪日期',
  `trackingtext` text COMMENT '追踪文字描述',
  `trackingimg` text COMMENT '追踪图片描述',
  `trackingpeoplename` varchar(255) DEFAULT NULL COMMENT '追踪人姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infection_report_tracking
-- ----------------------------
INSERT INTO `infection_report_tracking` VALUES ('6', '64', '2017-06-26 16:22:01', '进一步观察中，确认患有腮腺炎', '', '天津第四十七中学');
INSERT INTO `infection_report_tracking` VALUES ('7', '64', '2017-06-26 16:22:10', '进一步观察中，确认患有腮腺炎', '', '天津第四十七中学');
INSERT INTO `infection_report_tracking` VALUES ('8', '64', '2017-06-26 16:24:57', '沙发斯蒂芬', '', '天津第四十七中学');
INSERT INTO `infection_report_tracking` VALUES ('9', '66', '2017-06-26 16:37:37', '一次追踪', 'localhost:8080/Infection/UploadFile/56345cbad2cc4b2f968808ffb2b4ce84.jpg,', '欢呼小学');
INSERT INTO `infection_report_tracking` VALUES ('10', '66', '2017-06-26 16:37:49', '一次追踪', 'localhost:8080/Infection/UploadFile/56345cbad2cc4b2f968808ffb2b4ce84.jpg,', '欢呼小学');
INSERT INTO `infection_report_tracking` VALUES ('11', '66', '2017-06-26 16:41:29', '测试', 'localhost:8080/Infection/UploadFile/69b58b1428cd43d999ca99ac41b6f329.jpg,', '欢呼小学');
INSERT INTO `infection_report_tracking` VALUES ('12', '69', '2017-06-26 17:22:07', '追踪备注', 'localhost:8080/Infection/UploadFile/0ac922bd0d7c4b68a4ed82ddeb33b62a.jpg,', '欢呼小学');
INSERT INTO `infection_report_tracking` VALUES ('13', '68', '2017-06-26 17:20:13', '', '192.168.0.142:8080/Infection/UploadFile/e5fb999a1e1149a3af5ee7a66c21d234.png,', '天津第四十七中学');
INSERT INTO `infection_report_tracking` VALUES ('14', '68', '2017-06-26 17:23:12', '132123', '', '天津第四十七中学');
INSERT INTO `infection_report_tracking` VALUES ('15', '70', '2017-06-28 10:43:07', '', '', '超管');
INSERT INTO `infection_report_tracking` VALUES ('16', '70', '2017-06-28 10:44:12', '', '', '超管');
INSERT INTO `infection_report_tracking` VALUES ('17', '70', '2017-06-28 10:44:40', '', '', '超管');
INSERT INTO `infection_report_tracking` VALUES ('18', '70', '2017-06-28 10:46:19', '', '', '超管');
INSERT INTO `infection_report_tracking` VALUES ('19', '70', '2017-06-28 10:46:39', '', '', '超管');
INSERT INTO `infection_report_tracking` VALUES ('20', '70', '2017-06-28 10:46:53', '', '', '超管');
INSERT INTO `infection_report_tracking` VALUES ('21', '70', '2017-06-28 10:49:16', '', '192.168.0.129:8080/Infection/UploadFile/b3c45cefc1d14156b7fc446be9532ed9.png,', '超管');
INSERT INTO `infection_report_tracking` VALUES ('22', '76', '2017-06-29 17:51:54', '', '182.92.107.180:8080/Infection/UploadFile/232c0795b10e445a86b98874ec5ffee2.png,', '超管');
INSERT INTO `infection_report_tracking` VALUES ('23', '80', '2017-06-30 10:19:38', '', '182.92.107.180:8080/Infection/UploadFile/b7ec861b86f54c4e9c668b27a645eaef.jpg,182.92.107.180:8080/Infection/UploadFile/f865fbc4407d40e78b88f5b18d5921f8.jpg,', '万科城伊顿慧智');

-- ----------------------------
-- Table structure for infection_school
-- ----------------------------
DROP TABLE IF EXISTS `infection_school`;
CREATE TABLE `infection_school` (
  `schoolId` int(11) NOT NULL AUTO_INCREMENT COMMENT '学校编号',
  `schoolCode` varchar(100) NOT NULL COMMENT '学校编码',
  `schoolName` varchar(100) NOT NULL COMMENT '学校名称',
  `address` varchar(100) NOT NULL COMMENT '学校地址',
  `level` int(11) DEFAULT NULL COMMENT '办学层次',
  `postalcode` varchar(100) NOT NULL COMMENT '邮政编码',
  `limkman` varchar(30) NOT NULL COMMENT '联系人',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `note` text COMMENT '备注',
  `lengthYear` int(1) DEFAULT '0' COMMENT '学校学制（63:0,54:1,53:2）',
  `elementary` int(1) DEFAULT '0' COMMENT '小学',
  `junior` int(1) DEFAULT '0' COMMENT '中学',
  `high` int(1) DEFAULT '0' COMMENT '高中',
  `university` int(1) DEFAULT '0' COMMENT '大学',
  `levelTime` date DEFAULT NULL COMMENT '升级时间',
  `introduction` text COMMENT '学校简介',
  `streetId` int(11) NOT NULL COMMENT '所属街道',
  PRIMARY KEY (`schoolId`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infection_school
-- ----------------------------
INSERT INTO `infection_school` VALUES ('153', 'qqq111', '合图学校', '核桃仁问题和我', '3', '324242', '红人馆', '32424', null, '0', '1', '0', '0', '0', '2017-08-11', null, '0');
INSERT INTO `infection_school` VALUES ('154', 'www111', '昊天中学', '共同任务和问题', '4', '12312312', '张志浩', '12312312', null, '1', '1', '1', '1', '0', null, null, '0');
INSERT INTO `infection_school` VALUES ('156', 'eee111', '六合学校', '特我很乖的', '4', '3241432', '啧啧啧', '31321', null, '2', '1', '1', '0', '0', null, null, '0');
INSERT INTO `infection_school` VALUES ('157', '001', '001', '112', '4', '300212', '122', '1222', null, '0', '0', '1', '1', '0', '2017-08-14', null, '0');

-- ----------------------------
-- Table structure for infection_school_plan
-- ----------------------------
DROP TABLE IF EXISTS `infection_school_plan`;
CREATE TABLE `infection_school_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `planId` int(11) NOT NULL COMMENT '预案（制度）Id',
  `schoolId` int(11) NOT NULL COMMENT '学校id',
  `planImg` text COMMENT '制度（预案）图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1671 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infection_school_plan
-- ----------------------------
INSERT INTO `infection_school_plan` VALUES ('51', '1', '3', 'localhost:8080/Infection/UploadFile/a448abdbc3194a7889f25f31372a26f5.xlsx');
INSERT INTO `infection_school_plan` VALUES ('52', '2', '3', '182.92.107.180:8080/Infection/UploadFile/23e6ef8950e943dc8b8dd751a8bd0313.rar');
INSERT INTO `infection_school_plan` VALUES ('53', '3', '3', null);
INSERT INTO `infection_school_plan` VALUES ('54', '4', '3', null);
INSERT INTO `infection_school_plan` VALUES ('55', '5', '3', null);
INSERT INTO `infection_school_plan` VALUES ('56', '6', '3', null);
INSERT INTO `infection_school_plan` VALUES ('57', '7', '3', null);
INSERT INTO `infection_school_plan` VALUES ('58', '8', '3', null);
INSERT INTO `infection_school_plan` VALUES ('59', '9', '3', null);
INSERT INTO `infection_school_plan` VALUES ('60', '10', '3', null);
INSERT INTO `infection_school_plan` VALUES ('61', '11', '3', null);
INSERT INTO `infection_school_plan` VALUES ('62', '12', '3', null);
INSERT INTO `infection_school_plan` VALUES ('63', '1', '4', null);
INSERT INTO `infection_school_plan` VALUES ('64', '2', '4', null);
INSERT INTO `infection_school_plan` VALUES ('65', '3', '4', null);
INSERT INTO `infection_school_plan` VALUES ('66', '4', '4', null);
INSERT INTO `infection_school_plan` VALUES ('67', '5', '4', null);
INSERT INTO `infection_school_plan` VALUES ('68', '6', '4', null);
INSERT INTO `infection_school_plan` VALUES ('69', '7', '4', null);
INSERT INTO `infection_school_plan` VALUES ('70', '8', '4', null);
INSERT INTO `infection_school_plan` VALUES ('71', '9', '4', null);
INSERT INTO `infection_school_plan` VALUES ('72', '10', '4', null);
INSERT INTO `infection_school_plan` VALUES ('73', '11', '4', null);
INSERT INTO `infection_school_plan` VALUES ('74', '12', '4', null);
INSERT INTO `infection_school_plan` VALUES ('75', '1', '5', null);
INSERT INTO `infection_school_plan` VALUES ('76', '2', '5', null);
INSERT INTO `infection_school_plan` VALUES ('77', '3', '5', null);
INSERT INTO `infection_school_plan` VALUES ('78', '4', '5', null);
INSERT INTO `infection_school_plan` VALUES ('79', '5', '5', null);
INSERT INTO `infection_school_plan` VALUES ('80', '6', '5', null);
INSERT INTO `infection_school_plan` VALUES ('81', '7', '5', null);
INSERT INTO `infection_school_plan` VALUES ('82', '8', '5', null);
INSERT INTO `infection_school_plan` VALUES ('83', '9', '5', null);
INSERT INTO `infection_school_plan` VALUES ('84', '10', '5', null);
INSERT INTO `infection_school_plan` VALUES ('85', '11', '5', null);
INSERT INTO `infection_school_plan` VALUES ('86', '12', '5', null);
INSERT INTO `infection_school_plan` VALUES ('87', '1', '22', null);
INSERT INTO `infection_school_plan` VALUES ('88', '2', '22', null);
INSERT INTO `infection_school_plan` VALUES ('89', '3', '22', null);
INSERT INTO `infection_school_plan` VALUES ('90', '4', '22', null);
INSERT INTO `infection_school_plan` VALUES ('91', '5', '22', null);
INSERT INTO `infection_school_plan` VALUES ('92', '6', '22', null);
INSERT INTO `infection_school_plan` VALUES ('93', '7', '22', null);
INSERT INTO `infection_school_plan` VALUES ('94', '8', '22', null);
INSERT INTO `infection_school_plan` VALUES ('95', '9', '22', null);
INSERT INTO `infection_school_plan` VALUES ('96', '10', '22', null);
INSERT INTO `infection_school_plan` VALUES ('97', '11', '22', null);
INSERT INTO `infection_school_plan` VALUES ('98', '12', '22', null);
INSERT INTO `infection_school_plan` VALUES ('99', '1', '23', null);
INSERT INTO `infection_school_plan` VALUES ('100', '2', '23', null);
INSERT INTO `infection_school_plan` VALUES ('101', '3', '23', null);
INSERT INTO `infection_school_plan` VALUES ('102', '4', '23', null);
INSERT INTO `infection_school_plan` VALUES ('103', '5', '23', null);
INSERT INTO `infection_school_plan` VALUES ('104', '6', '23', null);
INSERT INTO `infection_school_plan` VALUES ('105', '7', '23', null);
INSERT INTO `infection_school_plan` VALUES ('106', '8', '23', null);
INSERT INTO `infection_school_plan` VALUES ('107', '9', '23', null);
INSERT INTO `infection_school_plan` VALUES ('108', '10', '23', null);
INSERT INTO `infection_school_plan` VALUES ('109', '11', '23', null);
INSERT INTO `infection_school_plan` VALUES ('110', '12', '23', null);
INSERT INTO `infection_school_plan` VALUES ('111', '1', '25', null);
INSERT INTO `infection_school_plan` VALUES ('112', '2', '25', null);
INSERT INTO `infection_school_plan` VALUES ('113', '3', '25', null);
INSERT INTO `infection_school_plan` VALUES ('114', '4', '25', null);
INSERT INTO `infection_school_plan` VALUES ('115', '5', '25', null);
INSERT INTO `infection_school_plan` VALUES ('116', '6', '25', null);
INSERT INTO `infection_school_plan` VALUES ('117', '7', '25', null);
INSERT INTO `infection_school_plan` VALUES ('118', '8', '25', null);
INSERT INTO `infection_school_plan` VALUES ('119', '9', '25', null);
INSERT INTO `infection_school_plan` VALUES ('120', '10', '25', null);
INSERT INTO `infection_school_plan` VALUES ('121', '11', '25', null);
INSERT INTO `infection_school_plan` VALUES ('122', '12', '25', null);
INSERT INTO `infection_school_plan` VALUES ('123', '1', '26', null);
INSERT INTO `infection_school_plan` VALUES ('124', '2', '26', null);
INSERT INTO `infection_school_plan` VALUES ('125', '3', '26', null);
INSERT INTO `infection_school_plan` VALUES ('126', '4', '26', null);
INSERT INTO `infection_school_plan` VALUES ('127', '5', '26', null);
INSERT INTO `infection_school_plan` VALUES ('128', '6', '26', null);
INSERT INTO `infection_school_plan` VALUES ('129', '7', '26', null);
INSERT INTO `infection_school_plan` VALUES ('130', '8', '26', null);
INSERT INTO `infection_school_plan` VALUES ('131', '9', '26', null);
INSERT INTO `infection_school_plan` VALUES ('132', '10', '26', null);
INSERT INTO `infection_school_plan` VALUES ('133', '11', '26', null);
INSERT INTO `infection_school_plan` VALUES ('134', '12', '26', null);
INSERT INTO `infection_school_plan` VALUES ('135', '1', '27', null);
INSERT INTO `infection_school_plan` VALUES ('136', '2', '27', null);
INSERT INTO `infection_school_plan` VALUES ('137', '3', '27', null);
INSERT INTO `infection_school_plan` VALUES ('138', '4', '27', null);
INSERT INTO `infection_school_plan` VALUES ('139', '5', '27', null);
INSERT INTO `infection_school_plan` VALUES ('140', '6', '27', null);
INSERT INTO `infection_school_plan` VALUES ('141', '7', '27', null);
INSERT INTO `infection_school_plan` VALUES ('142', '8', '27', null);
INSERT INTO `infection_school_plan` VALUES ('143', '9', '27', null);
INSERT INTO `infection_school_plan` VALUES ('144', '10', '27', null);
INSERT INTO `infection_school_plan` VALUES ('145', '11', '27', null);
INSERT INTO `infection_school_plan` VALUES ('146', '12', '27', null);
INSERT INTO `infection_school_plan` VALUES ('147', '1', '28', null);
INSERT INTO `infection_school_plan` VALUES ('148', '2', '28', null);
INSERT INTO `infection_school_plan` VALUES ('149', '3', '28', null);
INSERT INTO `infection_school_plan` VALUES ('150', '4', '28', null);
INSERT INTO `infection_school_plan` VALUES ('151', '5', '28', null);
INSERT INTO `infection_school_plan` VALUES ('152', '6', '28', null);
INSERT INTO `infection_school_plan` VALUES ('153', '7', '28', null);
INSERT INTO `infection_school_plan` VALUES ('154', '8', '28', null);
INSERT INTO `infection_school_plan` VALUES ('155', '9', '28', null);
INSERT INTO `infection_school_plan` VALUES ('156', '10', '28', null);
INSERT INTO `infection_school_plan` VALUES ('157', '11', '28', null);
INSERT INTO `infection_school_plan` VALUES ('158', '12', '28', null);
INSERT INTO `infection_school_plan` VALUES ('159', '1', '29', null);
INSERT INTO `infection_school_plan` VALUES ('160', '2', '29', null);
INSERT INTO `infection_school_plan` VALUES ('161', '3', '29', null);
INSERT INTO `infection_school_plan` VALUES ('162', '4', '29', null);
INSERT INTO `infection_school_plan` VALUES ('163', '5', '29', null);
INSERT INTO `infection_school_plan` VALUES ('164', '6', '29', null);
INSERT INTO `infection_school_plan` VALUES ('165', '7', '29', null);
INSERT INTO `infection_school_plan` VALUES ('166', '8', '29', null);
INSERT INTO `infection_school_plan` VALUES ('167', '9', '29', null);
INSERT INTO `infection_school_plan` VALUES ('168', '10', '29', null);
INSERT INTO `infection_school_plan` VALUES ('169', '11', '29', null);
INSERT INTO `infection_school_plan` VALUES ('170', '12', '29', null);
INSERT INTO `infection_school_plan` VALUES ('171', '1', '30', null);
INSERT INTO `infection_school_plan` VALUES ('172', '2', '30', null);
INSERT INTO `infection_school_plan` VALUES ('173', '3', '30', null);
INSERT INTO `infection_school_plan` VALUES ('174', '4', '30', null);
INSERT INTO `infection_school_plan` VALUES ('175', '5', '30', null);
INSERT INTO `infection_school_plan` VALUES ('176', '6', '30', null);
INSERT INTO `infection_school_plan` VALUES ('177', '7', '30', null);
INSERT INTO `infection_school_plan` VALUES ('178', '8', '30', null);
INSERT INTO `infection_school_plan` VALUES ('179', '9', '30', null);
INSERT INTO `infection_school_plan` VALUES ('180', '10', '30', null);
INSERT INTO `infection_school_plan` VALUES ('181', '11', '30', null);
INSERT INTO `infection_school_plan` VALUES ('182', '12', '30', null);
INSERT INTO `infection_school_plan` VALUES ('183', '1', '31', null);
INSERT INTO `infection_school_plan` VALUES ('184', '2', '31', null);
INSERT INTO `infection_school_plan` VALUES ('185', '3', '31', null);
INSERT INTO `infection_school_plan` VALUES ('186', '4', '31', null);
INSERT INTO `infection_school_plan` VALUES ('187', '5', '31', null);
INSERT INTO `infection_school_plan` VALUES ('188', '6', '31', null);
INSERT INTO `infection_school_plan` VALUES ('189', '7', '31', null);
INSERT INTO `infection_school_plan` VALUES ('190', '8', '31', null);
INSERT INTO `infection_school_plan` VALUES ('191', '9', '31', null);
INSERT INTO `infection_school_plan` VALUES ('192', '10', '31', null);
INSERT INTO `infection_school_plan` VALUES ('193', '11', '31', null);
INSERT INTO `infection_school_plan` VALUES ('194', '12', '31', null);
INSERT INTO `infection_school_plan` VALUES ('195', '1', '32', null);
INSERT INTO `infection_school_plan` VALUES ('196', '2', '32', null);
INSERT INTO `infection_school_plan` VALUES ('197', '3', '32', null);
INSERT INTO `infection_school_plan` VALUES ('198', '4', '32', null);
INSERT INTO `infection_school_plan` VALUES ('199', '5', '32', null);
INSERT INTO `infection_school_plan` VALUES ('200', '6', '32', null);
INSERT INTO `infection_school_plan` VALUES ('201', '7', '32', null);
INSERT INTO `infection_school_plan` VALUES ('202', '8', '32', null);
INSERT INTO `infection_school_plan` VALUES ('203', '9', '32', null);
INSERT INTO `infection_school_plan` VALUES ('204', '10', '32', null);
INSERT INTO `infection_school_plan` VALUES ('205', '11', '32', null);
INSERT INTO `infection_school_plan` VALUES ('206', '12', '32', null);
INSERT INTO `infection_school_plan` VALUES ('207', '1', '33', null);
INSERT INTO `infection_school_plan` VALUES ('208', '2', '33', null);
INSERT INTO `infection_school_plan` VALUES ('209', '3', '33', null);
INSERT INTO `infection_school_plan` VALUES ('210', '4', '33', null);
INSERT INTO `infection_school_plan` VALUES ('211', '5', '33', null);
INSERT INTO `infection_school_plan` VALUES ('212', '6', '33', null);
INSERT INTO `infection_school_plan` VALUES ('213', '7', '33', null);
INSERT INTO `infection_school_plan` VALUES ('214', '8', '33', null);
INSERT INTO `infection_school_plan` VALUES ('215', '9', '33', null);
INSERT INTO `infection_school_plan` VALUES ('216', '10', '33', null);
INSERT INTO `infection_school_plan` VALUES ('217', '11', '33', null);
INSERT INTO `infection_school_plan` VALUES ('218', '12', '33', null);
INSERT INTO `infection_school_plan` VALUES ('219', '1', '34', null);
INSERT INTO `infection_school_plan` VALUES ('220', '2', '34', null);
INSERT INTO `infection_school_plan` VALUES ('221', '3', '34', null);
INSERT INTO `infection_school_plan` VALUES ('222', '4', '34', null);
INSERT INTO `infection_school_plan` VALUES ('223', '5', '34', null);
INSERT INTO `infection_school_plan` VALUES ('224', '6', '34', null);
INSERT INTO `infection_school_plan` VALUES ('225', '7', '34', null);
INSERT INTO `infection_school_plan` VALUES ('226', '8', '34', null);
INSERT INTO `infection_school_plan` VALUES ('227', '9', '34', null);
INSERT INTO `infection_school_plan` VALUES ('228', '10', '34', null);
INSERT INTO `infection_school_plan` VALUES ('229', '11', '34', null);
INSERT INTO `infection_school_plan` VALUES ('230', '12', '34', null);
INSERT INTO `infection_school_plan` VALUES ('231', '1', '35', null);
INSERT INTO `infection_school_plan` VALUES ('232', '2', '35', null);
INSERT INTO `infection_school_plan` VALUES ('233', '3', '35', null);
INSERT INTO `infection_school_plan` VALUES ('234', '4', '35', null);
INSERT INTO `infection_school_plan` VALUES ('235', '5', '35', null);
INSERT INTO `infection_school_plan` VALUES ('236', '6', '35', null);
INSERT INTO `infection_school_plan` VALUES ('237', '7', '35', null);
INSERT INTO `infection_school_plan` VALUES ('238', '8', '35', null);
INSERT INTO `infection_school_plan` VALUES ('239', '9', '35', null);
INSERT INTO `infection_school_plan` VALUES ('240', '10', '35', null);
INSERT INTO `infection_school_plan` VALUES ('241', '11', '35', null);
INSERT INTO `infection_school_plan` VALUES ('242', '12', '35', null);
INSERT INTO `infection_school_plan` VALUES ('243', '1', '36', null);
INSERT INTO `infection_school_plan` VALUES ('244', '2', '36', null);
INSERT INTO `infection_school_plan` VALUES ('245', '3', '36', null);
INSERT INTO `infection_school_plan` VALUES ('246', '4', '36', null);
INSERT INTO `infection_school_plan` VALUES ('247', '5', '36', null);
INSERT INTO `infection_school_plan` VALUES ('248', '6', '36', null);
INSERT INTO `infection_school_plan` VALUES ('249', '7', '36', null);
INSERT INTO `infection_school_plan` VALUES ('250', '8', '36', null);
INSERT INTO `infection_school_plan` VALUES ('251', '9', '36', null);
INSERT INTO `infection_school_plan` VALUES ('252', '10', '36', null);
INSERT INTO `infection_school_plan` VALUES ('253', '11', '36', null);
INSERT INTO `infection_school_plan` VALUES ('254', '12', '36', null);
INSERT INTO `infection_school_plan` VALUES ('255', '1', '37', null);
INSERT INTO `infection_school_plan` VALUES ('256', '2', '37', null);
INSERT INTO `infection_school_plan` VALUES ('257', '3', '37', null);
INSERT INTO `infection_school_plan` VALUES ('258', '4', '37', null);
INSERT INTO `infection_school_plan` VALUES ('259', '5', '37', null);
INSERT INTO `infection_school_plan` VALUES ('260', '6', '37', null);
INSERT INTO `infection_school_plan` VALUES ('261', '7', '37', null);
INSERT INTO `infection_school_plan` VALUES ('262', '8', '37', null);
INSERT INTO `infection_school_plan` VALUES ('263', '9', '37', null);
INSERT INTO `infection_school_plan` VALUES ('264', '10', '37', null);
INSERT INTO `infection_school_plan` VALUES ('265', '11', '37', null);
INSERT INTO `infection_school_plan` VALUES ('266', '12', '37', null);
INSERT INTO `infection_school_plan` VALUES ('267', '1', '38', '192.168.0.142:8080/Infection/UploadFile/7092149a5667441091466d7ea196d41e.docx');
INSERT INTO `infection_school_plan` VALUES ('268', '2', '38', null);
INSERT INTO `infection_school_plan` VALUES ('269', '3', '38', null);
INSERT INTO `infection_school_plan` VALUES ('270', '4', '38', null);
INSERT INTO `infection_school_plan` VALUES ('271', '5', '38', null);
INSERT INTO `infection_school_plan` VALUES ('272', '6', '38', null);
INSERT INTO `infection_school_plan` VALUES ('273', '7', '38', null);
INSERT INTO `infection_school_plan` VALUES ('274', '8', '38', null);
INSERT INTO `infection_school_plan` VALUES ('275', '9', '38', null);
INSERT INTO `infection_school_plan` VALUES ('276', '10', '38', null);
INSERT INTO `infection_school_plan` VALUES ('277', '11', '38', null);
INSERT INTO `infection_school_plan` VALUES ('278', '12', '38', null);
INSERT INTO `infection_school_plan` VALUES ('279', '1', '39', 'localhost:8080/Infection/UploadFile/4dc97525e27b4aac97d20be4076651a9.zip');
INSERT INTO `infection_school_plan` VALUES ('280', '2', '39', 'localhost:8080/Infection/UploadFile/d71b58da28bd452cbdb60ac464b0a5d5.zip');
INSERT INTO `infection_school_plan` VALUES ('281', '3', '39', null);
INSERT INTO `infection_school_plan` VALUES ('282', '4', '39', null);
INSERT INTO `infection_school_plan` VALUES ('283', '5', '39', null);
INSERT INTO `infection_school_plan` VALUES ('284', '6', '39', null);
INSERT INTO `infection_school_plan` VALUES ('285', '7', '39', null);
INSERT INTO `infection_school_plan` VALUES ('286', '8', '39', null);
INSERT INTO `infection_school_plan` VALUES ('287', '9', '39', null);
INSERT INTO `infection_school_plan` VALUES ('288', '10', '39', null);
INSERT INTO `infection_school_plan` VALUES ('289', '11', '39', null);
INSERT INTO `infection_school_plan` VALUES ('290', '12', '39', null);
INSERT INTO `infection_school_plan` VALUES ('291', '1', '40', null);
INSERT INTO `infection_school_plan` VALUES ('292', '2', '40', null);
INSERT INTO `infection_school_plan` VALUES ('293', '3', '40', null);
INSERT INTO `infection_school_plan` VALUES ('294', '4', '40', null);
INSERT INTO `infection_school_plan` VALUES ('295', '5', '40', null);
INSERT INTO `infection_school_plan` VALUES ('296', '6', '40', null);
INSERT INTO `infection_school_plan` VALUES ('297', '7', '40', null);
INSERT INTO `infection_school_plan` VALUES ('298', '8', '40', null);
INSERT INTO `infection_school_plan` VALUES ('299', '9', '40', null);
INSERT INTO `infection_school_plan` VALUES ('300', '10', '40', null);
INSERT INTO `infection_school_plan` VALUES ('301', '11', '40', null);
INSERT INTO `infection_school_plan` VALUES ('302', '12', '40', null);
INSERT INTO `infection_school_plan` VALUES ('303', '1', '41', 'localhost:8080/Infection/UploadFile/839ba1fd7c004c6bb0bfdd76c2512e8d.docx');
INSERT INTO `infection_school_plan` VALUES ('304', '2', '41', null);
INSERT INTO `infection_school_plan` VALUES ('305', '3', '41', null);
INSERT INTO `infection_school_plan` VALUES ('306', '4', '41', null);
INSERT INTO `infection_school_plan` VALUES ('307', '5', '41', null);
INSERT INTO `infection_school_plan` VALUES ('308', '6', '41', null);
INSERT INTO `infection_school_plan` VALUES ('309', '7', '41', null);
INSERT INTO `infection_school_plan` VALUES ('310', '8', '41', null);
INSERT INTO `infection_school_plan` VALUES ('311', '9', '41', null);
INSERT INTO `infection_school_plan` VALUES ('312', '10', '41', null);
INSERT INTO `infection_school_plan` VALUES ('313', '11', '41', null);
INSERT INTO `infection_school_plan` VALUES ('314', '12', '41', null);
INSERT INTO `infection_school_plan` VALUES ('315', '1', '42', null);
INSERT INTO `infection_school_plan` VALUES ('316', '2', '42', null);
INSERT INTO `infection_school_plan` VALUES ('317', '3', '42', null);
INSERT INTO `infection_school_plan` VALUES ('318', '4', '42', null);
INSERT INTO `infection_school_plan` VALUES ('319', '5', '42', null);
INSERT INTO `infection_school_plan` VALUES ('320', '6', '42', null);
INSERT INTO `infection_school_plan` VALUES ('321', '7', '42', null);
INSERT INTO `infection_school_plan` VALUES ('322', '8', '42', null);
INSERT INTO `infection_school_plan` VALUES ('323', '9', '42', null);
INSERT INTO `infection_school_plan` VALUES ('324', '10', '42', null);
INSERT INTO `infection_school_plan` VALUES ('325', '11', '42', null);
INSERT INTO `infection_school_plan` VALUES ('326', '12', '42', null);
INSERT INTO `infection_school_plan` VALUES ('327', '1', '43', null);
INSERT INTO `infection_school_plan` VALUES ('328', '2', '43', null);
INSERT INTO `infection_school_plan` VALUES ('329', '3', '43', null);
INSERT INTO `infection_school_plan` VALUES ('330', '4', '43', null);
INSERT INTO `infection_school_plan` VALUES ('331', '5', '43', null);
INSERT INTO `infection_school_plan` VALUES ('332', '6', '43', null);
INSERT INTO `infection_school_plan` VALUES ('333', '7', '43', null);
INSERT INTO `infection_school_plan` VALUES ('334', '8', '43', null);
INSERT INTO `infection_school_plan` VALUES ('335', '9', '43', null);
INSERT INTO `infection_school_plan` VALUES ('336', '10', '43', null);
INSERT INTO `infection_school_plan` VALUES ('337', '11', '43', null);
INSERT INTO `infection_school_plan` VALUES ('338', '12', '43', null);
INSERT INTO `infection_school_plan` VALUES ('339', '1', '44', null);
INSERT INTO `infection_school_plan` VALUES ('340', '2', '44', null);
INSERT INTO `infection_school_plan` VALUES ('341', '3', '44', null);
INSERT INTO `infection_school_plan` VALUES ('342', '4', '44', null);
INSERT INTO `infection_school_plan` VALUES ('343', '5', '44', null);
INSERT INTO `infection_school_plan` VALUES ('344', '6', '44', null);
INSERT INTO `infection_school_plan` VALUES ('345', '7', '44', null);
INSERT INTO `infection_school_plan` VALUES ('346', '8', '44', null);
INSERT INTO `infection_school_plan` VALUES ('347', '9', '44', null);
INSERT INTO `infection_school_plan` VALUES ('348', '10', '44', null);
INSERT INTO `infection_school_plan` VALUES ('349', '11', '44', null);
INSERT INTO `infection_school_plan` VALUES ('350', '12', '44', null);
INSERT INTO `infection_school_plan` VALUES ('351', '1', '45', null);
INSERT INTO `infection_school_plan` VALUES ('352', '2', '45', null);
INSERT INTO `infection_school_plan` VALUES ('353', '3', '45', null);
INSERT INTO `infection_school_plan` VALUES ('354', '4', '45', null);
INSERT INTO `infection_school_plan` VALUES ('355', '5', '45', null);
INSERT INTO `infection_school_plan` VALUES ('356', '6', '45', null);
INSERT INTO `infection_school_plan` VALUES ('357', '7', '45', null);
INSERT INTO `infection_school_plan` VALUES ('358', '8', '45', null);
INSERT INTO `infection_school_plan` VALUES ('359', '9', '45', null);
INSERT INTO `infection_school_plan` VALUES ('360', '10', '45', null);
INSERT INTO `infection_school_plan` VALUES ('361', '11', '45', null);
INSERT INTO `infection_school_plan` VALUES ('362', '12', '45', null);
INSERT INTO `infection_school_plan` VALUES ('363', '1', '46', null);
INSERT INTO `infection_school_plan` VALUES ('364', '2', '46', null);
INSERT INTO `infection_school_plan` VALUES ('365', '3', '46', null);
INSERT INTO `infection_school_plan` VALUES ('366', '4', '46', null);
INSERT INTO `infection_school_plan` VALUES ('367', '5', '46', null);
INSERT INTO `infection_school_plan` VALUES ('368', '6', '46', null);
INSERT INTO `infection_school_plan` VALUES ('369', '7', '46', null);
INSERT INTO `infection_school_plan` VALUES ('370', '8', '46', null);
INSERT INTO `infection_school_plan` VALUES ('371', '9', '46', null);
INSERT INTO `infection_school_plan` VALUES ('372', '10', '46', null);
INSERT INTO `infection_school_plan` VALUES ('373', '11', '46', null);
INSERT INTO `infection_school_plan` VALUES ('374', '12', '46', null);
INSERT INTO `infection_school_plan` VALUES ('375', '1', '47', null);
INSERT INTO `infection_school_plan` VALUES ('376', '2', '47', null);
INSERT INTO `infection_school_plan` VALUES ('377', '3', '47', null);
INSERT INTO `infection_school_plan` VALUES ('378', '4', '47', null);
INSERT INTO `infection_school_plan` VALUES ('379', '5', '47', null);
INSERT INTO `infection_school_plan` VALUES ('380', '6', '47', null);
INSERT INTO `infection_school_plan` VALUES ('381', '7', '47', null);
INSERT INTO `infection_school_plan` VALUES ('382', '8', '47', null);
INSERT INTO `infection_school_plan` VALUES ('383', '9', '47', null);
INSERT INTO `infection_school_plan` VALUES ('384', '10', '47', null);
INSERT INTO `infection_school_plan` VALUES ('385', '11', '47', null);
INSERT INTO `infection_school_plan` VALUES ('386', '12', '47', null);
INSERT INTO `infection_school_plan` VALUES ('387', '1', '48', null);
INSERT INTO `infection_school_plan` VALUES ('388', '2', '48', null);
INSERT INTO `infection_school_plan` VALUES ('389', '3', '48', null);
INSERT INTO `infection_school_plan` VALUES ('390', '4', '48', null);
INSERT INTO `infection_school_plan` VALUES ('391', '5', '48', null);
INSERT INTO `infection_school_plan` VALUES ('392', '6', '48', null);
INSERT INTO `infection_school_plan` VALUES ('393', '7', '48', null);
INSERT INTO `infection_school_plan` VALUES ('394', '8', '48', null);
INSERT INTO `infection_school_plan` VALUES ('395', '9', '48', null);
INSERT INTO `infection_school_plan` VALUES ('396', '10', '48', null);
INSERT INTO `infection_school_plan` VALUES ('397', '11', '48', null);
INSERT INTO `infection_school_plan` VALUES ('398', '12', '48', null);
INSERT INTO `infection_school_plan` VALUES ('399', '1', '49', null);
INSERT INTO `infection_school_plan` VALUES ('400', '2', '49', null);
INSERT INTO `infection_school_plan` VALUES ('401', '3', '49', null);
INSERT INTO `infection_school_plan` VALUES ('402', '4', '49', null);
INSERT INTO `infection_school_plan` VALUES ('403', '5', '49', null);
INSERT INTO `infection_school_plan` VALUES ('404', '6', '49', null);
INSERT INTO `infection_school_plan` VALUES ('405', '7', '49', null);
INSERT INTO `infection_school_plan` VALUES ('406', '8', '49', null);
INSERT INTO `infection_school_plan` VALUES ('407', '9', '49', null);
INSERT INTO `infection_school_plan` VALUES ('408', '10', '49', null);
INSERT INTO `infection_school_plan` VALUES ('409', '11', '49', null);
INSERT INTO `infection_school_plan` VALUES ('410', '12', '49', null);
INSERT INTO `infection_school_plan` VALUES ('411', '1', '50', null);
INSERT INTO `infection_school_plan` VALUES ('412', '2', '50', null);
INSERT INTO `infection_school_plan` VALUES ('413', '3', '50', null);
INSERT INTO `infection_school_plan` VALUES ('414', '4', '50', null);
INSERT INTO `infection_school_plan` VALUES ('415', '5', '50', null);
INSERT INTO `infection_school_plan` VALUES ('416', '6', '50', null);
INSERT INTO `infection_school_plan` VALUES ('417', '7', '50', null);
INSERT INTO `infection_school_plan` VALUES ('418', '8', '50', null);
INSERT INTO `infection_school_plan` VALUES ('419', '9', '50', null);
INSERT INTO `infection_school_plan` VALUES ('420', '10', '50', null);
INSERT INTO `infection_school_plan` VALUES ('421', '11', '50', null);
INSERT INTO `infection_school_plan` VALUES ('422', '12', '50', null);
INSERT INTO `infection_school_plan` VALUES ('423', '1', '51', null);
INSERT INTO `infection_school_plan` VALUES ('424', '2', '51', null);
INSERT INTO `infection_school_plan` VALUES ('425', '3', '51', null);
INSERT INTO `infection_school_plan` VALUES ('426', '4', '51', null);
INSERT INTO `infection_school_plan` VALUES ('427', '5', '51', null);
INSERT INTO `infection_school_plan` VALUES ('428', '6', '51', null);
INSERT INTO `infection_school_plan` VALUES ('429', '7', '51', null);
INSERT INTO `infection_school_plan` VALUES ('430', '8', '51', null);
INSERT INTO `infection_school_plan` VALUES ('431', '9', '51', null);
INSERT INTO `infection_school_plan` VALUES ('432', '10', '51', null);
INSERT INTO `infection_school_plan` VALUES ('433', '11', '51', null);
INSERT INTO `infection_school_plan` VALUES ('434', '12', '51', null);
INSERT INTO `infection_school_plan` VALUES ('435', '1', '52', null);
INSERT INTO `infection_school_plan` VALUES ('436', '2', '52', null);
INSERT INTO `infection_school_plan` VALUES ('437', '3', '52', null);
INSERT INTO `infection_school_plan` VALUES ('438', '4', '52', null);
INSERT INTO `infection_school_plan` VALUES ('439', '5', '52', null);
INSERT INTO `infection_school_plan` VALUES ('440', '6', '52', null);
INSERT INTO `infection_school_plan` VALUES ('441', '7', '52', null);
INSERT INTO `infection_school_plan` VALUES ('442', '8', '52', null);
INSERT INTO `infection_school_plan` VALUES ('443', '9', '52', null);
INSERT INTO `infection_school_plan` VALUES ('444', '10', '52', null);
INSERT INTO `infection_school_plan` VALUES ('445', '11', '52', null);
INSERT INTO `infection_school_plan` VALUES ('446', '12', '52', null);
INSERT INTO `infection_school_plan` VALUES ('447', '1', '53', null);
INSERT INTO `infection_school_plan` VALUES ('448', '2', '53', null);
INSERT INTO `infection_school_plan` VALUES ('449', '3', '53', null);
INSERT INTO `infection_school_plan` VALUES ('450', '4', '53', null);
INSERT INTO `infection_school_plan` VALUES ('451', '5', '53', null);
INSERT INTO `infection_school_plan` VALUES ('452', '6', '53', null);
INSERT INTO `infection_school_plan` VALUES ('453', '7', '53', null);
INSERT INTO `infection_school_plan` VALUES ('454', '8', '53', null);
INSERT INTO `infection_school_plan` VALUES ('455', '9', '53', null);
INSERT INTO `infection_school_plan` VALUES ('456', '10', '53', null);
INSERT INTO `infection_school_plan` VALUES ('457', '11', '53', null);
INSERT INTO `infection_school_plan` VALUES ('458', '12', '53', null);
INSERT INTO `infection_school_plan` VALUES ('459', '1', '54', null);
INSERT INTO `infection_school_plan` VALUES ('460', '2', '54', null);
INSERT INTO `infection_school_plan` VALUES ('461', '3', '54', null);
INSERT INTO `infection_school_plan` VALUES ('462', '4', '54', null);
INSERT INTO `infection_school_plan` VALUES ('463', '5', '54', null);
INSERT INTO `infection_school_plan` VALUES ('464', '6', '54', null);
INSERT INTO `infection_school_plan` VALUES ('465', '7', '54', null);
INSERT INTO `infection_school_plan` VALUES ('466', '8', '54', null);
INSERT INTO `infection_school_plan` VALUES ('467', '9', '54', null);
INSERT INTO `infection_school_plan` VALUES ('468', '10', '54', null);
INSERT INTO `infection_school_plan` VALUES ('469', '11', '54', null);
INSERT INTO `infection_school_plan` VALUES ('470', '12', '54', null);
INSERT INTO `infection_school_plan` VALUES ('471', '1', '55', null);
INSERT INTO `infection_school_plan` VALUES ('472', '2', '55', null);
INSERT INTO `infection_school_plan` VALUES ('473', '3', '55', null);
INSERT INTO `infection_school_plan` VALUES ('474', '4', '55', null);
INSERT INTO `infection_school_plan` VALUES ('475', '5', '55', null);
INSERT INTO `infection_school_plan` VALUES ('476', '6', '55', null);
INSERT INTO `infection_school_plan` VALUES ('477', '7', '55', null);
INSERT INTO `infection_school_plan` VALUES ('478', '8', '55', null);
INSERT INTO `infection_school_plan` VALUES ('479', '9', '55', null);
INSERT INTO `infection_school_plan` VALUES ('480', '10', '55', null);
INSERT INTO `infection_school_plan` VALUES ('481', '11', '55', null);
INSERT INTO `infection_school_plan` VALUES ('482', '12', '55', null);
INSERT INTO `infection_school_plan` VALUES ('483', '1', '56', null);
INSERT INTO `infection_school_plan` VALUES ('484', '2', '56', null);
INSERT INTO `infection_school_plan` VALUES ('485', '3', '56', null);
INSERT INTO `infection_school_plan` VALUES ('486', '4', '56', null);
INSERT INTO `infection_school_plan` VALUES ('487', '5', '56', null);
INSERT INTO `infection_school_plan` VALUES ('488', '6', '56', null);
INSERT INTO `infection_school_plan` VALUES ('489', '7', '56', null);
INSERT INTO `infection_school_plan` VALUES ('490', '8', '56', null);
INSERT INTO `infection_school_plan` VALUES ('491', '9', '56', null);
INSERT INTO `infection_school_plan` VALUES ('492', '10', '56', null);
INSERT INTO `infection_school_plan` VALUES ('493', '11', '56', null);
INSERT INTO `infection_school_plan` VALUES ('494', '12', '56', null);
INSERT INTO `infection_school_plan` VALUES ('495', '1', '57', null);
INSERT INTO `infection_school_plan` VALUES ('496', '2', '57', null);
INSERT INTO `infection_school_plan` VALUES ('497', '3', '57', null);
INSERT INTO `infection_school_plan` VALUES ('498', '4', '57', null);
INSERT INTO `infection_school_plan` VALUES ('499', '5', '57', null);
INSERT INTO `infection_school_plan` VALUES ('500', '6', '57', null);
INSERT INTO `infection_school_plan` VALUES ('501', '7', '57', null);
INSERT INTO `infection_school_plan` VALUES ('502', '8', '57', null);
INSERT INTO `infection_school_plan` VALUES ('503', '9', '57', null);
INSERT INTO `infection_school_plan` VALUES ('504', '10', '57', null);
INSERT INTO `infection_school_plan` VALUES ('505', '11', '57', null);
INSERT INTO `infection_school_plan` VALUES ('506', '12', '57', null);
INSERT INTO `infection_school_plan` VALUES ('507', '1', '58', null);
INSERT INTO `infection_school_plan` VALUES ('508', '2', '58', null);
INSERT INTO `infection_school_plan` VALUES ('509', '3', '58', null);
INSERT INTO `infection_school_plan` VALUES ('510', '4', '58', null);
INSERT INTO `infection_school_plan` VALUES ('511', '5', '58', null);
INSERT INTO `infection_school_plan` VALUES ('512', '6', '58', null);
INSERT INTO `infection_school_plan` VALUES ('513', '7', '58', null);
INSERT INTO `infection_school_plan` VALUES ('514', '8', '58', null);
INSERT INTO `infection_school_plan` VALUES ('515', '9', '58', null);
INSERT INTO `infection_school_plan` VALUES ('516', '10', '58', null);
INSERT INTO `infection_school_plan` VALUES ('517', '11', '58', null);
INSERT INTO `infection_school_plan` VALUES ('518', '12', '58', null);
INSERT INTO `infection_school_plan` VALUES ('519', '1', '59', null);
INSERT INTO `infection_school_plan` VALUES ('520', '2', '59', null);
INSERT INTO `infection_school_plan` VALUES ('521', '3', '59', null);
INSERT INTO `infection_school_plan` VALUES ('522', '4', '59', null);
INSERT INTO `infection_school_plan` VALUES ('523', '5', '59', null);
INSERT INTO `infection_school_plan` VALUES ('524', '6', '59', null);
INSERT INTO `infection_school_plan` VALUES ('525', '7', '59', null);
INSERT INTO `infection_school_plan` VALUES ('526', '8', '59', null);
INSERT INTO `infection_school_plan` VALUES ('527', '9', '59', null);
INSERT INTO `infection_school_plan` VALUES ('528', '10', '59', null);
INSERT INTO `infection_school_plan` VALUES ('529', '11', '59', null);
INSERT INTO `infection_school_plan` VALUES ('530', '12', '59', null);
INSERT INTO `infection_school_plan` VALUES ('531', '1', '60', null);
INSERT INTO `infection_school_plan` VALUES ('532', '2', '60', null);
INSERT INTO `infection_school_plan` VALUES ('533', '3', '60', null);
INSERT INTO `infection_school_plan` VALUES ('534', '4', '60', null);
INSERT INTO `infection_school_plan` VALUES ('535', '5', '60', null);
INSERT INTO `infection_school_plan` VALUES ('536', '6', '60', null);
INSERT INTO `infection_school_plan` VALUES ('537', '7', '60', null);
INSERT INTO `infection_school_plan` VALUES ('538', '8', '60', null);
INSERT INTO `infection_school_plan` VALUES ('539', '9', '60', null);
INSERT INTO `infection_school_plan` VALUES ('540', '10', '60', null);
INSERT INTO `infection_school_plan` VALUES ('541', '11', '60', null);
INSERT INTO `infection_school_plan` VALUES ('542', '12', '60', null);
INSERT INTO `infection_school_plan` VALUES ('543', '1', '61', null);
INSERT INTO `infection_school_plan` VALUES ('544', '2', '61', null);
INSERT INTO `infection_school_plan` VALUES ('545', '3', '61', null);
INSERT INTO `infection_school_plan` VALUES ('546', '4', '61', null);
INSERT INTO `infection_school_plan` VALUES ('547', '5', '61', null);
INSERT INTO `infection_school_plan` VALUES ('548', '6', '61', null);
INSERT INTO `infection_school_plan` VALUES ('549', '7', '61', null);
INSERT INTO `infection_school_plan` VALUES ('550', '8', '61', null);
INSERT INTO `infection_school_plan` VALUES ('551', '9', '61', null);
INSERT INTO `infection_school_plan` VALUES ('552', '10', '61', null);
INSERT INTO `infection_school_plan` VALUES ('553', '11', '61', null);
INSERT INTO `infection_school_plan` VALUES ('554', '12', '61', null);
INSERT INTO `infection_school_plan` VALUES ('555', '1', '62', null);
INSERT INTO `infection_school_plan` VALUES ('556', '2', '62', null);
INSERT INTO `infection_school_plan` VALUES ('557', '3', '62', null);
INSERT INTO `infection_school_plan` VALUES ('558', '4', '62', null);
INSERT INTO `infection_school_plan` VALUES ('559', '5', '62', null);
INSERT INTO `infection_school_plan` VALUES ('560', '6', '62', null);
INSERT INTO `infection_school_plan` VALUES ('561', '7', '62', null);
INSERT INTO `infection_school_plan` VALUES ('562', '8', '62', null);
INSERT INTO `infection_school_plan` VALUES ('563', '9', '62', null);
INSERT INTO `infection_school_plan` VALUES ('564', '10', '62', null);
INSERT INTO `infection_school_plan` VALUES ('565', '11', '62', null);
INSERT INTO `infection_school_plan` VALUES ('566', '12', '62', null);
INSERT INTO `infection_school_plan` VALUES ('567', '1', '63', '182.92.107.180:8080/Infection/UploadFile/abb50a3c39c643bf891db91111a22660.doc');
INSERT INTO `infection_school_plan` VALUES ('568', '2', '63', '182.92.107.180:8080/Infection/UploadFile/e39baed28c6749b9a0a4f8d6c912682a.docx');
INSERT INTO `infection_school_plan` VALUES ('569', '3', '63', '182.92.107.180:8080/Infection/UploadFile/e8284fc6b2e34bfab6eddbcc9c7471e1.docx');
INSERT INTO `infection_school_plan` VALUES ('570', '4', '63', '182.92.107.180:8080/Infection/UploadFile/9eb74cedcbe7409a99743cf1d1f708e7.docx');
INSERT INTO `infection_school_plan` VALUES ('571', '5', '63', '182.92.107.180:8080/Infection/UploadFile/eed2d04aae4c406ea771d65c2106b24c.docx');
INSERT INTO `infection_school_plan` VALUES ('572', '6', '63', '182.92.107.180:8080/Infection/UploadFile/1d3c5a207e3148c69f55ed3a6cfd2a75.doc');
INSERT INTO `infection_school_plan` VALUES ('573', '7', '63', '182.92.107.180:8080/Infection/UploadFile/6f7bc093586c47a8bb9e752bc64a73bc.doc');
INSERT INTO `infection_school_plan` VALUES ('574', '8', '63', '182.92.107.180:8080/Infection/UploadFile/c13a48a631d24d6a8970f109cdd31949.doc');
INSERT INTO `infection_school_plan` VALUES ('575', '9', '63', '182.92.107.180:8080/Infection/UploadFile/ad51ea42281f4d0fa0aa35a39dfe7677.docx');
INSERT INTO `infection_school_plan` VALUES ('576', '10', '63', '182.92.107.180:8080/Infection/UploadFile/af28c357714f4e3b81410e65d496837d.docx');
INSERT INTO `infection_school_plan` VALUES ('577', '11', '63', '182.92.107.180:8080/Infection/UploadFile/f86b2a8d096942ad830520ad37ee9fe8.docx');
INSERT INTO `infection_school_plan` VALUES ('578', '12', '63', '182.92.107.180:8080/Infection/UploadFile/a9afc37f2a0343c59e17cd8fcc96def6.doc');
INSERT INTO `infection_school_plan` VALUES ('579', '1', '64', null);
INSERT INTO `infection_school_plan` VALUES ('580', '2', '64', null);
INSERT INTO `infection_school_plan` VALUES ('581', '3', '64', null);
INSERT INTO `infection_school_plan` VALUES ('582', '4', '64', null);
INSERT INTO `infection_school_plan` VALUES ('583', '5', '64', null);
INSERT INTO `infection_school_plan` VALUES ('584', '6', '64', null);
INSERT INTO `infection_school_plan` VALUES ('585', '7', '64', null);
INSERT INTO `infection_school_plan` VALUES ('586', '8', '64', null);
INSERT INTO `infection_school_plan` VALUES ('587', '9', '64', null);
INSERT INTO `infection_school_plan` VALUES ('588', '10', '64', null);
INSERT INTO `infection_school_plan` VALUES ('589', '11', '64', null);
INSERT INTO `infection_school_plan` VALUES ('590', '12', '64', null);
INSERT INTO `infection_school_plan` VALUES ('591', '1', '65', null);
INSERT INTO `infection_school_plan` VALUES ('592', '2', '65', null);
INSERT INTO `infection_school_plan` VALUES ('593', '3', '65', null);
INSERT INTO `infection_school_plan` VALUES ('594', '4', '65', null);
INSERT INTO `infection_school_plan` VALUES ('595', '5', '65', null);
INSERT INTO `infection_school_plan` VALUES ('596', '6', '65', null);
INSERT INTO `infection_school_plan` VALUES ('597', '7', '65', null);
INSERT INTO `infection_school_plan` VALUES ('598', '8', '65', null);
INSERT INTO `infection_school_plan` VALUES ('599', '9', '65', null);
INSERT INTO `infection_school_plan` VALUES ('600', '10', '65', null);
INSERT INTO `infection_school_plan` VALUES ('601', '11', '65', null);
INSERT INTO `infection_school_plan` VALUES ('602', '12', '65', null);
INSERT INTO `infection_school_plan` VALUES ('603', '1', '66', null);
INSERT INTO `infection_school_plan` VALUES ('604', '2', '66', null);
INSERT INTO `infection_school_plan` VALUES ('605', '3', '66', null);
INSERT INTO `infection_school_plan` VALUES ('606', '4', '66', null);
INSERT INTO `infection_school_plan` VALUES ('607', '5', '66', null);
INSERT INTO `infection_school_plan` VALUES ('608', '6', '66', null);
INSERT INTO `infection_school_plan` VALUES ('609', '7', '66', null);
INSERT INTO `infection_school_plan` VALUES ('610', '8', '66', null);
INSERT INTO `infection_school_plan` VALUES ('611', '9', '66', null);
INSERT INTO `infection_school_plan` VALUES ('612', '10', '66', null);
INSERT INTO `infection_school_plan` VALUES ('613', '11', '66', null);
INSERT INTO `infection_school_plan` VALUES ('614', '12', '66', null);
INSERT INTO `infection_school_plan` VALUES ('615', '1', '67', null);
INSERT INTO `infection_school_plan` VALUES ('616', '2', '67', null);
INSERT INTO `infection_school_plan` VALUES ('617', '3', '67', null);
INSERT INTO `infection_school_plan` VALUES ('618', '4', '67', null);
INSERT INTO `infection_school_plan` VALUES ('619', '5', '67', null);
INSERT INTO `infection_school_plan` VALUES ('620', '6', '67', null);
INSERT INTO `infection_school_plan` VALUES ('621', '7', '67', null);
INSERT INTO `infection_school_plan` VALUES ('622', '8', '67', null);
INSERT INTO `infection_school_plan` VALUES ('623', '9', '67', null);
INSERT INTO `infection_school_plan` VALUES ('624', '10', '67', null);
INSERT INTO `infection_school_plan` VALUES ('625', '11', '67', null);
INSERT INTO `infection_school_plan` VALUES ('626', '12', '67', null);
INSERT INTO `infection_school_plan` VALUES ('627', '1', '68', null);
INSERT INTO `infection_school_plan` VALUES ('628', '2', '68', null);
INSERT INTO `infection_school_plan` VALUES ('629', '3', '68', null);
INSERT INTO `infection_school_plan` VALUES ('630', '4', '68', null);
INSERT INTO `infection_school_plan` VALUES ('631', '5', '68', null);
INSERT INTO `infection_school_plan` VALUES ('632', '6', '68', null);
INSERT INTO `infection_school_plan` VALUES ('633', '7', '68', null);
INSERT INTO `infection_school_plan` VALUES ('634', '8', '68', null);
INSERT INTO `infection_school_plan` VALUES ('635', '9', '68', null);
INSERT INTO `infection_school_plan` VALUES ('636', '10', '68', null);
INSERT INTO `infection_school_plan` VALUES ('637', '11', '68', null);
INSERT INTO `infection_school_plan` VALUES ('638', '12', '68', null);
INSERT INTO `infection_school_plan` VALUES ('639', '1', '69', null);
INSERT INTO `infection_school_plan` VALUES ('640', '2', '69', null);
INSERT INTO `infection_school_plan` VALUES ('641', '3', '69', null);
INSERT INTO `infection_school_plan` VALUES ('642', '4', '69', null);
INSERT INTO `infection_school_plan` VALUES ('643', '5', '69', null);
INSERT INTO `infection_school_plan` VALUES ('644', '6', '69', null);
INSERT INTO `infection_school_plan` VALUES ('645', '7', '69', null);
INSERT INTO `infection_school_plan` VALUES ('646', '8', '69', null);
INSERT INTO `infection_school_plan` VALUES ('647', '9', '69', null);
INSERT INTO `infection_school_plan` VALUES ('648', '10', '69', null);
INSERT INTO `infection_school_plan` VALUES ('649', '11', '69', null);
INSERT INTO `infection_school_plan` VALUES ('650', '12', '69', null);
INSERT INTO `infection_school_plan` VALUES ('651', '1', '70', null);
INSERT INTO `infection_school_plan` VALUES ('652', '2', '70', null);
INSERT INTO `infection_school_plan` VALUES ('653', '3', '70', null);
INSERT INTO `infection_school_plan` VALUES ('654', '4', '70', null);
INSERT INTO `infection_school_plan` VALUES ('655', '5', '70', null);
INSERT INTO `infection_school_plan` VALUES ('656', '6', '70', null);
INSERT INTO `infection_school_plan` VALUES ('657', '7', '70', null);
INSERT INTO `infection_school_plan` VALUES ('658', '8', '70', null);
INSERT INTO `infection_school_plan` VALUES ('659', '9', '70', null);
INSERT INTO `infection_school_plan` VALUES ('660', '10', '70', null);
INSERT INTO `infection_school_plan` VALUES ('661', '11', '70', null);
INSERT INTO `infection_school_plan` VALUES ('662', '12', '70', null);
INSERT INTO `infection_school_plan` VALUES ('663', '1', '71', null);
INSERT INTO `infection_school_plan` VALUES ('664', '2', '71', null);
INSERT INTO `infection_school_plan` VALUES ('665', '3', '71', null);
INSERT INTO `infection_school_plan` VALUES ('666', '4', '71', null);
INSERT INTO `infection_school_plan` VALUES ('667', '5', '71', null);
INSERT INTO `infection_school_plan` VALUES ('668', '6', '71', null);
INSERT INTO `infection_school_plan` VALUES ('669', '7', '71', null);
INSERT INTO `infection_school_plan` VALUES ('670', '8', '71', null);
INSERT INTO `infection_school_plan` VALUES ('671', '9', '71', null);
INSERT INTO `infection_school_plan` VALUES ('672', '10', '71', null);
INSERT INTO `infection_school_plan` VALUES ('673', '11', '71', null);
INSERT INTO `infection_school_plan` VALUES ('674', '12', '71', null);
INSERT INTO `infection_school_plan` VALUES ('747', '1', '78', null);
INSERT INTO `infection_school_plan` VALUES ('748', '2', '78', null);
INSERT INTO `infection_school_plan` VALUES ('749', '3', '78', null);
INSERT INTO `infection_school_plan` VALUES ('750', '4', '78', null);
INSERT INTO `infection_school_plan` VALUES ('751', '5', '78', null);
INSERT INTO `infection_school_plan` VALUES ('752', '6', '78', null);
INSERT INTO `infection_school_plan` VALUES ('753', '7', '78', null);
INSERT INTO `infection_school_plan` VALUES ('754', '8', '78', null);
INSERT INTO `infection_school_plan` VALUES ('755', '9', '78', null);
INSERT INTO `infection_school_plan` VALUES ('756', '10', '78', null);
INSERT INTO `infection_school_plan` VALUES ('757', '11', '78', null);
INSERT INTO `infection_school_plan` VALUES ('758', '12', '78', null);
INSERT INTO `infection_school_plan` VALUES ('759', '1', '79', null);
INSERT INTO `infection_school_plan` VALUES ('760', '2', '79', null);
INSERT INTO `infection_school_plan` VALUES ('761', '3', '79', null);
INSERT INTO `infection_school_plan` VALUES ('762', '4', '79', null);
INSERT INTO `infection_school_plan` VALUES ('763', '5', '79', null);
INSERT INTO `infection_school_plan` VALUES ('764', '6', '79', null);
INSERT INTO `infection_school_plan` VALUES ('765', '7', '79', null);
INSERT INTO `infection_school_plan` VALUES ('766', '8', '79', null);
INSERT INTO `infection_school_plan` VALUES ('767', '9', '79', null);
INSERT INTO `infection_school_plan` VALUES ('768', '10', '79', null);
INSERT INTO `infection_school_plan` VALUES ('769', '11', '79', null);
INSERT INTO `infection_school_plan` VALUES ('770', '12', '79', null);
INSERT INTO `infection_school_plan` VALUES ('771', '1', '80', null);
INSERT INTO `infection_school_plan` VALUES ('772', '2', '80', null);
INSERT INTO `infection_school_plan` VALUES ('773', '3', '80', null);
INSERT INTO `infection_school_plan` VALUES ('774', '4', '80', null);
INSERT INTO `infection_school_plan` VALUES ('775', '5', '80', null);
INSERT INTO `infection_school_plan` VALUES ('776', '6', '80', null);
INSERT INTO `infection_school_plan` VALUES ('777', '7', '80', null);
INSERT INTO `infection_school_plan` VALUES ('778', '8', '80', null);
INSERT INTO `infection_school_plan` VALUES ('779', '9', '80', null);
INSERT INTO `infection_school_plan` VALUES ('780', '10', '80', null);
INSERT INTO `infection_school_plan` VALUES ('781', '11', '80', null);
INSERT INTO `infection_school_plan` VALUES ('782', '12', '80', null);
INSERT INTO `infection_school_plan` VALUES ('783', '1', '81', null);
INSERT INTO `infection_school_plan` VALUES ('784', '2', '81', null);
INSERT INTO `infection_school_plan` VALUES ('785', '3', '81', null);
INSERT INTO `infection_school_plan` VALUES ('786', '4', '81', null);
INSERT INTO `infection_school_plan` VALUES ('787', '5', '81', null);
INSERT INTO `infection_school_plan` VALUES ('788', '6', '81', null);
INSERT INTO `infection_school_plan` VALUES ('789', '7', '81', null);
INSERT INTO `infection_school_plan` VALUES ('790', '8', '81', null);
INSERT INTO `infection_school_plan` VALUES ('791', '9', '81', null);
INSERT INTO `infection_school_plan` VALUES ('792', '10', '81', null);
INSERT INTO `infection_school_plan` VALUES ('793', '11', '81', null);
INSERT INTO `infection_school_plan` VALUES ('794', '12', '81', null);
INSERT INTO `infection_school_plan` VALUES ('795', '1', '82', null);
INSERT INTO `infection_school_plan` VALUES ('796', '2', '82', null);
INSERT INTO `infection_school_plan` VALUES ('797', '3', '82', null);
INSERT INTO `infection_school_plan` VALUES ('798', '4', '82', null);
INSERT INTO `infection_school_plan` VALUES ('799', '5', '82', null);
INSERT INTO `infection_school_plan` VALUES ('800', '6', '82', null);
INSERT INTO `infection_school_plan` VALUES ('801', '7', '82', null);
INSERT INTO `infection_school_plan` VALUES ('802', '8', '82', null);
INSERT INTO `infection_school_plan` VALUES ('803', '9', '82', null);
INSERT INTO `infection_school_plan` VALUES ('804', '10', '82', null);
INSERT INTO `infection_school_plan` VALUES ('805', '11', '82', null);
INSERT INTO `infection_school_plan` VALUES ('806', '12', '82', null);
INSERT INTO `infection_school_plan` VALUES ('807', '1', '83', null);
INSERT INTO `infection_school_plan` VALUES ('808', '2', '83', null);
INSERT INTO `infection_school_plan` VALUES ('809', '3', '83', null);
INSERT INTO `infection_school_plan` VALUES ('810', '4', '83', null);
INSERT INTO `infection_school_plan` VALUES ('811', '5', '83', null);
INSERT INTO `infection_school_plan` VALUES ('812', '6', '83', null);
INSERT INTO `infection_school_plan` VALUES ('813', '7', '83', null);
INSERT INTO `infection_school_plan` VALUES ('814', '8', '83', null);
INSERT INTO `infection_school_plan` VALUES ('815', '9', '83', null);
INSERT INTO `infection_school_plan` VALUES ('816', '10', '83', null);
INSERT INTO `infection_school_plan` VALUES ('817', '11', '83', null);
INSERT INTO `infection_school_plan` VALUES ('818', '12', '83', null);
INSERT INTO `infection_school_plan` VALUES ('819', '1', '84', null);
INSERT INTO `infection_school_plan` VALUES ('820', '2', '84', null);
INSERT INTO `infection_school_plan` VALUES ('821', '3', '84', null);
INSERT INTO `infection_school_plan` VALUES ('822', '4', '84', null);
INSERT INTO `infection_school_plan` VALUES ('823', '5', '84', null);
INSERT INTO `infection_school_plan` VALUES ('824', '6', '84', null);
INSERT INTO `infection_school_plan` VALUES ('825', '7', '84', null);
INSERT INTO `infection_school_plan` VALUES ('826', '8', '84', null);
INSERT INTO `infection_school_plan` VALUES ('827', '9', '84', null);
INSERT INTO `infection_school_plan` VALUES ('828', '10', '84', null);
INSERT INTO `infection_school_plan` VALUES ('829', '11', '84', null);
INSERT INTO `infection_school_plan` VALUES ('830', '12', '84', null);
INSERT INTO `infection_school_plan` VALUES ('831', '1', '85', null);
INSERT INTO `infection_school_plan` VALUES ('832', '2', '85', null);
INSERT INTO `infection_school_plan` VALUES ('833', '3', '85', null);
INSERT INTO `infection_school_plan` VALUES ('834', '4', '85', null);
INSERT INTO `infection_school_plan` VALUES ('835', '5', '85', null);
INSERT INTO `infection_school_plan` VALUES ('836', '6', '85', null);
INSERT INTO `infection_school_plan` VALUES ('837', '7', '85', null);
INSERT INTO `infection_school_plan` VALUES ('838', '8', '85', null);
INSERT INTO `infection_school_plan` VALUES ('839', '9', '85', null);
INSERT INTO `infection_school_plan` VALUES ('840', '10', '85', null);
INSERT INTO `infection_school_plan` VALUES ('841', '11', '85', null);
INSERT INTO `infection_school_plan` VALUES ('842', '12', '85', null);
INSERT INTO `infection_school_plan` VALUES ('843', '1', '86', null);
INSERT INTO `infection_school_plan` VALUES ('844', '2', '86', null);
INSERT INTO `infection_school_plan` VALUES ('845', '3', '86', null);
INSERT INTO `infection_school_plan` VALUES ('846', '4', '86', null);
INSERT INTO `infection_school_plan` VALUES ('847', '5', '86', null);
INSERT INTO `infection_school_plan` VALUES ('848', '6', '86', null);
INSERT INTO `infection_school_plan` VALUES ('849', '7', '86', null);
INSERT INTO `infection_school_plan` VALUES ('850', '8', '86', null);
INSERT INTO `infection_school_plan` VALUES ('851', '9', '86', null);
INSERT INTO `infection_school_plan` VALUES ('852', '10', '86', null);
INSERT INTO `infection_school_plan` VALUES ('853', '11', '86', null);
INSERT INTO `infection_school_plan` VALUES ('854', '12', '86', null);
INSERT INTO `infection_school_plan` VALUES ('855', '1', '87', null);
INSERT INTO `infection_school_plan` VALUES ('856', '2', '87', null);
INSERT INTO `infection_school_plan` VALUES ('857', '3', '87', null);
INSERT INTO `infection_school_plan` VALUES ('858', '4', '87', null);
INSERT INTO `infection_school_plan` VALUES ('859', '5', '87', null);
INSERT INTO `infection_school_plan` VALUES ('860', '6', '87', null);
INSERT INTO `infection_school_plan` VALUES ('861', '7', '87', null);
INSERT INTO `infection_school_plan` VALUES ('862', '8', '87', null);
INSERT INTO `infection_school_plan` VALUES ('863', '9', '87', null);
INSERT INTO `infection_school_plan` VALUES ('864', '10', '87', null);
INSERT INTO `infection_school_plan` VALUES ('865', '11', '87', null);
INSERT INTO `infection_school_plan` VALUES ('866', '12', '87', null);
INSERT INTO `infection_school_plan` VALUES ('867', '1', '88', null);
INSERT INTO `infection_school_plan` VALUES ('868', '2', '88', null);
INSERT INTO `infection_school_plan` VALUES ('869', '3', '88', null);
INSERT INTO `infection_school_plan` VALUES ('870', '4', '88', null);
INSERT INTO `infection_school_plan` VALUES ('871', '5', '88', null);
INSERT INTO `infection_school_plan` VALUES ('872', '6', '88', null);
INSERT INTO `infection_school_plan` VALUES ('873', '7', '88', null);
INSERT INTO `infection_school_plan` VALUES ('874', '8', '88', null);
INSERT INTO `infection_school_plan` VALUES ('875', '9', '88', null);
INSERT INTO `infection_school_plan` VALUES ('876', '10', '88', null);
INSERT INTO `infection_school_plan` VALUES ('877', '11', '88', null);
INSERT INTO `infection_school_plan` VALUES ('878', '12', '88', null);
INSERT INTO `infection_school_plan` VALUES ('879', '1', '89', null);
INSERT INTO `infection_school_plan` VALUES ('880', '2', '89', null);
INSERT INTO `infection_school_plan` VALUES ('881', '3', '89', null);
INSERT INTO `infection_school_plan` VALUES ('882', '4', '89', null);
INSERT INTO `infection_school_plan` VALUES ('883', '5', '89', null);
INSERT INTO `infection_school_plan` VALUES ('884', '6', '89', null);
INSERT INTO `infection_school_plan` VALUES ('885', '7', '89', null);
INSERT INTO `infection_school_plan` VALUES ('886', '8', '89', null);
INSERT INTO `infection_school_plan` VALUES ('887', '9', '89', null);
INSERT INTO `infection_school_plan` VALUES ('888', '10', '89', null);
INSERT INTO `infection_school_plan` VALUES ('889', '11', '89', null);
INSERT INTO `infection_school_plan` VALUES ('890', '12', '89', null);
INSERT INTO `infection_school_plan` VALUES ('891', '1', '90', null);
INSERT INTO `infection_school_plan` VALUES ('892', '2', '90', null);
INSERT INTO `infection_school_plan` VALUES ('893', '3', '90', null);
INSERT INTO `infection_school_plan` VALUES ('894', '4', '90', null);
INSERT INTO `infection_school_plan` VALUES ('895', '5', '90', null);
INSERT INTO `infection_school_plan` VALUES ('896', '6', '90', null);
INSERT INTO `infection_school_plan` VALUES ('897', '7', '90', null);
INSERT INTO `infection_school_plan` VALUES ('898', '8', '90', null);
INSERT INTO `infection_school_plan` VALUES ('899', '9', '90', null);
INSERT INTO `infection_school_plan` VALUES ('900', '10', '90', null);
INSERT INTO `infection_school_plan` VALUES ('901', '11', '90', null);
INSERT INTO `infection_school_plan` VALUES ('902', '12', '90', null);
INSERT INTO `infection_school_plan` VALUES ('903', '1', '91', null);
INSERT INTO `infection_school_plan` VALUES ('904', '2', '91', null);
INSERT INTO `infection_school_plan` VALUES ('905', '3', '91', null);
INSERT INTO `infection_school_plan` VALUES ('906', '4', '91', null);
INSERT INTO `infection_school_plan` VALUES ('907', '5', '91', null);
INSERT INTO `infection_school_plan` VALUES ('908', '6', '91', null);
INSERT INTO `infection_school_plan` VALUES ('909', '7', '91', null);
INSERT INTO `infection_school_plan` VALUES ('910', '8', '91', null);
INSERT INTO `infection_school_plan` VALUES ('911', '9', '91', null);
INSERT INTO `infection_school_plan` VALUES ('912', '10', '91', null);
INSERT INTO `infection_school_plan` VALUES ('913', '11', '91', null);
INSERT INTO `infection_school_plan` VALUES ('914', '12', '91', null);
INSERT INTO `infection_school_plan` VALUES ('915', '1', '92', null);
INSERT INTO `infection_school_plan` VALUES ('916', '2', '92', null);
INSERT INTO `infection_school_plan` VALUES ('917', '3', '92', null);
INSERT INTO `infection_school_plan` VALUES ('918', '4', '92', null);
INSERT INTO `infection_school_plan` VALUES ('919', '5', '92', null);
INSERT INTO `infection_school_plan` VALUES ('920', '6', '92', null);
INSERT INTO `infection_school_plan` VALUES ('921', '7', '92', null);
INSERT INTO `infection_school_plan` VALUES ('922', '8', '92', null);
INSERT INTO `infection_school_plan` VALUES ('923', '9', '92', null);
INSERT INTO `infection_school_plan` VALUES ('924', '10', '92', null);
INSERT INTO `infection_school_plan` VALUES ('925', '11', '92', null);
INSERT INTO `infection_school_plan` VALUES ('926', '12', '92', null);
INSERT INTO `infection_school_plan` VALUES ('927', '1', '93', null);
INSERT INTO `infection_school_plan` VALUES ('928', '2', '93', null);
INSERT INTO `infection_school_plan` VALUES ('929', '3', '93', null);
INSERT INTO `infection_school_plan` VALUES ('930', '4', '93', null);
INSERT INTO `infection_school_plan` VALUES ('931', '5', '93', null);
INSERT INTO `infection_school_plan` VALUES ('932', '6', '93', null);
INSERT INTO `infection_school_plan` VALUES ('933', '7', '93', null);
INSERT INTO `infection_school_plan` VALUES ('934', '8', '93', null);
INSERT INTO `infection_school_plan` VALUES ('935', '9', '93', null);
INSERT INTO `infection_school_plan` VALUES ('936', '10', '93', null);
INSERT INTO `infection_school_plan` VALUES ('937', '11', '93', null);
INSERT INTO `infection_school_plan` VALUES ('938', '12', '93', null);
INSERT INTO `infection_school_plan` VALUES ('939', '1', '94', null);
INSERT INTO `infection_school_plan` VALUES ('940', '2', '94', null);
INSERT INTO `infection_school_plan` VALUES ('941', '3', '94', null);
INSERT INTO `infection_school_plan` VALUES ('942', '4', '94', null);
INSERT INTO `infection_school_plan` VALUES ('943', '5', '94', null);
INSERT INTO `infection_school_plan` VALUES ('944', '6', '94', null);
INSERT INTO `infection_school_plan` VALUES ('945', '7', '94', null);
INSERT INTO `infection_school_plan` VALUES ('946', '8', '94', null);
INSERT INTO `infection_school_plan` VALUES ('947', '9', '94', null);
INSERT INTO `infection_school_plan` VALUES ('948', '10', '94', null);
INSERT INTO `infection_school_plan` VALUES ('949', '11', '94', null);
INSERT INTO `infection_school_plan` VALUES ('950', '12', '94', null);
INSERT INTO `infection_school_plan` VALUES ('951', '1', '95', null);
INSERT INTO `infection_school_plan` VALUES ('952', '2', '95', null);
INSERT INTO `infection_school_plan` VALUES ('953', '3', '95', null);
INSERT INTO `infection_school_plan` VALUES ('954', '4', '95', null);
INSERT INTO `infection_school_plan` VALUES ('955', '5', '95', null);
INSERT INTO `infection_school_plan` VALUES ('956', '6', '95', null);
INSERT INTO `infection_school_plan` VALUES ('957', '7', '95', null);
INSERT INTO `infection_school_plan` VALUES ('958', '8', '95', null);
INSERT INTO `infection_school_plan` VALUES ('959', '9', '95', null);
INSERT INTO `infection_school_plan` VALUES ('960', '10', '95', null);
INSERT INTO `infection_school_plan` VALUES ('961', '11', '95', null);
INSERT INTO `infection_school_plan` VALUES ('962', '12', '95', null);
INSERT INTO `infection_school_plan` VALUES ('963', '1', '96', null);
INSERT INTO `infection_school_plan` VALUES ('964', '2', '96', null);
INSERT INTO `infection_school_plan` VALUES ('965', '3', '96', null);
INSERT INTO `infection_school_plan` VALUES ('966', '4', '96', null);
INSERT INTO `infection_school_plan` VALUES ('967', '5', '96', null);
INSERT INTO `infection_school_plan` VALUES ('968', '6', '96', null);
INSERT INTO `infection_school_plan` VALUES ('969', '7', '96', null);
INSERT INTO `infection_school_plan` VALUES ('970', '8', '96', null);
INSERT INTO `infection_school_plan` VALUES ('971', '9', '96', null);
INSERT INTO `infection_school_plan` VALUES ('972', '10', '96', null);
INSERT INTO `infection_school_plan` VALUES ('973', '11', '96', null);
INSERT INTO `infection_school_plan` VALUES ('974', '12', '96', null);
INSERT INTO `infection_school_plan` VALUES ('975', '1', '97', null);
INSERT INTO `infection_school_plan` VALUES ('976', '2', '97', null);
INSERT INTO `infection_school_plan` VALUES ('977', '3', '97', null);
INSERT INTO `infection_school_plan` VALUES ('978', '4', '97', null);
INSERT INTO `infection_school_plan` VALUES ('979', '5', '97', null);
INSERT INTO `infection_school_plan` VALUES ('980', '6', '97', null);
INSERT INTO `infection_school_plan` VALUES ('981', '7', '97', null);
INSERT INTO `infection_school_plan` VALUES ('982', '8', '97', null);
INSERT INTO `infection_school_plan` VALUES ('983', '9', '97', null);
INSERT INTO `infection_school_plan` VALUES ('984', '10', '97', null);
INSERT INTO `infection_school_plan` VALUES ('985', '11', '97', null);
INSERT INTO `infection_school_plan` VALUES ('986', '12', '97', null);
INSERT INTO `infection_school_plan` VALUES ('987', '1', '98', null);
INSERT INTO `infection_school_plan` VALUES ('988', '2', '98', null);
INSERT INTO `infection_school_plan` VALUES ('989', '3', '98', null);
INSERT INTO `infection_school_plan` VALUES ('990', '4', '98', null);
INSERT INTO `infection_school_plan` VALUES ('991', '5', '98', null);
INSERT INTO `infection_school_plan` VALUES ('992', '6', '98', null);
INSERT INTO `infection_school_plan` VALUES ('993', '7', '98', null);
INSERT INTO `infection_school_plan` VALUES ('994', '8', '98', null);
INSERT INTO `infection_school_plan` VALUES ('995', '9', '98', null);
INSERT INTO `infection_school_plan` VALUES ('996', '10', '98', null);
INSERT INTO `infection_school_plan` VALUES ('997', '11', '98', null);
INSERT INTO `infection_school_plan` VALUES ('998', '12', '98', null);
INSERT INTO `infection_school_plan` VALUES ('999', '1', '99', null);
INSERT INTO `infection_school_plan` VALUES ('1000', '2', '99', null);
INSERT INTO `infection_school_plan` VALUES ('1001', '3', '99', null);
INSERT INTO `infection_school_plan` VALUES ('1002', '4', '99', null);
INSERT INTO `infection_school_plan` VALUES ('1003', '5', '99', null);
INSERT INTO `infection_school_plan` VALUES ('1004', '6', '99', null);
INSERT INTO `infection_school_plan` VALUES ('1005', '7', '99', null);
INSERT INTO `infection_school_plan` VALUES ('1006', '8', '99', null);
INSERT INTO `infection_school_plan` VALUES ('1007', '9', '99', null);
INSERT INTO `infection_school_plan` VALUES ('1008', '10', '99', null);
INSERT INTO `infection_school_plan` VALUES ('1009', '11', '99', null);
INSERT INTO `infection_school_plan` VALUES ('1010', '12', '99', null);
INSERT INTO `infection_school_plan` VALUES ('1011', '1', '100', null);
INSERT INTO `infection_school_plan` VALUES ('1012', '2', '100', null);
INSERT INTO `infection_school_plan` VALUES ('1013', '3', '100', null);
INSERT INTO `infection_school_plan` VALUES ('1014', '4', '100', null);
INSERT INTO `infection_school_plan` VALUES ('1015', '5', '100', null);
INSERT INTO `infection_school_plan` VALUES ('1016', '6', '100', null);
INSERT INTO `infection_school_plan` VALUES ('1017', '7', '100', null);
INSERT INTO `infection_school_plan` VALUES ('1018', '8', '100', null);
INSERT INTO `infection_school_plan` VALUES ('1019', '9', '100', null);
INSERT INTO `infection_school_plan` VALUES ('1020', '10', '100', null);
INSERT INTO `infection_school_plan` VALUES ('1021', '11', '100', null);
INSERT INTO `infection_school_plan` VALUES ('1022', '12', '100', null);
INSERT INTO `infection_school_plan` VALUES ('1023', '1', '101', null);
INSERT INTO `infection_school_plan` VALUES ('1024', '2', '101', null);
INSERT INTO `infection_school_plan` VALUES ('1025', '3', '101', null);
INSERT INTO `infection_school_plan` VALUES ('1026', '4', '101', null);
INSERT INTO `infection_school_plan` VALUES ('1027', '5', '101', null);
INSERT INTO `infection_school_plan` VALUES ('1028', '6', '101', null);
INSERT INTO `infection_school_plan` VALUES ('1029', '7', '101', null);
INSERT INTO `infection_school_plan` VALUES ('1030', '8', '101', null);
INSERT INTO `infection_school_plan` VALUES ('1031', '9', '101', null);
INSERT INTO `infection_school_plan` VALUES ('1032', '10', '101', null);
INSERT INTO `infection_school_plan` VALUES ('1033', '11', '101', null);
INSERT INTO `infection_school_plan` VALUES ('1034', '12', '101', null);
INSERT INTO `infection_school_plan` VALUES ('1035', '1', '102', null);
INSERT INTO `infection_school_plan` VALUES ('1036', '2', '102', null);
INSERT INTO `infection_school_plan` VALUES ('1037', '3', '102', null);
INSERT INTO `infection_school_plan` VALUES ('1038', '4', '102', null);
INSERT INTO `infection_school_plan` VALUES ('1039', '5', '102', null);
INSERT INTO `infection_school_plan` VALUES ('1040', '6', '102', null);
INSERT INTO `infection_school_plan` VALUES ('1041', '7', '102', null);
INSERT INTO `infection_school_plan` VALUES ('1042', '8', '102', null);
INSERT INTO `infection_school_plan` VALUES ('1043', '9', '102', null);
INSERT INTO `infection_school_plan` VALUES ('1044', '10', '102', null);
INSERT INTO `infection_school_plan` VALUES ('1045', '11', '102', null);
INSERT INTO `infection_school_plan` VALUES ('1046', '12', '102', null);
INSERT INTO `infection_school_plan` VALUES ('1047', '1', '103', null);
INSERT INTO `infection_school_plan` VALUES ('1048', '2', '103', null);
INSERT INTO `infection_school_plan` VALUES ('1049', '3', '103', null);
INSERT INTO `infection_school_plan` VALUES ('1050', '4', '103', null);
INSERT INTO `infection_school_plan` VALUES ('1051', '5', '103', null);
INSERT INTO `infection_school_plan` VALUES ('1052', '6', '103', null);
INSERT INTO `infection_school_plan` VALUES ('1053', '7', '103', null);
INSERT INTO `infection_school_plan` VALUES ('1054', '8', '103', null);
INSERT INTO `infection_school_plan` VALUES ('1055', '9', '103', null);
INSERT INTO `infection_school_plan` VALUES ('1056', '10', '103', null);
INSERT INTO `infection_school_plan` VALUES ('1057', '11', '103', null);
INSERT INTO `infection_school_plan` VALUES ('1058', '12', '103', null);
INSERT INTO `infection_school_plan` VALUES ('1059', '1', '104', null);
INSERT INTO `infection_school_plan` VALUES ('1060', '2', '104', null);
INSERT INTO `infection_school_plan` VALUES ('1061', '3', '104', null);
INSERT INTO `infection_school_plan` VALUES ('1062', '4', '104', null);
INSERT INTO `infection_school_plan` VALUES ('1063', '5', '104', null);
INSERT INTO `infection_school_plan` VALUES ('1064', '6', '104', null);
INSERT INTO `infection_school_plan` VALUES ('1065', '7', '104', null);
INSERT INTO `infection_school_plan` VALUES ('1066', '8', '104', null);
INSERT INTO `infection_school_plan` VALUES ('1067', '9', '104', null);
INSERT INTO `infection_school_plan` VALUES ('1068', '10', '104', null);
INSERT INTO `infection_school_plan` VALUES ('1069', '11', '104', null);
INSERT INTO `infection_school_plan` VALUES ('1070', '12', '104', null);
INSERT INTO `infection_school_plan` VALUES ('1071', '1', '105', null);
INSERT INTO `infection_school_plan` VALUES ('1072', '2', '105', null);
INSERT INTO `infection_school_plan` VALUES ('1073', '3', '105', null);
INSERT INTO `infection_school_plan` VALUES ('1074', '4', '105', null);
INSERT INTO `infection_school_plan` VALUES ('1075', '5', '105', null);
INSERT INTO `infection_school_plan` VALUES ('1076', '6', '105', null);
INSERT INTO `infection_school_plan` VALUES ('1077', '7', '105', null);
INSERT INTO `infection_school_plan` VALUES ('1078', '8', '105', null);
INSERT INTO `infection_school_plan` VALUES ('1079', '9', '105', null);
INSERT INTO `infection_school_plan` VALUES ('1080', '10', '105', null);
INSERT INTO `infection_school_plan` VALUES ('1081', '11', '105', null);
INSERT INTO `infection_school_plan` VALUES ('1082', '12', '105', null);
INSERT INTO `infection_school_plan` VALUES ('1083', '1', '106', null);
INSERT INTO `infection_school_plan` VALUES ('1084', '2', '106', null);
INSERT INTO `infection_school_plan` VALUES ('1085', '3', '106', null);
INSERT INTO `infection_school_plan` VALUES ('1086', '4', '106', null);
INSERT INTO `infection_school_plan` VALUES ('1087', '5', '106', null);
INSERT INTO `infection_school_plan` VALUES ('1088', '6', '106', null);
INSERT INTO `infection_school_plan` VALUES ('1089', '7', '106', null);
INSERT INTO `infection_school_plan` VALUES ('1090', '8', '106', null);
INSERT INTO `infection_school_plan` VALUES ('1091', '9', '106', null);
INSERT INTO `infection_school_plan` VALUES ('1092', '10', '106', null);
INSERT INTO `infection_school_plan` VALUES ('1093', '11', '106', null);
INSERT INTO `infection_school_plan` VALUES ('1094', '12', '106', null);
INSERT INTO `infection_school_plan` VALUES ('1095', '1', '107', null);
INSERT INTO `infection_school_plan` VALUES ('1096', '2', '107', null);
INSERT INTO `infection_school_plan` VALUES ('1097', '3', '107', null);
INSERT INTO `infection_school_plan` VALUES ('1098', '4', '107', null);
INSERT INTO `infection_school_plan` VALUES ('1099', '5', '107', null);
INSERT INTO `infection_school_plan` VALUES ('1100', '6', '107', null);
INSERT INTO `infection_school_plan` VALUES ('1101', '7', '107', null);
INSERT INTO `infection_school_plan` VALUES ('1102', '8', '107', null);
INSERT INTO `infection_school_plan` VALUES ('1103', '9', '107', null);
INSERT INTO `infection_school_plan` VALUES ('1104', '10', '107', null);
INSERT INTO `infection_school_plan` VALUES ('1105', '11', '107', null);
INSERT INTO `infection_school_plan` VALUES ('1106', '12', '107', null);
INSERT INTO `infection_school_plan` VALUES ('1107', '1', '108', null);
INSERT INTO `infection_school_plan` VALUES ('1108', '2', '108', null);
INSERT INTO `infection_school_plan` VALUES ('1109', '3', '108', null);
INSERT INTO `infection_school_plan` VALUES ('1110', '4', '108', null);
INSERT INTO `infection_school_plan` VALUES ('1111', '5', '108', null);
INSERT INTO `infection_school_plan` VALUES ('1112', '6', '108', null);
INSERT INTO `infection_school_plan` VALUES ('1113', '7', '108', null);
INSERT INTO `infection_school_plan` VALUES ('1114', '8', '108', null);
INSERT INTO `infection_school_plan` VALUES ('1115', '9', '108', null);
INSERT INTO `infection_school_plan` VALUES ('1116', '10', '108', null);
INSERT INTO `infection_school_plan` VALUES ('1117', '11', '108', null);
INSERT INTO `infection_school_plan` VALUES ('1118', '12', '108', null);
INSERT INTO `infection_school_plan` VALUES ('1119', '1', '109', null);
INSERT INTO `infection_school_plan` VALUES ('1120', '2', '109', null);
INSERT INTO `infection_school_plan` VALUES ('1121', '3', '109', null);
INSERT INTO `infection_school_plan` VALUES ('1122', '4', '109', null);
INSERT INTO `infection_school_plan` VALUES ('1123', '5', '109', null);
INSERT INTO `infection_school_plan` VALUES ('1124', '6', '109', null);
INSERT INTO `infection_school_plan` VALUES ('1125', '7', '109', null);
INSERT INTO `infection_school_plan` VALUES ('1126', '8', '109', null);
INSERT INTO `infection_school_plan` VALUES ('1127', '9', '109', null);
INSERT INTO `infection_school_plan` VALUES ('1128', '10', '109', null);
INSERT INTO `infection_school_plan` VALUES ('1129', '11', '109', null);
INSERT INTO `infection_school_plan` VALUES ('1130', '12', '109', null);
INSERT INTO `infection_school_plan` VALUES ('1131', '1', '110', null);
INSERT INTO `infection_school_plan` VALUES ('1132', '2', '110', null);
INSERT INTO `infection_school_plan` VALUES ('1133', '3', '110', null);
INSERT INTO `infection_school_plan` VALUES ('1134', '4', '110', null);
INSERT INTO `infection_school_plan` VALUES ('1135', '5', '110', null);
INSERT INTO `infection_school_plan` VALUES ('1136', '6', '110', null);
INSERT INTO `infection_school_plan` VALUES ('1137', '7', '110', null);
INSERT INTO `infection_school_plan` VALUES ('1138', '8', '110', null);
INSERT INTO `infection_school_plan` VALUES ('1139', '9', '110', null);
INSERT INTO `infection_school_plan` VALUES ('1140', '10', '110', null);
INSERT INTO `infection_school_plan` VALUES ('1141', '11', '110', null);
INSERT INTO `infection_school_plan` VALUES ('1142', '12', '110', null);
INSERT INTO `infection_school_plan` VALUES ('1143', '1', '111', null);
INSERT INTO `infection_school_plan` VALUES ('1144', '2', '111', null);
INSERT INTO `infection_school_plan` VALUES ('1145', '3', '111', null);
INSERT INTO `infection_school_plan` VALUES ('1146', '4', '111', null);
INSERT INTO `infection_school_plan` VALUES ('1147', '5', '111', null);
INSERT INTO `infection_school_plan` VALUES ('1148', '6', '111', null);
INSERT INTO `infection_school_plan` VALUES ('1149', '7', '111', null);
INSERT INTO `infection_school_plan` VALUES ('1150', '8', '111', null);
INSERT INTO `infection_school_plan` VALUES ('1151', '9', '111', null);
INSERT INTO `infection_school_plan` VALUES ('1152', '10', '111', null);
INSERT INTO `infection_school_plan` VALUES ('1153', '11', '111', null);
INSERT INTO `infection_school_plan` VALUES ('1154', '12', '111', null);
INSERT INTO `infection_school_plan` VALUES ('1155', '1', '112', null);
INSERT INTO `infection_school_plan` VALUES ('1156', '2', '112', null);
INSERT INTO `infection_school_plan` VALUES ('1157', '3', '112', null);
INSERT INTO `infection_school_plan` VALUES ('1158', '4', '112', null);
INSERT INTO `infection_school_plan` VALUES ('1159', '5', '112', null);
INSERT INTO `infection_school_plan` VALUES ('1160', '6', '112', null);
INSERT INTO `infection_school_plan` VALUES ('1161', '7', '112', null);
INSERT INTO `infection_school_plan` VALUES ('1162', '8', '112', null);
INSERT INTO `infection_school_plan` VALUES ('1163', '9', '112', null);
INSERT INTO `infection_school_plan` VALUES ('1164', '10', '112', null);
INSERT INTO `infection_school_plan` VALUES ('1165', '11', '112', null);
INSERT INTO `infection_school_plan` VALUES ('1166', '12', '112', null);
INSERT INTO `infection_school_plan` VALUES ('1167', '1', '113', null);
INSERT INTO `infection_school_plan` VALUES ('1168', '2', '113', null);
INSERT INTO `infection_school_plan` VALUES ('1169', '3', '113', null);
INSERT INTO `infection_school_plan` VALUES ('1170', '4', '113', null);
INSERT INTO `infection_school_plan` VALUES ('1171', '5', '113', null);
INSERT INTO `infection_school_plan` VALUES ('1172', '6', '113', null);
INSERT INTO `infection_school_plan` VALUES ('1173', '7', '113', null);
INSERT INTO `infection_school_plan` VALUES ('1174', '8', '113', null);
INSERT INTO `infection_school_plan` VALUES ('1175', '9', '113', null);
INSERT INTO `infection_school_plan` VALUES ('1176', '10', '113', null);
INSERT INTO `infection_school_plan` VALUES ('1177', '11', '113', null);
INSERT INTO `infection_school_plan` VALUES ('1178', '12', '113', null);
INSERT INTO `infection_school_plan` VALUES ('1179', '1', '114', null);
INSERT INTO `infection_school_plan` VALUES ('1180', '2', '114', null);
INSERT INTO `infection_school_plan` VALUES ('1181', '3', '114', null);
INSERT INTO `infection_school_plan` VALUES ('1182', '4', '114', null);
INSERT INTO `infection_school_plan` VALUES ('1183', '5', '114', null);
INSERT INTO `infection_school_plan` VALUES ('1184', '6', '114', null);
INSERT INTO `infection_school_plan` VALUES ('1185', '7', '114', null);
INSERT INTO `infection_school_plan` VALUES ('1186', '8', '114', null);
INSERT INTO `infection_school_plan` VALUES ('1187', '9', '114', null);
INSERT INTO `infection_school_plan` VALUES ('1188', '10', '114', null);
INSERT INTO `infection_school_plan` VALUES ('1189', '11', '114', null);
INSERT INTO `infection_school_plan` VALUES ('1190', '12', '114', null);
INSERT INTO `infection_school_plan` VALUES ('1191', '1', '115', null);
INSERT INTO `infection_school_plan` VALUES ('1192', '2', '115', null);
INSERT INTO `infection_school_plan` VALUES ('1193', '3', '115', null);
INSERT INTO `infection_school_plan` VALUES ('1194', '4', '115', null);
INSERT INTO `infection_school_plan` VALUES ('1195', '5', '115', null);
INSERT INTO `infection_school_plan` VALUES ('1196', '6', '115', null);
INSERT INTO `infection_school_plan` VALUES ('1197', '7', '115', null);
INSERT INTO `infection_school_plan` VALUES ('1198', '8', '115', null);
INSERT INTO `infection_school_plan` VALUES ('1199', '9', '115', null);
INSERT INTO `infection_school_plan` VALUES ('1200', '10', '115', null);
INSERT INTO `infection_school_plan` VALUES ('1201', '11', '115', null);
INSERT INTO `infection_school_plan` VALUES ('1202', '12', '115', null);
INSERT INTO `infection_school_plan` VALUES ('1203', '1', '116', null);
INSERT INTO `infection_school_plan` VALUES ('1204', '2', '116', null);
INSERT INTO `infection_school_plan` VALUES ('1205', '3', '116', null);
INSERT INTO `infection_school_plan` VALUES ('1206', '4', '116', null);
INSERT INTO `infection_school_plan` VALUES ('1207', '5', '116', null);
INSERT INTO `infection_school_plan` VALUES ('1208', '6', '116', null);
INSERT INTO `infection_school_plan` VALUES ('1209', '7', '116', null);
INSERT INTO `infection_school_plan` VALUES ('1210', '8', '116', null);
INSERT INTO `infection_school_plan` VALUES ('1211', '9', '116', null);
INSERT INTO `infection_school_plan` VALUES ('1212', '10', '116', null);
INSERT INTO `infection_school_plan` VALUES ('1213', '11', '116', null);
INSERT INTO `infection_school_plan` VALUES ('1214', '12', '116', null);
INSERT INTO `infection_school_plan` VALUES ('1215', '1', '117', null);
INSERT INTO `infection_school_plan` VALUES ('1216', '2', '117', null);
INSERT INTO `infection_school_plan` VALUES ('1217', '3', '117', null);
INSERT INTO `infection_school_plan` VALUES ('1218', '4', '117', null);
INSERT INTO `infection_school_plan` VALUES ('1219', '5', '117', null);
INSERT INTO `infection_school_plan` VALUES ('1220', '6', '117', null);
INSERT INTO `infection_school_plan` VALUES ('1221', '7', '117', null);
INSERT INTO `infection_school_plan` VALUES ('1222', '8', '117', null);
INSERT INTO `infection_school_plan` VALUES ('1223', '9', '117', null);
INSERT INTO `infection_school_plan` VALUES ('1224', '10', '117', null);
INSERT INTO `infection_school_plan` VALUES ('1225', '11', '117', null);
INSERT INTO `infection_school_plan` VALUES ('1226', '12', '117', null);
INSERT INTO `infection_school_plan` VALUES ('1227', '1', '118', null);
INSERT INTO `infection_school_plan` VALUES ('1228', '2', '118', null);
INSERT INTO `infection_school_plan` VALUES ('1229', '3', '118', null);
INSERT INTO `infection_school_plan` VALUES ('1230', '4', '118', null);
INSERT INTO `infection_school_plan` VALUES ('1231', '5', '118', null);
INSERT INTO `infection_school_plan` VALUES ('1232', '6', '118', null);
INSERT INTO `infection_school_plan` VALUES ('1233', '7', '118', null);
INSERT INTO `infection_school_plan` VALUES ('1234', '8', '118', null);
INSERT INTO `infection_school_plan` VALUES ('1235', '9', '118', null);
INSERT INTO `infection_school_plan` VALUES ('1236', '10', '118', null);
INSERT INTO `infection_school_plan` VALUES ('1237', '11', '118', null);
INSERT INTO `infection_school_plan` VALUES ('1238', '12', '118', null);
INSERT INTO `infection_school_plan` VALUES ('1239', '1', '119', null);
INSERT INTO `infection_school_plan` VALUES ('1240', '2', '119', null);
INSERT INTO `infection_school_plan` VALUES ('1241', '3', '119', null);
INSERT INTO `infection_school_plan` VALUES ('1242', '4', '119', null);
INSERT INTO `infection_school_plan` VALUES ('1243', '5', '119', null);
INSERT INTO `infection_school_plan` VALUES ('1244', '6', '119', null);
INSERT INTO `infection_school_plan` VALUES ('1245', '7', '119', null);
INSERT INTO `infection_school_plan` VALUES ('1246', '8', '119', null);
INSERT INTO `infection_school_plan` VALUES ('1247', '9', '119', null);
INSERT INTO `infection_school_plan` VALUES ('1248', '10', '119', null);
INSERT INTO `infection_school_plan` VALUES ('1249', '11', '119', null);
INSERT INTO `infection_school_plan` VALUES ('1250', '12', '119', null);
INSERT INTO `infection_school_plan` VALUES ('1251', '1', '120', null);
INSERT INTO `infection_school_plan` VALUES ('1252', '2', '120', null);
INSERT INTO `infection_school_plan` VALUES ('1253', '3', '120', null);
INSERT INTO `infection_school_plan` VALUES ('1254', '4', '120', null);
INSERT INTO `infection_school_plan` VALUES ('1255', '5', '120', null);
INSERT INTO `infection_school_plan` VALUES ('1256', '6', '120', null);
INSERT INTO `infection_school_plan` VALUES ('1257', '7', '120', null);
INSERT INTO `infection_school_plan` VALUES ('1258', '8', '120', null);
INSERT INTO `infection_school_plan` VALUES ('1259', '9', '120', null);
INSERT INTO `infection_school_plan` VALUES ('1260', '10', '120', null);
INSERT INTO `infection_school_plan` VALUES ('1261', '11', '120', null);
INSERT INTO `infection_school_plan` VALUES ('1262', '12', '120', null);
INSERT INTO `infection_school_plan` VALUES ('1263', '1', '121', null);
INSERT INTO `infection_school_plan` VALUES ('1264', '2', '121', null);
INSERT INTO `infection_school_plan` VALUES ('1265', '3', '121', null);
INSERT INTO `infection_school_plan` VALUES ('1266', '4', '121', null);
INSERT INTO `infection_school_plan` VALUES ('1267', '5', '121', null);
INSERT INTO `infection_school_plan` VALUES ('1268', '6', '121', null);
INSERT INTO `infection_school_plan` VALUES ('1269', '7', '121', null);
INSERT INTO `infection_school_plan` VALUES ('1270', '8', '121', null);
INSERT INTO `infection_school_plan` VALUES ('1271', '9', '121', null);
INSERT INTO `infection_school_plan` VALUES ('1272', '10', '121', null);
INSERT INTO `infection_school_plan` VALUES ('1273', '11', '121', null);
INSERT INTO `infection_school_plan` VALUES ('1274', '12', '121', null);
INSERT INTO `infection_school_plan` VALUES ('1275', '1', '122', null);
INSERT INTO `infection_school_plan` VALUES ('1276', '2', '122', null);
INSERT INTO `infection_school_plan` VALUES ('1277', '3', '122', null);
INSERT INTO `infection_school_plan` VALUES ('1278', '4', '122', null);
INSERT INTO `infection_school_plan` VALUES ('1279', '5', '122', null);
INSERT INTO `infection_school_plan` VALUES ('1280', '6', '122', null);
INSERT INTO `infection_school_plan` VALUES ('1281', '7', '122', null);
INSERT INTO `infection_school_plan` VALUES ('1282', '8', '122', null);
INSERT INTO `infection_school_plan` VALUES ('1283', '9', '122', null);
INSERT INTO `infection_school_plan` VALUES ('1284', '10', '122', null);
INSERT INTO `infection_school_plan` VALUES ('1285', '11', '122', null);
INSERT INTO `infection_school_plan` VALUES ('1286', '12', '122', null);
INSERT INTO `infection_school_plan` VALUES ('1287', '1', '123', null);
INSERT INTO `infection_school_plan` VALUES ('1288', '2', '123', null);
INSERT INTO `infection_school_plan` VALUES ('1289', '3', '123', null);
INSERT INTO `infection_school_plan` VALUES ('1290', '4', '123', null);
INSERT INTO `infection_school_plan` VALUES ('1291', '5', '123', null);
INSERT INTO `infection_school_plan` VALUES ('1292', '6', '123', null);
INSERT INTO `infection_school_plan` VALUES ('1293', '7', '123', null);
INSERT INTO `infection_school_plan` VALUES ('1294', '8', '123', null);
INSERT INTO `infection_school_plan` VALUES ('1295', '9', '123', null);
INSERT INTO `infection_school_plan` VALUES ('1296', '10', '123', null);
INSERT INTO `infection_school_plan` VALUES ('1297', '11', '123', null);
INSERT INTO `infection_school_plan` VALUES ('1298', '12', '123', null);
INSERT INTO `infection_school_plan` VALUES ('1299', '1', '124', null);
INSERT INTO `infection_school_plan` VALUES ('1300', '2', '124', null);
INSERT INTO `infection_school_plan` VALUES ('1301', '3', '124', null);
INSERT INTO `infection_school_plan` VALUES ('1302', '4', '124', null);
INSERT INTO `infection_school_plan` VALUES ('1303', '5', '124', null);
INSERT INTO `infection_school_plan` VALUES ('1304', '6', '124', null);
INSERT INTO `infection_school_plan` VALUES ('1305', '7', '124', null);
INSERT INTO `infection_school_plan` VALUES ('1306', '8', '124', null);
INSERT INTO `infection_school_plan` VALUES ('1307', '9', '124', null);
INSERT INTO `infection_school_plan` VALUES ('1308', '10', '124', null);
INSERT INTO `infection_school_plan` VALUES ('1309', '11', '124', null);
INSERT INTO `infection_school_plan` VALUES ('1310', '12', '124', null);
INSERT INTO `infection_school_plan` VALUES ('1311', '1', '125', null);
INSERT INTO `infection_school_plan` VALUES ('1312', '2', '125', null);
INSERT INTO `infection_school_plan` VALUES ('1313', '3', '125', null);
INSERT INTO `infection_school_plan` VALUES ('1314', '4', '125', null);
INSERT INTO `infection_school_plan` VALUES ('1315', '5', '125', null);
INSERT INTO `infection_school_plan` VALUES ('1316', '6', '125', null);
INSERT INTO `infection_school_plan` VALUES ('1317', '7', '125', null);
INSERT INTO `infection_school_plan` VALUES ('1318', '8', '125', null);
INSERT INTO `infection_school_plan` VALUES ('1319', '9', '125', null);
INSERT INTO `infection_school_plan` VALUES ('1320', '10', '125', null);
INSERT INTO `infection_school_plan` VALUES ('1321', '11', '125', null);
INSERT INTO `infection_school_plan` VALUES ('1322', '12', '125', null);
INSERT INTO `infection_school_plan` VALUES ('1323', '1', '126', null);
INSERT INTO `infection_school_plan` VALUES ('1324', '2', '126', null);
INSERT INTO `infection_school_plan` VALUES ('1325', '3', '126', null);
INSERT INTO `infection_school_plan` VALUES ('1326', '4', '126', null);
INSERT INTO `infection_school_plan` VALUES ('1327', '5', '126', null);
INSERT INTO `infection_school_plan` VALUES ('1328', '6', '126', null);
INSERT INTO `infection_school_plan` VALUES ('1329', '7', '126', null);
INSERT INTO `infection_school_plan` VALUES ('1330', '8', '126', null);
INSERT INTO `infection_school_plan` VALUES ('1331', '9', '126', null);
INSERT INTO `infection_school_plan` VALUES ('1332', '10', '126', null);
INSERT INTO `infection_school_plan` VALUES ('1333', '11', '126', null);
INSERT INTO `infection_school_plan` VALUES ('1334', '12', '126', null);
INSERT INTO `infection_school_plan` VALUES ('1335', '1', '127', null);
INSERT INTO `infection_school_plan` VALUES ('1336', '2', '127', null);
INSERT INTO `infection_school_plan` VALUES ('1337', '3', '127', null);
INSERT INTO `infection_school_plan` VALUES ('1338', '4', '127', null);
INSERT INTO `infection_school_plan` VALUES ('1339', '5', '127', null);
INSERT INTO `infection_school_plan` VALUES ('1340', '6', '127', null);
INSERT INTO `infection_school_plan` VALUES ('1341', '7', '127', null);
INSERT INTO `infection_school_plan` VALUES ('1342', '8', '127', null);
INSERT INTO `infection_school_plan` VALUES ('1343', '9', '127', null);
INSERT INTO `infection_school_plan` VALUES ('1344', '10', '127', null);
INSERT INTO `infection_school_plan` VALUES ('1345', '11', '127', null);
INSERT INTO `infection_school_plan` VALUES ('1346', '12', '127', null);
INSERT INTO `infection_school_plan` VALUES ('1347', '1', '128', null);
INSERT INTO `infection_school_plan` VALUES ('1348', '2', '128', null);
INSERT INTO `infection_school_plan` VALUES ('1349', '3', '128', null);
INSERT INTO `infection_school_plan` VALUES ('1350', '4', '128', null);
INSERT INTO `infection_school_plan` VALUES ('1351', '5', '128', null);
INSERT INTO `infection_school_plan` VALUES ('1352', '6', '128', null);
INSERT INTO `infection_school_plan` VALUES ('1353', '7', '128', null);
INSERT INTO `infection_school_plan` VALUES ('1354', '8', '128', null);
INSERT INTO `infection_school_plan` VALUES ('1355', '9', '128', null);
INSERT INTO `infection_school_plan` VALUES ('1356', '10', '128', null);
INSERT INTO `infection_school_plan` VALUES ('1357', '11', '128', null);
INSERT INTO `infection_school_plan` VALUES ('1358', '12', '128', null);
INSERT INTO `infection_school_plan` VALUES ('1359', '1', '129', null);
INSERT INTO `infection_school_plan` VALUES ('1360', '2', '129', null);
INSERT INTO `infection_school_plan` VALUES ('1361', '3', '129', null);
INSERT INTO `infection_school_plan` VALUES ('1362', '4', '129', null);
INSERT INTO `infection_school_plan` VALUES ('1363', '5', '129', null);
INSERT INTO `infection_school_plan` VALUES ('1364', '6', '129', null);
INSERT INTO `infection_school_plan` VALUES ('1365', '7', '129', null);
INSERT INTO `infection_school_plan` VALUES ('1366', '8', '129', null);
INSERT INTO `infection_school_plan` VALUES ('1367', '9', '129', null);
INSERT INTO `infection_school_plan` VALUES ('1368', '10', '129', null);
INSERT INTO `infection_school_plan` VALUES ('1369', '11', '129', null);
INSERT INTO `infection_school_plan` VALUES ('1370', '12', '129', null);
INSERT INTO `infection_school_plan` VALUES ('1371', '1', '130', null);
INSERT INTO `infection_school_plan` VALUES ('1372', '2', '130', null);
INSERT INTO `infection_school_plan` VALUES ('1373', '3', '130', null);
INSERT INTO `infection_school_plan` VALUES ('1374', '4', '130', null);
INSERT INTO `infection_school_plan` VALUES ('1375', '5', '130', null);
INSERT INTO `infection_school_plan` VALUES ('1376', '6', '130', null);
INSERT INTO `infection_school_plan` VALUES ('1377', '7', '130', null);
INSERT INTO `infection_school_plan` VALUES ('1378', '8', '130', null);
INSERT INTO `infection_school_plan` VALUES ('1379', '9', '130', null);
INSERT INTO `infection_school_plan` VALUES ('1380', '10', '130', null);
INSERT INTO `infection_school_plan` VALUES ('1381', '11', '130', null);
INSERT INTO `infection_school_plan` VALUES ('1382', '12', '130', null);
INSERT INTO `infection_school_plan` VALUES ('1383', '1', '131', null);
INSERT INTO `infection_school_plan` VALUES ('1384', '2', '131', null);
INSERT INTO `infection_school_plan` VALUES ('1385', '3', '131', null);
INSERT INTO `infection_school_plan` VALUES ('1386', '4', '131', null);
INSERT INTO `infection_school_plan` VALUES ('1387', '5', '131', null);
INSERT INTO `infection_school_plan` VALUES ('1388', '6', '131', null);
INSERT INTO `infection_school_plan` VALUES ('1389', '7', '131', null);
INSERT INTO `infection_school_plan` VALUES ('1390', '8', '131', null);
INSERT INTO `infection_school_plan` VALUES ('1391', '9', '131', null);
INSERT INTO `infection_school_plan` VALUES ('1392', '10', '131', null);
INSERT INTO `infection_school_plan` VALUES ('1393', '11', '131', null);
INSERT INTO `infection_school_plan` VALUES ('1394', '12', '131', null);
INSERT INTO `infection_school_plan` VALUES ('1395', '1', '132', null);
INSERT INTO `infection_school_plan` VALUES ('1396', '2', '132', null);
INSERT INTO `infection_school_plan` VALUES ('1397', '3', '132', null);
INSERT INTO `infection_school_plan` VALUES ('1398', '4', '132', null);
INSERT INTO `infection_school_plan` VALUES ('1399', '5', '132', null);
INSERT INTO `infection_school_plan` VALUES ('1400', '6', '132', null);
INSERT INTO `infection_school_plan` VALUES ('1401', '7', '132', null);
INSERT INTO `infection_school_plan` VALUES ('1402', '8', '132', null);
INSERT INTO `infection_school_plan` VALUES ('1403', '9', '132', null);
INSERT INTO `infection_school_plan` VALUES ('1404', '10', '132', null);
INSERT INTO `infection_school_plan` VALUES ('1405', '11', '132', null);
INSERT INTO `infection_school_plan` VALUES ('1406', '12', '132', null);
INSERT INTO `infection_school_plan` VALUES ('1407', '1', '133', null);
INSERT INTO `infection_school_plan` VALUES ('1408', '2', '133', null);
INSERT INTO `infection_school_plan` VALUES ('1409', '3', '133', null);
INSERT INTO `infection_school_plan` VALUES ('1410', '4', '133', null);
INSERT INTO `infection_school_plan` VALUES ('1411', '5', '133', null);
INSERT INTO `infection_school_plan` VALUES ('1412', '6', '133', null);
INSERT INTO `infection_school_plan` VALUES ('1413', '7', '133', null);
INSERT INTO `infection_school_plan` VALUES ('1414', '8', '133', null);
INSERT INTO `infection_school_plan` VALUES ('1415', '9', '133', null);
INSERT INTO `infection_school_plan` VALUES ('1416', '10', '133', null);
INSERT INTO `infection_school_plan` VALUES ('1417', '11', '133', null);
INSERT INTO `infection_school_plan` VALUES ('1418', '12', '133', null);
INSERT INTO `infection_school_plan` VALUES ('1419', '1', '134', null);
INSERT INTO `infection_school_plan` VALUES ('1420', '2', '134', null);
INSERT INTO `infection_school_plan` VALUES ('1421', '3', '134', null);
INSERT INTO `infection_school_plan` VALUES ('1422', '4', '134', null);
INSERT INTO `infection_school_plan` VALUES ('1423', '5', '134', null);
INSERT INTO `infection_school_plan` VALUES ('1424', '6', '134', null);
INSERT INTO `infection_school_plan` VALUES ('1425', '7', '134', null);
INSERT INTO `infection_school_plan` VALUES ('1426', '8', '134', null);
INSERT INTO `infection_school_plan` VALUES ('1427', '9', '134', null);
INSERT INTO `infection_school_plan` VALUES ('1428', '10', '134', null);
INSERT INTO `infection_school_plan` VALUES ('1429', '11', '134', null);
INSERT INTO `infection_school_plan` VALUES ('1430', '12', '134', null);
INSERT INTO `infection_school_plan` VALUES ('1431', '1', '135', null);
INSERT INTO `infection_school_plan` VALUES ('1432', '2', '135', null);
INSERT INTO `infection_school_plan` VALUES ('1433', '3', '135', null);
INSERT INTO `infection_school_plan` VALUES ('1434', '4', '135', null);
INSERT INTO `infection_school_plan` VALUES ('1435', '5', '135', null);
INSERT INTO `infection_school_plan` VALUES ('1436', '6', '135', null);
INSERT INTO `infection_school_plan` VALUES ('1437', '7', '135', null);
INSERT INTO `infection_school_plan` VALUES ('1438', '8', '135', null);
INSERT INTO `infection_school_plan` VALUES ('1439', '9', '135', null);
INSERT INTO `infection_school_plan` VALUES ('1440', '10', '135', null);
INSERT INTO `infection_school_plan` VALUES ('1441', '11', '135', null);
INSERT INTO `infection_school_plan` VALUES ('1442', '12', '135', null);
INSERT INTO `infection_school_plan` VALUES ('1443', '1', '136', null);
INSERT INTO `infection_school_plan` VALUES ('1444', '2', '136', null);
INSERT INTO `infection_school_plan` VALUES ('1445', '3', '136', null);
INSERT INTO `infection_school_plan` VALUES ('1446', '4', '136', null);
INSERT INTO `infection_school_plan` VALUES ('1447', '5', '136', null);
INSERT INTO `infection_school_plan` VALUES ('1448', '6', '136', null);
INSERT INTO `infection_school_plan` VALUES ('1449', '7', '136', null);
INSERT INTO `infection_school_plan` VALUES ('1450', '8', '136', null);
INSERT INTO `infection_school_plan` VALUES ('1451', '9', '136', null);
INSERT INTO `infection_school_plan` VALUES ('1452', '10', '136', null);
INSERT INTO `infection_school_plan` VALUES ('1453', '11', '136', null);
INSERT INTO `infection_school_plan` VALUES ('1454', '12', '136', null);
INSERT INTO `infection_school_plan` VALUES ('1455', '1', '137', null);
INSERT INTO `infection_school_plan` VALUES ('1456', '2', '137', null);
INSERT INTO `infection_school_plan` VALUES ('1457', '3', '137', null);
INSERT INTO `infection_school_plan` VALUES ('1458', '4', '137', null);
INSERT INTO `infection_school_plan` VALUES ('1459', '5', '137', null);
INSERT INTO `infection_school_plan` VALUES ('1460', '6', '137', null);
INSERT INTO `infection_school_plan` VALUES ('1461', '7', '137', null);
INSERT INTO `infection_school_plan` VALUES ('1462', '8', '137', null);
INSERT INTO `infection_school_plan` VALUES ('1463', '9', '137', null);
INSERT INTO `infection_school_plan` VALUES ('1464', '10', '137', null);
INSERT INTO `infection_school_plan` VALUES ('1465', '11', '137', null);
INSERT INTO `infection_school_plan` VALUES ('1466', '12', '137', null);
INSERT INTO `infection_school_plan` VALUES ('1467', '1', '138', null);
INSERT INTO `infection_school_plan` VALUES ('1468', '2', '138', null);
INSERT INTO `infection_school_plan` VALUES ('1469', '3', '138', null);
INSERT INTO `infection_school_plan` VALUES ('1470', '4', '138', null);
INSERT INTO `infection_school_plan` VALUES ('1471', '5', '138', null);
INSERT INTO `infection_school_plan` VALUES ('1472', '6', '138', null);
INSERT INTO `infection_school_plan` VALUES ('1473', '7', '138', null);
INSERT INTO `infection_school_plan` VALUES ('1474', '8', '138', null);
INSERT INTO `infection_school_plan` VALUES ('1475', '9', '138', null);
INSERT INTO `infection_school_plan` VALUES ('1476', '10', '138', null);
INSERT INTO `infection_school_plan` VALUES ('1477', '11', '138', null);
INSERT INTO `infection_school_plan` VALUES ('1478', '12', '138', null);
INSERT INTO `infection_school_plan` VALUES ('1479', '1', '139', null);
INSERT INTO `infection_school_plan` VALUES ('1480', '2', '139', null);
INSERT INTO `infection_school_plan` VALUES ('1481', '3', '139', null);
INSERT INTO `infection_school_plan` VALUES ('1482', '4', '139', null);
INSERT INTO `infection_school_plan` VALUES ('1483', '5', '139', null);
INSERT INTO `infection_school_plan` VALUES ('1484', '6', '139', null);
INSERT INTO `infection_school_plan` VALUES ('1485', '7', '139', null);
INSERT INTO `infection_school_plan` VALUES ('1486', '8', '139', null);
INSERT INTO `infection_school_plan` VALUES ('1487', '9', '139', null);
INSERT INTO `infection_school_plan` VALUES ('1488', '10', '139', null);
INSERT INTO `infection_school_plan` VALUES ('1489', '11', '139', null);
INSERT INTO `infection_school_plan` VALUES ('1490', '12', '139', null);
INSERT INTO `infection_school_plan` VALUES ('1491', '1', '140', null);
INSERT INTO `infection_school_plan` VALUES ('1492', '2', '140', null);
INSERT INTO `infection_school_plan` VALUES ('1493', '3', '140', null);
INSERT INTO `infection_school_plan` VALUES ('1494', '4', '140', null);
INSERT INTO `infection_school_plan` VALUES ('1495', '5', '140', null);
INSERT INTO `infection_school_plan` VALUES ('1496', '6', '140', null);
INSERT INTO `infection_school_plan` VALUES ('1497', '7', '140', null);
INSERT INTO `infection_school_plan` VALUES ('1498', '8', '140', null);
INSERT INTO `infection_school_plan` VALUES ('1499', '9', '140', null);
INSERT INTO `infection_school_plan` VALUES ('1500', '10', '140', null);
INSERT INTO `infection_school_plan` VALUES ('1501', '11', '140', null);
INSERT INTO `infection_school_plan` VALUES ('1502', '12', '140', null);
INSERT INTO `infection_school_plan` VALUES ('1503', '1', '141', null);
INSERT INTO `infection_school_plan` VALUES ('1504', '2', '141', null);
INSERT INTO `infection_school_plan` VALUES ('1505', '3', '141', null);
INSERT INTO `infection_school_plan` VALUES ('1506', '4', '141', null);
INSERT INTO `infection_school_plan` VALUES ('1507', '5', '141', null);
INSERT INTO `infection_school_plan` VALUES ('1508', '6', '141', null);
INSERT INTO `infection_school_plan` VALUES ('1509', '7', '141', null);
INSERT INTO `infection_school_plan` VALUES ('1510', '8', '141', null);
INSERT INTO `infection_school_plan` VALUES ('1511', '9', '141', null);
INSERT INTO `infection_school_plan` VALUES ('1512', '10', '141', null);
INSERT INTO `infection_school_plan` VALUES ('1513', '11', '141', null);
INSERT INTO `infection_school_plan` VALUES ('1514', '12', '141', null);
INSERT INTO `infection_school_plan` VALUES ('1515', '1', '142', null);
INSERT INTO `infection_school_plan` VALUES ('1516', '2', '142', null);
INSERT INTO `infection_school_plan` VALUES ('1517', '3', '142', null);
INSERT INTO `infection_school_plan` VALUES ('1518', '4', '142', null);
INSERT INTO `infection_school_plan` VALUES ('1519', '5', '142', null);
INSERT INTO `infection_school_plan` VALUES ('1520', '6', '142', null);
INSERT INTO `infection_school_plan` VALUES ('1521', '7', '142', null);
INSERT INTO `infection_school_plan` VALUES ('1522', '8', '142', null);
INSERT INTO `infection_school_plan` VALUES ('1523', '9', '142', null);
INSERT INTO `infection_school_plan` VALUES ('1524', '10', '142', null);
INSERT INTO `infection_school_plan` VALUES ('1525', '11', '142', null);
INSERT INTO `infection_school_plan` VALUES ('1526', '12', '142', null);
INSERT INTO `infection_school_plan` VALUES ('1527', '1', '143', null);
INSERT INTO `infection_school_plan` VALUES ('1528', '2', '143', null);
INSERT INTO `infection_school_plan` VALUES ('1529', '3', '143', null);
INSERT INTO `infection_school_plan` VALUES ('1530', '4', '143', null);
INSERT INTO `infection_school_plan` VALUES ('1531', '5', '143', null);
INSERT INTO `infection_school_plan` VALUES ('1532', '6', '143', null);
INSERT INTO `infection_school_plan` VALUES ('1533', '7', '143', null);
INSERT INTO `infection_school_plan` VALUES ('1534', '8', '143', null);
INSERT INTO `infection_school_plan` VALUES ('1535', '9', '143', null);
INSERT INTO `infection_school_plan` VALUES ('1536', '10', '143', null);
INSERT INTO `infection_school_plan` VALUES ('1537', '11', '143', null);
INSERT INTO `infection_school_plan` VALUES ('1538', '12', '143', null);
INSERT INTO `infection_school_plan` VALUES ('1539', '1', '144', null);
INSERT INTO `infection_school_plan` VALUES ('1540', '2', '144', null);
INSERT INTO `infection_school_plan` VALUES ('1541', '3', '144', null);
INSERT INTO `infection_school_plan` VALUES ('1542', '4', '144', null);
INSERT INTO `infection_school_plan` VALUES ('1543', '5', '144', null);
INSERT INTO `infection_school_plan` VALUES ('1544', '6', '144', null);
INSERT INTO `infection_school_plan` VALUES ('1545', '7', '144', null);
INSERT INTO `infection_school_plan` VALUES ('1546', '8', '144', null);
INSERT INTO `infection_school_plan` VALUES ('1547', '9', '144', null);
INSERT INTO `infection_school_plan` VALUES ('1548', '10', '144', null);
INSERT INTO `infection_school_plan` VALUES ('1549', '11', '144', null);
INSERT INTO `infection_school_plan` VALUES ('1550', '12', '144', null);
INSERT INTO `infection_school_plan` VALUES ('1551', '1', '145', null);
INSERT INTO `infection_school_plan` VALUES ('1552', '2', '145', null);
INSERT INTO `infection_school_plan` VALUES ('1553', '3', '145', null);
INSERT INTO `infection_school_plan` VALUES ('1554', '4', '145', null);
INSERT INTO `infection_school_plan` VALUES ('1555', '5', '145', null);
INSERT INTO `infection_school_plan` VALUES ('1556', '6', '145', null);
INSERT INTO `infection_school_plan` VALUES ('1557', '7', '145', null);
INSERT INTO `infection_school_plan` VALUES ('1558', '8', '145', null);
INSERT INTO `infection_school_plan` VALUES ('1559', '9', '145', null);
INSERT INTO `infection_school_plan` VALUES ('1560', '10', '145', null);
INSERT INTO `infection_school_plan` VALUES ('1561', '11', '145', null);
INSERT INTO `infection_school_plan` VALUES ('1562', '12', '145', null);
INSERT INTO `infection_school_plan` VALUES ('1563', '1', '146', null);
INSERT INTO `infection_school_plan` VALUES ('1564', '2', '146', null);
INSERT INTO `infection_school_plan` VALUES ('1565', '3', '146', null);
INSERT INTO `infection_school_plan` VALUES ('1566', '4', '146', null);
INSERT INTO `infection_school_plan` VALUES ('1567', '5', '146', null);
INSERT INTO `infection_school_plan` VALUES ('1568', '6', '146', null);
INSERT INTO `infection_school_plan` VALUES ('1569', '7', '146', null);
INSERT INTO `infection_school_plan` VALUES ('1570', '8', '146', null);
INSERT INTO `infection_school_plan` VALUES ('1571', '9', '146', null);
INSERT INTO `infection_school_plan` VALUES ('1572', '10', '146', null);
INSERT INTO `infection_school_plan` VALUES ('1573', '11', '146', null);
INSERT INTO `infection_school_plan` VALUES ('1574', '12', '146', null);
INSERT INTO `infection_school_plan` VALUES ('1575', '1', '147', null);
INSERT INTO `infection_school_plan` VALUES ('1576', '2', '147', null);
INSERT INTO `infection_school_plan` VALUES ('1577', '3', '147', null);
INSERT INTO `infection_school_plan` VALUES ('1578', '4', '147', null);
INSERT INTO `infection_school_plan` VALUES ('1579', '5', '147', null);
INSERT INTO `infection_school_plan` VALUES ('1580', '6', '147', null);
INSERT INTO `infection_school_plan` VALUES ('1581', '7', '147', null);
INSERT INTO `infection_school_plan` VALUES ('1582', '8', '147', null);
INSERT INTO `infection_school_plan` VALUES ('1583', '9', '147', null);
INSERT INTO `infection_school_plan` VALUES ('1584', '10', '147', null);
INSERT INTO `infection_school_plan` VALUES ('1585', '11', '147', null);
INSERT INTO `infection_school_plan` VALUES ('1586', '12', '147', null);
INSERT INTO `infection_school_plan` VALUES ('1587', '1', '148', null);
INSERT INTO `infection_school_plan` VALUES ('1588', '2', '148', null);
INSERT INTO `infection_school_plan` VALUES ('1589', '3', '148', null);
INSERT INTO `infection_school_plan` VALUES ('1590', '4', '148', null);
INSERT INTO `infection_school_plan` VALUES ('1591', '5', '148', null);
INSERT INTO `infection_school_plan` VALUES ('1592', '6', '148', null);
INSERT INTO `infection_school_plan` VALUES ('1593', '7', '148', null);
INSERT INTO `infection_school_plan` VALUES ('1594', '8', '148', null);
INSERT INTO `infection_school_plan` VALUES ('1595', '9', '148', null);
INSERT INTO `infection_school_plan` VALUES ('1596', '10', '148', null);
INSERT INTO `infection_school_plan` VALUES ('1597', '11', '148', null);
INSERT INTO `infection_school_plan` VALUES ('1598', '12', '148', null);
INSERT INTO `infection_school_plan` VALUES ('1599', '1', '149', null);
INSERT INTO `infection_school_plan` VALUES ('1600', '2', '149', null);
INSERT INTO `infection_school_plan` VALUES ('1601', '3', '149', null);
INSERT INTO `infection_school_plan` VALUES ('1602', '4', '149', null);
INSERT INTO `infection_school_plan` VALUES ('1603', '5', '149', null);
INSERT INTO `infection_school_plan` VALUES ('1604', '6', '149', null);
INSERT INTO `infection_school_plan` VALUES ('1605', '7', '149', null);
INSERT INTO `infection_school_plan` VALUES ('1606', '8', '149', null);
INSERT INTO `infection_school_plan` VALUES ('1607', '9', '149', null);
INSERT INTO `infection_school_plan` VALUES ('1608', '10', '149', null);
INSERT INTO `infection_school_plan` VALUES ('1609', '11', '149', null);
INSERT INTO `infection_school_plan` VALUES ('1610', '12', '149', null);
INSERT INTO `infection_school_plan` VALUES ('1611', '1', '150', null);
INSERT INTO `infection_school_plan` VALUES ('1612', '2', '150', null);
INSERT INTO `infection_school_plan` VALUES ('1613', '3', '150', null);
INSERT INTO `infection_school_plan` VALUES ('1614', '4', '150', null);
INSERT INTO `infection_school_plan` VALUES ('1615', '5', '150', null);
INSERT INTO `infection_school_plan` VALUES ('1616', '6', '150', null);
INSERT INTO `infection_school_plan` VALUES ('1617', '7', '150', null);
INSERT INTO `infection_school_plan` VALUES ('1618', '8', '150', null);
INSERT INTO `infection_school_plan` VALUES ('1619', '9', '150', null);
INSERT INTO `infection_school_plan` VALUES ('1620', '10', '150', null);
INSERT INTO `infection_school_plan` VALUES ('1621', '11', '150', null);
INSERT INTO `infection_school_plan` VALUES ('1622', '12', '150', null);
INSERT INTO `infection_school_plan` VALUES ('1623', '1', '151', null);
INSERT INTO `infection_school_plan` VALUES ('1624', '2', '151', null);
INSERT INTO `infection_school_plan` VALUES ('1625', '3', '151', null);
INSERT INTO `infection_school_plan` VALUES ('1626', '4', '151', null);
INSERT INTO `infection_school_plan` VALUES ('1627', '5', '151', null);
INSERT INTO `infection_school_plan` VALUES ('1628', '6', '151', null);
INSERT INTO `infection_school_plan` VALUES ('1629', '7', '151', null);
INSERT INTO `infection_school_plan` VALUES ('1630', '8', '151', null);
INSERT INTO `infection_school_plan` VALUES ('1631', '9', '151', null);
INSERT INTO `infection_school_plan` VALUES ('1632', '10', '151', null);
INSERT INTO `infection_school_plan` VALUES ('1633', '11', '151', null);
INSERT INTO `infection_school_plan` VALUES ('1634', '12', '151', null);
INSERT INTO `infection_school_plan` VALUES ('1635', '1', '154', null);
INSERT INTO `infection_school_plan` VALUES ('1636', '2', '154', null);
INSERT INTO `infection_school_plan` VALUES ('1637', '3', '154', null);
INSERT INTO `infection_school_plan` VALUES ('1638', '4', '154', null);
INSERT INTO `infection_school_plan` VALUES ('1639', '5', '154', null);
INSERT INTO `infection_school_plan` VALUES ('1640', '6', '154', null);
INSERT INTO `infection_school_plan` VALUES ('1641', '7', '154', null);
INSERT INTO `infection_school_plan` VALUES ('1642', '8', '154', null);
INSERT INTO `infection_school_plan` VALUES ('1643', '9', '154', null);
INSERT INTO `infection_school_plan` VALUES ('1644', '10', '154', null);
INSERT INTO `infection_school_plan` VALUES ('1645', '11', '154', null);
INSERT INTO `infection_school_plan` VALUES ('1646', '12', '154', null);
INSERT INTO `infection_school_plan` VALUES ('1647', '1', '156', null);
INSERT INTO `infection_school_plan` VALUES ('1648', '2', '156', null);
INSERT INTO `infection_school_plan` VALUES ('1649', '3', '156', null);
INSERT INTO `infection_school_plan` VALUES ('1650', '4', '156', null);
INSERT INTO `infection_school_plan` VALUES ('1651', '5', '156', null);
INSERT INTO `infection_school_plan` VALUES ('1652', '6', '156', null);
INSERT INTO `infection_school_plan` VALUES ('1653', '7', '156', null);
INSERT INTO `infection_school_plan` VALUES ('1654', '8', '156', null);
INSERT INTO `infection_school_plan` VALUES ('1655', '9', '156', null);
INSERT INTO `infection_school_plan` VALUES ('1656', '10', '156', null);
INSERT INTO `infection_school_plan` VALUES ('1657', '11', '156', null);
INSERT INTO `infection_school_plan` VALUES ('1658', '12', '156', null);
INSERT INTO `infection_school_plan` VALUES ('1659', '1', '157', null);
INSERT INTO `infection_school_plan` VALUES ('1660', '2', '157', null);
INSERT INTO `infection_school_plan` VALUES ('1661', '3', '157', null);
INSERT INTO `infection_school_plan` VALUES ('1662', '4', '157', null);
INSERT INTO `infection_school_plan` VALUES ('1663', '5', '157', null);
INSERT INTO `infection_school_plan` VALUES ('1664', '6', '157', null);
INSERT INTO `infection_school_plan` VALUES ('1665', '7', '157', null);
INSERT INTO `infection_school_plan` VALUES ('1666', '8', '157', null);
INSERT INTO `infection_school_plan` VALUES ('1667', '9', '157', null);
INSERT INTO `infection_school_plan` VALUES ('1668', '10', '157', null);
INSERT INTO `infection_school_plan` VALUES ('1669', '11', '157', null);
INSERT INTO `infection_school_plan` VALUES ('1670', '12', '157', null);

-- ----------------------------
-- Table structure for infection_structure
-- ----------------------------
DROP TABLE IF EXISTS `infection_structure`;
CREATE TABLE `infection_structure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL COMMENT '等级',
  `schoolId` int(11) DEFAULT NULL COMMENT '学校id',
  `position` varchar(255) DEFAULT NULL COMMENT '职务',
  `duties` text COMMENT '职责',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infection_structure
-- ----------------------------
INSERT INTO `infection_structure` VALUES ('8', '古芳', '0', '3', '校长', '我是校长，我是第一责任人');
INSERT INTO `infection_structure` VALUES ('9', '吴柳慧', '1', '3', '卫生主任', '负责卫生工作');
INSERT INTO `infection_structure` VALUES ('10', '方雾湖', '1', '3', '后勤主任', '负责学校后勤工作');
INSERT INTO `infection_structure` VALUES ('11', '苗天天', '2', '3', '校医', '负责学生的基本医务工作');
INSERT INTO `infection_structure` VALUES ('12', '张翠芳', '0', '33', '校长', '学校第一负责人');
INSERT INTO `infection_structure` VALUES ('13', '', '1', '33', '', '');
INSERT INTO `infection_structure` VALUES ('14', '李华华', '2', '33', '校医', '负责最基本的医务工作');
INSERT INTO `infection_structure` VALUES ('15', 'aaa', '0', '35', '校长', 'ccc');
INSERT INTO `infection_structure` VALUES ('16', 'bbb', '1', '35', 'ddd', '222');
INSERT INTO `infection_structure` VALUES ('17', '66666', '2', '35', '333', 'asdfefas');
INSERT INTO `infection_structure` VALUES ('18', '测试校长', '0', '36', '校长', '学校负责人');
INSERT INTO `infection_structure` VALUES ('19', '测试', '1', '36', '校医', '报告传染疫情');
INSERT INTO `infection_structure` VALUES ('20', '', '2', '36', '', '');
INSERT INTO `infection_structure` VALUES ('21', 'sfdf', '0', '37', '校长', 'dfdf');
INSERT INTO `infection_structure` VALUES ('22', '34', '1', '37', '434', 'retr');
INSERT INTO `infection_structure` VALUES ('23', '34', '2', '37', '34', '34');
INSERT INTO `infection_structure` VALUES ('30', '张跃进', '0', '38', '校长', '校长');
INSERT INTO `infection_structure` VALUES ('31', '栾新国', '1', '38', '教师', '语文老师');
INSERT INTO `infection_structure` VALUES ('32', '宋涛', '2', '38', '教师', '数学老师');
INSERT INTO `infection_structure` VALUES ('39', 'wudi', '0', '39', '校长', '第一责任人');
INSERT INTO `infection_structure` VALUES ('40', 'xiaohu', '1', '39', '1', '1222');
INSERT INTO `infection_structure` VALUES ('41', '2222', '2', '39', '1', '1');
INSERT INTO `infection_structure` VALUES ('42', 'aaa', '0', '40', '校长', '');
INSERT INTO `infection_structure` VALUES ('43', 'bbb', '1', '40', '1', '22222');
INSERT INTO `infection_structure` VALUES ('44', 'ccc', '2', '40', '2', '222222');
INSERT INTO `infection_structure` VALUES ('48', '7777777', '0', '41', '校长', '');
INSERT INTO `infection_structure` VALUES ('49', '666666', '1', '41', '444', '1111');
INSERT INTO `infection_structure` VALUES ('50', '555555', '2', '41', '333', '222');
INSERT INTO `infection_structure` VALUES ('54', '李炎', '0', '53', '校长', '园长');
INSERT INTO `infection_structure` VALUES ('55', '陈芳', '1', '53', '主任', '');
INSERT INTO `infection_structure` VALUES ('56', '李炎', '2', '53', '保健医', '');
INSERT INTO `infection_structure` VALUES ('57', '测试', '0', '45', '校长', '测试');
INSERT INTO `infection_structure` VALUES ('58', '测试', '1', '45', '测试', '测试');
INSERT INTO `infection_structure` VALUES ('59', '测试', '2', '45', '测试', '测试');
INSERT INTO `infection_structure` VALUES ('60', '刘乐', '0', '47', '校长', '负责幼儿园全面管理工作');
INSERT INTO `infection_structure` VALUES ('61', '史玮', '1', '47', '后勤园长', '负责总务后勤全面工作');
INSERT INTO `infection_structure` VALUES ('62', '郭佳欣', '2', '47', '保健医生', '负责全园幼儿卫生保健工作');
INSERT INTO `infection_structure` VALUES ('66', '林淑芬', '0', '69', '校长', '管理全园');
INSERT INTO `infection_structure` VALUES ('67', '吴晓欣', '1', '69', '保健医', '卫生保健工作');
INSERT INTO `infection_structure` VALUES ('68', '杨晓静', '2', '69', '保教主任', '教育教学');
INSERT INTO `infection_structure` VALUES ('69', '刘晶', '0', '62', '校长', '幼儿园负责人，园长');
INSERT INTO `infection_structure` VALUES ('70', '窦雪捷', '1', '62', '主任', '负责幼儿园所有日常管理');
INSERT INTO `infection_structure` VALUES ('71', '畅茹', '2', '62', '财务', '负责幼儿园财务工作');
INSERT INTO `infection_structure` VALUES ('75', '李德艳', '0', '64', '校长', '管理监督');
INSERT INTO `infection_structure` VALUES ('76', '张凌雪', '1', '64', '保健医', '卫生保健');
INSERT INTO `infection_structure` VALUES ('77', '', '2', '64', '', '');
INSERT INTO `infection_structure` VALUES ('78', '许金双', '0', '52', '校长', '负责全园卫生保健的统一预防与安排。');
INSERT INTO `infection_structure` VALUES ('79', '许金双', '1', '52', '保健医', '负责全园幼儿及教师健康情况的统一观察与安排');
INSERT INTO `infection_structure` VALUES ('80', '聂扇扇', '2', '52', '小班班组长', '负责本班幼儿健康情况检查与报告');
INSERT INTO `infection_structure` VALUES ('81', '董静', '2', '52', '中班班组长', '负责本班幼儿健康情况检查与报告');
INSERT INTO `infection_structure` VALUES ('82', '闫富焕', '2', '52', '大班班组长', '负责本班幼儿健康情况检查与报告');
INSERT INTO `infection_structure` VALUES ('83', '张永娟', '0', '50', '校长', '负责全园的教学，行政，安全，后勤工作。');
INSERT INTO `infection_structure` VALUES ('84', '王雪', '1', '50', '保教主任', '负责教学工作及园长助理工作！');
INSERT INTO `infection_structure` VALUES ('85', '吴雪明', '2', '50', '保健医', '督导后勤及厨房卫生安全工作，每天检查幼儿晨午晚检查及幼儿营养食谱！');
INSERT INTO `infection_structure` VALUES ('86', '邢维娟', '0', '61', '校长', '负责全园卫生保健的统一预防与安排');
INSERT INTO `infection_structure` VALUES ('87', '山院院', '1', '61', '保健医', '负责全园幼儿及教师健康情况的统一观察与安排');
INSERT INTO `infection_structure` VALUES ('88', '康录雪', '2', '61', '小班主班', '负责本班幼儿健康情况检查与报告');
INSERT INTO `infection_structure` VALUES ('89', '山院院', '2', '61', '中班主班', '负责本班幼儿健康情况检查与报告');
INSERT INTO `infection_structure` VALUES ('90', '李玲丽', '2', '61', '大班主班', '负责本班幼儿健康情况检查与报告');
INSERT INTO `infection_structure` VALUES ('91', '杨紫薇', '2', '61', '托班主班', '负责本班幼儿健康情况检查与报告');
INSERT INTO `infection_structure` VALUES ('92', '胡志超', '0', '55', '校长', '');
INSERT INTO `infection_structure` VALUES ('93', '张春艳', '1', '55', '保健医', '');
INSERT INTO `infection_structure` VALUES ('94', '', '2', '55', '', '');
INSERT INTO `infection_structure` VALUES ('95', '高淑香', '0', '46', '校长', '对全园的保健工作负责，对园内的保健工作做统一的统筹安排，疫情应急指挥小组负责人。');
INSERT INTO `infection_structure` VALUES ('96', '王国元', '1', '46', '副园长', '负责传达园长下达的指派任务，具体安排园内的保健卫生工作。');
INSERT INTO `infection_structure` VALUES ('97', '吴凌云', '2', '46', '保健医', '负责园内幼儿的简单的健康护理工作，以及晨午检工作，和食品安全相关的工作内容。');
INSERT INTO `infection_structure` VALUES ('101', '何淑玲', '0', '59', '校长', '园长岗位职责\n1、坚持正确的办学方向，全面贯彻党的教育方针，执行国家教育教学标准，保证教育教学质量不断提高。\n2、遵守法律法规，贯彻执行有关政策，接受审批机关及有关部门依法进行的检查监督。 \n    3、维护受教育者、教职工合法权益，保证受教育者、教职工的人身安全。\n    4、主持本园日常教学和行政管理工作，组织实施董事会的决议。       \n5、拟订本园年度工作计划、财务预算和各项教育教学管理制度。\n6、拟定本园内部管理机构设置方案，提请聘任或解聘副园长和内设机构负责人，聘任和解聘教职工，实施奖惩。\n    7、组织开展教育教学、教科研活动，业务学习培训，保证教育教学质量。');
INSERT INTO `infection_structure` VALUES ('102', '王月', '1', '59', '副园长', '园长岗位职责\n1、坚持正确的办学方向，全面贯彻党的教育方针，执行国家教育教学标准，保证教育教学质量不断提高。\n2、遵守法律法规，贯彻执行有关政策，接受审批机关及有关部门依法进行的检查监督。 \n    3、维护受教育者、教职工合法权益，保证受教育者、教职工的人身安全。\n    4、主持本园日常教学和行政管理工作，组织实施董事会的决议。       \n5、拟订本园年度工作计划、财务预算和各项教育教学管理制度。\n6、拟定本园内部管理机构设置方案，提请聘任或解聘内设机构负责人，聘任和解聘教职工，实施奖惩。\n    7、组织开展教育教学、教科研活动，业务学习培训，保证教育教学质量。');
INSERT INTO `infection_structure` VALUES ('103', '', '2', '59', '', '1、认真贯彻“预防为主”的方针，做好儿童常见病、传染病的防治工作防止蔓延，做好幼儿发病率和每日出勤率的统计管理。\n2、根据区保健所和幼儿园的要求，制定本园的保健工作计划，组织实施并定期检查，及时写出年终总结。\n3、每日做好晨午检工作，按要求入班级巡诊，管理好幼儿带的药品，做好记录和喂服。\n4、把关幼儿入园前的查体，查验幼儿的各种疫苗接种情况，和保健所保持联系，查体报告齐全方可入园。\n6、经常深入班内抽查生活制度执行情况，对不能执行生活制度的班级有权力提醒和向园长汇报，以保证幼儿正常的生活作息。\n7、定期检查与日常抽查相结合的方式，督促、指导、检查全园\n各部门环境、厨房卫生，进行分析评比，及时、定期公布检查结果保证幼儿园环境清洁、美观。\n8、负责检查指导幼儿园的各项消毒工作、各种设施的安全卫生情况。\n9、主持伙委会工作，定期召开伙委会，研究膳食问题，搞好营养配餐，定期进行营养测算。\n10、掌握本园教职员工健康情况，组织安排全园教职员工每年全面体检一次，发现传染病及时反映领导。');
INSERT INTO `infection_structure` VALUES ('104', 'ceshi', '0', '71', '校长', 'ceshi');
INSERT INTO `infection_structure` VALUES ('105', 'ceshi', '1', '71', 'ceshi', 'ceshi');
INSERT INTO `infection_structure` VALUES ('106', 'ceshi', '2', '71', 'ceshi', 'ceshi');
INSERT INTO `infection_structure` VALUES ('107', '黄甫敬', '0', '54', '校长', '1.认真执行《托儿所、幼儿园卫生保健制度》，负责管理园所内的卫生保健工作。 \n    2.负责制定园所全年的卫生保健工作计划和总结；主持召开园所的各种卫生保健会议，检查各班的保健保育工作落实情况，协调园所内外关系。     3.参与制定人员编制，明确岗位分工及人事的聘任、调离、晋升考核，合理安排保健保育、炊事人员的工作。');
INSERT INTO `infection_structure` VALUES ('108', '张玉彬', '1', '54', '主管主任', '1.负责抓好园所内的卫生保健、保育、早教工作。根据7岁前儿童不同的生长发育，以及心理特点，认真做好膳食管理、保育护理、早期教育等工作。 \n2.实施科学化、规范化管理，及时了解国内外有关托幼园所卫生保健工作的信息动态，吸取经验，不断改进。定期参加卫生保健知识的培训，提高自身的管理水平。 \n3.协调好园所与社会各方面的关系，争取社会和家长的配合。向家长宣传科学育儿知识和保健知识，使园所内教育、社会教育、家庭教育有机结合起来。 \n 3.检查卫生保健制度及园所内的安全保卫工作的落实情况，杜绝意外事故的发生。负责管理后勤人员的工作和学习，硬件设施的改造、维修。负责每周一次的卫生检查等工作。');
INSERT INTO `infection_structure` VALUES ('109', '韩燕明', '2', '54', '保健医', '1、在园长或主任的领导下，负责制定学期卫生工作保健计划和检查卫生保健、安全制度，季节性防病计划，并按时进行预防接种工作。 \n2、严格执行婴幼儿入园及定期检查，每日晨、午、晚间检查，定期做身高体重测量和分析工作，掌握各班幼儿的健康情况，发现问题分析研究，采取措施，及时解决。特别对体弱儿及营养不良幼儿要加强护理，给予必要的照顾，根据不同情况，采取不同措施使其逐步增强体质。 \n3、做好传染病的管理工作，发现传染病要做到早隔离、早报告、早治疗、做好消毒及检疫工作。');
INSERT INTO `infection_structure` VALUES ('110', '赵平', '0', '48', '校长', '传染病防控工作第一责任人。');
INSERT INTO `infection_structure` VALUES ('111', '刘雨', '1', '48', '副组长', '负责日常监督及传染病防控业务指导，制订幼儿园的应急预案。');
INSERT INTO `infection_structure` VALUES ('112', '张欣', '2', '48', '班组长', '做好因病缺勤，追踪，时时关注幼儿，发现导常及与传染病领导小组进行沟通，防患于未然。');
INSERT INTO `infection_structure` VALUES ('113', '高淑香', '0', '57', '校长', '为全园的保健卫生工作负责，协调安排园内的保健卫生工作，并负全责。');
INSERT INTO `infection_structure` VALUES ('114', '王国元', '1', '57', '副园长', '服从园长安排，并传达园长指令，负责工作的具体实施，并负相关责任。');
INSERT INTO `infection_structure` VALUES ('115', '侯堃', '2', '57', '助理', '负责园内的保健相关工作，以及卫生工作和食品安全的相关工作。');
INSERT INTO `infection_structure` VALUES ('125', '张志凤', '0', '68', '校长', '负责管理全园的卫生保健工作');
INSERT INTO `infection_structure` VALUES ('126', '武学慧', '1', '68', '保健医', '检查全园的卫生保健');
INSERT INTO `infection_structure` VALUES ('127', '', '2', '68', '', '');
INSERT INTO `infection_structure` VALUES ('131', '纪秀梅', '0', '63', '校长', '1、负责指导实施幼儿园幼儿的晨检、午检工作。\n2、每天对幼儿园幼儿的出勤、健康情况进行统计排查。');
INSERT INTO `infection_structure` VALUES ('132', '陈雯', '1', '63', '后勤', '1.负责本幼儿园传染病疫情和疑似传染病疫情的报告工作。\n2.建立、健全本幼儿园传染病疫情的监测、发现及报告相关工作制度及工作流程。');
INSERT INTO `infection_structure` VALUES ('133', '', '2', '63', '', '');
INSERT INTO `infection_structure` VALUES ('134', '孙悦', '0', '51', '校长', '园长是幼儿园安全工作第一人，认真贯彻落实相关法律法规，完成上级对幼儿园安全工作的部署。全面负责幼儿园安全工作，建立健全组织机构和防范体系。');
INSERT INTO `infection_structure` VALUES ('135', '卢静', '1', '51', '保教主任', '配合园长抓紧教育教学，切合本园实际情况，作出相应的招生安排工作，完成各项上级领导所交的工作。根据幼儿园纲要做好园所教职员工上班安排，保证幼儿每日都高高兴兴度过幼儿园的每一天');
INSERT INTO `infection_structure` VALUES ('136', '杨帆', '2', '51', '保健医', '做好幼儿园卫生保健和疾病的预防工作。培训食堂人员食品安全知识，培训保育员一日生活流程。建立幼儿档案。认真落实晨午检，对于携带传染源的幼儿及时隔离上报。抓好厨房管理工作，做好食品安全工作，预防食物中毒。');
INSERT INTO `infection_structure` VALUES ('137', '姚金翠', '2', '51', '行政助理', '负责园所相关财务工作。');
INSERT INTO `infection_structure` VALUES ('145', '王超华', '0', '49', '校长', '1、园长负责幼儿园的全面管理，主持全园工作，对幼儿园的安全工作负总责。\n2、全面了解教育、教研、卫生保健及膳食管理的情况，并根据实际情况及时调整，尽量减少工作中的失误。充分发挥教职工的作用，');
INSERT INTO `infection_structure` VALUES ('146', '陈晨', '1', '49', '保健医', '1、负责落实各项卫生保健制度，每月将检查记录交园长。\n2、认真指定并贯彻落实卫生保健工作计划，保证各类人员的健康检查率达标。\n3、每周制定科学合理的带量食谱，注意饭菜多样规划，营养搭配合理，保证幼儿伙食达标，检查并督促食堂饮食卫生工作执行情况，保证幼儿食品卫生安全。\n4、加强对各部门人员卫生保健工作情况的检查与指导，对发生的问题及时汇报，提出改进意见。\n5、正确处理幼儿常见病，做好意外事故的急救，负责护送发生意外的幼儿去医院。');
INSERT INTO `infection_structure` VALUES ('147', '袁娜', '2', '49', '保教主任', '1、指定保教工作计划，配合园长贯彻落实幼儿园保教工作计划，在园长领导下，负责本部门保教人员的全面工作。\n2、全面关心幼儿，经常与保健医、后勤部门密切联系，配合搞好幼儿卫生保健及环境设置等工作。');
INSERT INTO `infection_structure` VALUES ('148', '', '0', '65', '校长', '');
INSERT INTO `infection_structure` VALUES ('149', '', '1', '65', '', '');
INSERT INTO `infection_structure` VALUES ('150', '', '2', '65', '', '');

-- ----------------------------
-- Table structure for infection_type
-- ----------------------------
DROP TABLE IF EXISTS `infection_type`;
CREATE TABLE `infection_type` (
  `typeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型编号',
  `typeName` varchar(50) NOT NULL COMMENT '类型名称',
  PRIMARY KEY (`typeId`),
  UNIQUE KEY `typeName` (`typeName`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infection_type
-- ----------------------------
INSERT INTO `infection_type` VALUES ('3', '丙');
INSERT INTO `infection_type` VALUES ('2', '乙');
INSERT INTO `infection_type` VALUES ('4', '其它');
INSERT INTO `infection_type` VALUES ('1', '甲');

-- ----------------------------
-- Table structure for party_branch
-- ----------------------------
DROP TABLE IF EXISTS `party_branch`;
CREATE TABLE `party_branch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '支部名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of party_branch
-- ----------------------------

-- ----------------------------
-- Table structure for party_lesson
-- ----------------------------
DROP TABLE IF EXISTS `party_lesson`;
CREATE TABLE `party_lesson` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '课程标题',
  `content` text COMMENT '课程内容',
  `start_time` datetime NOT NULL COMMENT '开课时间',
  `address` varchar(255) NOT NULL COMMENT '课程地点',
  `document` varchar(255) DEFAULT NULL COMMENT '课程文档',
  `image` varchar(255) DEFAULT NULL COMMENT '图片',
  `video` varchar(255) DEFAULT NULL COMMENT '视频',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of party_lesson
-- ----------------------------

-- ----------------------------
-- Table structure for party_lesson_members
-- ----------------------------
DROP TABLE IF EXISTS `party_lesson_members`;
CREATE TABLE `party_lesson_members` (
  `lid` bigint(20) DEFAULT NULL COMMENT '课程id',
  `mid` bigint(20) DEFAULT NULL COMMENT '党员id',
  `feelings` text COMMENT '感想'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of party_lesson_members
-- ----------------------------

-- ----------------------------
-- Table structure for party_members
-- ----------------------------
DROP TABLE IF EXISTS `party_members`;
CREATE TABLE `party_members` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idNo` varchar(255) NOT NULL COMMENT '党员编号',
  `branch_id` int(11) NOT NULL COMMENT '支部id',
  `name` varchar(255) NOT NULL COMMENT '党员名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of party_members
-- ----------------------------

-- ----------------------------
-- Table structure for public_school_honor
-- ----------------------------
DROP TABLE IF EXISTS `public_school_honor`;
CREATE TABLE `public_school_honor` (
  `school_id` int(11) NOT NULL COMMENT '学校Id',
  `honor_name` varchar(255) NOT NULL COMMENT '荣誉名称',
  `create_time` date NOT NULL COMMENT '荣誉取得时间',
  `image` varchar(255) NOT NULL COMMENT '图片'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of public_school_honor
-- ----------------------------

-- ----------------------------
-- Table structure for public_street
-- ----------------------------
DROP TABLE IF EXISTS `public_street`;
CREATE TABLE `public_street` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `street_name` varchar(100) NOT NULL COMMENT '街道名称',
  `people_num` int(11) NOT NULL COMMENT '人口数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of public_street
-- ----------------------------
