/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50729
Source Host           : localhost:3306
Source Database       : hotel

Target Server Type    : MYSQL
Target Server Version : 50729
File Encoding         : 65001

Date: 2021-02-03 17:19:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `check_in`
-- ----------------------------
DROP TABLE IF EXISTS `check_in`;
CREATE TABLE `check_in` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `custumer _id` int(11) DEFAULT NULL COMMENT '客户id',
  `room_id` int(11) DEFAULT NULL COMMENT '房间id',
  `time_in` datetime DEFAULT NULL COMMENT '入住时间',
  `day` int(11) DEFAULT NULL COMMENT '入住天数',
  `time_out` datetime DEFAULT NULL COMMENT '退房时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of check_in
-- ----------------------------

-- ----------------------------
-- Table structure for `custumer`
-- ----------------------------
DROP TABLE IF EXISTS `custumer`;
CREATE TABLE `custumer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `sex` int(2) DEFAULT NULL COMMENT '性别,0女，1男',
  `idcard` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `tel` varchar(255) DEFAULT NULL COMMENT '电话号码',
  `address` varchar(255) DEFAULT NULL COMMENT '家庭住址',
  `type` int(2) DEFAULT '0' COMMENT '类型，0普通，1vip',
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
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `no` varchar(50) DEFAULT NULL COMMENT '楼房编号',
  `name` varchar(255) DEFAULT NULL COMMENT '楼房名称',
  `floorno` varchar(50) DEFAULT NULL COMMENT '楼层',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int(11) DEFAULT NULL COMMENT '状态0：正常，-1：异常',
  `remark` varchar(255) DEFAULT NULL COMMENT '楼房简介',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of floor
-- ----------------------------
INSERT INTO `floor` VALUES ('1', '1_1', '1栋1单元', '6', '2021-01-02 15:52:58', '2021-01-02 15:52:58', '0', null);
INSERT INTO `floor` VALUES ('2', '1_2', '1栋2单元', '6', '2021-01-02 15:53:28', '2021-01-02 15:53:28', '0', null);
INSERT INTO `floor` VALUES ('3', '2_1', '2栋1单元', '6', '2021-01-02 15:54:43', '2021-01-02 15:54:43', '0', null);
INSERT INTO `floor` VALUES ('5', '3_1', '3栋1单元', '6', '2021-01-02 16:39:13', '2021-01-02 16:07:38', '0', '3栋1单元');
INSERT INTO `floor` VALUES ('6', '3_2', '3栋2单元', '6', '2021-01-02 16:39:20', '2021-01-02 16:10:16', '0', '3栋2单元');

-- ----------------------------
-- Table structure for `income`
-- ----------------------------
DROP TABLE IF EXISTS `income`;
CREATE TABLE `income` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `income` int(11) DEFAULT NULL COMMENT '收入',
  `income_time` datetime DEFAULT NULL COMMENT '收入时间',
  `income_type` int(11) DEFAULT NULL COMMENT '1：现金，2：支付宝，3：微信，4：银行卡',
  `remark` varchar(255) DEFAULT NULL COMMENT '谁付的钱，备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of income
-- ----------------------------

-- ----------------------------
-- Table structure for `room`
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `room_type_id` int(11) DEFAULT NULL COMMENT '房间类型id',
  `floorid` int(11) DEFAULT NULL COMMENT '楼房id',
  `room` varchar(255) DEFAULT NULL COMMENT '房间编号',
  `floorno` varchar(50) DEFAULT NULL COMMENT '楼层',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int(11) DEFAULT NULL COMMENT '状态0：空闲，-1：异常，1：入住，-2：未打扫',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('2', '1', '1', '1-1-1', '1', '2021-02-03 15:54:12', '2021-02-03 15:54:12', '0');

-- ----------------------------
-- Table structure for `room_type`
-- ----------------------------
DROP TABLE IF EXISTS `room_type`;
CREATE TABLE `room_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `typename` varchar(255) DEFAULT NULL COMMENT '房间类型',
  `price` decimal(10,2) DEFAULT NULL COMMENT '房间价格',
  `vip_price` decimal(10,2) DEFAULT NULL COMMENT 'Vip价格',
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of room_type
-- ----------------------------
INSERT INTO `room_type` VALUES ('1', '单间普通', '10.00', '9.90', '2021-01-02 18:11:43');
INSERT INTO `room_type` VALUES ('2', '单间vip', '199.00', '188.00', '2021-02-03 15:44:56');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) DEFAULT NULL COMMENT '账号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int(11) DEFAULT '0' COMMENT '状态0：正常，-1：异常',
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
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `idcard` varchar(255) DEFAULT NULL COMMENT '身份证号码',
  `tel` varchar(255) DEFAULT NULL COMMENT '电话号码',
  `address` varchar(255) DEFAULT NULL COMMENT '家庭住址',
  `class` varchar(255) DEFAULT NULL COMMENT '等级',
  `pho` longtext COMMENT '头像',
  `integral` int(11) DEFAULT NULL COMMENT '积分',
  `status` int(11) DEFAULT NULL COMMENT '状态：',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of vip
-- ----------------------------
