/*
Navicat MySQL Data Transfer

Source Server         : 192.168.3.100_3306
Source Server Version : 50527
Source Host           : 192.168.3.100:3306
Source Database       : lovehome

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2017-08-18 18:30:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tel` varchar(11) NOT NULL COMMENT '手机号',
  `name` varchar(55) DEFAULT NULL COMMENT '昵称',
  `account` varchar(11) NOT NULL COMMENT '账号',
  `pwd` varchar(55) NOT NULL COMMENT '密码',
  `is_del` int(1) NOT NULL DEFAULT '1' COMMENT '0:删除 1:正常',
  `last_login` datetime DEFAULT NULL COMMENT '注册时间',
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '用户类型 0:患者 1:志愿者 2:社会组织 -1:超管',
  `photo` varchar(255) NOT NULL DEFAULT 'LoveHome/upload/defaultPhoto.png' COMMENT '头像',
  `level` int(11) NOT NULL DEFAULT '2' COMMENT '用户级别：0超级管理员，1普通管理员，2普通用户',
  `integral` int(11) DEFAULT '0' COMMENT '积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', '1', 'admin', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '1', null, '-1', 'LoveHome/upload/defaultPhoto.png', '0', '0');
INSERT INTO `account` VALUES ('2', '15620223345', 'tt', 'test1', 'e10adc3949ba59abbe56e057f20f883e', '1', '2017-05-03 14:02:57', '-1', 'LoveHome/upload/defaultPhoto.png', '1', '0');
INSERT INTO `account` VALUES ('3', '13452344456', 'tom', 'test2', 'e10adc3949ba59abbe56e057f20f883e', '0', '2017-04-24 10:49:14', '0', '12745db600794129a2861354ccc98907.png', '2', '0');
INSERT INTO `account` VALUES ('4', '14533456789', 'jack', 'test3', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '1', 'LoveHome/upload/defaultPhoto.png', '2', '0');
INSERT INTO `account` VALUES ('5', '15622334567', 'wls', 'zhouqingyu', 'e10adc3949ba59abbe56e057f20f883e', '1', '2017-05-03 16:54:43', '-1', 'LoveHome/upload/defaultPhoto.png', '1', '0');
INSERT INTO `account` VALUES ('6', '124424242', 'asdfgh', 'asdfgh', 'e10adc3949ba59abbe56e057f20f883e', '1', null, '0', 'LoveHome/upload/defaultPhoto.png', '2', '0');

-- ----------------------------
-- Table structure for active_img
-- ----------------------------
DROP TABLE IF EXISTS `active_img`;
CREATE TABLE `active_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL COMMENT '帖子ID',
  `article_img` varchar(255) NOT NULL COMMENT '轮播图片',
  `pub_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  `is_del` int(1) NOT NULL DEFAULT '0' COMMENT '是否轮播1:轮播0:不展示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of active_img
-- ----------------------------
INSERT INTO `active_img` VALUES ('4', '2', 'LoveHome/upload/f6bd493bd07f4c45bf0da96f5df7e418.jpg', '2017-05-04 14:32:13', '1');

-- ----------------------------
-- Table structure for appeal
-- ----------------------------
DROP TABLE IF EXISTS `appeal`;
CREATE TABLE `appeal` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '求助信息id',
  `title` varchar(255) NOT NULL COMMENT '求助信息标题',
  `real_name` varchar(255) NOT NULL COMMENT '求助者真实姓名',
  `account` varchar(255) NOT NULL COMMENT '求助者账号（用户名）',
  `tel` varchar(255) NOT NULL COMMENT '求助者电话',
  `addr` varchar(255) NOT NULL COMMENT '求助者地址',
  `content` varchar(255) NOT NULL COMMENT '求助内容',
  `module` int(11) NOT NULL COMMENT '所属模块',
  `post_time` datetime NOT NULL COMMENT '发布时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `is_del` int(1) NOT NULL DEFAULT '1' COMMENT '删除标志0:删除 1:正常',
  `account_id` int(11) NOT NULL COMMENT '发布人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of appeal
-- ----------------------------
INSERT INTO `appeal` VALUES ('1', '1', '1', '1', '1', '1', '1', '7', '2017-03-08 16:23:05', '2017-03-16 16:23:13', '0', '224');
INSERT INTO `appeal` VALUES ('2', '13', '1', '1', '1', '1', '1', '7', '2017-02-08 16:23:05', '2017-03-16 16:23:13', '1', '224');
INSERT INTO `appeal` VALUES ('3', '1', '1', '1', '1', '1', '1', '7', '2013-03-08 16:23:05', '2011-01-16 16:23:13', '0', '224');
INSERT INTO `appeal` VALUES ('4', '13', '1', '1', '1', '1', '1', '7', '2014-03-08 06:23:05', '2012-01-16 16:23:13', '1', '224');
INSERT INTO `appeal` VALUES ('5', '134', '1', '1', '1', '1', '1', '7', '2015-03-08 16:23:05', '2017-01-16 16:23:13', '1', '224');
INSERT INTO `appeal` VALUES ('6', '145', '1', '1', '1', '1', '1', '7', '2017-03-08 16:23:05', '2017-03-16 16:23:13', '1', '224');
INSERT INTO `appeal` VALUES ('7', '156', '1', '1', '1', '1', '1', '7', '2011-03-08 16:23:05', '2017-01-16 16:23:13', '1', '224');
INSERT INTO `appeal` VALUES ('8', '1787', '1', '1', '1', '1', '1', '7', '2012-03-08 16:23:05', '2017-03-16 16:23:13', '1', '224');
INSERT INTO `appeal` VALUES ('9', '张三', '1', '1', '1', '1', '1', '7', '2013-03-08 16:23:05', '2012-03-16 16:23:13', '1', '224');
INSERT INTO `appeal` VALUES ('10', '张小三', '1', '1', '1', '1', '1', '7', '2014-03-08 16:23:05', '2017-03-16 16:23:13', '1', '224');
INSERT INTO `appeal` VALUES ('11', '李四', '1', '1', '1', '1', '1', '7', '2015-03-08 16:23:05', '2017-03-16 16:23:13', '1', '224');
INSERT INTO `appeal` VALUES ('12', '1', '1', '1', '1', '1', '1', '7', '2016-03-08 16:23:05', '2017-03-16 16:23:13', '1', '224');
INSERT INTO `appeal` VALUES ('13', '1', '1', '1', '1', '1', '1', '7', '2017-02-08 16:23:05', '2014-03-16 16:23:13', '1', '224');
INSERT INTO `appeal` VALUES ('14', '1', '1', '1', '1', '1', '1', '7', '2017-04-08 16:23:05', '2017-03-16 16:23:13', '0', '224');
INSERT INTO `appeal` VALUES ('15', '1', '1', '1', '1', '1', '1', '7', '2017-05-08 16:23:05', '2015-03-16 16:23:13', '0', '224');
INSERT INTO `appeal` VALUES ('16', '1', '1', '1', '1', '1', '1', '7', '2017-01-08 16:23:05', '2017-03-16 16:23:13', '1', '224');
INSERT INTO `appeal` VALUES ('17', '这是检测修改', '1', '1', '18728969696', '1', '<p>1阿斯顿</p>', '7', '2017-03-08 04:23:05', '2017-05-06 18:59:31', '1', '224');
INSERT INTO `appeal` VALUES ('18', '求助帖子', '张三', 'test1', '18722363635', '张三的家庭住址', '撒旦<img src=\"http://localhost:8080/LoveHome/umeditor/jsp/upload/20170506/38171494067567540.jpg\" _src=\"http://localhost:8080/LoveHome/umeditor/jsp/upload/20170506/38171494067567540.jpg\"/>', '7', '2017-05-06 18:46:12', '2017-05-06 18:46:12', '1', '224');
INSERT INTO `appeal` VALUES ('19', '求助信息', 'au', 'admin', '18722536365', 'au的地址', '撒地方', '7', '2017-05-06 18:47:34', '2017-05-06 18:47:34', '1', '224');
INSERT INTO `appeal` VALUES ('20', '阿斯顿飞过', '王小五', 'admin', '18722525258', '王小五的地址', '速度发顺丰', '7', '2017-05-06 18:53:49', '2017-05-06 18:53:49', '1', '224');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子id',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `photos` varchar(255) DEFAULT '1' COMMENT '图片',
  `module` int(2) DEFAULT '0' COMMENT '所属模块',
  `postTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发帖时间',
  `isDel` int(1) DEFAULT '1' COMMENT '是否删除0:删除1:正常',
  `accountId` int(11) DEFAULT '0' COMMENT '发帖人id',
  `anonymous` int(1) DEFAULT '0' COMMENT '是否匿名   0:不匿名   1:匿名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '内蒙古大兴安岭突发森林火灾 火场面积约5000公顷', '<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">中新社<a href=\"http://news.uc.cn/tag/857/\" target=\"_blank\" style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0);\">内蒙古</a>呼伦贝尔5月3日电 (记者 乌瑶 张玮)<a href=\"http://news.uc.cn/tag/857/\" target=\"_blank\" style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0);\">内蒙古</a>自治区大兴安岭毕拉<a href=\"http://news.uc.cn/tag/802/\" target=\"_blank\" style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0);\">河北</a>大河林场2日发生森林火灾。据当地防火及林业部门最新消息，目前已有逾8000人赴火场扑救。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">2日12时15分，<a href=\"http://news.uc.cn/tag/857/\" target=\"_blank\" style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0);\">内蒙古</a>大兴安岭毕拉<a href=\"http://news.uc.cn/tag/802/\" target=\"_blank\" style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0);\">河北</a>大河林场发生森林火灾。由于沟塘草甸植被干枯，风力较大(4-5级)，气温较高(达到28.6℃)，火势较强。2日晚间，风向突变，阵风达6级，给扑救带来极大困难，导致火势蔓延，火线可见南北各长7千米。初步研判，火场面积约5000公顷。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">由于火场火势较强，地形复杂，扑救难度较大。扑救过程中，有人员受伤。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\"><a href=\"http://news.uc.cn/tag/857/\" target=\"_blank\" style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0);\">内蒙古</a>自治区党委书记李纪恒深夜赴<a href=\"http://news.uc.cn/tag/857/\" target=\"_blank\" style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0);\">内蒙古</a>防火指挥部紧急部署扑救工作，要求相关部门迅速协调最好的医疗力量火速救治伤员，并做好救治应急预案；重兵投入，尽快扑灭火灾；加强值班调度和火情报送工作。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">根据气象部门监测，2日夜间到3日凌晨，风力减小，利用晚间、清晨刹风时机，当地紧急调集增派扑救人员通过地面和飞机送入两种方式进入火场。目前，火场已调集8365人，其中森警部队2590人，林业专业扑火队5775人。(完)<br/>', '1', '0', '2017-05-03 14:04:37', '1', '1', '0');
INSERT INTO `article` VALUES ('2', '格斗狂人”徐晓冬: 我不狂哪有那么多粉丝', '<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">仅用13秒击败“雷公太极”，转而约战<a href=\"http://news.uc.cn/tag/11977/\" target=\"_blank\" style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0);\">马云</a>保镖、武僧一龙、“金牌拳王”邹市明，号称要“打传统武术的假”。综合格斗教练徐晓冬“挑战整个武林”的狂妄，吸引了足够多的关注，也让自己深陷争议的漩涡。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">5月2日晚，在位于朝阳区劲松的拳馆，徐晓冬接受了北京时间“此刻”的采访。从晚上七点半到十点半，拳馆里电话机、手机一直响个不停。徐晓东却顾不上一一接听，只能拜托助理或拳馆的工作人员去应付。即便如此，他仍坚持给晚班学员上课。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">徐晓冬说，最近几天自己都是凌晨4点睡，上午9点起。即便是凌晨3点还有媒体要约他专访，疲惫写满了脸庞。在给学员上课时，一组蹲起还没做完，徐晓冬便要趴在落地的镜子上休息一会儿。但看得出他的心情不错，课堂上还用自己这两天的遭遇开开玩笑，整个拳馆的气氛一下子显得非常欢乐，完全看不出，他正处在舆论的风口浪尖。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\"><strong style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\">关于打假：武术只有1%是真的</strong><p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">北京时间“此刻”：为什么开始打假？<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">徐晓冬：在央视曝光了“太极大师”闫芳之后，我又看到了很多太极大师。我觉得那些推手真的是太假了，就先骂一骂。我负责的说，太极拳我一个都没想打，但是出现了雷雷。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">开始我也没想打他，还想让他上我的直播节目。但后来我的节目也请了另外一位太极大师，他们两个人关系不好。结果，雷雷没上节目，就把我的手机号之类的信息曝光了。让我非常生气。后来我就决定，你既然不给我留余地，我也不给你留余地。所以，也是出于报仇。这是实话，我没有那么高瞻远瞩。<p class=\"img-para\" style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\"><img src=\"http://image.uczzd.cn/6973119983195267174.webp?id=0\" alt=\"\" style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border: 0px; text-align: center; width: 710px;\"/><p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">北京时间“此刻”：你打假的目标是什么？<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">徐晓冬：传统武林，我之前说话留了很多余地，我说90%是假的，10%是真的。后来我觉得不对，传统武术，99%是假的，只有1%是真的。现在中国武林存在假、吹、骗。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">武术有三点，首选是防御、对抗的能力；第二是强身健体；第三是修身养性。以前说太极拳这三点都包含了。但是我发现不对，首先的防身、防卫，现在太极几乎没有。太极推手，真要打起架没用。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">打架不要说得那么高尚，功夫就是打架。谁要说武术是修身养性，那就不要再说防身。以防卫打人为主又兼着健身养生那就是不对的。我就打你，因为你就是假的。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">北京时间“此刻”：你打假的方式是什么？<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">徐晓冬：语言的揭发和实际的对抗。但现在已经有40多个人给我下了战书。我发布了一个消息，说自己是一个人的武林，我一个人对抗他们所有人。其中有人请了崆峒派、太极派、咏春三派的大侠，我一晚上跟他们三个人打。现在少林释永信的保镖也向我宣战了，我也答应了，全中国的六大门派全齐了。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">大家可能觉得我疯了。但大家在网络上叫我格斗狂人徐晓冬，我不狂还有那么多粉丝吗？我觉得他们就是假的，我必须要打。建国到现在60多年，没人敢像我这样去说，我觉得自己像鲁迅，他敢说出当时的黑暗。我现在敢写也敢说，当然我更敢骂。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">北京时间“此刻”：你觉得，打假到什么时候就算完结了？<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">徐晓冬：我还不知道。目前，我先把手头的事情办完。这两个月内，可能要打两到三场的比赛。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\"><strong style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\">关于约战：如果我输了说明武林更伟大</strong><p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">北京时间“此刻”：你为什么说只和各个门派的掌门打？<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">徐晓冬：不仅是太极，少林功夫也有假，我都应战，但千万不要让少林山下那些武校的学生和我打。那些大部分都是练散打的，而不是少林功夫。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">另外，有人号称中国太极实战第一人。那他们为什么也派出自己的学生？这些学生也多是散打运动员，我可以跟他们打，但请对方承认太极没人，让练散打的出来跟我打。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">而且，就算我打赢了弟子，他们也会说，打赢弟子算什么？永远都有嘴上的功夫。所以我就打掌门，不打算给他们留余地。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">他们可能说徐晓冬是个草民，没有名气，甚至连正规比赛都没参加过，更没有战绩。所以没有资格跟他们打？OK，这两天我的名气够了吧？<p class=\"img-para\" style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\"><img src=\"http://image.uczzd.cn/6362197015043883489.webp?id=0\" alt=\"\" style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border: 0px; text-align: center; width: 710px;\"/><p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">北京时间“此刻”：应对各个门派的大师，你有什么特殊准备么？<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">徐晓冬：没有特殊的准备，就是平时的训练。我依靠肌肉记忆法训练，就是用某个动作连续打。我在教学时，挨打都不叫啥，学员一边打，我一边乐。当你的身体不怕挨打的时候，你的战斗力会更强。但有些武术不是这样，不能挨打、害怕挨打，那跟一般人没有什么区别。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">北京时间“此刻”：什么样的武者能赢得你的尊重？<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">徐晓冬：真的进行过系统训练，并且跟人交过手，打过实战。虽然看上去很暴力，但很遗憾，没有实战就没法验证身手。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">北京时间“此刻”：之后的约战，输或赢你会怎样？<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">徐晓冬：如果我输了，是好事儿。证明中国武林更伟大了。就等于我拿自己的身体，以身试武林。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">赢了，也不代表他们全部都是假的。赢了我只希望假的能低头。不是认错，是去反思和反省。更不用给我钱，给我下跪，我不需要。当然他们输了也可以骂徐晓东是土鳖，也可以说打赢了他一个人，不代表整个门派不行。那好，我会一直战斗下去。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">我觉得中国武术，真的就像一辆20年前的赛车，跟现在的赛车没法比。但是20年前的赛车依旧有价值，为什么？怀旧。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">北京时间“此刻”：为什么还要约邹市明？<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">徐晓冬：他们都说我打的各流各派，打的是武术，为啥不打搏击。我谁都打，但是约邹市明是因为我喜欢他，崇拜他。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">而且，我打算做慈善。我跟各个门派约，他们说我是流氓，到处打架。那好，我跟邹市明这样的正派打一场，我把所有挣的钱捐给北京的孤儿院，现场发支票或者电脑转账，所有人都现场看着。也许会有人说，徐晓东野兽的外表下，有个善良的心。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">但很遗憾，邹市明说职业跟业余没得打。他可能误解了我，但我的内心是想跟他一起做慈善事业。无所谓。人家是大咖，我是屌丝。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\"><strong style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\">关于质疑：没用打假赚一分钱</strong><p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">北京时间“此刻”：有网友说你是在炒作自己，你怎么看？<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">徐晓冬：如果我在一个小黑屋里跟雷雷打，打完后出来告诉大家我把他赢了。这个谁信？另外，万一雷雷说我打人，要告我怎么办？所以这才会在公开的场合，并且录下视频。如果这算炒作，那就炒吧。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">我觉得，我这里有真正的搏击精神。包括我在内，拳馆里的所有人，都不是职业的拳手，都不能通过这个赚钱，只是因为喜欢。我不是穷人，也不是富翁，不因为赚钱而坚持下来，这就是我的信念。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">有人可能会说我要利用这件事来赚钱，但到目前为止，我没有因为这件事赚到一分钱，还因为交通、食宿等等花了很多钱。我之前还推掉了一个赞助，我想让自己真实霸气地活着。但开销太大的话，以后或许会考虑进行收费直播。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">北京时间“此刻”：有网友认为你涉嫌斗殴，扰乱治安，你如何回应？<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">徐晓冬：打架斗殴是突发事件，双方在非常愤怒、不计后果、没有签任何字据的情况下打架，这个是非法的。我们是在合理合法的框架内，双方在约战前，发生交友，签字画押，并视频摄像、有证人的情况下进行，为啥说是打架斗殴。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">但为了以防万一，以后比赛时我会带上法务的工作人员，签署合同、拍摄视频。并且一定会在一个合法的场地里进行。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">北京时间“此刻”：成为“网红”后，你的生活有变化么？<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">徐晓冬：几乎没有太多变化。原来是吃、喝、拉、撒、睡、打人、挨打。现在多了一项，接受采访。另外，最近确实也有不少人慕名到拳馆来的人。<p class=\"img-para\" style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\"><img src=\"http://image.uczzd.cn/16143587211847877228.webp?id=0\" alt=\"\" style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border: 0px; text-align: center; width: 710px;\"/><p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">北京时间“此刻”：现在拳馆的情况怎么样？<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">徐晓冬：我现在有三家拳馆，从第一家2011年到现在，上万人了。但是每次来的人几十人不等。目前大概也有上百人。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">我从1996年开始练散打，后来开始练习MMA，到现在20多年吧，拳击、摔跤、柔术、柔道、泰拳也都练了。我也会把这些教给学生们。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">北京时间“此刻”：接下来怎么打算？<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">徐晓冬：明天（5月3日）我会去趟台湾。台湾有一个叫做“陈馆长”的网红，是个退役的特种兵。也是一个打假人，跟我的理论也几乎一样。会一起做一个节目，以语言交流的“文斗”为主，也不排除“武斗”。接下来，还要去澳大利亚和法国。<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">另外，我会在近日召开新闻发布会，详细地介绍我应战各个门派的具体安排。<br/>', '1', '0', '2017-05-03 14:27:55', '1', '1', '0');
INSERT INTO `article` VALUES ('3', '云南通报在押犯越狱事件: 罪犯趁司机下车时抢车脱逃', '<p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">5月3日早上10点，云南省司法厅通报了一起案件。通报称，2017年5月2日上午8时20分，云南省第一监狱七监区一名在押罪犯从监狱逃脱，目前正在全力追捕中。<p class=\"img-para\" style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\"><img src=\"http://image.uczzd.cn/17820043673995698481.jpeg?id=0\" alt=\"\" style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border: 0px; text-align: center; width: 710px;\"/><p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">通报称，在押罪犯张林苍，男，27岁，云南省马龙县人，因运输毒品罪被判处无期徒刑，剥夺政治权利终身，2017年1月18日入监。<p class=\"img-para\" style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\"><img src=\"http://image.uczzd.cn/335614306242411421.jpeg?id=0\" alt=\"\" style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border: 0px; text-align: center; width: 710px;\"/><p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">其擅离劳动现场，趁驾驶员下车等候装货之机，强行驾驶一辆130型福田牌货车，冲破监狱隔离网和施工用的临时栅栏门后脱逃，并把货车丢弃在距监狱2公里处的虹桥路附近。<p class=\"img-para\" style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\"><img src=\"http://image.uczzd.cn/2279529835460512022.jpeg?id=0\" alt=\"\" style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border: 0px; text-align: center; width: 710px;\"/><p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">省司法厅、省监狱局高度重视，迅速成立处置工作领导小组，组建追捕指挥部。省司法厅党委书记、厅长商小云，省监狱管理局党委书记、局长夏新建等同志接报后，立即赶赴省第一监狱，现场组织指挥案件侦查和追捕工作。<p class=\"img-para\" style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\"><img src=\"http://image.uczzd.cn/4128644407911920888.jpeg?id=0\" alt=\"\" style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border: 0px; text-align: center; width: 710px;\"/><p style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\">目前，张犯仍在逃，相关部门正在联动追捕。<p class=\"img-para\" style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0px; margin-bottom: 48px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif; font-size: medium; white-space: normal;\"><img src=\"http://image.uczzd.cn/5277073144061594323.jpeg?id=0\" alt=\"\" style=\"outline: 0px; text-size-adjust: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border: 0px; text-align: center; width: 710px;\"/><br/>', '1', '6', '2017-05-03 14:36:03', '1', '1', '0');
INSERT INTO `article` VALUES ('4', 'dd', 'ddd', '1', '1', '2017-05-03 15:18:45', '1', '1', '0');
INSERT INTO `article` VALUES ('5', 'ee', 'eeeee', '1', '2', '2017-05-03 15:18:52', '1', '1', '0');
INSERT INTO `article` VALUES ('6', 'eee', 'eeeeee', '1', '3', '2017-05-03 15:18:58', '1', '1', '0');
INSERT INTO `article` VALUES ('7', '求助者姓名:null;求助者电话:null;求助者地址:null', null, '1', '6', '2017-05-03 16:31:17', '0', '3', '0');
INSERT INTO `article` VALUES ('8', '1', '啊实打实大声道', '1', '5', '2017-05-03 18:21:58', '0', '3', '0');
INSERT INTO `article` VALUES ('9', '1', 'asdszxc2343234234234234', '1', '4', '2017-05-04 11:27:21', '0', '3', '0');
INSERT INTO `article` VALUES ('10', '1', 'asdcxczxczxxzxc4534535', '', '4', '2017-05-04 11:30:51', '0', '3', '0');
INSERT INTO `article` VALUES ('11', '1', '发帖交流', '', '4', '2017-05-04 11:31:56', '0', '3', '0');
INSERT INTO `article` VALUES ('12', '1', '发帖交流', '', '4', '2017-05-04 11:32:58', '0', '3', '0');
INSERT INTO `article` VALUES ('13', '1', '发帖交流', '', '4', '2017-05-04 11:34:33', '0', '3', '0');
INSERT INTO `article` VALUES ('14', '1', '阿萨是单位全身都在', '', '4', '2017-05-04 11:37:23', '0', '3', '0');
INSERT INTO `article` VALUES ('15', '1', '经验交流贴', '', '4', '2017-05-04 11:40:19', '0', '3', '0');
INSERT INTO `article` VALUES ('16', '1', '按时打算打算待送达', '', '4', '2017-05-04 11:48:24', '1', '3', '0');
INSERT INTO `article` VALUES ('17', ' tt', 'tttt', '1', '0', '2017-05-04 14:28:19', '1', '1', '0');

-- ----------------------------
-- Table structure for assent_collect
-- ----------------------------
DROP TABLE IF EXISTS `assent_collect`;
CREATE TABLE `assent_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `post_id` int(11) DEFAULT NULL COMMENT '帖子id',
  `account_id` int(11) DEFAULT NULL COMMENT '用户id',
  `is_assent` int(1) DEFAULT '0' COMMENT '是否点赞1:是0:否',
  `is_collect` int(1) DEFAULT '0' COMMENT '是否收藏1:是0:否',
  `is_report` int(1) DEFAULT '0' COMMENT '是否举报1:是0:否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assent_collect
-- ----------------------------
INSERT INTO `assent_collect` VALUES ('1', '1', '3', '0', '1', '1');

-- ----------------------------
-- Table structure for donate
-- ----------------------------
DROP TABLE IF EXISTS `donate`;
CREATE TABLE `donate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '爱心捐赠id',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `real_name` varchar(255) NOT NULL DEFAULT '这个没用，一会儿删了' COMMENT '求助者真实姓名',
  `donor_account` varchar(255) NOT NULL COMMENT '捐助者账号（用户名）',
  `donor_contact_way` varchar(255) NOT NULL COMMENT '捐赠者联系方式（电话/邮箱/QQ等）',
  `donation_name` varchar(255) NOT NULL COMMENT '捐赠物品的名称',
  `donation_count` varchar(255) NOT NULL COMMENT '捐赠物品数量',
  `donation_value` varchar(255) NOT NULL COMMENT '捐赠物品价值',
  `donation_money` varchar(255) NOT NULL COMMENT '捐赠金额',
  `donation_total_value` varchar(255) NOT NULL COMMENT '捐赠总价值',
  `donation_time` datetime NOT NULL COMMENT '捐赠时间',
  `recipient_account` varchar(255) NOT NULL COMMENT '受助者账号（用户名）',
  `module` int(11) NOT NULL COMMENT '所属模块',
  `post_time` datetime NOT NULL COMMENT '发布时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `is_del` int(1) NOT NULL DEFAULT '1' COMMENT '删除标志0:删除 1:正常',
  `anonymous` int(1) NOT NULL DEFAULT '0' COMMENT '是否匿名 0:不匿名 1:匿名',
  `remark` longtext COMMENT '备注',
  `account_id` int(11) NOT NULL COMMENT '发帖人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of donate
-- ----------------------------
INSERT INTO `donate` VALUES ('1', '1', '1', 'test1', '1', '1', '1', '1', '1', '1', '2017-04-03 04:56:20', 'admin', '4', '2017-05-09 04:56:35', '2017-05-06 13:02:24', '1', '0', null, '224');
INSERT INTO `donate` VALUES ('2', '2', '2', 'admin', '2', '2', '2', '2', '2', '2', '2017-04-18 05:38:22', 'test1', '4', '2017-05-10 05:38:32', '2017-05-06 13:06:59', '1', '0', null, '224');
INSERT INTO `donate` VALUES ('3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '2017-05-08 05:39:39', '3', '4', '2017-05-09 05:39:14', '2017-05-06 19:00:29', '1', '0', null, '224');
INSERT INTO `donate` VALUES ('4', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2017-04-18 16:56:20', '1', '4', '2017-05-09 16:56:35', '2017-03-06 16:56:39', '1', '0', null, '224');
INSERT INTO `donate` VALUES ('5', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2017-05-23 16:56:20', '1', '4', '2017-05-09 16:56:35', '2017-03-14 16:56:39', '1', '0', null, '224');
INSERT INTO `donate` VALUES ('6', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2017-05-10 16:56:20', '1', '4', '2017-05-09 16:56:35', '2017-03-21 16:56:39', '1', '0', null, '224');
INSERT INTO `donate` VALUES ('7', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2017-05-10 16:56:20', '1', '4', '2017-05-09 16:56:35', '2017-03-07 16:56:39', '1', '0', null, '224');
INSERT INTO `donate` VALUES ('8', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2017-05-10 16:56:20', '1', '4', '2017-05-09 16:56:35', '2017-03-13 16:56:39', '1', '0', null, '224');
INSERT INTO `donate` VALUES ('9', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2017-05-10 16:56:20', '1', '4', '2017-05-09 16:56:35', '2017-03-20 16:56:39', '1', '0', null, '224');
INSERT INTO `donate` VALUES ('10', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2017-05-10 16:56:20', '1', '4', '2017-05-09 16:56:35', '2017-03-20 16:56:39', '1', '0', null, '224');
INSERT INTO `donate` VALUES ('11', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2017-05-10 04:56:20', '1', '4', '2017-05-09 04:56:35', '2017-05-06 12:56:31', '1', '0', null, '224');
INSERT INTO `donate` VALUES ('12', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2017-05-10 04:56:20', '1', '4', '2017-05-09 04:56:35', '2017-05-06 12:48:50', '1', '0', null, '224');
INSERT INTO `donate` VALUES ('13', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2017-05-10 16:56:20', '1', '4', '2017-05-09 16:56:35', '2017-03-27 16:56:39', '1', '0', null, '224');
INSERT INTO `donate` VALUES ('14', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2017-05-10 16:56:20', '1', '4', '2017-05-09 16:56:35', '2017-03-14 16:56:39', '1', '0', null, '224');
INSERT INTO `donate` VALUES ('15', '123', '这个没用，一会儿删了', '123', '123', '123', '0', '0', '0', '0', '2017-05-10 17:39:39', '123', '4', '2017-05-05 09:57:01', '2017-03-14 09:57:01', '1', '1', '123', '224');
INSERT INTO `donate` VALUES ('16', '12', '这个没用，一会儿删了', '12', '12', '12', '0', '0', '0', '0', '2017-05-10 17:39:39', '12', '4', '2017-05-05 09:59:33', '2017-03-14 09:59:33', '1', '1', '12', '224');
INSERT INTO `donate` VALUES ('17', '1', '这个没用，一会儿删了', '1', '1', '1', '0', '0', '0', '0', '2017-05-22 10:34:08', '1', '4', '2017-05-05 10:34:37', '2017-05-05 10:34:37', '1', '1', '1', '224');
INSERT INTO `donate` VALUES ('18', 'qwe', '这个没用，一会儿删了', '9', '9', '9', '0', '0', '0', '0', '2017-05-09 10:38:28', '9', '4', '2017-05-05 10:38:35', '2017-05-06 12:47:47', '1', '0', '9', '224');
INSERT INTO `donate` VALUES ('19', 'au', '这个没用，一会儿删了', '1', '1', '1', '0', '0', '0', '0', '2017-05-05 10:44:41', '1', '4', '2017-05-05 10:44:55', '2017-05-06 12:48:57', '1', '1', '12', '224');
INSERT INTO `donate` VALUES ('20', 'au', '这个没用，一会儿删了', '123', '123', '1', '0', '34', '34', '34', '2017-05-24 10:44:41', '123', '4', '2017-05-05 02:29:28', '2017-05-06 12:49:18', '1', '1', '123', '224');
INSERT INTO `donate` VALUES ('21', 'au', '这个没用，一会儿删了', '1', '213', '1', '0', '0', '0', '0', '2017-05-05 10:44:41', '1', '4', '2017-05-05 14:29:38', '2017-05-05 14:29:38', '0', '1', '12', '224');
INSERT INTO `donate` VALUES ('22', 'au', '这个没用，一会儿删了', '1', '123', '1', '0', '0', '0', '0', '2017-05-05 10:44:41', '1', '4', '2017-05-05 14:29:46', '2017-05-05 14:29:46', '0', '1', '12', '224');
INSERT INTO `donate` VALUES ('23', 'au', '这个没用，一会儿删了', '1我去饿', '213', '1', '0', '0', '0', '0', '2017-05-05 10:44:41', '1', '4', '2017-05-05 14:29:57', '2017-05-05 14:29:57', '0', '1', '12', '224');
INSERT INTO `donate` VALUES ('24', '6', '这个没用，一会儿删了', '6', '6', '6', '06', '06', '06', '06', '2017-05-10 16:58:02', '6', '4', '2017-05-05 16:59:46', '2017-05-05 16:59:46', '0', '1', '6', '224');
INSERT INTO `donate` VALUES ('25', '捐赠', '这个没用，一会儿删了', 'test1', '247923631', '衣服', '2', '200', '200', '200', '2017-05-04 12:19:37', 'admin', '4', '2017-05-06 12:19:53', '2017-05-06 12:50:25', '1', '1', '就这么牛逼！', '224');
INSERT INTO `donate` VALUES ('26', '爱心捐赠', '这个没用，一会儿删了', 'admin', '18755569655', '衣服', '56', '56', '56', '56', '2017-05-04 12:54:30', 'test1', '4', '2017-05-06 12:55:28', '2017-05-06 12:56:39', '1', '1', '捐吧！', '224');
INSERT INTO `donate` VALUES ('27', '1', '这个没用，一会儿删了', 'test1', '18722225369', '1', '0', '0', '0', '0', '2017-04-04 09:24:13', 'admin', '4', '2017-05-08 09:24:22', '2017-05-08 09:24:22', '1', '0', '', '1');

-- ----------------------------
-- Table structure for floor
-- ----------------------------
DROP TABLE IF EXISTS `floor`;
CREATE TABLE `floor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL COMMENT '帖子id',
  `floor_sum` int(11) DEFAULT NULL COMMENT '楼层帖子数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of floor
-- ----------------------------

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `restore_id` int(11) DEFAULT NULL COMMENT '所属评论id',
  `content` varchar(255) DEFAULT NULL COMMENT '回复内容',
  `reply_time` datetime DEFAULT NULL COMMENT '回复时间',
  `is_del` int(1) DEFAULT '1' COMMENT '是否删除0:删除1:有效',
  `post_id` int(11) DEFAULT NULL COMMENT '帖子Id',
  `account_id` int(11) DEFAULT NULL COMMENT '回复的用户id',
  `account_id2` int(11) DEFAULT NULL COMMENT '被回复的用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES ('1', '1', '按时大大', '2017-05-03 14:17:04', '0', '1', '2', '2');
INSERT INTO `reply` VALUES ('2', '2', '测试2', '2017-05-03 14:31:53', '0', '2', '2', '2');
INSERT INTO `reply` VALUES ('3', '18', '测试3', '2017-05-03 14:32:25', '0', '2', '2', '2');
INSERT INTO `reply` VALUES ('4', '4', '按时打算打算', '2017-05-03 15:20:08', '0', '4', '3', '3');
INSERT INTO `reply` VALUES ('5', '5', '啊实打实的山东省呈现出', '2017-05-03 15:20:29', '0', '5', '3', '3');
INSERT INTO `reply` VALUES ('6', '7', '手术方式地方', '2017-05-04 14:42:01', '0', '1', '3', '3');

-- ----------------------------
-- Table structure for restore
-- ----------------------------
DROP TABLE IF EXISTS `restore`;
CREATE TABLE `restore` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `post_id` int(11) NOT NULL COMMENT '帖子Id',
  `account_id` int(55) NOT NULL COMMENT '用户id',
  `content` varchar(255) DEFAULT NULL COMMENT '主评论内容',
  `is_del` int(1) DEFAULT '1' COMMENT '是否删除0:删除1:有效',
  `restore_time` datetime DEFAULT NULL COMMENT '评论时间',
  `floor` int(11) DEFAULT NULL COMMENT '所属楼层',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of restore
-- ----------------------------
INSERT INTO `restore` VALUES ('1', '1', '3', '123', '0', '2017-05-04 15:40:42', '0');
INSERT INTO `restore` VALUES ('2', '1', '3', '', '1', '2017-05-04 16:26:52', '0');

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商城ID',
  `title` varchar(100) NOT NULL COMMENT '商品名称',
  `photo` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `price` float DEFAULT NULL COMMENT '商品原价',
  `real_price` float DEFAULT NULL COMMENT '商品app渠道专享价',
  `link` varchar(255) NOT NULL COMMENT '商品链接',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_del` int(1) NOT NULL DEFAULT '1' COMMENT '0:删除1:正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES ('1', 'daiwa骑行太阳镜 达瓦钓鱼镜 钓鱼偏光增晰镜 达亿瓦登山太阳眼镜', 'LoveHome/upload/196dbac5a4af4a3cad11957db4939ecb.jpg', '50', '45', 'https://shop73462402.taobao.com/?spm=2013.1.1000126.2.MK7EEU', '2017-05-03 15:43:30', null, '1');
INSERT INTO `store` VALUES ('2', '55', 'LoveHome/upload/998c6c1c77674403ad98e9191b6eca79.png', '5', '5', '5', '2017-05-03 17:02:43', null, '0');
INSERT INTO `store` VALUES ('3', 'ff', 'LoveHome/upload/ba919227d5d84e7b9f2f47ab05ab7eb4.docx', '55', '55', '55', '2017-05-03 17:13:03', null, '0');
INSERT INTO `store` VALUES ('4', '55', 'LoveHome/upload/ca176f7f8f6a4b2fb9070b7d6be04ccd.png', '5', '55', '5', '2017-05-03 17:15:14', null, '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(22) NOT NULL COMMENT '姓名、法人',
  `sex` int(1) NOT NULL DEFAULT '1' COMMENT '0：女 1：男 ',
  `idCard` varchar(30) DEFAULT NULL,
  `birth_time` datetime DEFAULT NULL COMMENT '出生日期、注册时间',
  `addr` varchar(255) DEFAULT NULL COMMENT '住址、地址',
  `qq` varchar(22) DEFAULT NULL COMMENT 'qq',
  `wechat` varchar(22) DEFAULT NULL COMMENT '微信',
  `create_time` datetime NOT NULL COMMENT '资料完善、修改时间',
  `tel` varchar(22) DEFAULT NULL COMMENT '联系电话',
  `work_addr` varchar(255) DEFAULT NULL COMMENT '工作单位',
  `school` varchar(255) DEFAULT NULL COMMENT '所在学校',
  `field` varchar(255) DEFAULT NULL COMMENT '所学专业',
  `sickness` varchar(255) DEFAULT NULL COMMENT '所患病种',
  `education` varchar(255) DEFAULT NULL COMMENT '学历',
  `account_id` int(11) NOT NULL COMMENT '对应账号ID',
  `capital` float DEFAULT NULL COMMENT '注册资金',
  `scope` varchar(255) DEFAULT NULL COMMENT '业务范围',
  `organization` varchar(255) DEFAULT NULL COMMENT '组织名称',
  `integral` int(11) DEFAULT '0' COMMENT '积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '张三', '1', null, null, null, null, null, '2017-05-04 11:36:51', null, null, null, null, null, null, '3', null, null, null, '15');
