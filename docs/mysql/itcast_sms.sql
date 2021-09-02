/*
 Source Server Type    : MySQL
 Source Server Version : 80020
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for black_list
-- ----------------------------
DROP TABLE IF EXISTS `black_list`;
CREATE TABLE `black_list` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `type` varchar(10) NOT NULL COMMENT '类型：1：短信、2：邮件、3：微信',
  `content` varchar(64) NOT NULL COMMENT '内容：手机号',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(64) NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `is_delete` tinyint NOT NULL DEFAULT '1' COMMENT '逻辑删除：0删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `black_list_content_type` (`type`,`content`) USING BTREE
) ENGINE=InnoDB COMMENT='黑名单';

-- ----------------------------
-- Records of black_list
-- ----------------------------
BEGIN;
INSERT INTO `black_list` VALUES ('770664647790428225', '1', '13261698938', NULL, '2020-10-27 07:06:10', '0', '2020-10-27 07:06:10', NULL, 1);
INSERT INTO `black_list` VALUES ('770665684110672065', '1', '13800000000', NULL, '2020-10-27 07:10:17', '0', '2020-10-27 07:10:17', NULL, 1);
INSERT INTO `black_list` VALUES ('770665684123255009', '1', '13802200222', NULL, '2020-10-27 07:10:17', '0', '2020-10-27 07:10:17', NULL, 1);
INSERT INTO `black_list` VALUES ('771302052507682017', '1', '13651011131', NULL, '2020-10-29 01:18:59', '0', '2020-10-29 01:18:59', NULL, 1);
INSERT INTO `black_list` VALUES ('772873039443395105', '1', '19000000001', '备注限制输入0-10个字，包括空格', '2020-11-02 09:21:32', '0', '2020-11-02 09:21:32', NULL, 1);
INSERT INTO `black_list` VALUES ('772873039455978081', '1', '19000000003', NULL, '2020-11-02 09:21:32', '0', '2020-11-02 09:21:32', NULL, 1);
INSERT INTO `black_list` VALUES ('772873039464366721', '1', '19000000005', '1', '2020-11-02 09:21:32', '0', '2020-11-02 09:21:32', NULL, 1);
INSERT INTO `black_list` VALUES ('773514615765166113', '1', '18501000201', NULL, '2020-11-04 03:50:55', '0', '2020-11-04 03:50:55', NULL, 1);
INSERT INTO `black_list` VALUES ('773564222121536449', '1', '13651011127', NULL, '2020-11-04 07:08:02', '0', '2020-11-04 07:08:02', NULL, 1);
INSERT INTO `black_list` VALUES ('773564222125730785', '1', '13651011128', NULL, '2020-11-04 07:08:02', '0', '2020-11-04 07:08:02', NULL, 1);
INSERT INTO `black_list` VALUES ('773564222134119425', '1', '13651011129', NULL, '2020-11-04 07:08:02', '0', '2020-11-04 07:08:02', NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `platform` varchar(20) NOT NULL COMMENT '平台',
  `domain` varchar(100) NOT NULL COMMENT '域名',
  `access_key_id` varchar(100) DEFAULT NULL,
  `access_key_secret` varchar(100) DEFAULT NULL,
  `other` json DEFAULT NULL COMMENT '其他配置 json格式',
  `is_active` tinyint NOT NULL COMMENT '是否可用：0不可用',
  `is_enable` tinyint NOT NULL COMMENT '是否正常：0不正常',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `level` tinyint DEFAULT NULL COMMENT '级别',
  `channel_type` tinyint NOT NULL COMMENT '通道类型，1：文字，2：语音，3：推送',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(64) NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `is_delete` tinyint NOT NULL DEFAULT '1' COMMENT '逻辑删除：0删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `config_name` (`name`) USING BTREE
) ENGINE=InnoDB COMMENT='配置表';

-- ----------------------------
-- Records of config
-- ----------------------------
BEGIN;
INSERT INTO `config` VALUES ('786220212855770497', '阿里', 'Aliyun', 'dysmsapi.aliyuncs.com', 'LTAI4Frk7UF3245Cva52HfopQ', '1FH7BlrYFmqrIX6553qWjM0x4VAHpXR', '{\"RegionId\": \"cn-hangzhou\"}', 1, 1, '测试1111', 2, 1, '2020-10-23 16:14:04', '0', '2020-12-21 02:41:44', '0', 1);
INSERT INTO `config` VALUES ('786220213002571169', '梦网', 'MengWang', 'http://api02.monyun.cn:7901/sms/v2/std/', '011605aa2457a8df175d4b29ed', '4f917a011605aa7162342a8df175d', '{\"single_send\": \"std/single_send\"}', 1, 1, '测试', 4, 1, '2020-10-23 16:14:09', '0', '2021-01-04 06:06:02', '0', 1);
INSERT INTO `config` VALUES ('786220213052902849', '飞鸽', 'Feige', 'http://api.feige.ee/SmsService/Template', '18510012002', '23c38eb6a823452e8cb24e0e1b38', NULL, 1, 1, NULL, 1, 1, '2020-10-23 16:14:11', '0', '2020-12-21 02:41:44', '0', 1);
INSERT INTO `config` VALUES ('786220213178732001', '京东', 'Jd', '6289b2b3decd49da9e36432d8d2c8c32', 'EC3DCB9F1D242547D888B7526232C95C', 'DF173FA4F234B085B28A254223F24DCDC16', NULL, 1, 1, NULL, 3, 1, '2020-10-31 09:36:37', '0', '2020-12-21 02:41:47', '0', 1);
INSERT INTO `config` VALUES ('786220213229063681', '华为', 'Huawei', 'https://rtcsms.cn-north-1.myhuaweicloud.com:10743', 'nhI5IcgM3442TP536h29220gEt432g6', '856643rEZSg506FcL8f234Q6lhKr3', NULL, 1, 0, NULL, 99, 1, '2020-10-31 09:38:16', '0', '2020-12-21 10:41:29', '0', 1);
COMMIT;

-- ----------------------------
-- Table structure for config_signature
-- ----------------------------
DROP TABLE IF EXISTS `config_signature`;
CREATE TABLE `config_signature` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `config_id` varchar(64) NOT NULL COMMENT '配置主键',
  `signature_id` varchar(64) NOT NULL COMMENT '签名主键',
  `config_signature_code` varchar(64) DEFAULT NULL COMMENT '通道签名（如果为空在不需要签名id）',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(64) NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `is_delete` tinyint NOT NULL DEFAULT '1' COMMENT '逻辑删除：0删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB COMMENT='配置—签名表';

-- ----------------------------
-- Records of config_signature
-- ----------------------------
BEGIN;
INSERT INTO `config_signature` VALUES ('786220214336359969', '3', '769149562420986625', NULL, NULL, '2020-10-30 06:11:41', '0', '2020-10-30 06:11:41', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220214432828993', '772031261198778625', '773126502404406817', 'qm_ca7e2578dcd047a09c2a8429b7c5c53b', NULL, '2020-11-03 02:09:37', '0', '2020-11-03 02:11:41', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220214525103713', '1', '773126502404406817', NULL, NULL, '2020-11-03 02:09:56', '0', '2020-12-08 08:41:05', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220214608989825', '772031678762713377', '773126502404406817', '8820102933300', NULL, '2020-11-03 02:10:18', '0', '2020-11-03 02:10:46', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220214705458849', '772031678762713377', '773550264442513601', NULL, NULL, '2020-12-08 08:38:38', '0', '2020-12-08 08:38:38', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220214801927873', '772031678762713377', '773550249540151457', NULL, NULL, '2020-12-08 08:38:38', '0', '2020-12-08 08:38:38', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220214827093729', '772031678762713377', '773550237330532481', NULL, NULL, '2020-12-08 08:38:38', '0', '2020-12-08 08:38:38', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220214856453889', '772031678762713377', '773126981079351041', NULL, NULL, '2020-12-08 08:38:38', '0', '2020-12-08 08:38:38', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220214881619745', '772031678762713377', '773126963127729889', NULL, NULL, '2020-12-08 08:38:38', '0', '2020-12-08 08:38:38', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220214906785601', '772031678762713377', '773126947726245569', NULL, NULL, '2020-12-08 08:38:38', '0', '2020-12-08 08:38:38', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220214936145761', '772031678762713377', '773126930982583969', NULL, NULL, '2020-12-08 08:38:38', '0', '2020-12-08 08:38:38', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220214965505921', '772031678762713377', '773550275590973665', NULL, NULL, '2020-12-08 08:38:38', '0', '2020-12-08 08:38:38', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220214999060385', '772031678762713377', '773550285455976705', NULL, NULL, '2020-12-08 08:38:38', '0', '2020-12-08 08:38:38', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215028420545', '772031678762713377', '773550297552349473', NULL, NULL, '2020-12-08 08:38:38', '0', '2020-12-08 08:38:38', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215057780705', '772031678762713377', '773550314027575617', NULL, NULL, '2020-12-08 08:38:38', '0', '2020-12-08 08:38:38', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215087140865', '772031678762713377', '773550325150869857', NULL, NULL, '2020-12-08 08:38:38', '0', '2020-12-08 08:38:38', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215116501025', '2', '773550325150869857', NULL, NULL, '2020-12-08 08:39:15', '0', '2020-12-08 08:39:15', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215145861185', '2', '773550314027575617', NULL, NULL, '2020-12-08 08:39:15', '0', '2020-12-08 08:39:15', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215175221345', '2', '773550297552349473', NULL, NULL, '2020-12-08 08:39:15', '0', '2020-12-08 08:39:15', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215204581505', '2', '773550285455976705', NULL, NULL, '2020-12-08 08:39:15', '0', '2020-12-08 08:39:15', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215233941665', '2', '773550275590973665', NULL, NULL, '2020-12-08 08:39:15', '0', '2020-12-08 08:39:15', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215259107521', '2', '773550264442513601', NULL, NULL, '2020-12-08 08:39:15', '0', '2020-12-08 08:39:15', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215292661985', '2', '773550249540151457', NULL, NULL, '2020-12-08 08:39:15', '0', '2020-12-08 08:39:15', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215317827841', '2', '773550237330532481', NULL, NULL, '2020-12-08 08:39:15', '0', '2020-12-08 08:39:15', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215347188001', '2', '773126981079351041', NULL, NULL, '2020-12-08 08:39:15', '0', '2020-12-08 08:39:15', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215372353857', '2', '773126963127729889', NULL, NULL, '2020-12-08 08:39:15', '0', '2020-12-08 08:39:15', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215401714017', '2', '773126947726245569', NULL, NULL, '2020-12-08 08:39:15', '0', '2020-12-08 08:39:15', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215431074177', '2', '773126930982583969', NULL, NULL, '2020-12-08 08:39:15', '0', '2020-12-08 08:39:15', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215460434337', '2', '773126502404406817', NULL, NULL, '2020-12-08 08:39:15', '0', '2020-12-08 08:39:15', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215489794497', '772031261198778625', '773550264442513601', NULL, NULL, '2020-12-08 08:39:49', '0', '2020-12-08 08:39:49', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215514960353', '772031261198778625', '773550249540151457', NULL, NULL, '2020-12-08 08:39:49', '0', '2020-12-08 08:39:49', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215544320513', '772031261198778625', '773550237330532481', NULL, NULL, '2020-12-08 08:39:49', '0', '2020-12-08 08:39:49', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215569486369', '772031261198778625', '773126981079351041', NULL, NULL, '2020-12-08 08:39:49', '0', '2020-12-08 08:39:49', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215598846529', '772031261198778625', '773126963127729889', NULL, NULL, '2020-12-08 08:39:49', '0', '2020-12-08 08:39:49', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215624012385', '772031261198778625', '773126947726245569', NULL, NULL, '2020-12-08 08:39:49', '0', '2020-12-08 08:39:49', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215649178241', '772031261198778625', '773126930982583969', NULL, NULL, '2020-12-08 08:39:49', '0', '2020-12-08 08:39:49', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215678538401', '1', '773550237330532481', NULL, NULL, '2020-12-08 08:40:16', '0', '2020-12-08 08:40:16', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215707898561', '1', '773550249540151457', NULL, NULL, '2020-12-08 08:40:16', '0', '2020-12-08 08:40:16', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215733064417', '1', '773550264442513601', NULL, NULL, '2020-12-08 08:40:16', '0', '2020-12-08 08:40:16', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215762424577', '1', '773126981079351041', NULL, NULL, '2020-12-08 08:40:16', '0', '2020-12-08 08:40:16', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215787590433', '1', '773126963127729889', NULL, NULL, '2020-12-08 08:40:16', '0', '2020-12-08 08:40:16', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215812756289', '1', '773126947726245569', NULL, NULL, '2020-12-08 08:40:16', '0', '2020-12-08 08:40:16', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215842116449', '1', '773126930982583969', NULL, NULL, '2020-12-08 08:40:16', '0', '2020-12-08 08:40:16', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215871476609', '1', '773550325150869857', NULL, NULL, '2020-12-08 08:40:16', '0', '2020-12-08 08:40:16', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215900836769', '1', '773550314027575617', NULL, NULL, '2020-12-08 08:40:16', '0', '2020-12-08 08:40:16', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215930196929', '1', '773550297552349473', NULL, NULL, '2020-12-08 08:40:16', '0', '2020-12-08 08:40:16', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215959557089', '1', '773550285455976705', NULL, NULL, '2020-12-08 08:40:16', '0', '2020-12-08 08:40:16', NULL, 1);
INSERT INTO `config_signature` VALUES ('786220215984722945', '1', '773550275590973665', NULL, NULL, '2020-12-08 08:40:16', '0', '2020-12-08 08:40:16', NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for config_template
-- ----------------------------
DROP TABLE IF EXISTS `config_template`;
CREATE TABLE `config_template` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `config_id` varchar(64) NOT NULL COMMENT '配置主键',
  `template_id` varchar(64) NOT NULL COMMENT '模板主键',
  `config_template_code` varchar(64) DEFAULT NULL COMMENT '通道模板（如果为空在不需要模板id）',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(64) NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `is_delete` tinyint NOT NULL DEFAULT '1' COMMENT '逻辑删除：0删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB COMMENT='配置—模板表';

-- ----------------------------
-- Records of config_template
-- ----------------------------
BEGIN;
INSERT INTO `config_template` VALUES ('786220223010182177', '1', '769149402735444705', 'SMS_1938710932', NULL, '2020-10-23 03:00:11', '0', '2020-12-08 08:41:14', NULL, 1);
INSERT INTO `config_template` VALUES ('786220223106651201', '2', '769149402735444705', NULL, NULL, '2020-10-30 02:16:09', '0', '2020-10-30 02:16:09', NULL, 1);
INSERT INTO `config_template` VALUES ('786220223194731617', '3', '769149402735444705', NULL, NULL, '2020-10-30 06:11:50', '0', '2020-10-30 06:11:50', NULL, 1);
INSERT INTO `config_template` VALUES ('786220223224091777', '772031261198778625', '769149402735444705', 'mb_25ed3f494ff44cd189db01a8cec577cd', NULL, '2020-10-31 01:47:05', '0', '2020-10-31 01:47:41', NULL, 1);
INSERT INTO `config_template` VALUES ('786220223320560801', '772031678762713377', '769149402735444705', '3e9f0a8978d44578aba218ecf56db4a2', NULL, '2020-11-02 06:11:09', '0', '2020-11-02 06:15:03', NULL, 1);
INSERT INTO `config_template` VALUES ('786220223349920961', '772031678762713377', '771672590514127009', NULL, NULL, '2020-12-08 08:38:48', '0', '2020-12-08 08:38:48', NULL, 1);
INSERT INTO `config_template` VALUES ('786220223438001377', '772031678762713377', '771672553595863137', NULL, NULL, '2020-12-08 08:38:48', '0', '2020-12-08 08:38:48', NULL, 1);
INSERT INTO `config_template` VALUES ('786220223467361537', '772031678762713377', '771672535010902081', NULL, NULL, '2020-12-08 08:38:48', '0', '2020-12-08 08:38:48', NULL, 1);
INSERT INTO `config_template` VALUES ('786220223496721697', '2', '771672535010902081', NULL, NULL, '2020-12-08 08:39:22', '0', '2020-12-08 08:39:22', NULL, 1);
INSERT INTO `config_template` VALUES ('786220223526081857', '2', '771672553595863137', NULL, NULL, '2020-12-08 08:39:22', '0', '2020-12-08 08:39:22', NULL, 1);
INSERT INTO `config_template` VALUES ('786220223551247713', '772031261198778625', '771672553595863137', NULL, NULL, '2020-12-08 08:39:59', '0', '2020-12-08 08:39:59', NULL, 1);
INSERT INTO `config_template` VALUES ('786220223580607873', '772031261198778625', '771672535010902081', NULL, NULL, '2020-12-08 08:39:59', '0', '2020-12-08 08:39:59', NULL, 1);
INSERT INTO `config_template` VALUES ('786220223609968033', '1', '771672590514127009', NULL, NULL, '2020-12-08 08:40:23', '0', '2020-12-08 08:40:23', NULL, 1);
INSERT INTO `config_template` VALUES ('786220223639328193', '1', '771672553595863137', NULL, NULL, '2020-12-08 08:40:23', '0', '2020-12-08 08:40:23', NULL, 1);
INSERT INTO `config_template` VALUES ('786220223672882657', '1', '771672535010902081', NULL, NULL, '2020-12-08 08:40:23', '0', '2020-12-08 08:40:23', NULL, 1);
INSERT INTO `config_template` VALUES ('786220223702242817', '2', '785916405126048833', NULL, NULL, '2020-12-08 09:16:48', '0', '2020-12-08 09:16:48', NULL, 1);
INSERT INTO `config_template` VALUES ('786220223731602977', '2', '785917287481781345', NULL, NULL, '2020-12-08 09:16:48', '0', '2020-12-08 09:16:48', NULL, 1);
INSERT INTO `config_template` VALUES ('786220223760963137', '2', '785917523960835233', NULL, NULL, '2020-12-08 09:16:48', '0', '2020-12-08 09:16:48', NULL, 1);
INSERT INTO `config_template` VALUES ('786220223786128993', '2', '785917377684483201', NULL, NULL, '2020-12-08 09:16:48', '0', '2020-12-08 09:16:48', NULL, 1);
INSERT INTO `config_template` VALUES ('786220223815489153', '2', '785917582072917185', NULL, NULL, '2020-12-08 09:16:48', '0', '2020-12-08 09:16:48', NULL, 1);
INSERT INTO `config_template` VALUES ('788357695797900609', '786220213002571169', '786220229641378017', NULL, NULL, '2020-12-15 02:52:01', '0', '2020-12-15 02:52:01', NULL, 1);
INSERT INTO `config_template` VALUES ('788357695802094945', '786220213002571169', '786220229603629249', NULL, NULL, '2020-12-15 02:52:01', '0', '2020-12-15 02:52:01', NULL, 1);
INSERT INTO `config_template` VALUES ('788357695802094977', '786220213002571169', '786220229536520321', NULL, NULL, '2020-12-15 02:52:01', '0', '2020-12-15 02:52:01', NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for mail_group
-- ----------------------------
DROP TABLE IF EXISTS `mail_group`;
CREATE TABLE `mail_group` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `name` varchar(64) NOT NULL COMMENT '名称',
  `type` varchar(10) NOT NULL COMMENT '类型',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(64) NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `is_delete` tinyint NOT NULL DEFAULT '1' COMMENT '逻辑删除：0删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB COMMENT='通讯组';

-- ----------------------------
-- Records of mail_group
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mail_list
-- ----------------------------
DROP TABLE IF EXISTS `mail_list`;
CREATE TABLE `mail_list` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `name` varchar(64) NOT NULL COMMENT '姓名',
  `dept` varchar(64) DEFAULT NULL COMMENT '部门',
  `position` varchar(64) DEFAULT NULL COMMENT '职位',
  `phone` varchar(20) NOT NULL COMMENT '电话',
  `email` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `qq` varchar(64) DEFAULT NULL COMMENT 'QQ',
  `wechat` varchar(64) DEFAULT NULL COMMENT '微信',
  `type` varchar(10) DEFAULT NULL COMMENT '类型',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(64) NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `is_delete` tinyint NOT NULL DEFAULT '1' COMMENT '逻辑删除：0删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB COMMENT='通讯录';

-- ----------------------------
-- Records of mail_list
-- ----------------------------
BEGIN;
INSERT INTO `mail_list` VALUES ('738802115379462433', 'name1', 'dept1', 'position1', 'phone1', 'email1', 'qq1', 'wechat1', 'type1', 'remark1', '2020-07-31 16:55:51', '0', '2020-07-31 16:55:51', '0', 1);
INSERT INTO `mail_list` VALUES ('738811722311139969', 'name1', 'dept1', 'position1', 'phone1', 'email1', 'qq1', 'wechat1', 'type1', 'remark1', '2020-07-31 17:34:01', '0', '2020-07-31 17:34:01', '0', 1);
INSERT INTO `mail_list` VALUES ('738812226713945057', 'name1', 'dept1', 'position1', 'phone1', 'email1', 'qq1', 'wechat1', 'type1', 'remark1', '2020-07-31 17:36:02', '0', '2020-07-31 17:36:02', '0', 1);
INSERT INTO `mail_list` VALUES ('738813776526049569', 'name1', 'dept1', 'position1', 'phone1', 'email1', 'qq1', 'wechat1', 'type1', 'remark1', '2020-07-31 17:42:11', '0', '2020-07-31 17:42:11', '0', 1);
COMMIT;

-- ----------------------------
-- Table structure for mail_list_group
-- ----------------------------
DROP TABLE IF EXISTS `mail_list_group`;
CREATE TABLE `mail_list_group` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `list_id` varchar(64) NOT NULL COMMENT '通讯录id',
  `group_id` varchar(64) NOT NULL COMMENT '通讯组id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(64) NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `is_delete` tinyint NOT NULL DEFAULT '1' COMMENT '逻辑删除：0删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB COMMENT='通讯录-通讯组';

-- ----------------------------
-- Records of mail_list_group
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for manual_process
-- ----------------------------
DROP TABLE IF EXISTS `manual_process`;
CREATE TABLE `manual_process` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `template` varchar(64) DEFAULT NULL COMMENT '模板',
  `signature` varchar(64) DEFAULT NULL COMMENT '签名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `request` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `config_ids` varchar(500) DEFAULT NULL COMMENT '通道id集合',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态 0新建，1处理中，2处理成功，3处理失败',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `is_delete` tinyint NOT NULL DEFAULT '1' COMMENT '逻辑删除：0删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB COMMENT='人工处理任务表';

-- ----------------------------
-- Records of manual_process
-- ----------------------------
BEGIN;
INSERT INTO `manual_process` VALUES ('771747348362559521', 'DXMB_000000001', 'DXQM_000000001', '13000003546', '', '[3, 1]', 0, NULL, '2020-10-30 14:48:26', '0', '2020-10-30 06:48:29', NULL, 1);
INSERT INTO `manual_process` VALUES ('771747362308620385', 'DXMB_000000001', 'DXQM_000000001', '13000003547', '', '[3, 1]', 0, NULL, '2020-10-30 14:48:30', '0', '2020-10-30 06:48:29', NULL, 1);
INSERT INTO `manual_process` VALUES ('771747363390750881', 'DXMB_000000001', 'DXQM_000000001', '13000003548', '', '[3, 1]', 0, NULL, '2020-10-30 14:48:30', '0', '2020-10-30 06:48:30', NULL, 1);
INSERT INTO `manual_process` VALUES ('771747363856318689', 'DXMB_000000001', 'DXQM_000000001', '13000003549', '', '[3, 1]', 0, NULL, '2020-10-30 14:48:30', '0', '2020-10-30 06:48:30', NULL, 1);
INSERT INTO `manual_process` VALUES ('771747364502241569', 'DXMB_000000001', 'DXQM_000000001', '13000003550', '', '[3, 1]', 0, NULL, '2020-10-30 14:48:30', '0', '2020-10-30 06:48:30', NULL, 1);
INSERT INTO `manual_process` VALUES ('771747365085249889', 'DXMB_000000001', 'DXQM_000000001', '13000003551', '', '[3, 1]', 0, NULL, '2020-10-30 14:48:30', '0', '2020-10-30 06:48:30', NULL, 1);
INSERT INTO `manual_process` VALUES ('771747365756338593', 'DXMB_000000001', 'DXQM_000000001', '13000003552', '', '[3, 1]', 0, NULL, '2020-10-30 14:48:31', '0', '2020-10-30 06:48:30', NULL, 1);
INSERT INTO `manual_process` VALUES ('771747366284820961', 'DXMB_000000001', 'DXQM_000000001', '13000003553', '', '[3, 1]', 0, NULL, '2020-10-30 14:48:31', '0', '2020-10-30 06:48:30', NULL, 1);
INSERT INTO `manual_process` VALUES ('771747366985269793', 'DXMB_000000001', 'DXQM_000000001', '13000003554', '', '[3, 1]', 0, NULL, '2020-10-30 14:48:31', '0', '2020-10-30 06:48:30', NULL, 1);
INSERT INTO `manual_process` VALUES ('771747367404700257', 'DXMB_000000001', 'DXQM_000000001', '13000003555', '', '[3, 1]', 0, NULL, '2020-10-30 14:48:31', '0', '2020-10-30 06:48:30', NULL, 1);
INSERT INTO `manual_process` VALUES ('772056618614391457', 'DXMB_000000001', 'DXQM_000000001', '18510971002', '', '[772031261198778625, 3, 1]', 0, NULL, '2020-10-31 11:17:22', '0', '2020-10-31 03:17:22', NULL, 1);
INSERT INTO `manual_process` VALUES ('785910200715444385', 'DXMB_000000002', 'DXQM_000000012', '18510971002', NULL, '[2, 1]', 0, NULL, '2020-12-08 16:46:34', '0', '2020-12-08 08:46:33', NULL, 1);
INSERT INTO `manual_process` VALUES ('788821027999187169', 'DXMB_000000001', 'DXQM_000000001', '13812345678', NULL, '[788816571152728161]', 0, NULL, '2020-12-16 17:33:09', '0', '2020-12-16 09:33:08', NULL, 1);
INSERT INTO `manual_process` VALUES ('788825599819907361', 'DXMB_000000001', 'DXQM_000000001', '13812345678', NULL, '[788816571152728161]', 0, NULL, '2020-12-16 17:51:19', '0', '2020-12-16 09:51:18', NULL, 1);
INSERT INTO `manual_process` VALUES ('790973830863520097', 'DXMB_000000001', 'DXQM_000000001', '13812345678', NULL, '[788816571152728161]', 0, NULL, '2020-12-22 16:07:37', '0', '2020-12-22 08:07:37', NULL, 1);
INSERT INTO `manual_process` VALUES ('790990221175947681', 'DXMB_000000001', 'DXQM_000000001', '13812345678', NULL, '[788816571152728161]', 0, NULL, '2020-12-22 17:12:45', '0', '2020-12-22 09:12:44', NULL, 1);
INSERT INTO `manual_process` VALUES ('790990284648350177', 'DXMB_000000001', 'DXQM_000000001', '13812345678', NULL, '[788816571152728161]', 0, NULL, '2020-12-22 17:13:00', '0', '2020-12-22 09:12:59', NULL, 1);
INSERT INTO `manual_process` VALUES ('790990337047790113', 'DXMB_000000001', 'DXQM_000000001', '13812345678', NULL, '[788816571152728161]', 0, NULL, '2020-12-22 17:13:12', '0', '2020-12-22 09:13:12', NULL, 1);
INSERT INTO `manual_process` VALUES ('790992471541678689', 'DXMB_000000001', 'DXQM_000000001', '13812345678', NULL, '[788816571152728161]', 0, NULL, '2020-12-22 17:21:41', '0', '2020-12-22 09:21:41', NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for marketing
-- ----------------------------
DROP TABLE IF EXISTS `marketing`;
CREATE TABLE `marketing` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `title` varchar(200) NOT NULL COMMENT '主题',
  `template` varchar(64) NOT NULL COMMENT '模板',
  `signature` varchar(64) NOT NULL COMMENT '签名',
  `mail_group` varchar(64) DEFAULT NULL COMMENT '用户组名称，可能没有',
  `mobiles` blob NOT NULL COMMENT '手机号:多个用,分隔',
  `mobile_number` int NOT NULL COMMENT '手机号个数',
  `mobile_file` varchar(200) DEFAULT NULL COMMENT '手机号导入文件名称',
  `content` json NOT NULL COMMENT '短信内容',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态 0：待审核 1：通过 2：驳回',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_user_name` varchar(50) DEFAULT NULL COMMENT '创建人姓名（申请人）',
  `update_user_name` varchar(50) DEFAULT NULL COMMENT '修改人姓名（审批人）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `is_delete` tinyint NOT NULL DEFAULT '1' COMMENT '逻辑删除：0删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB COMMENT='营销';

-- ----------------------------
-- Records of marketing
-- ----------------------------
BEGIN;
INSERT INTO `marketing` VALUES ('769155853713408385', '测试-王松岩', 'DXMB_000000001', 'DXQM_000000001', NULL, 0x3138353130393731303032, 1, NULL, '{\"code\": \"9999\"}', 1, NULL, '赵六', NULL, '2020-10-23 11:10:46', '0', '2020-10-30 09:37:29', '0', 1);
INSERT INTO `marketing` VALUES ('769223118488076385', '测试2020年10月23日15:37:45', 'DXMB_000000001', 'DXQM_000000001', NULL, 0x3138353130393731303032, 1, NULL, '{\"code\": \"555555\"}', 1, NULL, '王五', NULL, '2020-10-23 15:38:03', '0', '2020-10-31 04:21:16', '0', 1);
INSERT INTO `marketing` VALUES ('769223673918783617', '测试2', 'DXMB_000000001', 'DXQM_000000001', NULL, 0x3133323631363938393337, 1, NULL, '{\"code\": \"111111\"}', 1, NULL, '赵六', NULL, '2020-10-23 15:40:16', '0', '2020-10-30 09:37:30', '0', 1);
INSERT INTO `marketing` VALUES ('769226821995593793', '测试2020年10月23日15:52:31', 'DXMB_000000001', 'DXQM_000000001', NULL, 0x3138353130393731303032, 1, NULL, '{\"code\": \"234123\"}', 1, NULL, '赵六', NULL, '2020-10-23 15:52:46', '0', '2020-10-30 09:37:31', '0', 1);
INSERT INTO `marketing` VALUES ('769227427170746465', '测试1', 'DXMB_000000001', 'DXQM_000000001', NULL, 0x3133323631363938393337, 1, NULL, '{\"code\": \"111111\"}', 1, NULL, '王五', NULL, '2020-10-23 15:55:10', '0', '2020-10-31 04:21:14', '0', 1);
INSERT INTO `marketing` VALUES ('769235436643024929', '测试2020-10-23 16:26:44', 'DXMB_000000001', 'DXQM_000000001', NULL, 0x3138353130393731303032, 1, NULL, '{\"code\": \"987000\"}', 1, NULL, '赵六', NULL, '2020-10-23 16:27:00', '0', '2020-10-30 09:37:32', '0', 1);
INSERT INTO `marketing` VALUES ('769238943790006305', '测试2020年10月23日16:40:30', 'DXMB_000000001', 'DXQM_000000001', NULL, 0x3138353130393731303032, 1, NULL, '{\"code\": \"0w020\"}', 1, NULL, '李四', NULL, '2020-10-23 16:40:56', '0', '2020-10-31 04:21:04', '0', 1);
INSERT INTO `marketing` VALUES ('769519133111877697', '20201024', 'DXMB_000000001', 'DXQM_000000001', NULL, 0x31333236313639383933372C3133323631363938393337, 2, NULL, '{\"code\": \"00000\"}', 1, NULL, '赵六', NULL, '2020-10-24 11:14:19', '0', '2020-10-30 09:37:33', '0', 1);
INSERT INTO `marketing` VALUES ('769578923091558529', '11', 'DXMB_000000001', 'DXQM_000000001', NULL, 0x3133323631363938393337, 1, NULL, '{\"code\": \"1\"}', 2, NULL, '赵六', NULL, '2020-10-24 15:11:54', '0', '2020-10-30 09:37:33', '0', 1);
INSERT INTO `marketing` VALUES ('770665159604568161', '发送1', 'DXMB_000000001', 'DXQM_000000001', NULL, 0x3133323631363938393337, 1, NULL, '{\"code\": \"111\"}', 1, NULL, '李四', NULL, '2020-10-27 15:08:13', '0', '2020-10-31 04:21:08', '0', 1);
INSERT INTO `marketing` VALUES ('771329114257753857', '123123123', 'DXMB_000000001', 'DXQM_000000001', NULL, 0x3133323631363938393337, 1, NULL, '{\"code\": \"111\"}', 2, NULL, '王五', NULL, '2020-10-29 11:06:32', '0', '2020-10-31 04:21:11', '0', 1);
INSERT INTO `marketing` VALUES ('771661351767506977', '测试 2020年10月30日09:06:19', 'DXMB_000000001', 'DXQM_000000001', NULL, 0x3138353130393731303032, 1, NULL, '{\"code\": \"898989\"}', 1, NULL, '王五', NULL, '2020-10-30 09:06:43', '0', '2020-10-31 04:21:12', '0', 1);
INSERT INTO `marketing` VALUES ('771665171885064225', '测试2020年10月30日09:21:37', 'DXMB_000000001', 'DXQM_000000001', NULL, 0x3138353130393731303032, 1, NULL, '{\"code\": \"9009\"}', 1, NULL, '赵六', NULL, '2020-10-30 09:21:54', '0', '2020-10-30 09:37:40', '0', 1);
INSERT INTO `marketing` VALUES ('772073200518430753', '测试2020-10-31 12:23:00', 'DXMB_000000001', 'DXQM_000000001', NULL, 0x3138353130393731303032, 1, NULL, '{\"code\": \"123123\"}', 1, NULL, '赵丽', '李丹', '2020-10-31 12:23:16', '0', '2020-10-31 15:42:24', '0', 1);
INSERT INTO `marketing` VALUES ('773136685704675457', '测试', 'DXMB_000000001', 'DXQM_000000001', NULL, 0x3133323631363938393337, 1, NULL, '{\"code\": \"123\"}', 1, NULL, '赵丽', '李丹', '2020-11-03 10:49:10', '0', '2020-11-03 10:49:16', '0', 1);
INSERT INTO `marketing` VALUES ('785909954370382881', '用户名通知', 'DXMB_000000002', 'DXQM_000000012', NULL, 0x3138353130393731303032, 1, NULL, '{\"name\": \"username\"}', 1, NULL, '赵丽', '李丹', '2020-12-08 16:45:35', '0', '2020-12-08 16:46:32', '0', 1);
INSERT INTO `marketing` VALUES ('786631623166898529', '新学期中奖', 'DXMB_000000008', 'DXQM_000000001', NULL, 0x3133363531303737373830, 1, NULL, '{\"link\": \"http://java.itcast.cn/?javaeezly\", \"thing\": \"iPhone、iPad\"}', 2, NULL, '赵丽', '李丹', '2020-12-10 16:33:14', '0', '2020-12-11 14:11:59', '0', 1);
INSERT INTO `marketing` VALUES ('789809441267506529', '推广短信', 'DXMB_000000008', 'DXQM_000000013', NULL, 0x3138353130393731303032, 1, NULL, '{\"link\": \"http://E4Er8r.cn\", \"thing\": \"大奖\"}', 0, NULL, '赵丽', NULL, '2020-12-19 11:00:45', '0', '2020-12-19 11:00:45', '0', 1);
COMMIT;

-- ----------------------------
-- Table structure for platform
-- ----------------------------
DROP TABLE IF EXISTS `platform`;
CREATE TABLE `platform` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `name` varchar(20) NOT NULL COMMENT '平台名称',
  `access_key_id` varchar(100) DEFAULT NULL,
  `access_key_secret` varchar(100) DEFAULT NULL,
  `ip_addr` varchar(100) DEFAULT NULL COMMENT 'ip绑定,多个用英文逗号分隔',
  `need_auth` tinyint NOT NULL DEFAULT '0' COMMENT '是否鉴权：0不鉴权',
  `is_active` tinyint NOT NULL DEFAULT '1' COMMENT '是否可用：0不可用',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `level` tinyint DEFAULT NULL COMMENT '平台等级（预留）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(64) NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `is_delete` tinyint NOT NULL DEFAULT '1' COMMENT '逻辑删除：0删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `platform_name` (`name`) USING BTREE
) ENGINE=InnoDB COMMENT='接入平台表';

-- ----------------------------
-- Records of platform
-- ----------------------------
BEGIN;
INSERT INTO `platform` VALUES ('786220231017109825', '营销', 'e38c7ef216f54ae69033a56371cc2785', '128491ba166f45609d44233d8f25198e', '127.0.0.1', 0, 1, '', NULL, '2020-06-22 09:31:15', '0', '2020-12-08 08:48:32', '0', 1);
INSERT INTO `platform` VALUES ('786220231126161761', 'TMS', '92e97240572a49f9af3cb61487ca7f19', '2984RHAIHF024U9REFIDJK', '0.0.0.0', 0, 1, NULL, NULL, '2020-06-22 09:31:15', '0', '2020-12-15 14:04:05', '0', 1);
INSERT INTO `platform` VALUES ('786220231239408001', '小兔仙', '1fb3c56626eb4be4a3aacb53830d22a3', '92e97240572a49f9af3cb61487ca7f19', '0.0.0.0', 0, 1, '', NULL, '2020-10-23 16:15:07', '0', '2020-12-08 08:42:50', '0', 1);
INSERT INTO `platform` VALUES ('786220231348459937', '学成在线', '59dd93673d5d4c038b040d49877b469c', 'e57114f0f73f439b9c196bf2d8fbf6c7', '0.0.0.0', 0, 1, '', NULL, '2020-10-30 09:54:04', '0', '2020-12-08 08:43:54', '0', 1);
INSERT INTO `platform` VALUES ('786220231390403009', '闲云旅游', 'c78685a3e088412a8852fe6c2c9cdbc7', 'dd9c27ce4a0d42de88ba15fec803aa99', '0.0.0.0', 0, 1, '', NULL, '2020-10-30 09:54:09', '0', '2020-12-08 08:44:05', '0', 1);
INSERT INTO `platform` VALUES ('786220231428151777', '智维找房', '54bd3c2c1f804732b723767ea80c778e', '22baca21dd8941c4a13813ad4fe3f37f', '0.0.0.0', 0, 1, '', NULL, '2020-10-30 09:54:13', '0', '2020-12-08 08:43:59', '0', 1);
INSERT INTO `platform` VALUES ('786220231470094849', '亿可控', '62dac3c1d3744c0b9bf91fc67a59c7b2', '043e60d636a8459b9c5f642f93823e49', '187.191.3.24', 0, 0, '', NULL, '2020-10-30 09:54:17', '0', '2020-12-21 10:53:23', '0', 1);
INSERT INTO `platform` VALUES ('786220231516232225', '企业云', '128491ba166f45609d44233d8f25198e', 'd5dfe420aaa24803bd261620f53bec3b', '0.0.0.0', 0, 0, '', NULL, '2020-10-30 09:54:27', '0', '2020-12-17 21:21:35', '0', 1);
INSERT INTO `platform` VALUES ('786220231558175297', '探花', 'e5cd9a67c74849909d7e1393d9afa207', 'b74071f52d7c44b0850d168e4ee88d0a', '0.0.0.0', 0, 0, '', NULL, '2020-10-30 10:00:24', '0', '2020-12-17 09:30:26', '0', 1);
INSERT INTO `platform` VALUES ('786220231600118369', '黑马头条', 'cbf0d93f4e6c4473bd7f142728706759', 'e38c7ef216f54ae69033a56371cc2785', '58.47.203.99', 0, 0, '', NULL, '2020-10-30 10:00:31', '0', '2020-12-17 21:21:34', '0', 1);
INSERT INTO `platform` VALUES ('786220231642061441', 'ihrm', 'db4cb415f06b47839a177ca712d214ea', '4e4cc2c20d8b4c6d8779d8bd3fc13fd8', '0.0.0.0', 0, 0, '', NULL, '2020-10-30 10:00:37', '0', '2020-12-17 21:21:34', '0', 1);
INSERT INTO `platform` VALUES ('786220231684004513', '权限管家', 'd0b878c2f59f4c0ca5b7ff9cf85f7c65', 'f2c9991c243a438887bb1defc1c4f241', '0.0.0.0', 0, 0, '', NULL, '2020-10-30 10:00:48', '0', '2020-12-17 21:21:33', '0', 1);
INSERT INTO `platform` VALUES ('786220231730141889', '冷链', '33bce931f6cd44f887d529f992696403', 'ffcc5b868f634068a518e433ed9faa13', '0.0.0.0', 0, 0, '', NULL, '2020-10-30 10:00:55', '0', '2020-12-17 21:21:31', '0', 1);
COMMIT;

-- ----------------------------
-- Table structure for receive_log
-- ----------------------------
DROP TABLE IF EXISTS `receive_log`;
CREATE TABLE `receive_log` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `platform_id` varchar(64) NOT NULL COMMENT '请求平台id',
  `platform_name` varchar(64) NOT NULL COMMENT '请求平台名称',
  `business` varchar(100) DEFAULT NULL COMMENT '请求平台业务信息',
  `config_ids` varchar(500) DEFAULT NULL COMMENT '配置主键集合',
  `template` varchar(64) NOT NULL COMMENT '模板',
  `signature` varchar(64) NOT NULL COMMENT '签名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `request` varchar(5000) NOT NULL COMMENT '请求参数',
  `error` varchar(5000) DEFAULT NULL COMMENT '错误信息',
  `use_time` bigint NOT NULL COMMENT '耗时',
  `status` tinyint NOT NULL COMMENT '状态：0失败，1成功',
  `api_log_id` varchar(64) DEFAULT NULL COMMENT '日志id',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `is_delete` tinyint NOT NULL DEFAULT '1' COMMENT '逻辑删除：0删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `receive_log_api_log_id` (`api_log_id`) USING BTREE,
  KEY `receive_log_template` (`template`) USING BTREE,
  KEY `receive_log_signature` (`signature`) USING BTREE,
  KEY `receive_log_business` (`business`) USING BTREE
) ENGINE=InnoDB COMMENT='接收日志表';

-- ----------------------------
-- Records of receive_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for send_log
-- ----------------------------
DROP TABLE IF EXISTS `send_log`;
CREATE TABLE `send_log` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `config_id` varchar(64) NOT NULL COMMENT '配置主键',
  `config_platform` varchar(64) NOT NULL COMMENT '配置平台',
  `config_name` varchar(64) NOT NULL COMMENT '配置名称',
  `template` varchar(64) NOT NULL COMMENT '模板',
  `signature` varchar(64) NOT NULL COMMENT '签名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `request` varchar(5000) NOT NULL COMMENT '请求参数',
  `response` varchar(5000) DEFAULT NULL COMMENT '返回参数',
  `error` varchar(5000) DEFAULT NULL COMMENT '错误信息',
  `use_time` bigint NOT NULL COMMENT '耗时',
  `status` tinyint NOT NULL COMMENT '状态：0失败，1成功',
  `api_log_id` varchar(64) DEFAULT NULL COMMENT 'api日志主键',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `is_delete` tinyint NOT NULL DEFAULT '1' COMMENT '逻辑删除：0删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `send_log_api_log_id` (`api_log_id`) USING BTREE,
  KEY `send_log_signature` (`signature`) USING BTREE,
  KEY `send_log_template` (`template`) USING BTREE
) ENGINE=InnoDB COMMENT='日志表';

-- ----------------------------
-- Records of send_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sensitive_list
-- ----------------------------
DROP TABLE IF EXISTS `sensitive_list`;
CREATE TABLE `sensitive_list` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `type` varchar(10) NOT NULL COMMENT '类型：全部、短信、邮件、微信',
  `content` varchar(64) NOT NULL COMMENT '内容：手机号',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(64) NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `is_delete` tinyint NOT NULL DEFAULT '1' COMMENT '逻辑删除：0删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB COMMENT='敏感词';

-- ----------------------------
-- Records of sensitive_list
-- ----------------------------
BEGIN;
INSERT INTO `sensitive_list` VALUES ('738802111206129793', 'type1', 'content1', 'remark1', '2020-07-31 16:55:50', '0', '2020-07-31 16:55:50', '0', 1);
INSERT INTO `sensitive_list` VALUES ('738811719064748513', 'type1', 'content1', 'remark1', '2020-07-31 17:34:00', '0', '2020-07-31 17:34:00', '0', 1);
INSERT INTO `sensitive_list` VALUES ('738812223614354241', 'type1', 'content1', 'remark1', '2020-07-31 17:36:01', '0', '2020-07-31 17:36:01', '0', 1);
INSERT INTO `sensitive_list` VALUES ('738813773044777089', 'type1', 'content1', 'remark1', '2020-07-31 17:42:10', '0', '2020-07-31 17:42:10', '0', 1);
INSERT INTO `sensitive_list` VALUES ('765218354452496417', '', '', '', '2020-10-12 06:24:33', '', '2020-10-12 14:24:33', '0', 0);
COMMIT;

-- ----------------------------
-- Table structure for signature
-- ----------------------------
DROP TABLE IF EXISTS `signature`;
CREATE TABLE `signature` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `name` varchar(64) NOT NULL COMMENT '签名名称',
  `code` varchar(64) NOT NULL COMMENT '签名编码',
  `content` varchar(64) NOT NULL COMMENT '签名内容',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(64) NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `is_delete` tinyint NOT NULL DEFAULT '1' COMMENT '逻辑删除：0删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `signature_code` (`code`) USING BTREE,
  UNIQUE KEY `signature_name` (`name`) USING BTREE
) ENGINE=InnoDB COMMENT='签名表';

-- ----------------------------
-- Records of signature
-- ----------------------------
BEGIN;
INSERT INTO `signature` VALUES ('786220226680198817', '传智播客', 'DXQM_000000001', '传智播客', NULL, '2020-11-03 10:08:42', '0', '2020-11-03 10:08:42', '0', 1);
INSERT INTO `signature` VALUES ('786220226780862145', '品达物流', 'DXQM_000000002', '认为饿345', '品达物流', '2020-11-03 10:10:25', '0', '2020-12-08 16:30:08', '0', 1);
INSERT INTO `signature` VALUES ('786220226873136865', '冷链', 'DXQM_000000003', '345345', '冷链', '2020-11-03 10:10:29', '0', '2020-12-08 16:30:26', '0', 1);
INSERT INTO `signature` VALUES ('786220226902497025', '权限管家', 'DXQM_000000004', '3234234', '权限管家', '2020-11-03 10:10:32', '0', '2020-12-08 16:30:46', '0', 1);
INSERT INTO `signature` VALUES ('786220226936051489', '黑马头条', 'DXQM_000000005', '234234', '黑马头条', '2020-11-03 10:10:37', '0', '2020-12-08 16:31:08', '0', 1);
INSERT INTO `signature` VALUES ('786220226969605953', 'ihrm', 'DXQM_000000006', '11', 'ihrm', '2020-11-04 14:12:29', '0', '2020-12-08 16:32:02', '0', 1);
INSERT INTO `signature` VALUES ('786220227007354721', '探花', 'DXQM_000000007', '12', '探花', '2020-11-04 14:12:32', '0', '2020-12-08 16:32:15', '0', 1);
INSERT INTO `signature` VALUES ('786220227040909185', '企业云', 'DXQM_000000008', '123', '企业云', '2020-11-04 14:12:35', '0', '2020-12-08 16:32:25', '0', 1);
INSERT INTO `signature` VALUES ('786220227078657953', '亿可控', 'DXQM_000000009', '21', NULL, '2020-11-04 14:12:38', '0', '2020-12-08 16:32:46', '0', 1);
INSERT INTO `signature` VALUES ('786220227179321281', '智维找房', 'DXQM_000000010', '22', NULL, '2020-11-04 14:12:40', '0', '2020-12-08 16:33:11', '0', 1);
INSERT INTO `signature` VALUES ('786220227212875745', '闲云旅游', 'DXQM_000000011', '23', NULL, '2020-11-04 14:12:43', '0', '2020-12-08 16:33:21', '0', 1);
INSERT INTO `signature` VALUES ('786220227242235905', '学成在线', 'DXQM_000000012', '211', NULL, '2020-11-04 14:12:47', '0', '2020-12-08 16:33:29', '0', 1);
INSERT INTO `signature` VALUES ('786220227275790369', '小兔仙', 'DXQM_000000013', '212', NULL, '2020-11-04 14:12:50', '0', '2020-12-08 16:33:38', '0', 1);
COMMIT;

-- ----------------------------
-- Table structure for template
-- ----------------------------
DROP TABLE IF EXISTS `template`;
CREATE TABLE `template` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `name` varchar(64) NOT NULL COMMENT '模板名称',
  `code` varchar(64) NOT NULL COMMENT '模板编码',
  `content` varchar(500) NOT NULL COMMENT '模板内容',
  `type` tinyint DEFAULT NULL COMMENT '模板类型 1：验证码，2：营销类',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(64) NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `is_delete` tinyint NOT NULL DEFAULT '1' COMMENT '逻辑删除：0删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `template_code` (`code`) USING BTREE,
  UNIQUE KEY `template_name` (`name`) USING BTREE
) ENGINE=InnoDB COMMENT='模板表';

-- ----------------------------
-- Records of template
-- ----------------------------
BEGIN;
INSERT INTO `template` VALUES ('786220229406496833', '数字验证码', 'DXMB_000000001', '您的验证码${code}，该验证码5分钟内有效，请勿泄漏于他人！', 1, NULL, '2020-10-23 09:45:08', '0', '2020-12-08 16:35:08', '0', 1);
INSERT INTO `template` VALUES ('786220229502965857', '注册用户名通知', 'DXMB_000000002', '您的用户名为${name}，请妥善保管', 2, NULL, '2020-10-30 09:51:10', '0', '2020-12-08 16:35:29', '0', 1);
INSERT INTO `template` VALUES ('786220229536520321', '密码通知', 'DXMB_000000003', '您的密码为${pwd}。为了您的安全，您可以登录后修改密码', 2, NULL, '2020-10-30 09:51:14', '0', '2020-12-08 16:35:51', '0', 1);
INSERT INTO `template` VALUES ('786220229570074785', '集信达验证码', 'DXMB_000000004', '您在集信达网站注册的验证码为XXXX，请保存好不要随意给其他人，有效期为30分钟', 1, NULL, '2020-12-08 17:11:13', '0', '2020-12-08 17:11:13', '0', 1);
INSERT INTO `template` VALUES ('786220229603629249', '限时体验课', 'DXMB_000000005', '好消息！${subject}学科推出${curriculum}课程，限时体验课${coin}，查看详情${link}', 3, NULL, '2020-12-08 17:14:43', '0', '2020-12-08 17:14:43', '0', 1);
INSERT INTO `template` VALUES ('786220229641378017', '课程体验代金券', 'DXMB_000000006', '博学谷线上课程体验代金券${coin}！有效期至${date},点击领取${link}', 3, NULL, '2020-12-08 17:15:05', '0', '2020-12-08 17:15:05', '0', 1);
INSERT INTO `template` VALUES ('786220229670738177', '线上就业指导', 'DXMB_000000007', '大咖做客传智直播间，各种技术干货分享，线上就业指导，${date}${time}等你来站', 3, NULL, '2020-12-08 17:15:40', '0', '2020-12-08 17:15:40', '0', 1);
INSERT INTO `template` VALUES ('786220229708486945', '推荐好友赢现金', 'DXMB_000000008', '助力新学期，推荐好友赢现金，100%中奖！${thing}等你拿，快来${link}', 3, NULL, '2020-12-08 17:15:53', '0', '2020-12-21 08:11:10', '0', 1);
INSERT INTO `template` VALUES ('789973015784840577', '的佛教个热豆浆个哦', 'DXMB_000000009', '破省得麻烦坡上面破屏幕上破吗', 2, NULL, '2020-12-19 21:50:44', '0', '2020-12-19 21:50:44', '0', 1);
COMMIT;

-- ----------------------------
-- Table structure for timing_push
-- ----------------------------
DROP TABLE IF EXISTS `timing_push`;
CREATE TABLE `timing_push` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `template` varchar(64) NOT NULL COMMENT '模板',
  `signature` varchar(64) NOT NULL COMMENT '签名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `request` varchar(5000) NOT NULL COMMENT '参数json',
  `timing` varchar(40) DEFAULT NULL COMMENT '发送时间',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态 0：未处理 1：已处理',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `is_delete` tinyint NOT NULL DEFAULT '1' COMMENT '逻辑删除：0删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `timing_push_status` (`status`) USING BTREE
) ENGINE=InnoDB COMMENT='定时发送';

-- ----------------------------
-- Records of timing_push
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
