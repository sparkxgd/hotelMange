/*
 Navicat Premium Data Transfer

 Source Server         : 1.15.129.36_3306
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : 1.15.129.36:3306
 Source Schema         : party

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 06/05/2021 19:20:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `course_no` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '课程编号',
  `course_name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程名称',
  `course_content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程内容概况',
  `course_number` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课时数',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` bigint(0) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(0) NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------

-- ----------------------------
-- Table structure for knowledge
-- ----------------------------
DROP TABLE IF EXISTS `knowledge`;
CREATE TABLE `knowledge`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '唯一标识ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `number` bigint(0) NULL DEFAULT NULL COMMENT '已读人数',
  `release_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `img` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `remark` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` bigint(0) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(0) NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `appraise_year` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考核年份',
  `del_flag` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '知识' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of knowledge
-- ----------------------------
INSERT INTO `knowledge` VALUES (6, '111', NULL, '2020-12-08 00:00:00', '1', '', '', '', NULL, NULL, NULL, NULL, '', '', '');

-- ----------------------------
-- Table structure for knowledge_file
-- ----------------------------
DROP TABLE IF EXISTS `knowledge_file`;
CREATE TABLE `knowledge_file`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '唯一标识ID',
  `knowledge_id` bigint(0) NOT NULL COMMENT '知识ID',
  `file_name` bigint(0) NULL DEFAULT NULL COMMENT '名称',
  `content` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `remark` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` bigint(0) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(0) NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '知识文档' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of knowledge_file
-- ----------------------------

-- ----------------------------
-- Table structure for knowledge_nouse
-- ----------------------------
DROP TABLE IF EXISTS `knowledge_nouse`;
CREATE TABLE `knowledge_nouse`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '唯一标识ID',
  `knowledge_id` bigint(0) NOT NULL COMMENT '知识ID',
  `file_name` bigint(0) NULL DEFAULT NULL COMMENT '名称',
  `content` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `remark` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` bigint(0) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(0) NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '知识管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of knowledge_nouse
-- ----------------------------

-- ----------------------------
-- Table structure for knowledgemanager
-- ----------------------------
DROP TABLE IF EXISTS `knowledgemanager`;
CREATE TABLE `knowledgemanager`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `doc_no` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '文档编号',
  `doc_name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文档名称',
  `doc_content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '检查标准',
  `doc_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '检查标准',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` bigint(0) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(0) NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '知识管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of knowledgemanager
-- ----------------------------

-- ----------------------------
-- Table structure for leave_message
-- ----------------------------
DROP TABLE IF EXISTS `leave_message`;
CREATE TABLE `leave_message`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '留言时间',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '留言人',
  `replier` bigint(0) NULL DEFAULT NULL COMMENT '回复人',
  `reply_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '鍥炲鍐呭',
  `handle_time` datetime(0) NULL DEFAULT NULL COMMENT '处理时间，回复时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '留言表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of leave_message
-- ----------------------------
INSERT INTO `leave_message` VALUES (1, '我可以入党了没有', '我是一个好学生，非常好的一个学生，天天看书，累得很', '2020-12-16 19:45:45', '20202020@qq.com', '15188888888', '西瓜刀', 1, '44444444', '2020-12-16 23:06:02', NULL, NULL);
INSERT INTO `leave_message` VALUES (2, '入党需要什么条件', '跨域是浏览器的专用概念，指js代码访问自己来源站点之外的站点。比如A站点网页中的js代码，请求了B站点的数据，就是跨域。\r\nA和B要想被认为是同域，则必须有相同的协议（比如http和https就不行）、相同域名、和相同端口号（port）。\r\n\r\n如果你是做App、小程序等非H5平台，是不涉及跨域问题的。\r\n稍微例外的是iOS的wkWebview，在5+App，或uni-app的web-view组件及renderjs中，由于WKWebview限制也会产生跨域，这方面另见专题文章：https://ask.dcloud.net.cn/article/36348。uni-app在App的普通js代码不运行在Webview下，不存在跨域问题。', '2021-05-05 00:01:01', '20202020@qq.com', '15188888888', '僵尸先生', 1, '这个内置浏览器经过官方处理，不存在跨域问题，简单易用，推荐使用。（需HBuilderX 2.6以上）\r\n在打开页面后，点HBuilderX右上角的预览，即可打开内部浏览器。或者在运行菜单里选择运行到内置浏览器也可以。', '2020-12-16 23:06:02', NULL, NULL);
INSERT INTO `leave_message` VALUES (3, '入党成功！！！', '跨域是浏览器的专用概念，指js代码访问自己来源站点之外的站点。比如A站点网页中的js代码，请求了B站点的数据，就是跨域。\r\nA和B要想被认为是同域，则必须有相同的协议（比如http和https就不行）、相同域名、和相同端口号（port）。\r\n\r\n如果你是做App、小程序等非H5平台，是不涉及跨域问题的。\r\n稍微例外的是iOS的wkWebview，在5+App，或uni-app的web-view组件及renderjs中，由于WKWebview限制也会产生跨域，这方面另见专题文章：https://ask.dcloud.net.cn/article/36348。uni-app在App的普通js代码不运行在Webview下，不存在跨域问题。', '2021-05-05 00:01:01', '20202020@qq.com', '15188888888', '僵尸先生', 1, '这个内置浏览器经过官方处理，不存在跨域问题，简单易用，推荐使用。（需HBuilderX 2.6以上）\r\n在打开页面后，点HBuilderX右上角的预览，即可打开内部浏览器。或者在运行菜单里选择运行到内置浏览器也可以。', '2020-12-16 23:06:02', NULL, NULL);
INSERT INTO `leave_message` VALUES (4, '入党后，要学习党的新知识', '跨域是浏览器的专用概念，指js代码访问自己来源站点之外的站点。比如A站点网页中的js代码，请求了B站点的数据，就是跨域。\r\nA和B要想被认为是同域，则必须有相同的协议（比如http和https就不行）、相同域名、和相同端口号（port）。\r\n\r\n如果你是做App、小程序等非H5平台，是不涉及跨域问题的。\r\n稍微例外的是iOS的wkWebview，在5+App，或uni-app的web-view组件及renderjs中，由于WKWebview限制也会产生跨域，这方面另见专题文章：https://ask.dcloud.net.cn/article/36348。uni-app在App的普通js代码不运行在Webview下，不存在跨域问题。', '2021-05-05 00:01:01', '20202020@qq.com', '15188888888', '僵尸先生', 1, '这个内置浏览器经过官方处理，不存在跨域问题，简单易用，推荐使用。（需HBuilderX 2.6以上）\r\n在打开页面后，点HBuilderX右上角的预览，即可打开内部浏览器。或者在运行菜单里选择运行到内置浏览器也可以。', '2020-12-16 23:06:02', NULL, NULL);

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '唯一标识ID',
  `task_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `stage` bigint(0) NULL DEFAULT NULL COMMENT '期次',
  `target` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对象',
  `start_date` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_date` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `remark` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` bigint(0) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(0) NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `appraise_year` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考核年份',
  `del_flag` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资料管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of material
-- ----------------------------

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '唯一标识ID',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `subhead` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '副标题',
  `type` tinyint(0) NULL DEFAULT 1 COMMENT '文章类型，1：原创，2：转摘',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `editor` bigint(0) NULL DEFAULT NULL COMMENT '编辑者',
  `reviewer` bigint(0) NULL DEFAULT NULL COMMENT '审核人',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `release_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `remark` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注，文章存在的问题',
  `look_num` bigint(0) NULL DEFAULT NULL COMMENT '浏览量',
  `status` tinyint(0) NULL DEFAULT 0 COMMENT '文章状态，0：创建，1发布，-1异常',
  `create_by` bigint(0) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(0) NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '宣传图片地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新闻' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (7, '大数据工程学院党员学习', '爱学习', 0, 'xiao', 1, 1, '<p>好好学习，天天向上</p><p style=\"text-indent: 0em;\"><strong>狼群学习</strong></p>', '2020-12-16 16:05:38', NULL, 27, 1, 1, '2020-12-16 14:59:14', 1, '2020-12-16 14:59:14', '0', 'https://www.kluniv.edu.cn/__local/F/1E/CB/31EC2231F681B7FE6DF7EBA2AB0_74AE60FD_162D3.jpg');
INSERT INTO `news` VALUES (8, 'vue中created与mounted的区别', 'vue学习', 0, 'xiao', 1, 1, 'SDFSDFSDFSDFSD', '2020-12-16 16:13:56', NULL, 6, 1, 1, '2020-12-16 16:13:49', 1, '2020-12-16 16:13:49', '0', 'https://www.kluniv.edu.cn/__local/F/1E/CB/31EC2231F681B7FE6DF7EBA2AB0_74AE60FD_162D3.jpg');
INSERT INTO `news` VALUES (9, '中宣部发出通知要求 贯彻十八大精神 切实改进文风', '中宣部发出通知要求 贯彻十八大精神 切实改进文风', 1, '大数据工程学院', 1, 1, '<p style=\"margin-top: 1em; margin-bottom: 1em; padding: 0px; border: 0px; font-family: 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">新华网北京１２月２６日电 在深入调查研究、广泛征询意见的基础上，中宣部近日发出《关于贯彻党的十八大精神　切实改进<span style=\"border-bottom: 0px dotted; color: rgb(0, 132, 216); text-decoration-line: underline;\">文风</span>的意见》，要求宣传思想文化战线把改进文风作为宣传贯彻党的十八大精神、落实中央政治局八项规定的重要任务，作为改进工作、提高舆论引导能力的重要机遇，下大决心大气力抓紧抓好。</p><p style=\"margin-top: 1em; margin-bottom: 1em; padding: 0px; border: 0px; font-family: 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　《意见》指出，文风是党风的体现，关系党的形象，关系事业成败。宣传思想文化战线要坚持“三贴近”原则，发扬“走转改”精神，着力转变思想作风、工作作风，着力提高针对性实效性、亲和力感染力，提倡短、实、新，反对假、长、空。</p><p style=\"margin-top: 1em; margin-bottom: 1em; padding: 0px; border: 0px; font-family: 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　《意见》对如何改进文风作出明确规定。要求党报党刊、通讯社、电台电视台要从新闻报道、评论言论的内容、语言、标题、篇幅到版面编排、栏目设计、节目制作等方面，进行全面改进。要根据工作需要、新闻价值、社会效果确定内容，说真话、写实情，言之有物、言之有理、言之有情，杜绝脱离实际、内容空洞的文章和“应景”文章，不发一般化的工作报道。要善于运用鲜活的语言说明事物、表达观点，善于把文件语言和学术概念转换成易读易懂的群众语言，善于捕捉富有个性、特色鲜明的话语，简洁平实、通俗明白，杜绝照抄照搬文件和领导讲话。要做准、做好、做活标题，善于抓住要点、提炼有效信息，准确鲜明表达核心观点，避免机械呆板、不知所云、大而无当的口号式标题。要力求篇幅简短精炼，使新闻报道开门见山、直截了当，要言不烦、意尽言止。报纸版面、栏目设计、节目编排要清新活泼，符合内容传播需要，适应受众接受习惯，展示媒体自身特色。媒体要定位准确，根据服务对象的需求，说不同的话、写不同的文章、制作不同的节目，形成各具特色的发展格局，克服定位不清、缺乏特色的同质化现象。</p><p style=\"margin-top: 1em; margin-bottom: 1em; padding: 0px; border: 0px; font-family: 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　《意见》强调，各级党委宣传部和党报党刊、通讯社、电台电视台要对改进文风进行总体研究，制定具体方案，从每一篇报道、每一个栏目抓起。要建立健全工作制度机制，把改进文风的要求体现到稿件使用、业务考核、业绩评价、评奖表彰中。领导班子成员要身体力行、率先垂范，加强对采编队伍特别是年轻采编人员的教育培训，持之以恒、久久为功。中央媒体要走在前列，在改进文风上先走一步、高出一筹，发挥好示范带动作用。</p><p><br/></p>', '2020-12-16 16:39:53', NULL, 7, 1, 1, '2020-12-16 16:39:46', 1, '2020-12-16 16:39:46', '0', 'https://www.kluniv.edu.cn/__local/F/1E/CB/31EC2231F681B7FE6DF7EBA2AB0_74AE60FD_162D3.jpg');

-- ----------------------------
-- Table structure for news_look
-- ----------------------------
DROP TABLE IF EXISTS `news_look`;
CREATE TABLE `news_look`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `news_id` bigint(0) NULL DEFAULT NULL,
  `day` date NULL DEFAULT NULL,
  `num` bigint(0) NULL DEFAULT 0 COMMENT '浏览量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新闻浏览记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news_look
-- ----------------------------
INSERT INTO `news_look` VALUES (1, 9, '2021-02-26', 1);
INSERT INTO `news_look` VALUES (2, 8, '2021-02-26', 1);
INSERT INTO `news_look` VALUES (3, 9, '2021-03-03', 1);
INSERT INTO `news_look` VALUES (4, 7, '2021-05-05', 1);
INSERT INTO `news_look` VALUES (5, 7, '2021-05-05', 1);

-- ----------------------------
-- Table structure for pt_grade
-- ----------------------------
DROP TABLE IF EXISTS `pt_grade`;
CREATE TABLE `pt_grade`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `no` tinyint(0) NULL DEFAULT NULL COMMENT '等级序号	数字越低，等级越低',
  `grade_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '等级名称：针对等级不同的人进行发送，申请人- 积极分子-发展对象-预备党员-党员',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '等级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pt_grade
-- ----------------------------
INSERT INTO `pt_grade` VALUES (1, 1, '入党申请人', '群众');
INSERT INTO `pt_grade` VALUES (2, 2, '积极分子', NULL);
INSERT INTO `pt_grade` VALUES (3, 3, '发展对象', NULL);
INSERT INTO `pt_grade` VALUES (4, 4, '预备党员', NULL);
INSERT INTO `pt_grade` VALUES (5, 5, '正式党员', NULL);

-- ----------------------------
-- Table structure for pt_task
-- ----------------------------
DROP TABLE IF EXISTS `pt_task`;
CREATE TABLE `pt_task`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务标题',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务描述',
  `task_type` tinyint(0) NULL DEFAULT NULL COMMENT '任务类型：预留',
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '创建任务的人：外键，user表id',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '任务开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '任务结束时间',
  `sand_type` tinyint(0) NULL DEFAULT 0 COMMENT '发送类型：0：一般，1：紧急',
  `sand_target` bigint(0) NULL DEFAULT NULL COMMENT '发送目标：外键，等级表id\r\n针对等级不同的人进行发送，申请人- 积极分子-发展对象-预备党员-党员',
  `status` tinyint(0) NULL DEFAULT 0 COMMENT '状态：0：未执行，1：执行中，2：完成，3：未完成，-1：异常',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pt_task
-- ----------------------------
INSERT INTO `pt_task` VALUES (1, '恩恩额', '嗯嗯', NULL, 1, '2021-05-03 22:25:30', '2021-05-04 00:00:00', 0, 1, 1, '');
INSERT INTO `pt_task` VALUES (2, '测试任务2', '测试任务，交党费了，赶紧赶紧\n', 0, 1, '2021-05-05 11:25:42', '2021-05-05 12:25:44', 0, 1, 1, '');
INSERT INTO `pt_task` VALUES (3, '测试3', '尊敬的拜登总统，\n\n尊敬的各位同事：\n\n很高兴在“世界地球日”到来之际出席领导人气候峰会，感谢拜登总统的邀请。借此机会，我愿同大家就气候变化问题深入交换意见，共商应对气候变化挑战之策，共谋人与自然和谐共生之道。', 0, 1, '2021-05-05 11:47:33', '2021-05-05 11:47:34', 0, 1, 1, '');

-- ----------------------------
-- Table structure for pt_task_answer
-- ----------------------------
DROP TABLE IF EXISTS `pt_task_answer`;
CREATE TABLE `pt_task_answer`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `task_sand_id` bigint(0) NULL DEFAULT NULL COMMENT '任务发送表id	外键pt_task_sand表id',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容1	HTML格式',
  `content_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容2	文件格式(txt,word),多个文件，用|隔开',
  `content_avi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容3	视频格式，多个文件，用|隔开',
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '提交任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pt_task_answer
-- ----------------------------
INSERT INTO `pt_task_answer` VALUES (5, 1, '<p>是是是手动阀</p>', NULL, NULL, '是是是手动阀\n', '2021-05-04 23:14:36');
INSERT INTO `pt_task_answer` VALUES (6, 2, '<p>新华社北京5月2日电&nbsp;&nbsp;5月1日，国家主席习近平就以色列发生严重踩踏事故，造成重大人员伤亡向以色列总统瑞夫林致慰问电，代表中国政府和中国人民，对遇难者表示深切的哀悼，向遇难者家属和伤者致以诚挚的慰问。</p>', NULL, NULL, '新华社北京5月2日电  5月1日，国家主席习近平就以色列发生严重踩踏事故，造成重大人员伤亡向以色列总统瑞夫林致慰问电，代表中国政府和中国人民，对遇难者表示深切的哀悼，向遇难者家属和伤者致以诚挚的慰问。\n', '2021-05-05 11:39:20');
INSERT INTO `pt_task_answer` VALUES (7, 3, '<p>	人类进入工业文明时代以来，在创造巨大物质财富的同时，也加速了对自然资源的攫取，打破了地球生态系统平衡，人与自然深层次矛盾日益显现。近年来，气候变化、生物多样性丧失、荒漠化加剧、极端气候事件频发，给人类生存和发展带来严峻挑战。新冠肺炎疫情持续蔓延，使各国经济社会发展雪上加霜。面对全球环境治理前所未有的困难，国际社会要以前所未有的雄心和行动，勇于担当，勠力同心，共同构建人与自然生命共同体。</p><p>	——坚持人与自然和谐共生。“万物各得其和以生，各得其养以成。”大自然是包括人在内一切生物的摇篮，是人类赖以生存发展的基本条件。大自然孕育抚养了人类，人类应该以自然为根，尊重自然、顺应自然、保护自然。不尊重自然，违背自然规律，只会遭到自然报复。自然遭到系统性破坏，人类生存发展就成了无源之水、无本之木。我们要像保护眼睛一样保护自然和生态环境，推动形成人与自然和谐共生新格局。</p>', NULL, NULL, '	人类进入工业文明时代以来，在创造巨大物质财富的同时，也加速了对自然资源的攫取，打破了地球生态系统平衡，人与自然深层次矛盾日益显现。近年来，气候变化、生物多样性丧失、荒漠化加剧、极端气候事件频发，给人类生存和发展带来严峻挑战。新冠肺炎疫情持续蔓延，使各国经济社会发展雪上加霜。面对全球环境治理前所未有的困难，国际社会要以前所未有的雄心和行动，勇于担当，勠力同心，共同构建人与自然生命共同体。\n	——坚持人与自然和谐共生。“万物各得其和以生，各得其养以成。”大自然是包括人在内一切生物的摇篮，是人类赖以生存发展的基本条件。大自然孕育抚养了人类，人类应该以自然为根，尊重自然、顺应自然、保护自然。不尊重自然，违背自然规律，只会遭到自然报复。自然遭到系统性破坏，人类生存发展就成了无源之水、无本之木。我们要像保护眼睛一样保护自然和生态环境，推动形成人与自然和谐共生新格局。\n', '2021-05-05 11:51:35');

-- ----------------------------
-- Table structure for pt_task_comment
-- ----------------------------
DROP TABLE IF EXISTS `pt_task_comment`;
CREATE TABLE `pt_task_comment`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `task_sand_id` bigint(0) NULL DEFAULT NULL COMMENT '任务发送表id	外键pt_task_sand表id',
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '点评人	user表id',
  `result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '点评结果	类似分数，等级',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '点评内容',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '点评时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务点评表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pt_task_comment
-- ----------------------------

-- ----------------------------
-- Table structure for pt_task_sand
-- ----------------------------
DROP TABLE IF EXISTS `pt_task_sand`;
CREATE TABLE `pt_task_sand`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `task_id` bigint(0) NULL DEFAULT NULL COMMENT '任务表id	外键pt_task表id',
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '执行任务人	（任务执行人）user表id',
  `is_comment` tinyint(0) NULL DEFAULT 0 COMMENT '是否点评	0:未点评，1：已点评',
  `status` tinyint(0) NULL DEFAULT 0 COMMENT '完成状态	0：待完成，1：已完成，-1：未完成（过期的任务）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务发送表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pt_task_sand
-- ----------------------------
INSERT INTO `pt_task_sand` VALUES (1, 1, 1, 2, 1);
INSERT INTO `pt_task_sand` VALUES (2, 2, 1, 0, 1);
INSERT INTO `pt_task_sand` VALUES (3, 3, 1, 0, 1);

-- ----------------------------
-- Table structure for pt_user_info
-- ----------------------------
DROP TABLE IF EXISTS `pt_user_info`;
CREATE TABLE `pt_user_info`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '用户',
  `tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `id_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '身份证号',
  `type` tinyint(0) NULL DEFAULT NULL COMMENT '0：学生，1：教师，2：其他',
  `sex` tinyint(0) NULL DEFAULT NULL COMMENT '0女，1男',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `grade` bigint(0) NULL DEFAULT NULL COMMENT '等级表id',
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学生学号，教师工号，其他？',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pt_user_info
-- ----------------------------
INSERT INTO `pt_user_info` VALUES (1, 1, '123456789', '肖光鼎', '000000000000', 0, 1, '123', '2021-05-03 22:57:30', 1, '201801');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(0) NOT NULL,
  `SCHED_TIME` bigint(0) NOT NULL,
  `PRIORITY` int(0) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(0) NOT NULL,
  `CHECKIN_INTERVAL` bigint(0) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'PC-20201117KVRV1620194124982', 1620195336273, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(0) NOT NULL,
  `REPEAT_INTERVAL` bigint(0) NOT NULL,
  `TIMES_TRIGGERED` bigint(0) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(0) NULL DEFAULT NULL,
  `INT_PROP_2` int(0) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(0) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(0) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(0) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(0) NULL DEFAULT NULL,
  `PRIORITY` int(0) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(0) NOT NULL,
  `END_TIME` bigint(0) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(0) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job`  (
  `job_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'spring bean鍚嶇О',
  `params` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鍙傛暟',
  `cron_expression` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron琛ㄨ揪寮?',
  `status` tinyint(0) NULL DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '澶囨敞',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log`  (
  `log_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(0) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'spring bean鍚嶇О',
  `params` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鍙傛暟',
  `status` tinyint(0) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '澶辫触淇℃伅',
  `times` int(0) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `job_id`(`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 222 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES (1, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-10 09:00:00');
INSERT INTO `schedule_job_log` VALUES (2, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-10 10:00:00');
INSERT INTO `schedule_job_log` VALUES (3, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-10 10:30:00');
INSERT INTO `schedule_job_log` VALUES (4, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-10 11:00:00');
INSERT INTO `schedule_job_log` VALUES (5, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-10 11:30:00');
INSERT INTO `schedule_job_log` VALUES (6, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-10 12:00:00');
INSERT INTO `schedule_job_log` VALUES (7, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-10 12:30:00');
INSERT INTO `schedule_job_log` VALUES (8, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-10 13:00:00');
INSERT INTO `schedule_job_log` VALUES (9, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-10 13:30:00');
INSERT INTO `schedule_job_log` VALUES (10, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-10 14:00:00');
INSERT INTO `schedule_job_log` VALUES (11, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-10 14:30:00');
INSERT INTO `schedule_job_log` VALUES (12, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-10 15:00:00');
INSERT INTO `schedule_job_log` VALUES (13, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-10 15:30:00');
INSERT INTO `schedule_job_log` VALUES (14, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-10 16:00:00');
INSERT INTO `schedule_job_log` VALUES (15, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-10 16:30:00');
INSERT INTO `schedule_job_log` VALUES (16, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-10 17:00:00');
INSERT INTO `schedule_job_log` VALUES (17, 1, 'testTask', 'renren', 0, NULL, 3, '2020-12-10 17:30:00');
INSERT INTO `schedule_job_log` VALUES (18, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-10 18:00:00');
INSERT INTO `schedule_job_log` VALUES (19, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-10 18:30:00');
INSERT INTO `schedule_job_log` VALUES (20, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-10 19:00:00');
INSERT INTO `schedule_job_log` VALUES (21, 1, 'testTask', 'renren', 0, NULL, 3, '2020-12-10 19:30:00');
INSERT INTO `schedule_job_log` VALUES (22, 1, 'testTask', 'renren', 0, NULL, 2, '2020-12-10 20:00:00');
INSERT INTO `schedule_job_log` VALUES (23, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-10 20:30:00');
INSERT INTO `schedule_job_log` VALUES (24, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-10 21:00:00');
INSERT INTO `schedule_job_log` VALUES (25, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-10 22:00:00');
INSERT INTO `schedule_job_log` VALUES (26, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-10 22:30:00');
INSERT INTO `schedule_job_log` VALUES (27, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-10 23:00:00');
INSERT INTO `schedule_job_log` VALUES (28, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-10 23:30:00');
INSERT INTO `schedule_job_log` VALUES (29, 1, 'testTask', 'renren', 0, NULL, 11, '2020-12-11 00:00:00');
INSERT INTO `schedule_job_log` VALUES (30, 1, 'testTask', 'renren', 0, NULL, 3, '2020-12-11 00:30:00');
INSERT INTO `schedule_job_log` VALUES (31, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-11 01:00:00');
INSERT INTO `schedule_job_log` VALUES (32, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-11 01:30:00');
INSERT INTO `schedule_job_log` VALUES (33, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 02:00:00');
INSERT INTO `schedule_job_log` VALUES (34, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 02:30:00');
INSERT INTO `schedule_job_log` VALUES (35, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 03:00:00');
INSERT INTO `schedule_job_log` VALUES (36, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 03:30:00');
INSERT INTO `schedule_job_log` VALUES (37, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 04:00:00');
INSERT INTO `schedule_job_log` VALUES (38, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 04:30:00');
INSERT INTO `schedule_job_log` VALUES (39, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 05:00:00');
INSERT INTO `schedule_job_log` VALUES (40, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-11 05:30:00');
INSERT INTO `schedule_job_log` VALUES (41, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 06:00:00');
INSERT INTO `schedule_job_log` VALUES (42, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 06:30:00');
INSERT INTO `schedule_job_log` VALUES (43, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 07:00:00');
INSERT INTO `schedule_job_log` VALUES (44, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 07:30:00');
INSERT INTO `schedule_job_log` VALUES (45, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 08:00:00');
INSERT INTO `schedule_job_log` VALUES (46, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 08:30:00');
INSERT INTO `schedule_job_log` VALUES (47, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 09:00:00');
INSERT INTO `schedule_job_log` VALUES (48, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-11 09:30:00');
INSERT INTO `schedule_job_log` VALUES (49, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 10:00:00');
INSERT INTO `schedule_job_log` VALUES (50, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-11 10:30:00');
INSERT INTO `schedule_job_log` VALUES (51, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 11:00:00');
INSERT INTO `schedule_job_log` VALUES (52, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-11 11:30:00');
INSERT INTO `schedule_job_log` VALUES (53, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 12:00:00');
INSERT INTO `schedule_job_log` VALUES (54, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 12:30:00');
INSERT INTO `schedule_job_log` VALUES (55, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-11 13:00:00');
INSERT INTO `schedule_job_log` VALUES (56, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 13:30:00');
INSERT INTO `schedule_job_log` VALUES (57, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-11 14:00:00');
INSERT INTO `schedule_job_log` VALUES (58, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 14:30:00');
INSERT INTO `schedule_job_log` VALUES (59, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-11 15:00:00');
INSERT INTO `schedule_job_log` VALUES (60, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 15:30:00');
INSERT INTO `schedule_job_log` VALUES (61, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 16:00:00');
INSERT INTO `schedule_job_log` VALUES (62, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-11 16:30:00');
INSERT INTO `schedule_job_log` VALUES (63, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 17:00:00');
INSERT INTO `schedule_job_log` VALUES (64, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 17:30:00');
INSERT INTO `schedule_job_log` VALUES (65, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 18:00:00');
INSERT INTO `schedule_job_log` VALUES (66, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 18:30:00');
INSERT INTO `schedule_job_log` VALUES (67, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 19:00:00');
INSERT INTO `schedule_job_log` VALUES (68, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-11 19:30:00');
INSERT INTO `schedule_job_log` VALUES (69, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 20:00:00');
INSERT INTO `schedule_job_log` VALUES (70, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 20:30:00');
INSERT INTO `schedule_job_log` VALUES (71, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 21:00:00');
INSERT INTO `schedule_job_log` VALUES (72, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-11 21:30:00');
INSERT INTO `schedule_job_log` VALUES (73, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 22:00:00');
INSERT INTO `schedule_job_log` VALUES (74, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 22:30:00');
INSERT INTO `schedule_job_log` VALUES (75, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-11 23:00:00');
INSERT INTO `schedule_job_log` VALUES (76, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-11 23:30:00');
INSERT INTO `schedule_job_log` VALUES (77, 1, 'testTask', 'renren', 0, NULL, 304, '2020-12-12 00:00:00');
INSERT INTO `schedule_job_log` VALUES (78, 1, 'testTask', 'renren', 0, NULL, 11, '2020-12-12 00:30:00');
INSERT INTO `schedule_job_log` VALUES (79, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 01:00:00');
INSERT INTO `schedule_job_log` VALUES (80, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 01:30:00');
INSERT INTO `schedule_job_log` VALUES (81, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 02:00:00');
INSERT INTO `schedule_job_log` VALUES (82, 1, 'testTask', 'renren', 0, NULL, 2, '2020-12-12 02:30:00');
INSERT INTO `schedule_job_log` VALUES (83, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 03:00:00');
INSERT INTO `schedule_job_log` VALUES (84, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 03:30:00');
INSERT INTO `schedule_job_log` VALUES (85, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 04:00:00');
INSERT INTO `schedule_job_log` VALUES (86, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-12 04:30:00');
INSERT INTO `schedule_job_log` VALUES (87, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 05:00:00');
INSERT INTO `schedule_job_log` VALUES (88, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 05:30:00');
INSERT INTO `schedule_job_log` VALUES (89, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-12 06:00:00');
INSERT INTO `schedule_job_log` VALUES (90, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 06:30:00');
INSERT INTO `schedule_job_log` VALUES (91, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 07:00:00');
INSERT INTO `schedule_job_log` VALUES (92, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 07:30:00');
INSERT INTO `schedule_job_log` VALUES (93, 1, 'testTask', 'renren', 0, NULL, 3, '2020-12-12 08:00:00');
INSERT INTO `schedule_job_log` VALUES (94, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 08:30:00');
INSERT INTO `schedule_job_log` VALUES (95, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 09:00:00');
INSERT INTO `schedule_job_log` VALUES (96, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 09:30:00');
INSERT INTO `schedule_job_log` VALUES (97, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-12 10:00:00');
INSERT INTO `schedule_job_log` VALUES (98, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 10:30:00');
INSERT INTO `schedule_job_log` VALUES (99, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 11:00:00');
INSERT INTO `schedule_job_log` VALUES (100, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 11:30:00');
INSERT INTO `schedule_job_log` VALUES (101, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 12:00:00');
INSERT INTO `schedule_job_log` VALUES (102, 1, 'testTask', 'renren', 0, NULL, 2, '2020-12-12 12:30:00');
INSERT INTO `schedule_job_log` VALUES (103, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-12 13:00:00');
INSERT INTO `schedule_job_log` VALUES (104, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-12 13:30:00');
INSERT INTO `schedule_job_log` VALUES (105, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 14:00:00');
INSERT INTO `schedule_job_log` VALUES (106, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 14:30:00');
INSERT INTO `schedule_job_log` VALUES (107, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 15:00:00');
INSERT INTO `schedule_job_log` VALUES (108, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-12 15:30:00');
INSERT INTO `schedule_job_log` VALUES (109, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 16:00:00');
INSERT INTO `schedule_job_log` VALUES (110, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 16:30:00');
INSERT INTO `schedule_job_log` VALUES (111, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 17:00:00');
INSERT INTO `schedule_job_log` VALUES (112, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-12 17:30:00');
INSERT INTO `schedule_job_log` VALUES (113, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 18:00:00');
INSERT INTO `schedule_job_log` VALUES (114, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 18:30:00');
INSERT INTO `schedule_job_log` VALUES (115, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-12 19:00:00');
INSERT INTO `schedule_job_log` VALUES (116, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 19:30:00');
INSERT INTO `schedule_job_log` VALUES (117, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-12 20:00:00');
INSERT INTO `schedule_job_log` VALUES (118, 1, 'testTask', 'renren', 0, NULL, 3, '2020-12-12 20:30:00');
INSERT INTO `schedule_job_log` VALUES (119, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 21:00:00');
INSERT INTO `schedule_job_log` VALUES (120, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-12 21:30:00');
INSERT INTO `schedule_job_log` VALUES (121, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 22:00:00');
INSERT INTO `schedule_job_log` VALUES (122, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-12 22:30:00');
INSERT INTO `schedule_job_log` VALUES (123, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 23:00:00');
INSERT INTO `schedule_job_log` VALUES (124, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-12 23:30:00');
INSERT INTO `schedule_job_log` VALUES (125, 1, 'testTask', 'renren', 0, NULL, 196, '2020-12-13 00:00:00');
INSERT INTO `schedule_job_log` VALUES (126, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 00:30:00');
INSERT INTO `schedule_job_log` VALUES (127, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-13 01:00:00');
INSERT INTO `schedule_job_log` VALUES (128, 1, 'testTask', 'renren', 0, NULL, 2, '2020-12-13 01:30:00');
INSERT INTO `schedule_job_log` VALUES (129, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-13 02:00:00');
INSERT INTO `schedule_job_log` VALUES (130, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-13 02:30:00');
INSERT INTO `schedule_job_log` VALUES (131, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 03:00:00');
INSERT INTO `schedule_job_log` VALUES (132, 1, 'testTask', 'renren', 0, NULL, 2, '2020-12-13 03:30:00');
INSERT INTO `schedule_job_log` VALUES (133, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 04:00:00');
INSERT INTO `schedule_job_log` VALUES (134, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 04:30:00');
INSERT INTO `schedule_job_log` VALUES (135, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 05:00:00');
INSERT INTO `schedule_job_log` VALUES (136, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-13 05:30:00');
INSERT INTO `schedule_job_log` VALUES (137, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-13 06:00:00');
INSERT INTO `schedule_job_log` VALUES (138, 1, 'testTask', 'renren', 0, NULL, 2, '2020-12-13 06:30:00');
INSERT INTO `schedule_job_log` VALUES (139, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 07:00:00');
INSERT INTO `schedule_job_log` VALUES (140, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-13 07:30:00');
INSERT INTO `schedule_job_log` VALUES (141, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 08:00:00');
INSERT INTO `schedule_job_log` VALUES (142, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 08:30:00');
INSERT INTO `schedule_job_log` VALUES (143, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 09:00:00');
INSERT INTO `schedule_job_log` VALUES (144, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 09:30:00');
INSERT INTO `schedule_job_log` VALUES (145, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-13 10:00:00');
INSERT INTO `schedule_job_log` VALUES (146, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 10:30:00');
INSERT INTO `schedule_job_log` VALUES (147, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 11:00:00');
INSERT INTO `schedule_job_log` VALUES (148, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 11:30:00');
INSERT INTO `schedule_job_log` VALUES (149, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 12:00:00');
INSERT INTO `schedule_job_log` VALUES (150, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 12:30:00');
INSERT INTO `schedule_job_log` VALUES (151, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-13 13:00:00');
INSERT INTO `schedule_job_log` VALUES (152, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-13 13:30:00');
INSERT INTO `schedule_job_log` VALUES (153, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 14:00:00');
INSERT INTO `schedule_job_log` VALUES (154, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 14:30:00');
INSERT INTO `schedule_job_log` VALUES (155, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 15:00:00');
INSERT INTO `schedule_job_log` VALUES (156, 1, 'testTask', 'renren', 0, NULL, 2, '2020-12-13 15:30:00');
INSERT INTO `schedule_job_log` VALUES (157, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 16:00:00');
INSERT INTO `schedule_job_log` VALUES (158, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 16:30:00');
INSERT INTO `schedule_job_log` VALUES (159, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 17:00:00');
INSERT INTO `schedule_job_log` VALUES (160, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 17:30:00');
INSERT INTO `schedule_job_log` VALUES (161, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-13 18:00:00');
INSERT INTO `schedule_job_log` VALUES (162, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 18:30:00');
INSERT INTO `schedule_job_log` VALUES (163, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 19:00:00');
INSERT INTO `schedule_job_log` VALUES (164, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 19:30:00');
INSERT INTO `schedule_job_log` VALUES (165, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 20:00:00');
INSERT INTO `schedule_job_log` VALUES (166, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 20:30:00');
INSERT INTO `schedule_job_log` VALUES (167, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-13 21:00:00');
INSERT INTO `schedule_job_log` VALUES (168, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-13 21:30:00');
INSERT INTO `schedule_job_log` VALUES (169, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 22:00:00');
INSERT INTO `schedule_job_log` VALUES (170, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 22:30:00');
INSERT INTO `schedule_job_log` VALUES (171, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 23:00:00');
INSERT INTO `schedule_job_log` VALUES (172, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-13 23:30:00');
INSERT INTO `schedule_job_log` VALUES (173, 1, 'testTask', 'renren', 0, NULL, 6, '2020-12-14 00:00:00');
INSERT INTO `schedule_job_log` VALUES (174, 1, 'testTask', 'renren', 0, NULL, 2, '2020-12-14 00:30:00');
INSERT INTO `schedule_job_log` VALUES (175, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-14 01:00:00');
INSERT INTO `schedule_job_log` VALUES (176, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-14 01:30:00');
INSERT INTO `schedule_job_log` VALUES (177, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-14 02:00:00');
INSERT INTO `schedule_job_log` VALUES (178, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-14 02:30:00');
INSERT INTO `schedule_job_log` VALUES (179, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-14 03:00:00');
INSERT INTO `schedule_job_log` VALUES (180, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-14 03:30:00');
INSERT INTO `schedule_job_log` VALUES (181, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-14 04:00:00');
INSERT INTO `schedule_job_log` VALUES (182, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-14 04:30:00');
INSERT INTO `schedule_job_log` VALUES (183, 1, 'testTask', 'renren', 0, NULL, 2, '2020-12-14 05:00:00');
INSERT INTO `schedule_job_log` VALUES (184, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-14 05:30:00');
INSERT INTO `schedule_job_log` VALUES (185, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-14 06:00:00');
INSERT INTO `schedule_job_log` VALUES (186, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-14 06:30:00');
INSERT INTO `schedule_job_log` VALUES (187, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-14 07:00:00');
INSERT INTO `schedule_job_log` VALUES (188, 1, 'testTask', 'renren', 0, NULL, 2, '2020-12-14 07:30:00');
INSERT INTO `schedule_job_log` VALUES (189, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-14 08:00:00');
INSERT INTO `schedule_job_log` VALUES (190, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-14 08:30:00');
INSERT INTO `schedule_job_log` VALUES (191, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-14 09:00:00');
INSERT INTO `schedule_job_log` VALUES (192, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-16 09:00:00');
INSERT INTO `schedule_job_log` VALUES (193, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-16 10:30:01');
INSERT INTO `schedule_job_log` VALUES (194, 1, 'testTask', 'renren', 0, NULL, 2, '2020-12-16 11:00:01');
INSERT INTO `schedule_job_log` VALUES (195, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-16 11:30:00');
INSERT INTO `schedule_job_log` VALUES (196, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-16 12:00:00');
INSERT INTO `schedule_job_log` VALUES (197, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-16 12:30:00');
INSERT INTO `schedule_job_log` VALUES (198, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-16 13:00:00');
INSERT INTO `schedule_job_log` VALUES (199, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-16 13:30:01');
INSERT INTO `schedule_job_log` VALUES (200, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-16 14:00:00');
INSERT INTO `schedule_job_log` VALUES (201, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-16 14:30:00');
INSERT INTO `schedule_job_log` VALUES (202, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-16 15:00:00');
INSERT INTO `schedule_job_log` VALUES (203, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-16 15:30:00');
INSERT INTO `schedule_job_log` VALUES (204, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-16 16:00:00');
INSERT INTO `schedule_job_log` VALUES (205, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-16 16:30:00');
INSERT INTO `schedule_job_log` VALUES (206, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-16 17:00:01');
INSERT INTO `schedule_job_log` VALUES (207, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-16 17:30:00');
INSERT INTO `schedule_job_log` VALUES (208, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-16 18:00:00');
INSERT INTO `schedule_job_log` VALUES (209, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-16 18:30:00');
INSERT INTO `schedule_job_log` VALUES (210, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-16 19:30:00');
INSERT INTO `schedule_job_log` VALUES (211, 1, 'testTask', 'renren', 0, NULL, 2, '2020-12-16 20:00:01');
INSERT INTO `schedule_job_log` VALUES (212, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-16 20:30:00');
INSERT INTO `schedule_job_log` VALUES (213, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-16 21:00:00');
INSERT INTO `schedule_job_log` VALUES (214, 1, 'testTask', 'renren', 0, NULL, 2, '2020-12-16 22:00:01');
INSERT INTO `schedule_job_log` VALUES (215, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-16 22:30:00');
INSERT INTO `schedule_job_log` VALUES (216, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-16 23:00:00');
INSERT INTO `schedule_job_log` VALUES (217, 1, 'testTask', 'renren', 0, NULL, 4, '2020-12-17 09:00:01');
INSERT INTO `schedule_job_log` VALUES (218, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-17 09:30:00');
INSERT INTO `schedule_job_log` VALUES (219, 1, 'testTask', 'renren', 0, NULL, 2, '2020-12-17 10:00:01');
INSERT INTO `schedule_job_log` VALUES (220, 1, 'testTask', 'renren', 0, NULL, 3, '2020-12-17 10:30:01');
INSERT INTO `schedule_job_log` VALUES (221, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-17 11:00:00');

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha`  (
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'uuid',
  `code` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '楠岃瘉鐮?',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统验证码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('0159251c-0459-4b53-8304-2acd862b2c5e', 'nny3n', '2020-12-14 08:49:31');
INSERT INTO `sys_captcha` VALUES ('03dadf74-3b0b-427e-8bbb-9916b93e0763', 'n53d2', '2020-12-23 17:07:41');
INSERT INTO `sys_captcha` VALUES ('0ba44ac4-e6fd-4bd4-8993-9346fa14ab12', 'pwwgc', '2020-12-10 17:36:38');
INSERT INTO `sys_captcha` VALUES ('0d0bca2f-9bda-4474-8eca-b643c902a347', 'm4wn2', '2020-12-23 17:10:56');
INSERT INTO `sys_captcha` VALUES ('112adfc3-a1ab-46eb-862e-c584df9ed334', 'ne2gc', '2020-12-10 17:55:05');
INSERT INTO `sys_captcha` VALUES ('122a98f5-db31-46e4-85fd-4b191ca53210', 'fwnnb', '2020-12-10 17:55:05');
INSERT INTO `sys_captcha` VALUES ('21483f17-2a0b-42b3-89fb-4f6a4a17bfcd', '64xx6', '2020-12-18 09:15:16');
INSERT INTO `sys_captcha` VALUES ('26890421-64ae-4694-80da-67799ec23e4b', '3bnnf', '2020-12-10 17:14:46');
INSERT INTO `sys_captcha` VALUES ('29a46172-d582-4767-8e6e-a4aaf158fd82', 'y36by', '2020-12-10 17:15:07');
INSERT INTO `sys_captcha` VALUES ('3592643a-0c65-4632-8b79-26e22f87c3fc', '46d4b', '2021-05-04 20:25:02');
INSERT INTO `sys_captcha` VALUES ('44072742-26b3-4775-8bfe-0d5deff5529b', 'cb3nb', '2020-12-10 17:12:04');
INSERT INTO `sys_captcha` VALUES ('457a2a2a-0a31-4519-8dd8-ce91e58f7de8', 'f86yd', '2020-12-10 17:07:58');
INSERT INTO `sys_captcha` VALUES ('470c2f74-f7a7-4806-8e15-69b070fae0f6', 'x6dbc', '2021-05-03 16:48:33');
INSERT INTO `sys_captcha` VALUES ('6b170f90-83ce-489c-81bd-af6a5080d3cf', 'nneeg', '2020-12-18 09:17:18');
INSERT INTO `sys_captcha` VALUES ('6b9cfdc1-4a96-480b-8cce-7b8f97212da4', 'bnw4a', '2020-12-24 16:10:50');
INSERT INTO `sys_captcha` VALUES ('6d68ea6d-1079-4d53-81b8-9e5bfde991c2', 'am6c6', '2021-05-05 10:54:57');
INSERT INTO `sys_captcha` VALUES ('71d74a05-cc6e-40ca-8379-03e1e4dcd617', 'xxm2n', '2020-12-10 16:56:13');
INSERT INTO `sys_captcha` VALUES ('75c5bffb-a91f-4e21-84e3-639ee86eee21', 'cpwan', '2020-12-17 09:01:26');
INSERT INTO `sys_captcha` VALUES ('7a141914-c275-4615-88bb-eb6c7611f5d8', 'gypgb', '2020-12-10 17:15:07');
INSERT INTO `sys_captcha` VALUES ('838c97c2-c2dd-4818-8aad-eb5d17471b91', '73nnx', '2020-12-10 17:50:54');
INSERT INTO `sys_captcha` VALUES ('8a67d51c-4acf-4dd3-8010-c871c5a68fcd', 'nfadg', '2020-12-10 16:36:25');
INSERT INTO `sys_captcha` VALUES ('8e2db6af-e55c-4ec5-8cef-9ddd38f8c5f3', 'a4cny', '2020-12-10 17:24:43');
INSERT INTO `sys_captcha` VALUES ('91dab356-377d-480b-8a0c-ddad41ddaee8', '3ge78', '2021-05-03 19:18:49');
INSERT INTO `sys_captcha` VALUES ('9c3292ec-24c5-4340-8b2c-fcb8ba4d099b', 'a85y7', '2020-12-10 17:36:38');
INSERT INTO `sys_captcha` VALUES ('9dea718c-e040-4cfc-8690-97224a61f5bc', '2yacw', '2020-12-10 17:51:10');
INSERT INTO `sys_captcha` VALUES ('ae34e5f0-861b-4f02-8ce1-03296af9cc38', 'dn37w', '2020-12-14 08:49:30');
INSERT INTO `sys_captcha` VALUES ('b33c8dd9-5070-4092-8280-eb1f1dbd0cc7', '2pc85', '2021-05-03 16:02:33');
INSERT INTO `sys_captcha` VALUES ('cade9b02-008f-46a3-895e-2f166e302ad6', 'ff4ge', '2020-12-10 17:16:38');
INSERT INTO `sys_captcha` VALUES ('ccd151d9-5b6c-4aca-8a7a-59800b402757', 'x7np2', '2020-12-10 17:50:45');
INSERT INTO `sys_captcha` VALUES ('d67c9386-cecb-4c15-810c-c1505a1e36f5', 'fgnwm', '2020-12-10 16:56:13');
INSERT INTO `sys_captcha` VALUES ('da1ee55c-fb78-4af7-8ac1-f50777d9e31a', 'efn2m', '2020-12-23 10:01:24');
INSERT INTO `sys_captcha` VALUES ('dcae985f-d1aa-41d3-8724-488b9de4822a', 'gpeng', '2020-12-16 18:39:55');
INSERT INTO `sys_captcha` VALUES ('dfa19a86-98d1-4f14-8481-f7e56153e565', 'mgmnd', '2020-12-23 10:35:06');
INSERT INTO `sys_captcha` VALUES ('e53d7648-74ca-48c2-8cfc-8c46fd762aed', 'yc3e6', '2020-12-10 17:16:38');
INSERT INTO `sys_captcha` VALUES ('e9bea43f-5f7e-470c-8ef1-39593cf4d934', '878y4', '2020-12-10 17:14:46');
INSERT INTO `sys_captcha` VALUES ('e9fddd01-9047-4dce-81a2-3fc16107ad0e', 'd4n32', '2020-12-10 17:51:19');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'value',
  `status` tinyint(0) NULL DEFAULT 1 COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '澶囨敞',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `param_key`(`param_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', 0, '云存储配置信息');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鐢ㄦ埛鍚?',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鐢ㄦ埛鎿嶄綔',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '璇锋眰鏂规硶',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '璇锋眰鍙傛暟',
  `time` bigint(0) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP鍦板潃',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (23, 'admin', '删除定时任务', 'io.renren.modules.job.controller.ScheduleJobController.delete()', '[[1]]', 807, '0:0:0:0:0:0:0:1', '2020-12-17 16:23:28');
INSERT INTO `sys_log` VALUES (24, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":33,\"parentId\":0,\"name\":\"知识管理\",\"url\":\"11\",\"perms\":\"\",\"type\":0,\"icon\":\"mudedi\",\"orderNum\":2}]', 84, '0:0:0:0:0:0:0:1', '2020-12-21 09:56:48');
INSERT INTO `sys_log` VALUES (25, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":48,\"parentId\":33,\"name\":\"知识\",\"url\":\"party/knowledge\",\"type\":1,\"icon\":\"config\",\"orderNum\":6}]', 124, '0:0:0:0:0:0:0:1', '2020-12-21 09:57:13');
INSERT INTO `sys_log` VALUES (26, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":53,\"parentId\":31,\"name\":\"资料管理\",\"url\":\"party/material\",\"type\":1,\"icon\":\"config\",\"orderNum\":6}]', 117, '0:0:0:0:0:0:0:1', '2020-12-21 09:57:36');
INSERT INTO `sys_log` VALUES (27, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":88,\"parentId\":63,\"name\":\"发布\",\"url\":\"\",\"perms\":\"party:pttask:publish\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', 173, '0:0:0:0:0:0:0:1', '2021-05-03 22:38:10');
INSERT INTO `sys_log` VALUES (28, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":82,\"parentId\":78,\"name\":\"通过\",\"perms\":\"party:pttasksand:pass\",\"type\":2,\"orderNum\":6}]', 179, '0:0:0:0:0:0:0:1', '2021-05-05 10:47:49');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(0) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鑿滃崟鍚嶇О',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鑿滃崟URL',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鎺堟潈(澶氫釜鐢ㄩ€楀彿鍒嗛殧锛屽锛歶ser:list,user:create)',
  `type` int(0) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鑿滃崟鍥炬爣',
  `order_num` int(0) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 89 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, NULL, 0, 'system', 5);
INSERT INTO `sys_menu` VALUES (2, 1, '管理员列表', 'sys/user', NULL, 1, 'admin', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'sys/role', NULL, 1, 'role', 2);
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'sys/menu', NULL, 1, 'menu', 3);
INSERT INTO `sys_menu` VALUES (5, 1, 'SQL监控', 'http://localhost:8080/renren-fast/druid/sql.html', NULL, 1, 'sql', 4);
INSERT INTO `sys_menu` VALUES (6, 1, '定时任务', 'job/schedule', NULL, 1, 'job', 5);
INSERT INTO `sys_menu` VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (8, 6, '新增', NULL, 'sys:schedule:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, 6, '修改', NULL, 'sys:schedule:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, 6, '删除', NULL, 'sys:schedule:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, 6, '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, 6, '恢复', NULL, 'sys:schedule:resume', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, 6, '立即执行', NULL, 'sys:schedule:run', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, 6, '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, 1, '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (29, 1, '系统日志', 'sys/log', 'sys:log:list', 1, 'log', 7);
INSERT INTO `sys_menu` VALUES (30, 1, '文件上传', 'oss/oss', 'sys:oss:all', 1, 'oss', 6);
INSERT INTO `sys_menu` VALUES (31, 0, '资料管理', '', '', 0, 'log', 1);
INSERT INTO `sys_menu` VALUES (32, 31, '任务管理', 'sss', '', 1, 'menu', 0);
INSERT INTO `sys_menu` VALUES (33, 0, '知识管理', '11', '', 0, 'mudedi', 2);
INSERT INTO `sys_menu` VALUES (34, 0, '留言管理', '11', '', 0, 'pinglun', 4);
INSERT INTO `sys_menu` VALUES (35, 0, '新闻管理', '11', '', 0, 'daohang', 3);
INSERT INTO `sys_menu` VALUES (36, 35, '新闻', 'party/news', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (37, 36, '查看', NULL, 'party:news:list,party:news:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (38, 36, '新增', NULL, 'party:news:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (39, 36, '修改', NULL, 'party:news:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (40, 36, '删除', NULL, 'party:news:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (41, 36, '发布/取消发布', '', 'party:news:cancelRelease,party:news:release', 2, '', 0);
INSERT INTO `sys_menu` VALUES (42, 34, '留言', 'party/leavemessage', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (43, 42, '查看', NULL, 'party:leavemessage:list,party:leavemessage:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (44, 42, '新增', NULL, 'party:leavemessage:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (45, 42, '修改', NULL, 'party:leavemessage:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (46, 42, '删除', NULL, 'party:leavemessage:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (47, 42, '回复', '', 'party:leavemessage:reply', 2, '', 0);
INSERT INTO `sys_menu` VALUES (48, 33, '知识', 'party/knowledge', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (49, 48, '查看', NULL, 'party:knowledge:list,party:knowledge:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (50, 48, '新增', NULL, 'party:knowledge:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (51, 48, '修改', NULL, 'party:knowledge:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (52, 48, '删除', NULL, 'party:knowledge:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (53, 31, '资料管理', 'party/material', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (54, 53, '查看', NULL, 'party:material:list,party:material:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (55, 53, '新增', NULL, 'party:material:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (56, 53, '修改', NULL, 'party:material:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (57, 53, '删除', NULL, 'party:material:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (58, 1, '等级表', 'party/ptgrade', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (59, 58, '查看', NULL, 'party:ptgrade:list,party:ptgrade:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (60, 58, '新增', NULL, 'party:ptgrade:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (61, 58, '修改', NULL, 'party:ptgrade:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (62, 58, '删除', NULL, 'party:ptgrade:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (63, 1, '任务表', 'party/pttask', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (64, 63, '查看', NULL, 'party:pttask:list,party:pttask:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (65, 63, '新增', NULL, 'party:pttask:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (66, 63, '修改', NULL, 'party:pttask:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (67, 63, '删除', NULL, 'party:pttask:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (68, 1, '提交任务表', 'party/pttaskanswer', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (69, 68, '查看', NULL, 'party:pttaskanswer:list,party:pttaskanswer:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (70, 68, '新增', NULL, 'party:pttaskanswer:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (71, 68, '修改', NULL, 'party:pttaskanswer:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (72, 68, '删除', NULL, 'party:pttaskanswer:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (73, 1, '任务点评表', 'party/pttaskcomment', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (74, 73, '查看', NULL, 'party:pttaskcomment:list,party:pttaskcomment:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (75, 73, '新增', NULL, 'party:pttaskcomment:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (76, 73, '修改', NULL, 'party:pttaskcomment:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (77, 73, '删除', NULL, 'party:pttaskcomment:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (78, 1, '任务发送表', 'party/pttasksand', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (79, 78, '查看', NULL, 'party:pttasksand:list,party:pttasksand:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (80, 78, '新增', NULL, 'party:pttasksand:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (81, 78, '修改', NULL, 'party:pttasksand:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (82, 78, '通过', NULL, 'party:pttasksand:pass', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (83, 1, '用户信息表', 'party/ptuserinfo', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (84, 83, '查看', NULL, 'party:ptuserinfo:list,party:ptuserinfo:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (85, 83, '新增', NULL, 'party:ptuserinfo:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (86, 83, '修改', NULL, 'party:ptuserinfo:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (87, 83, '删除', NULL, 'party:ptuserinfo:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (88, 63, '发布', '', 'party:pttask:publish', 2, '', 0);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URL鍦板潃',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件上传' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '瑙掕壊鍚嶇О',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '澶囨敞',
  `create_user_id` bigint(0) NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(0) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加密',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `status` tinyint(0) NULL DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(0) NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', 1, 1, '2016-11-11 11:11:11');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(0) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token`  (
  `user_id` bigint(0) NOT NULL,
  `token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'token',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `token`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户Token' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES (1, '91e5e896cdf8dddc1875f049f591f323', '2021-05-05 23:25:18', '2021-05-05 11:25:18');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '鐢ㄦ埛鍚?',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '鎵嬫満鍙?',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '瀵嗙爜',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');

SET FOREIGN_KEY_CHECKS = 1;
