/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : hotel

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 03/05/2021 13:11:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `room` int(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` decimal(10, 2) NULL,
  `status` int(0) NULL DEFAULT 2,
  `updatetime` datetime(0) NULL DEFAULT NULL,
  `createtime` datetime(0) NULL DEFAULT NULL,
  `inmoney` decimal(10, 2) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES (26, 109, NULL, 39.60, 0, '2021-05-02 21:06:22', '2021-05-02 21:04:49', 0.00);

-- ----------------------------
-- Table structure for check_in
-- ----------------------------
DROP TABLE IF EXISTS `check_in`;
CREATE TABLE `check_in`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `custumer_id` int(0) NULL DEFAULT NULL COMMENT '瀹㈡埛id',
  `room_id` int(0) NULL DEFAULT NULL COMMENT '房间id',
  `time_in` datetime(0) NULL DEFAULT NULL COMMENT '入住时间',
  `day` int(0) NULL DEFAULT NULL COMMENT '入住天数',
  `time_out` datetime(0) NULL DEFAULT NULL COMMENT '退房时间',
  `updatetime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `bill` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of check_in
-- ----------------------------
INSERT INTO `check_in` VALUES (1, 1, 109, '2021-05-02 21:04:49', 4, '2021-05-06 21:04:49', '2021-05-02 21:04:49', '2021-05-02 21:04:49', 26);

-- ----------------------------
-- Table structure for custumer
-- ----------------------------
DROP TABLE IF EXISTS `custumer`;
CREATE TABLE `custumer`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` int(0) NULL DEFAULT NULL COMMENT '性别,0女，1男',
  `idcard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭住址',
  `type` int(0) NULL DEFAULT 0 COMMENT '类型，0普通，1vip',
  `pho` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '头像',
  `updatetime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of custumer
-- ----------------------------
INSERT INTO `custumer` VALUES (1, '刘才', 1, '4444', '131', '好好干', 1, '0', '2021-02-03 16:46:06', '2021-02-03 16:46:06');
INSERT INTO `custumer` VALUES (4, '张杰', 0, '232323', '2323', '2323', 1, NULL, '2021-02-03 17:06:21', '2021-02-03 17:06:21');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('043utr6njz70m0icwy6fjnn3yjkt26pv', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-01 08:36:55.557501');
INSERT INTO `django_session` VALUES ('0a0dexg1zgd13t997uiiqmjwo8okl66z', 'eyJ1c2VybmFtZSI6IjEyMyIsIm5pY2tuYW1lIjoiXHU4OTdmXHU3NGRjXHU1MjAwIn0:1ldPs3:35pCCnn2N4MEKsg4nI1Rwqlgn63xMqJ95eHpVvhVsFA', '2021-05-17 12:07:47.993601');
INSERT INTO `django_session` VALUES ('0ovdok9h6i3ebdh42s482akosgw0i5ia', 'eyJ1c2VybmFtZSI6IjEyMyIsIm5pY2tuYW1lIjoiXHU4OTdmXHU3NGRjXHU1MjAwIn0:1ldPrj:Xl4QQITsW0DKxHkHcqs0sswsrgVFSgIU_sint8wXmr4', '2021-05-17 12:07:27.327007');
INSERT INTO `django_session` VALUES ('17di9b7dsria87ory34t0yqqrl8pw6gv', 'NGJlMzgwNTA5ZjM1ZGQyYjBkY2EwNjcxMDZkNGY3OGQ3OWJhNDQzZTp7InVzZXJuYW1lIjoieGppYWppYSJ9', '2020-06-08 13:53:31.158457');
INSERT INTO `django_session` VALUES ('2efkz08dh6f01b20mkl3s3bf3ilvtyib', 'NmVjZjRhYjExYmUxZjRkNzE0MzZkMTZmZTYyZjg2MjlhNDk0OGE4Mzp7InVzZXJuYW1lIjoieGlhbyIsIm5pY2tuYW1lIjoiXHU4MDk2XHU1MTQ5XHU5ZjBlMyJ9', '2021-05-17 02:37:10.558791');
INSERT INTO `django_session` VALUES ('2g3bv12l45hedjj68x1dylr0s8honbku', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-07 00:54:56.330616');
INSERT INTO `django_session` VALUES ('2q2eshkj89mzjcmmlhvddabilw8ebg51', 'NjU3YTgxOWQzODE2MmEyNGZjYTg3YzU3MDA2Yzg3ZTM1NTI0MmY3Njp7InVzZXJuYW1lIjoieGlhbyIsIm5pY2tuYW1lIjoiXHU4OTdmXHU3NGRjXHU1MjAwMiJ9', '2020-06-07 02:41:29.243427');
INSERT INTO `django_session` VALUES ('2vs04b0be0xzkd471q3j6e67xzlv6c13', 'NGJlMzgwNTA5ZjM1ZGQyYjBkY2EwNjcxMDZkNGY3OGQ3OWJhNDQzZTp7InVzZXJuYW1lIjoieGppYWppYSJ9', '2020-06-11 07:14:15.822573');
INSERT INTO `django_session` VALUES ('2wdnsptfkrbp3bf70ra9dycqk98t3320', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-06 23:24:26.797109');
INSERT INTO `django_session` VALUES ('3610yc8a9wsvdr5o9kw4hjqvl9gzxjma', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-07 00:02:04.112366');
INSERT INTO `django_session` VALUES ('42us58vszv8vecsiuxbdu7i3nbgmd56w', 'MDBkODMwNWQ0MjRlZTRhMzYzMmE0ZTIxNWRiNzQyNDczNmJhNDFjOTp7Im5pY2tuYW1lIjoiXHU4MDk2XHU1MTQ5XHU5ZjBlMyJ9', '2020-09-22 03:45:21.155195');
INSERT INTO `django_session` VALUES ('4f6c4sehpjbriclidrd9b6qsbxhpne22', 'eyJ1c2VybmFtZSI6IjEyMyIsIm5pY2tuYW1lIjoiXHU4OTdmXHU3NGRjXHU1MjAwIn0:1ldQo9:qe82WP0a5cH-2xpWCGCsfXe1rjezlm5j2EfRPyjWvjM', '2021-05-17 13:07:49.776914');
INSERT INTO `django_session` VALUES ('4hjc5pwjf8bu3jz41yi9yjt1cn85knr1', 'NGJlMzgwNTA5ZjM1ZGQyYjBkY2EwNjcxMDZkNGY3OGQ3OWJhNDQzZTp7InVzZXJuYW1lIjoieGppYWppYSJ9', '2020-06-08 13:14:27.408649');
INSERT INTO `django_session` VALUES ('4lr4bp4qekl2b2ei34y074gde43fyvkc', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-05 00:33:44.946485');
INSERT INTO `django_session` VALUES ('4txbaagvj7r0gi5hrajkfbgac3rxy53d', 'NGJlMzgwNTA5ZjM1ZGQyYjBkY2EwNjcxMDZkNGY3OGQ3OWJhNDQzZTp7InVzZXJuYW1lIjoieGppYWppYSJ9', '2020-06-15 03:05:15.926084');
INSERT INTO `django_session` VALUES ('5djmp7oe3y8b9j6mhmu4hlba67p1g1ow', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-01 09:17:24.844369');
INSERT INTO `django_session` VALUES ('5pc7kbm8s13no3d37qblms59o0vhjh3c', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-06 13:58:12.350674');
INSERT INTO `django_session` VALUES ('5s7casstt6j3lsujse5go4nnoteedfmg', 'NGJlMzgwNTA5ZjM1ZGQyYjBkY2EwNjcxMDZkNGY3OGQ3OWJhNDQzZTp7InVzZXJuYW1lIjoieGppYWppYSJ9', '2020-06-15 02:59:21.540483');
INSERT INTO `django_session` VALUES ('691a93z8a1zea67xyzdocqo2lceq2j9n', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-06 23:32:38.876962');
INSERT INTO `django_session` VALUES ('6erwdb4dfnxq857flwrxcze7wblpe3n1', 'NmQ2ZTdkMjk4N2EzNTczOTc0MGYzMzkyMWIwZjlhMmI1MWRmZWU0MTp7InVzZXJuYW1lIjoiMTIzIn0=', '2020-06-08 05:02:46.729080');
INSERT INTO `django_session` VALUES ('6keqch2ewybzevgx35nfvtlvoxe95s9w', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-05 00:41:17.338556');
INSERT INTO `django_session` VALUES ('6y5em0yjxv9gxso1pqoqj1se3s75xg4k', 'ZjFhZGRhMTYyYjEyMmRhMGQ5YmRhM2E0YmVjMTZlMjc0YmNiODZhNzp7fQ==', '2020-05-31 14:38:36.619183');
INSERT INTO `django_session` VALUES ('7mkkykx9t5bmvgjqudtks099vmpyb180', 'MTI2NGE1N2VhMTVmNWNmMWNmMTY3NjI5ODBlYWM4MTVhMmNhM2ZjMzp7Im5pY2tuYW1lIjoiXHU2ZjU4XHU2ZjU4IiwidXNlcm5hbWUiOiJwcCJ9', '2020-06-08 11:45:24.000431');
INSERT INTO `django_session` VALUES ('7n81apjoshxc2v0mwanawc8ry1zw3hap', 'NmVjZjRhYjExYmUxZjRkNzE0MzZkMTZmZTYyZjg2MjlhNDk0OGE4Mzp7InVzZXJuYW1lIjoieGlhbyIsIm5pY2tuYW1lIjoiXHU4MDk2XHU1MTQ5XHU5ZjBlMyJ9', '2020-06-15 00:52:23.988490');
INSERT INTO `django_session` VALUES ('8e2wszs1mkp9q4amac3eozxkb7at9e02', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-05-31 14:32:17.588521');
INSERT INTO `django_session` VALUES ('8ujbssbqv9f1aq8sno8j86075nrbii6d', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-01 00:37:58.337482');
INSERT INTO `django_session` VALUES ('8y15e7vuzyg9t0vzxgze9ahungj1y7ed', 'ZWUxMzIzNDNiY2Y3NzQyYjU5YWRlYmE3YTc4MmZkYzJjNDgyZTNiODp7Im5pY2tuYW1lIjoiXHU1YzBmXHU1YjY5XHU1YjUwIn0=', '2020-06-07 04:25:43.073431');
INSERT INTO `django_session` VALUES ('8z8b22ad689st7qh7w86lj18za4o55ub', 'NGJlMzgwNTA5ZjM1ZGQyYjBkY2EwNjcxMDZkNGY3OGQ3OWJhNDQzZTp7InVzZXJuYW1lIjoieGppYWppYSJ9', '2020-06-15 00:54:02.264229');
INSERT INTO `django_session` VALUES ('96dfzvq4ztyhvj4x4yn0jogcsbi9mwgb', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-02 06:51:58.829311');
INSERT INTO `django_session` VALUES ('9mbjfsj83nfhascn2pte63sh708ozeww', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-06 23:26:20.199294');
INSERT INTO `django_session` VALUES ('9wt7bhgbphqdthk5xetillg52sjat29j', 'NGJlMzgwNTA5ZjM1ZGQyYjBkY2EwNjcxMDZkNGY3OGQ3OWJhNDQzZTp7InVzZXJuYW1lIjoieGppYWppYSJ9', '2020-06-15 01:47:25.983136');
INSERT INTO `django_session` VALUES ('afb7cveb015onv9j7mt32hlye453wn7y', 'NGJlMzgwNTA5ZjM1ZGQyYjBkY2EwNjcxMDZkNGY3OGQ3OWJhNDQzZTp7InVzZXJuYW1lIjoieGppYWppYSJ9', '2020-06-11 06:58:00.530619');
INSERT INTO `django_session` VALUES ('ay1avsv48d8ndrtb2tuzo8l3vwmiajfn', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-01 09:06:32.238322');
INSERT INTO `django_session` VALUES ('bnuqvdzk1382azd2or4x3cnam70at128', 'ZjFhZGRhMTYyYjEyMmRhMGQ5YmRhM2E0YmVjMTZlMjc0YmNiODZhNzp7fQ==', '2020-06-03 00:44:01.536395');
INSERT INTO `django_session` VALUES ('bp0916zpa2e6mqvxc842i61yzmbbggnc', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-06 14:04:16.646740');
INSERT INTO `django_session` VALUES ('cq4u578w884ojgjxqlrqwe92xqm1uhhx', 'NmQ2ZTdkMjk4N2EzNTczOTc0MGYzMzkyMWIwZjlhMmI1MWRmZWU0MTp7InVzZXJuYW1lIjoiMTIzIn0=', '2020-06-08 09:40:21.953041');
INSERT INTO `django_session` VALUES ('d3s8tpw1g1ytjo4a5rhhkqmh457xktoz', 'NGJlMzgwNTA5ZjM1ZGQyYjBkY2EwNjcxMDZkNGY3OGQ3OWJhNDQzZTp7InVzZXJuYW1lIjoieGppYWppYSJ9', '2020-06-08 13:04:19.899987');
INSERT INTO `django_session` VALUES ('dcayqc4qhi6c137gztncamv8r9zejhfy', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-01 08:04:56.700001');
INSERT INTO `django_session` VALUES ('dgg4jx7rpprnw7yseqohonl9dreqjaem', 'NGJlMzgwNTA5ZjM1ZGQyYjBkY2EwNjcxMDZkNGY3OGQ3OWJhNDQzZTp7InVzZXJuYW1lIjoieGppYWppYSJ9', '2020-06-11 07:12:53.600647');
INSERT INTO `django_session` VALUES ('dl9ebac1imkfo22dh1k99py2cr8xyvkm', 'YjY4OTA1OTQ5YmQ2YTk3YjEzNzAwNTNjYTAxM2MwYmE5MjBhN2Y1MDp7Im5pY2tuYW1lIjoiXHU1YzBmXHU1YjY5XHU1YjUwIiwidXNlcm5hbWUiOiIxMjMifQ==', '2020-06-07 03:22:09.164097');
INSERT INTO `django_session` VALUES ('dqm9p2de59x74dwsj4php8b2s9fhiac2', 'ZjFhZGRhMTYyYjEyMmRhMGQ5YmRhM2E0YmVjMTZlMjc0YmNiODZhNzp7fQ==', '2020-06-07 02:24:21.587605');
INSERT INTO `django_session` VALUES ('dqt966io3oktdgnczyje0lt7a0yggjyb', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-06 23:46:34.467273');
INSERT INTO `django_session` VALUES ('ey3ztli2u2v20cdng0ll8nwu3b3igi3c', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-01 09:59:34.127505');
INSERT INTO `django_session` VALUES ('fh99moehg7ukday6v6t7bcmd7etywr1c', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-01 03:53:49.505854');
INSERT INTO `django_session` VALUES ('go8o8lsiybzgzc7czyu2mbr9hemqu9yr', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-05 02:28:50.321796');
INSERT INTO `django_session` VALUES ('gv9ps5js4p78kd785urogbn0n1igz22r', 'NmQ2ZTdkMjk4N2EzNTczOTc0MGYzMzkyMWIwZjlhMmI1MWRmZWU0MTp7InVzZXJuYW1lIjoiMTIzIn0=', '2020-06-08 10:51:58.287910');
INSERT INTO `django_session` VALUES ('gvs8i0y842h4pqox294g28jybqz55v3k', 'ZWUxMzIzNDNiY2Y3NzQyYjU5YWRlYmE3YTc4MmZkYzJjNDgyZTNiODp7Im5pY2tuYW1lIjoiXHU1YzBmXHU1YjY5XHU1YjUwIn0=', '2020-06-07 04:32:43.356493');
INSERT INTO `django_session` VALUES ('h3129crybl7x9lea3tgfdtw3ahhmxlex', 'NGJlMzgwNTA5ZjM1ZGQyYjBkY2EwNjcxMDZkNGY3OGQ3OWJhNDQzZTp7InVzZXJuYW1lIjoieGppYWppYSJ9', '2020-06-08 12:58:35.831068');
INSERT INTO `django_session` VALUES ('h7n4f2iouu2gy4uoqrad67ulqoelce86', 'YjY4OTA1OTQ5YmQ2YTk3YjEzNzAwNTNjYTAxM2MwYmE5MjBhN2Y1MDp7Im5pY2tuYW1lIjoiXHU1YzBmXHU1YjY5XHU1YjUwIiwidXNlcm5hbWUiOiIxMjMifQ==', '2020-06-07 03:33:00.306757');
INSERT INTO `django_session` VALUES ('hnmow63dvb2av51owwaxxabtlvhgk78o', 'NmQ2ZTdkMjk4N2EzNTczOTc0MGYzMzkyMWIwZjlhMmI1MWRmZWU0MTp7InVzZXJuYW1lIjoiMTIzIn0=', '2020-06-08 03:47:16.959049');
INSERT INTO `django_session` VALUES ('ii3yqc754nowe2rsi7ure5uihokp2jmv', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-05-31 15:22:50.965909');
INSERT INTO `django_session` VALUES ('jvj5e77kip9dhp1ojt60id2vxs2cyt3i', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-08 10:37:50.000854');
INSERT INTO `django_session` VALUES ('jzmr3a0i79rl4utrflmk3huvvvtxnmen', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-01 09:15:21.231296');
INSERT INTO `django_session` VALUES ('klhog0c7qllqkpo9zc7pbtoq1ski30d4', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-06 23:57:38.680902');
INSERT INTO `django_session` VALUES ('kuqari65s8rglbh75xjx3rqcasw8gcvr', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-07 00:05:44.924733');
INSERT INTO `django_session` VALUES ('kxwjh1e5m1pjw7xiqpwua6ygfqsvzzd7', 'ZjJmNWIxODIxYjJkOGMwOGE1NmQ2NjZhNDI2MjlmZTYxMWM5ODA2ODp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-05 11:17:36.833676');
INSERT INTO `django_session` VALUES ('l0yaaze8s6s515pfcu764e6rlkh3i3fh', 'NGJlMzgwNTA5ZjM1ZGQyYjBkY2EwNjcxMDZkNGY3OGQ3OWJhNDQzZTp7InVzZXJuYW1lIjoieGppYWppYSJ9', '2020-06-11 06:29:23.143162');
INSERT INTO `django_session` VALUES ('l8chxcl5mvs0514x38wdwaijnjynlu6y', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-05 01:47:36.864297');
INSERT INTO `django_session` VALUES ('lsa6z504ctji3n4zvqe5ewipr4zpb0xl', 'YjY4OTA1OTQ5YmQ2YTk3YjEzNzAwNTNjYTAxM2MwYmE5MjBhN2Y1MDp7Im5pY2tuYW1lIjoiXHU1YzBmXHU1YjY5XHU1YjUwIiwidXNlcm5hbWUiOiIxMjMifQ==', '2020-06-07 02:49:53.819984');
INSERT INTO `django_session` VALUES ('lsk7fjkqaq86mgyyaa0wyc22mjrdvmn2', 'NmQ2ZTdkMjk4N2EzNTczOTc0MGYzMzkyMWIwZjlhMmI1MWRmZWU0MTp7InVzZXJuYW1lIjoiMTIzIn0=', '2020-06-08 03:05:05.475657');
INSERT INTO `django_session` VALUES ('lxgj98m5rb3ywzkyde19bukgy2pjwsc3', 'N2M5YmM0OThkZTM1ZDM4YjE0YWIwN2UxMTBkNmRjYTI1NzZkOGQzNTp7Im5pY2tuYW1lIjoiXHU4MDk2XHU1MTQ5XHU5ZjBlMyIsInVzZXJuYW1lIjoieGlhbyJ9', '2020-06-29 01:05:15.579442');
INSERT INTO `django_session` VALUES ('mkzp7dxa0du5gp9a8fzdcoq2agu6qm0o', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-01 09:08:56.309197');
INSERT INTO `django_session` VALUES ('mo7u82pycaip2mgxxvnuuh4m72r6h5a1', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-01 08:41:18.063645');
INSERT INTO `django_session` VALUES ('mpo8gtvl6awhtjnclayonv80gm5sqf99', 'ZjFhZGRhMTYyYjEyMmRhMGQ5YmRhM2E0YmVjMTZlMjc0YmNiODZhNzp7fQ==', '2020-06-04 03:38:07.897980');
INSERT INTO `django_session` VALUES ('mpomd7yevq3zr6j4l6ugpl5h5ipc5pd8', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-01 07:47:08.756527');
INSERT INTO `django_session` VALUES ('mxb4i8421tle5jhcns30sec30epd1fne', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-05-31 15:49:28.456113');
INSERT INTO `django_session` VALUES ('n0uhu5jvtzcw6y2h5ikn8wf21165izs9', 'eyJ1c2VybmFtZSI6IjEyMyIsIm5pY2tuYW1lIjoiXHU4OTdmXHU3NGRjXHU1MjAwIn0:1ldQgm:q3FHlnb5kS-kJ2m3l0dlwmNyh9hdvAWB6NwAh0RAGfI', '2021-05-17 13:00:12.320940');
INSERT INTO `django_session` VALUES ('n1o1mq2jj61tn8pnt75eltcpbijdbspt', 'NmQ2ZTdkMjk4N2EzNTczOTc0MGYzMzkyMWIwZjlhMmI1MWRmZWU0MTp7InVzZXJuYW1lIjoiMTIzIn0=', '2020-06-08 03:08:51.600019');
INSERT INTO `django_session` VALUES ('ncxhxu02di2sfhofcweodornueu1ho34', 'NGJlMzgwNTA5ZjM1ZGQyYjBkY2EwNjcxMDZkNGY3OGQ3OWJhNDQzZTp7InVzZXJuYW1lIjoieGppYWppYSJ9', '2020-06-11 07:29:13.548374');
INSERT INTO `django_session` VALUES ('nh7pezxu0p0uvzmspak74ehipgzut5rd', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-06 13:57:04.317076');
INSERT INTO `django_session` VALUES ('njl78u1q1dsueuytrmbnhy1l7vm7cf6y', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-06 02:21:23.924605');
INSERT INTO `django_session` VALUES ('okcvzb9oqp3trz11ag06jkiirgkok5ax', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-05 02:21:16.639443');
INSERT INTO `django_session` VALUES ('oms92nf72h28g85wlvwv1l8o2ndp5lab', 'NGJlMzgwNTA5ZjM1ZGQyYjBkY2EwNjcxMDZkNGY3OGQ3OWJhNDQzZTp7InVzZXJuYW1lIjoieGppYWppYSJ9', '2020-06-15 01:44:44.204503');
INSERT INTO `django_session` VALUES ('piic5c6mooc17knmpta8j9zt8f8oub0h', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-06 14:07:59.221336');
INSERT INTO `django_session` VALUES ('q5jx6mdkc0c7m4wqbomu5w8dp6hi8nqc', 'ZjFhZGRhMTYyYjEyMmRhMGQ5YmRhM2E0YmVjMTZlMjc0YmNiODZhNzp7fQ==', '2020-06-07 02:13:58.539561');
INSERT INTO `django_session` VALUES ('q9bdk0sh0xpxomtq06udd6v9r1c3lii4', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-01 07:39:47.305703');
INSERT INTO `django_session` VALUES ('qd23pjvypnb47uhsqk1fhs673ekaxyen', 'NmQ2ZTdkMjk4N2EzNTczOTc0MGYzMzkyMWIwZjlhMmI1MWRmZWU0MTp7InVzZXJuYW1lIjoiMTIzIn0=', '2020-06-08 05:08:40.402064');
INSERT INTO `django_session` VALUES ('qgm5dy5vslfp6kyk59brdrku4u0z2x6o', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-07 02:28:08.116902');
INSERT INTO `django_session` VALUES ('qh0m6o3uqdqst96hzu77pzsaevwevxxb', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-07 00:00:47.436265');
INSERT INTO `django_session` VALUES ('rbwxndlilyn1ssicln3cufenw2ohby4i', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-05-31 14:43:34.266909');
INSERT INTO `django_session` VALUES ('rlqoxyibh3p6rc567h3217r7z0k87bk1', 'ZjFhZGRhMTYyYjEyMmRhMGQ5YmRhM2E0YmVjMTZlMjc0YmNiODZhNzp7fQ==', '2020-05-31 14:35:52.575945');
INSERT INTO `django_session` VALUES ('rv0pp868w1yv6j1dfn0h3jbb7fj8f6wh', 'NGJlMzgwNTA5ZjM1ZGQyYjBkY2EwNjcxMDZkNGY3OGQ3OWJhNDQzZTp7InVzZXJuYW1lIjoieGppYWppYSJ9', '2020-06-11 06:55:10.513282');
INSERT INTO `django_session` VALUES ('s0pdod7gzpoc1d5awbjzyseblcr9f60t', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-06 14:01:44.527976');
INSERT INTO `django_session` VALUES ('s19g3f32j2p4yp7ybpmoyq5ik7xwokv5', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-01 09:55:48.146563');
INSERT INTO `django_session` VALUES ('s1r9z42skxrog5uf061v6olyf3a62qa8', 'NGJlMzgwNTA5ZjM1ZGQyYjBkY2EwNjcxMDZkNGY3OGQ3OWJhNDQzZTp7InVzZXJuYW1lIjoieGppYWppYSJ9', '2020-06-08 13:28:25.501477');
INSERT INTO `django_session` VALUES ('sl8trd7h07e06et6mbu7xy5rstz5uctt', 'ZjFhZGRhMTYyYjEyMmRhMGQ5YmRhM2E0YmVjMTZlMjc0YmNiODZhNzp7fQ==', '2020-06-03 02:44:48.945768');
INSERT INTO `django_session` VALUES ('suc0yhr5330gu21flfh11vw8hwm0e8ic', 'NTA3ODJkYmY0OTYzYjI5M2U4NmJhNTQ4ZGQyZGQ4OTM5ZWI3ZDUxYTp7InVzZXJuYW1lIjoiMTIzIiwibmlja25hbWUiOiJcdTVjMGZcdTViNjlcdTViNTAifQ==', '2020-06-07 04:31:28.604187');
INSERT INTO `django_session` VALUES ('tknt3odqw23m6jzoyps0svlqh8eai1qy', 'NGJlMzgwNTA5ZjM1ZGQyYjBkY2EwNjcxMDZkNGY3OGQ3OWJhNDQzZTp7InVzZXJuYW1lIjoieGppYWppYSJ9', '2020-06-08 13:06:30.513542');
INSERT INTO `django_session` VALUES ('ujhxb1ac1y1l3mxmqrblt5i844uijqy1', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-06 23:39:23.463851');
INSERT INTO `django_session` VALUES ('v8ywahmnibpyjfg32jwivwn35ohi9tjn', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-06 23:45:10.537160');
INSERT INTO `django_session` VALUES ('vjqlsile6lbo2fttl1ev6v6r8sju9g7r', 'NmQ2ZTdkMjk4N2EzNTczOTc0MGYzMzkyMWIwZjlhMmI1MWRmZWU0MTp7InVzZXJuYW1lIjoiMTIzIn0=', '2020-06-08 02:59:46.337015');
INSERT INTO `django_session` VALUES ('vl0qdigznxjj3428hsa68gwzpw9aiolu', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-06 23:43:10.529239');
INSERT INTO `django_session` VALUES ('vl9zd400pldft3pks4fnerq6py522yhy', 'NGJlMzgwNTA5ZjM1ZGQyYjBkY2EwNjcxMDZkNGY3OGQ3OWJhNDQzZTp7InVzZXJuYW1lIjoieGppYWppYSJ9', '2020-06-15 01:49:54.810855');
INSERT INTO `django_session` VALUES ('vzs2be7w79u3i5r6577i3st0z5esoddu', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-06 23:41:51.002990');
INSERT INTO `django_session` VALUES ('wymzlds2dc25h9pxse463mc3s5i770w1', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-06 14:16:38.234802');
INSERT INTO `django_session` VALUES ('xam6d6rek1jfh6vo2tg847l7ctegjx3q', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-01 10:00:52.183035');
INSERT INTO `django_session` VALUES ('xarldydugdlt77q53rwg2vecj0vrjf30', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-06 23:40:57.793887');
INSERT INTO `django_session` VALUES ('xdk46w3dgzpvid5nmjjru08qcphrf8im', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-07 00:03:10.021808');
INSERT INTO `django_session` VALUES ('xg0ekvnfqcmush285zcn7fff4qq665om', 'YjY4OTA1OTQ5YmQ2YTk3YjEzNzAwNTNjYTAxM2MwYmE5MjBhN2Y1MDp7Im5pY2tuYW1lIjoiXHU1YzBmXHU1YjY5XHU1YjUwIiwidXNlcm5hbWUiOiIxMjMifQ==', '2020-06-07 04:34:28.435197');
INSERT INTO `django_session` VALUES ('xxnmkbxx3zwad0wfyuhvlnc58fibpj6v', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-01 03:04:09.597025');
INSERT INTO `django_session` VALUES ('yl9bag6c4qucn82y3i3dlf27i6fla4uo', 'NGJlMzgwNTA5ZjM1ZGQyYjBkY2EwNjcxMDZkNGY3OGQ3OWJhNDQzZTp7InVzZXJuYW1lIjoieGppYWppYSJ9', '2020-06-11 07:16:49.701929');
INSERT INTO `django_session` VALUES ('yzbgpymdh7icxb5o7ef2hzf8ulod7ks3', 'NmQ2ZTdkMjk4N2EzNTczOTc0MGYzMzkyMWIwZjlhMmI1MWRmZWU0MTp7InVzZXJuYW1lIjoiMTIzIn0=', '2020-06-08 03:46:28.080069');
INSERT INTO `django_session` VALUES ('zi0pkhcepacb5jdvkjkko8jozaqimmr1', 'NGJiZDgxMzM3Y2EwM2U5MTk0NmRiYWYwMmZmZjZmZDJjNTk0YzBiYjp7InVzZXJuYW1lIjoieGlhbyJ9', '2020-06-01 03:49:08.123788');
INSERT INTO `django_session` VALUES ('zzpgdv9dtk9nmj9z9n7r9bjgrn0myosb', 'NGJlMzgwNTA5ZjM1ZGQyYjBkY2EwNjcxMDZkNGY3OGQ3OWJhNDQzZTp7InVzZXJuYW1lIjoieGppYWppYSJ9', '2020-06-15 03:21:19.090722');

-- ----------------------------
-- Table structure for floor
-- ----------------------------
DROP TABLE IF EXISTS `floor`;
CREATE TABLE `floor`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '楼房编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '楼房名称',
  `floorno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '楼层',
  `updatetime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `status` int(0) NULL DEFAULT NULL COMMENT '状态0：正常，-1：异常',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '楼房简介',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of floor
-- ----------------------------
INSERT INTO `floor` VALUES (15, '1', '凯里大厦酒店', '8', '2021-05-03 13:08:33', '2021-05-01 08:41:56', 0, '8');

-- ----------------------------
-- Table structure for income
-- ----------------------------
DROP TABLE IF EXISTS `income`;
CREATE TABLE `income`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `money` decimal(11, 2) NULL COMMENT '收入',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '收入时间',
  `in_type` int(0) NULL DEFAULT 1 COMMENT '1：现金，2：支付宝，3：微信，4：银行卡',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '谁付的钱，备注',
  `type` int(0) NULL DEFAULT 0 COMMENT '0:收入,1:支出',
  `bill` int(0) NULL DEFAULT NULL COMMENT '账单表id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of income
-- ----------------------------
INSERT INTO `income` VALUES (4, 39.60, '2021-05-02 21:06:22', 1, '刘才', 0, 26);

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `room_type_id` int(0) NULL DEFAULT NULL COMMENT '房间类型id',
  `floorid` int(0) NULL DEFAULT NULL COMMENT '楼房id',
  `room` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房间编号',
  `floorno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '楼层',
  `updatetime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `status` int(0) NULL DEFAULT NULL COMMENT '状态0：空闲，-1：异常，1：入住，-2：未打扫',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 173 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES (109, 1, 15, '151101', '1', '2021-05-02 21:06:30', '2021-05-01 08:41:56', -2, NULL);
INSERT INTO `room` VALUES (110, 1, 15, '151102', '1', '2021-05-02 16:54:51', '2021-05-01 08:41:56', 0, NULL);
INSERT INTO `room` VALUES (111, 1, 15, '151103', '1', '2021-05-02 16:54:54', '2021-05-01 08:41:56', 0, NULL);
INSERT INTO `room` VALUES (112, 1, 15, '151104', '1', '2021-05-02 16:54:57', '2021-05-01 08:41:56', 0, NULL);
INSERT INTO `room` VALUES (113, 1, 15, '151105', '1', '2021-05-01 08:41:56', '2021-05-01 08:41:56', 0, NULL);
INSERT INTO `room` VALUES (114, 1, 15, '151106', '1', '2021-05-02 16:55:01', '2021-05-01 08:41:57', 0, NULL);
INSERT INTO `room` VALUES (115, 1, 15, '151107', '1', '2021-05-02 16:55:04', '2021-05-01 08:41:57', 0, NULL);
INSERT INTO `room` VALUES (116, 1, 15, '151108', '1', '2021-05-01 08:41:57', '2021-05-01 08:41:57', 0, NULL);
INSERT INTO `room` VALUES (117, 1, 15, '151201', '2', '2021-05-01 08:41:57', '2021-05-01 08:41:57', 0, NULL);
INSERT INTO `room` VALUES (118, 1, 15, '151202', '2', '2021-05-02 16:55:07', '2021-05-01 08:41:57', 0, '更让他一人');
INSERT INTO `room` VALUES (119, 1, 15, '151203', '2', '2021-05-02 16:55:14', '2021-05-01 08:41:57', 0, '而沃尔');
INSERT INTO `room` VALUES (120, 1, 15, '151204', '2', '2021-05-01 21:28:37', '2021-05-01 08:41:57', -1, '让他一人同意');
INSERT INTO `room` VALUES (121, 1, 15, '151205', '2', '2021-05-01 08:41:57', '2021-05-01 08:41:57', 0, NULL);
INSERT INTO `room` VALUES (122, 1, 15, '151206', '2', '2021-05-01 08:41:57', '2021-05-01 08:41:57', 0, NULL);
INSERT INTO `room` VALUES (123, 1, 15, '151207', '2', '2021-05-01 08:41:57', '2021-05-01 08:41:57', 0, NULL);
INSERT INTO `room` VALUES (124, 1, 15, '151208', '2', '2021-05-01 08:41:58', '2021-05-01 08:41:58', 0, NULL);
INSERT INTO `room` VALUES (125, 1, 15, '151301', '3', '2021-05-01 08:41:58', '2021-05-01 08:41:58', 0, NULL);
INSERT INTO `room` VALUES (126, 1, 15, '151302', '3', '2021-05-01 08:41:58', '2021-05-01 08:41:58', 0, NULL);
INSERT INTO `room` VALUES (127, 1, 15, '151303', '3', '2021-05-02 16:55:11', '2021-05-01 08:41:58', 0, '5654');
INSERT INTO `room` VALUES (128, 1, 15, '151304', '3', '2021-05-01 08:41:58', '2021-05-01 08:41:58', 0, NULL);
INSERT INTO `room` VALUES (129, 1, 15, '151305', '3', '2021-05-01 08:41:58', '2021-05-01 08:41:58', 0, NULL);
INSERT INTO `room` VALUES (130, 1, 15, '151306', '3', '2021-05-01 08:41:58', '2021-05-01 08:41:58', 0, NULL);
INSERT INTO `room` VALUES (131, 1, 15, '151307', '3', '2021-05-01 08:41:58', '2021-05-01 08:41:58', 0, NULL);
INSERT INTO `room` VALUES (132, 1, 15, '151308', '3', '2021-05-01 23:16:58', '2021-05-01 08:41:58', -1, NULL);
INSERT INTO `room` VALUES (133, 1, 15, '151401', '4', '2021-05-01 08:41:58', '2021-05-01 08:41:58', 0, NULL);
INSERT INTO `room` VALUES (134, 1, 15, '151402', '4', '2021-05-01 08:41:59', '2021-05-01 08:41:59', 0, NULL);
INSERT INTO `room` VALUES (135, 1, 15, '151403', '4', '2021-05-01 08:41:59', '2021-05-01 08:41:59', 0, NULL);
INSERT INTO `room` VALUES (136, 1, 15, '151404', '4', '2021-05-01 08:41:59', '2021-05-01 08:41:59', 0, NULL);
INSERT INTO `room` VALUES (137, 1, 15, '151405', '4', '2021-05-01 08:41:59', '2021-05-01 08:41:59', 0, NULL);
INSERT INTO `room` VALUES (138, 1, 15, '151406', '4', '2021-05-01 08:41:59', '2021-05-01 08:41:59', 0, NULL);
INSERT INTO `room` VALUES (139, 1, 15, '151407', '4', '2021-05-01 08:41:59', '2021-05-01 08:41:59', 0, NULL);
INSERT INTO `room` VALUES (140, 1, 15, '151408', '4', '2021-05-01 23:17:09', '2021-05-01 08:41:59', 0, NULL);
INSERT INTO `room` VALUES (141, 1, 15, '151501', '5', '2021-05-01 08:42:00', '2021-05-01 08:42:00', 0, NULL);
INSERT INTO `room` VALUES (142, 1, 15, '151502', '5', '2021-05-01 08:42:00', '2021-05-01 08:42:00', 0, NULL);
INSERT INTO `room` VALUES (143, 1, 15, '151503', '5', '2021-05-01 08:42:00', '2021-05-01 08:42:00', 0, NULL);
INSERT INTO `room` VALUES (144, 1, 15, '151504', '5', '2021-05-01 08:42:00', '2021-05-01 08:42:00', 0, NULL);
INSERT INTO `room` VALUES (145, 1, 15, '151505', '5', '2021-05-01 08:42:00', '2021-05-01 08:42:00', 0, NULL);
INSERT INTO `room` VALUES (146, 1, 15, '151506', '5', '2021-05-01 08:42:00', '2021-05-01 08:42:00', 0, NULL);
INSERT INTO `room` VALUES (147, 1, 15, '151507', '5', '2021-05-02 16:55:22', '2021-05-01 08:42:00', 0, NULL);
INSERT INTO `room` VALUES (148, 1, 15, '151508', '5', '2021-05-01 08:42:00', '2021-05-01 08:42:00', 0, NULL);
INSERT INTO `room` VALUES (149, 1, 15, '151601', '6', '2021-05-01 08:42:00', '2021-05-01 08:42:00', 0, NULL);
INSERT INTO `room` VALUES (150, 1, 15, '151602', '6', '2021-05-02 16:55:18', '2021-05-01 08:42:01', 0, NULL);
INSERT INTO `room` VALUES (151, 1, 15, '151603', '6', '2021-05-01 08:42:01', '2021-05-01 08:42:01', 0, NULL);
INSERT INTO `room` VALUES (152, 1, 15, '151604', '6', '2021-05-01 08:42:01', '2021-05-01 08:42:01', 0, NULL);
INSERT INTO `room` VALUES (153, 1, 15, '151605', '6', '2021-05-01 08:42:01', '2021-05-01 08:42:01', 0, NULL);
INSERT INTO `room` VALUES (154, 1, 15, '151606', '6', '2021-05-01 08:42:01', '2021-05-01 08:42:01', 0, NULL);
INSERT INTO `room` VALUES (155, 1, 15, '151607', '6', '2021-05-01 08:42:01', '2021-05-01 08:42:01', 0, NULL);
INSERT INTO `room` VALUES (156, 1, 15, '151608', '6', '2021-05-01 08:42:01', '2021-05-01 08:42:01', 0, NULL);
INSERT INTO `room` VALUES (157, 1, 15, '151701', '7', '2021-05-01 08:42:01', '2021-05-01 08:42:01', 0, NULL);
INSERT INTO `room` VALUES (158, 1, 15, '151702', '7', '2021-05-01 08:42:02', '2021-05-01 08:42:02', 0, NULL);
INSERT INTO `room` VALUES (159, 1, 15, '151703', '7', '2021-05-01 08:42:02', '2021-05-01 08:42:02', 0, NULL);
INSERT INTO `room` VALUES (160, 1, 15, '151704', '7', '2021-05-01 08:42:02', '2021-05-01 08:42:02', 0, NULL);
INSERT INTO `room` VALUES (161, 1, 15, '151705', '7', '2021-05-01 08:42:02', '2021-05-01 08:42:02', 0, NULL);
INSERT INTO `room` VALUES (162, 1, 15, '151706', '7', '2021-05-01 08:42:02', '2021-05-01 08:42:02', 0, NULL);
INSERT INTO `room` VALUES (163, 1, 15, '151707', '7', '2021-05-01 21:30:20', '2021-05-01 08:42:02', -1, '让他一人');
INSERT INTO `room` VALUES (164, 1, 15, '151708', '7', '2021-05-01 08:42:02', '2021-05-01 08:42:02', 0, NULL);
INSERT INTO `room` VALUES (165, 1, 15, '151801', '8', '2021-05-01 08:42:02', '2021-05-01 08:42:02', 0, NULL);
INSERT INTO `room` VALUES (166, 1, 15, '151802', '8', '2021-05-01 08:42:02', '2021-05-01 08:42:02', 0, NULL);
INSERT INTO `room` VALUES (167, 1, 15, '151803', '8', '2021-05-01 08:42:02', '2021-05-01 08:42:02', 0, NULL);
INSERT INTO `room` VALUES (168, 1, 15, '151804', '8', '2021-05-01 08:42:02', '2021-05-01 08:42:02', 0, NULL);
INSERT INTO `room` VALUES (169, 1, 15, '151805', '8', '2021-05-01 08:42:03', '2021-05-01 08:42:03', 0, NULL);
INSERT INTO `room` VALUES (170, 1, 15, '151806', '8', '2021-05-01 08:42:03', '2021-05-01 08:42:03', 0, NULL);
INSERT INTO `room` VALUES (171, 1, 15, '151807', '8', '2021-05-01 08:42:03', '2021-05-01 08:42:03', 0, NULL);
INSERT INTO `room` VALUES (172, 1, 15, '151808', '8', '2021-05-01 08:42:03', '2021-05-01 08:42:03', 0, NULL);

-- ----------------------------
-- Table structure for room_type
-- ----------------------------
DROP TABLE IF EXISTS `room_type`;
CREATE TABLE `room_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `typename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房间类型',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '房间价格',
  `vip_price` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Vip价格',
  `updatetime` datetime(0) NULL DEFAULT NULL,
  `custumer_type` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room_type
-- ----------------------------
INSERT INTO `room_type` VALUES (1, '单间普通', 10.00, 9.90, '2021-01-02 18:11:43', 0);
INSERT INTO `room_type` VALUES (2, '单间vip', 199.00, 188.00, '2021-02-03 15:44:56', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `updatetime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `status` int(0) NULL DEFAULT 0 COMMENT '状态0：正常，-1：异常',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (3, '123', '123456', '2020-12-13 22:17:38', '2020-12-13 22:17:38', 0, '西瓜刀');
INSERT INTO `user` VALUES (9, '111123', '123456', '2021-01-02 16:35:30', '2020-12-13 23:11:44', 0, '刘丹丹');

-- ----------------------------
-- Table structure for vip
-- ----------------------------
DROP TABLE IF EXISTS `vip`;
CREATE TABLE `vip`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `idcard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭住址',
  `class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '等级',
  `pho` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '头像',
  `integral` int(0) NULL DEFAULT NULL COMMENT '积分',
  `status` int(0) NULL DEFAULT NULL COMMENT '状态：',
  `updatetime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vip
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
