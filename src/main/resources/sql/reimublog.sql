/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 80016
Source Host           : 192.168.139.130:3306
Source Database       : reimublog

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2019-11-03 23:43:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `article_id` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文章ID',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '文章内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_article
-- ----------------------------

-- ----------------------------
-- Table structure for t_article_category
-- ----------------------------
DROP TABLE IF EXISTS `t_article_category`;
CREATE TABLE `t_article_category` (
  `id` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `article_id` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文章ID',
  `category_id` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分类ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_article_category
-- ----------------------------

-- ----------------------------
-- Table structure for t_article_info
-- ----------------------------
DROP TABLE IF EXISTS `t_article_info`;
CREATE TABLE `t_article_info` (
  `id` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `author_id` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '作者ID',
  `title` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标题ID',
  `keyword` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `views_num` bigint(16) DEFAULT NULL COMMENT '浏览量',
  `comment_num` bigint(16) DEFAULT NULL COMMENT '评论数',
  `star_num` bigint(16) DEFAULT NULL COMMENT '点赞数',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '编辑时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_article_info
-- ----------------------------

-- ----------------------------
-- Table structure for t_article_src
-- ----------------------------
DROP TABLE IF EXISTS `t_article_src`;
CREATE TABLE `t_article_src` (
  `id` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `article_id` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文章ID',
  `content_src` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '原始内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_article_src
-- ----------------------------

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分类名称',
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_category
-- ----------------------------

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限ID',
  `pid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'root' COMMENT '父节点ID',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限编码',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限名称',
  `type` int(4) DEFAULT NULL COMMENT '类型 0叶子，1 非叶子, 2 接口',
  `icon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图标',
  `description` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限描述',
  `sort` int(4) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='权限表';

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('00afe8f2689424796a0a45f431f548ec', '9b3bfb46abeaa6d7bb7bee44466079bf', '/role/role-add', '角色添加', '2', '', '角色添加', '522');
INSERT INTO `t_permission` VALUES ('0e43438893f3b401c360fe7e82b4a3fa', '42337d91507df7cb8e6f926ca22df265', '/user/user-page-data', '用户列表', '2', '', '用户列表', '511');
INSERT INTO `t_permission` VALUES ('1cf4f6eeff19a6fab6eb7fbcaeb1fb46', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/user/user-page', '皮肤管理', '1', '', '皮肤管理', '550');
INSERT INTO `t_permission` VALUES ('2de9951792266c1bd1b2de3926ea2558', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/user/user-page', '插件管理', '1', '', '插件管理', '540');
INSERT INTO `t_permission` VALUES ('2ec1c4b866955645baee8e3076b932b2', 'root', 'coffee', '广告管理', '0', '', '广告管理', '300');
INSERT INTO `t_permission` VALUES ('3fcfb38b748a71d5de9192bb8ad1608d', 'de81bd38bcfb555406326377c076b3c6', '/permission/permission-delete', '权限删除', '2', '', '权限删除', '534');
INSERT INTO `t_permission` VALUES ('42337d91507df7cb8e6f926ca22df265', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/user/user-page', '用户管理', '1', '', '用户管理', '510');
INSERT INTO `t_permission` VALUES ('565b9d7371a36099fc598fbf24709fc2', '9b3bfb46abeaa6d7bb7bee44466079bf', '/role/role-delete', '角色删除', '2', '', '角色删除', '524');
INSERT INTO `t_permission` VALUES ('6fb16af9095202bcfd71ffcb5cebd896', '9b3bfb46abeaa6d7bb7bee44466079bf', '/role/role-edit', '角色编辑', '2', '', '角色编辑', '523');
INSERT INTO `t_permission` VALUES ('760228cfeab3640219deae51cc3b0b69', 'de81bd38bcfb555406326377c076b3c6', '/permission/permission-add', '权限添加', '2', '', '权限添加', '532');
INSERT INTO `t_permission` VALUES ('7ccf03954968a566ec349aca74901267', 'root', 'statistics', '统计管理', '0', '', '统计管理', '100');
INSERT INTO `t_permission` VALUES ('7f37a751181aa8cd019b4663e197a11d', 'de81bd38bcfb555406326377c076b3c6', '/permission/permission-edit', '权限编辑', '2', '', '权限编辑', '533');
INSERT INTO `t_permission` VALUES ('9b3bfb46abeaa6d7bb7bee44466079bf', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/role/role-page', '角色管理', '1', '', '角色管理', '520');
INSERT INTO `t_permission` VALUES ('9df9a5e5795450a82a944a7da5e58d0e', '9b3bfb46abeaa6d7bb7bee44466079bf', '/rolepermission/rp-save', '角色授权接口', '2', '', '角色授权接口', '525');
INSERT INTO `t_permission` VALUES ('a707e27f38323471f3e452357287801b', 'root', 'blog', '博客管理', '0', '', '博客管理', '200');
INSERT INTO `t_permission` VALUES ('b09fe0458a5f652100c8a1083a1928dd', 'de81bd38bcfb555406326377c076b3c6', '/permission/permission-parent', '权限父节点查询', '2', '', '权限父节点查询', '535');
INSERT INTO `t_permission` VALUES ('b5f51641bb5d82900f0bbd55acdb8d2a', 'root', 'systemSetting', '系统设置', '0', 'menu-icon fa fa-cog', '系统设置', '500');
INSERT INTO `t_permission` VALUES ('de81bd38bcfb555406326377c076b3c6', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/permission/permission-page', '权限管理', '1', '', '权限管理', '530');
INSERT INTO `t_permission` VALUES ('e862309a22ee6d1768de6bc23c428d20', 'de81bd38bcfb555406326377c076b3c6', '/permission/permission-page-data', '权限列表', '2', '', '权限列表', '531');
INSERT INTO `t_permission` VALUES ('f5a32ad182cd3a684ad66a14b920faae', '9b3bfb46abeaa6d7bb7bee44466079bf', '/role/role-page-data', '角色列表', '2', '', '角色列表', '521');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色名称',
  `description` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色描述',
  `sort` int(4) DEFAULT NULL COMMENT '排序',
  `gmt_create` timestamp NULL DEFAULT NULL,
  `gmt_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色表';

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('0', 'SUPER', '超级管理员', '0', null, null);
INSERT INTO `t_role` VALUES ('1', 'ADMIN', '管理员', '1', null, null);
INSERT INTO `t_role` VALUES ('2', 'USER', '普通用户', '2', null, null);

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限表ID',
  `role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色ID',
  `permission_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色权限表';

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES ('033ed39992b29e0280f9057fee3e560c', '0', '1cf4f6eeff19a6fab6eb7fbcaeb1fb46');
INSERT INTO `t_role_permission` VALUES ('0517c4b7ced1728c070818eeff28d7d6', '0', '9df9a5e5795450a82a944a7da5e58d0e');
INSERT INTO `t_role_permission` VALUES ('0afab5e4125e2eed0945dd53a1f5b259', '0', '760228cfeab3640219deae51cc3b0b69');
INSERT INTO `t_role_permission` VALUES ('1228633942a7602ebcd57c8dd0133c98', '0', '6fb16af9095202bcfd71ffcb5cebd896');
INSERT INTO `t_role_permission` VALUES ('1ce8d0176754fbfc00ac666a839ec15e', '0', 'f5a32ad182cd3a684ad66a14b920faae');
INSERT INTO `t_role_permission` VALUES ('304413e5e9030944ec86087fd0dc0478', '0', 'df5d48fb57b1f0d9f7c73f8aca13e97c');
INSERT INTO `t_role_permission` VALUES ('37efa400a8268550b87e053ecb600f5b', '0', 'b09fe0458a5f652100c8a1083a1928dd');
INSERT INTO `t_role_permission` VALUES ('431e2a7f81c30eafecbacb1c459b706e', '0', '3fcfb38b748a71d5de9192bb8ad1608d');
INSERT INTO `t_role_permission` VALUES ('44c48fe7a111891dfade54485965a0bd', '0', 'e862309a22ee6d1768de6bc23c428d20');
INSERT INTO `t_role_permission` VALUES ('4d63805264fc9d2dc606b5258c8e303d', '0', '2de9951792266c1bd1b2de3926ea2558');
INSERT INTO `t_role_permission` VALUES ('5992dfb6141c7b36f673d78c08c8ab54', '0', '00afe8f2689424796a0a45f431f548ec');
INSERT INTO `t_role_permission` VALUES ('7067eaa9cc587f86fef77f961097526c', '0', '7f37a751181aa8cd019b4663e197a11d');
INSERT INTO `t_role_permission` VALUES ('7314f47180d17a04034dd87042e60828', '0', '42337d91507df7cb8e6f926ca22df265');
INSERT INTO `t_role_permission` VALUES ('83e3037185b64b88c806a7f9ebd67f89', '0', '565b9d7371a36099fc598fbf24709fc2');
INSERT INTO `t_role_permission` VALUES ('90aab5c013a66732393ba28d410b9006', '0', '9b3bfb46abeaa6d7bb7bee44466079bf');
INSERT INTO `t_role_permission` VALUES ('b5b3bfbd20d4a36ef6f8410b4d0cd8d1', '0', 'e7d672a6e56053fc23d5aa2502b29947');
INSERT INTO `t_role_permission` VALUES ('cbe46c6e582d1991893519d692881e3e', '0', 'de81bd38bcfb555406326377c076b3c6');
INSERT INTO `t_role_permission` VALUES ('da8ff9152de465d5087d3495de4d475a', '0', '0e43438893f3b401c360fe7e82b4a3fa');
INSERT INTO `t_role_permission` VALUES ('f8da88d5b74078e3800b2f6afc7a6904', '0', '4f65f6b88bdb8da8b124d0087d7c4c73');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `username` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `nickname` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '昵称',
  `photo` varchar(512) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `gender` int(2) DEFAULT NULL COMMENT '性别',
  `information` varchar(512) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '简介',
  `status` int(2) DEFAULT NULL COMMENT '状态 1正常，2冻结，9删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('0', 'super', '$2a$10$IbFU7vRzexKkqGG2J630AOBGpq6C6PgsNqHuaefz.ObYHnttgkzgu', '111', '111', '111', '1', '111', '1');
INSERT INTO `t_user` VALUES ('310ebbb298f0f788f30783efb343ad02', 'zhangsan', '$2a$10$tAyaw8Me5kHuDUwSXy/gg.M20ctlRr8vhVet2Nc.X2K/Gv077B33q', '张三', null, '111', '0', '普通用户', '1');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` bigint(11) NOT NULL COMMENT '用户角色表ID',
  `user_id` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(11) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户角色表';

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('1', '0', '0');
INSERT INTO `t_user_role` VALUES ('2', '310ebbb298f0f788f30783efb343ad02', '1');

-- ----------------------------
-- Table structure for t_vistor_log
-- ----------------------------
DROP TABLE IF EXISTS `t_vistor_log`;
CREATE TABLE `t_vistor_log` (
  `id` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `type` int(4) DEFAULT NULL COMMENT '类型',
  `content_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '被访内容ID',
  `vistor_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '访问链接',
  `vistor_ip` varchar(16) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '来访IP',
  `vistor_time` datetime DEFAULT NULL COMMENT '来访时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_vistor_log
-- ----------------------------
