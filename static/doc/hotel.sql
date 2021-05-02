/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80019
Source Host           : localhost:3306
Source Database       : hotel

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2021-05-02 16:57:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bill`
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `id` int NOT NULL AUTO_INCREMENT,
  `room` int DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT '0.00',
  `status` int DEFAULT '2',
  `updatetime` datetime DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `inmoney` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES ('24', '109', null, '19.80', '1', '2021-05-02 16:55:34', '2021-05-02 16:55:34', '19.80');

-- ----------------------------
-- Table structure for `check_in`
-- ----------------------------
DROP TABLE IF EXISTS `check_in`;
CREATE TABLE `check_in` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `custumer_id` int DEFAULT NULL COMMENT '瀹㈡埛id',
  `room_id` int DEFAULT NULL COMMENT '房间id',
  `time_in` datetime DEFAULT NULL COMMENT '入住时间',
  `day` int DEFAULT NULL COMMENT '入住天数',
  `time_out` datetime DEFAULT NULL COMMENT '退房时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `bill` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of check_in
-- ----------------------------
INSERT INTO `check_in` VALUES ('12', '1', '109', '2021-05-02 16:55:33', '2', '2021-05-04 16:55:33', '2021-05-02 16:55:34', '2021-05-02 16:55:34', '24');

-- ----------------------------
-- Table structure for `custumer`
-- ----------------------------
DROP TABLE IF EXISTS `custumer`;
CREATE TABLE `custumer` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `sex` int DEFAULT NULL COMMENT '性别,0女，1男',
  `idcard` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `tel` varchar(255) DEFAULT NULL COMMENT '电话号码',
  `address` varchar(255) DEFAULT NULL COMMENT '家庭住址',
  `type` int DEFAULT '0' COMMENT '类型，0普通，1vip',
  `pho` longtext COMMENT '头像',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of custumer
-- ----------------------------
INSERT INTO `custumer` VALUES ('1', '对对对', '1', '4444', '131', '好好干', '1', '0', '2021-02-03 16:46:06', '2021-02-03 16:46:06');
INSERT INTO `custumer` VALUES ('4', '张杰', '0', '232323', '2323', '2323', '1', null, '2021-02-03 17:06:21', '2021-02-03 17:06:21');

-- ----------------------------
-- Table structure for `floor`
-- ----------------------------
DROP TABLE IF EXISTS `floor`;
CREATE TABLE `floor` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `no` varchar(50) DEFAULT NULL COMMENT '楼房编号',
  `name` varchar(255) DEFAULT NULL COMMENT '楼房名称',
  `floorno` varchar(50) DEFAULT NULL COMMENT '楼层',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int DEFAULT NULL COMMENT '状态0：正常，-1：异常',
  `remark` varchar(255) DEFAULT NULL COMMENT '楼房简介',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of floor
-- ----------------------------
INSERT INTO `floor` VALUES ('15', '1', '1', '8', '2021-05-01 08:41:56', '2021-05-01 08:41:56', '0', '8');

-- ----------------------------
-- Table structure for `income`
-- ----------------------------
DROP TABLE IF EXISTS `income`;
CREATE TABLE `income` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `money` decimal(11,2) DEFAULT '0.00' COMMENT '收入',
  `create_time` datetime DEFAULT NULL COMMENT '收入时间',
  `in_type` int DEFAULT '1' COMMENT '1：现金，2：支付宝，3：微信，4：银行卡',
  `remark` varchar(255) DEFAULT NULL COMMENT '谁付的钱，备注',
  `type` int DEFAULT '0' COMMENT '0:收入,1:支出',
  `bill` int DEFAULT NULL COMMENT '账单表id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of income
-- ----------------------------

-- ----------------------------
-- Table structure for `room`
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `room_type_id` int DEFAULT NULL COMMENT '房间类型id',
  `floorid` int DEFAULT NULL COMMENT '楼房id',
  `room` varchar(255) DEFAULT NULL COMMENT '房间编号',
  `floorno` varchar(50) DEFAULT NULL COMMENT '楼层',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int DEFAULT NULL COMMENT '状态0：空闲，-1：异常，1：入住，-2：未打扫',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('109', '1', '15', '151101', '1', '2021-05-02 16:55:34', '2021-05-01 08:41:56', '1', null);
INSERT INTO `room` VALUES ('110', '1', '15', '151102', '1', '2021-05-02 16:54:51', '2021-05-01 08:41:56', '0', null);
INSERT INTO `room` VALUES ('111', '1', '15', '151103', '1', '2021-05-02 16:54:54', '2021-05-01 08:41:56', '0', null);
INSERT INTO `room` VALUES ('112', '1', '15', '151104', '1', '2021-05-02 16:54:57', '2021-05-01 08:41:56', '0', null);
INSERT INTO `room` VALUES ('113', '1', '15', '151105', '1', '2021-05-01 08:41:56', '2021-05-01 08:41:56', '0', null);
INSERT INTO `room` VALUES ('114', '1', '15', '151106', '1', '2021-05-02 16:55:01', '2021-05-01 08:41:57', '0', null);
INSERT INTO `room` VALUES ('115', '1', '15', '151107', '1', '2021-05-02 16:55:04', '2021-05-01 08:41:57', '0', null);
INSERT INTO `room` VALUES ('116', '1', '15', '151108', '1', '2021-05-01 08:41:57', '2021-05-01 08:41:57', '0', null);
INSERT INTO `room` VALUES ('117', '1', '15', '151201', '2', '2021-05-01 08:41:57', '2021-05-01 08:41:57', '0', null);
INSERT INTO `room` VALUES ('118', '1', '15', '151202', '2', '2021-05-02 16:55:07', '2021-05-01 08:41:57', '0', '更让他一人');
INSERT INTO `room` VALUES ('119', '1', '15', '151203', '2', '2021-05-02 16:55:14', '2021-05-01 08:41:57', '0', '而沃尔');
INSERT INTO `room` VALUES ('120', '1', '15', '151204', '2', '2021-05-01 21:28:37', '2021-05-01 08:41:57', '-1', '让他一人同意');
INSERT INTO `room` VALUES ('121', '1', '15', '151205', '2', '2021-05-01 08:41:57', '2021-05-01 08:41:57', '0', null);
INSERT INTO `room` VALUES ('122', '1', '15', '151206', '2', '2021-05-01 08:41:57', '2021-05-01 08:41:57', '0', null);
INSERT INTO `room` VALUES ('123', '1', '15', '151207', '2', '2021-05-01 08:41:57', '2021-05-01 08:41:57', '0', null);
INSERT INTO `room` VALUES ('124', '1', '15', '151208', '2', '2021-05-01 08:41:58', '2021-05-01 08:41:58', '0', null);
INSERT INTO `room` VALUES ('125', '1', '15', '151301', '3', '2021-05-01 08:41:58', '2021-05-01 08:41:58', '0', null);
INSERT INTO `room` VALUES ('126', '1', '15', '151302', '3', '2021-05-01 08:41:58', '2021-05-01 08:41:58', '0', null);
INSERT INTO `room` VALUES ('127', '1', '15', '151303', '3', '2021-05-02 16:55:11', '2021-05-01 08:41:58', '0', '5654');
INSERT INTO `room` VALUES ('128', '1', '15', '151304', '3', '2021-05-01 08:41:58', '2021-05-01 08:41:58', '0', null);
INSERT INTO `room` VALUES ('129', '1', '15', '151305', '3', '2021-05-01 08:41:58', '2021-05-01 08:41:58', '0', null);
INSERT INTO `room` VALUES ('130', '1', '15', '151306', '3', '2021-05-01 08:41:58', '2021-05-01 08:41:58', '0', null);
INSERT INTO `room` VALUES ('131', '1', '15', '151307', '3', '2021-05-01 08:41:58', '2021-05-01 08:41:58', '0', null);
INSERT INTO `room` VALUES ('132', '1', '15', '151308', '3', '2021-05-01 23:16:58', '2021-05-01 08:41:58', '-1', null);
INSERT INTO `room` VALUES ('133', '1', '15', '151401', '4', '2021-05-01 08:41:58', '2021-05-01 08:41:58', '0', null);
INSERT INTO `room` VALUES ('134', '1', '15', '151402', '4', '2021-05-01 08:41:59', '2021-05-01 08:41:59', '0', null);
INSERT INTO `room` VALUES ('135', '1', '15', '151403', '4', '2021-05-01 08:41:59', '2021-05-01 08:41:59', '0', null);
INSERT INTO `room` VALUES ('136', '1', '15', '151404', '4', '2021-05-01 08:41:59', '2021-05-01 08:41:59', '0', null);
INSERT INTO `room` VALUES ('137', '1', '15', '151405', '4', '2021-05-01 08:41:59', '2021-05-01 08:41:59', '0', null);
INSERT INTO `room` VALUES ('138', '1', '15', '151406', '4', '2021-05-01 08:41:59', '2021-05-01 08:41:59', '0', null);
INSERT INTO `room` VALUES ('139', '1', '15', '151407', '4', '2021-05-01 08:41:59', '2021-05-01 08:41:59', '0', null);
INSERT INTO `room` VALUES ('140', '1', '15', '151408', '4', '2021-05-01 23:17:09', '2021-05-01 08:41:59', '0', null);
INSERT INTO `room` VALUES ('141', '1', '15', '151501', '5', '2021-05-01 08:42:00', '2021-05-01 08:42:00', '0', null);
INSERT INTO `room` VALUES ('142', '1', '15', '151502', '5', '2021-05-01 08:42:00', '2021-05-01 08:42:00', '0', null);
INSERT INTO `room` VALUES ('143', '1', '15', '151503', '5', '2021-05-01 08:42:00', '2021-05-01 08:42:00', '0', null);
INSERT INTO `room` VALUES ('144', '1', '15', '151504', '5', '2021-05-01 08:42:00', '2021-05-01 08:42:00', '0', null);
INSERT INTO `room` VALUES ('145', '1', '15', '151505', '5', '2021-05-01 08:42:00', '2021-05-01 08:42:00', '0', null);
INSERT INTO `room` VALUES ('146', '1', '15', '151506', '5', '2021-05-01 08:42:00', '2021-05-01 08:42:00', '0', null);
INSERT INTO `room` VALUES ('147', '1', '15', '151507', '5', '2021-05-02 16:55:22', '2021-05-01 08:42:00', '0', null);
INSERT INTO `room` VALUES ('148', '1', '15', '151508', '5', '2021-05-01 08:42:00', '2021-05-01 08:42:00', '0', null);
INSERT INTO `room` VALUES ('149', '1', '15', '151601', '6', '2021-05-01 08:42:00', '2021-05-01 08:42:00', '0', null);
INSERT INTO `room` VALUES ('150', '1', '15', '151602', '6', '2021-05-02 16:55:18', '2021-05-01 08:42:01', '0', null);
INSERT INTO `room` VALUES ('151', '1', '15', '151603', '6', '2021-05-01 08:42:01', '2021-05-01 08:42:01', '0', null);
INSERT INTO `room` VALUES ('152', '1', '15', '151604', '6', '2021-05-01 08:42:01', '2021-05-01 08:42:01', '0', null);
INSERT INTO `room` VALUES ('153', '1', '15', '151605', '6', '2021-05-01 08:42:01', '2021-05-01 08:42:01', '0', null);
INSERT INTO `room` VALUES ('154', '1', '15', '151606', '6', '2021-05-01 08:42:01', '2021-05-01 08:42:01', '0', null);
INSERT INTO `room` VALUES ('155', '1', '15', '151607', '6', '2021-05-01 08:42:01', '2021-05-01 08:42:01', '0', null);
INSERT INTO `room` VALUES ('156', '1', '15', '151608', '6', '2021-05-01 08:42:01', '2021-05-01 08:42:01', '0', null);
INSERT INTO `room` VALUES ('157', '1', '15', '151701', '7', '2021-05-01 08:42:01', '2021-05-01 08:42:01', '0', null);
INSERT INTO `room` VALUES ('158', '1', '15', '151702', '7', '2021-05-01 08:42:02', '2021-05-01 08:42:02', '0', null);
INSERT INTO `room` VALUES ('159', '1', '15', '151703', '7', '2021-05-01 08:42:02', '2021-05-01 08:42:02', '0', null);
INSERT INTO `room` VALUES ('160', '1', '15', '151704', '7', '2021-05-01 08:42:02', '2021-05-01 08:42:02', '0', null);
INSERT INTO `room` VALUES ('161', '1', '15', '151705', '7', '2021-05-01 08:42:02', '2021-05-01 08:42:02', '0', null);
INSERT INTO `room` VALUES ('162', '1', '15', '151706', '7', '2021-05-01 08:42:02', '2021-05-01 08:42:02', '0', null);
INSERT INTO `room` VALUES ('163', '1', '15', '151707', '7', '2021-05-01 21:30:20', '2021-05-01 08:42:02', '-1', '让他一人');
INSERT INTO `room` VALUES ('164', '1', '15', '151708', '7', '2021-05-01 08:42:02', '2021-05-01 08:42:02', '0', null);
INSERT INTO `room` VALUES ('165', '1', '15', '151801', '8', '2021-05-01 08:42:02', '2021-05-01 08:42:02', '0', null);
INSERT INTO `room` VALUES ('166', '1', '15', '151802', '8', '2021-05-01 08:42:02', '2021-05-01 08:42:02', '0', null);
INSERT INTO `room` VALUES ('167', '1', '15', '151803', '8', '2021-05-01 08:42:02', '2021-05-01 08:42:02', '0', null);
INSERT INTO `room` VALUES ('168', '1', '15', '151804', '8', '2021-05-01 08:42:02', '2021-05-01 08:42:02', '0', null);
INSERT INTO `room` VALUES ('169', '1', '15', '151805', '8', '2021-05-01 08:42:03', '2021-05-01 08:42:03', '0', null);
INSERT INTO `room` VALUES ('170', '1', '15', '151806', '8', '2021-05-01 08:42:03', '2021-05-01 08:42:03', '0', null);
INSERT INTO `room` VALUES ('171', '1', '15', '151807', '8', '2021-05-01 08:42:03', '2021-05-01 08:42:03', '0', null);
INSERT INTO `room` VALUES ('172', '1', '15', '151808', '8', '2021-05-01 08:42:03', '2021-05-01 08:42:03', '0', null);

-- ----------------------------
-- Table structure for `room_type`
-- ----------------------------
DROP TABLE IF EXISTS `room_type`;
CREATE TABLE `room_type` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `typename` varchar(255) DEFAULT NULL COMMENT '房间类型',
  `price` decimal(10,2) DEFAULT NULL COMMENT '房间价格',
  `vip_price` decimal(10,2) DEFAULT NULL COMMENT 'Vip价格',
  `updatetime` datetime DEFAULT NULL,
  `custumer_type` int DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of room_type
-- ----------------------------
INSERT INTO `room_type` VALUES ('1', '单间普通', '10.00', '9.90', '2021-01-02 18:11:43', '0');
INSERT INTO `room_type` VALUES ('2', '单间vip', '199.00', '188.00', '2021-02-03 15:44:56', '0');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) DEFAULT NULL COMMENT '账号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int DEFAULT '0' COMMENT '状态0：正常，-1：异常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3', '123', '123456', '2020-12-13 22:17:38', '2020-12-13 22:17:38', '0');
INSERT INTO `user` VALUES ('9', '111123', '123456', '2021-01-02 16:35:30', '2020-12-13 23:11:44', '0');

-- ----------------------------
-- Table structure for `vip`
-- ----------------------------
DROP TABLE IF EXISTS `vip`;
CREATE TABLE `vip` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `idcard` varchar(255) DEFAULT NULL COMMENT '身份证号码',
  `tel` varchar(255) DEFAULT NULL COMMENT '电话号码',
  `address` varchar(255) DEFAULT NULL COMMENT '家庭住址',
  `class` varchar(255) DEFAULT NULL COMMENT '等级',
  `pho` longtext COMMENT '头像',
  `integral` int DEFAULT NULL COMMENT '积分',
  `status` int DEFAULT NULL COMMENT '状态：',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of vip
-- ----------------------------
