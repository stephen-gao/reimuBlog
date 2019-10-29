/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 80016
Source Host           : 192.168.139.129:3306
Source Database       : reimublog

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2019-10-30 00:16:38
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
  `id` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限ID',
  `pid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'root' COMMENT '父节点ID',
  `code` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限编码',
  `name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限名称',
  `type` int(4) DEFAULT NULL COMMENT '类型 0叶子，1 非叶子, 2 接口',
  `icon` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图标',
  `description` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限描述',
  `sort` int(4) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='权限表';

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('00afe8f2689424796a0a45f431f548ec', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/role/role-add', '角色添加', '2', '', '角色添加', '3');
INSERT INTO `t_permission` VALUES ('0e43438893f3b401c360fe7e82b4a3fa', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/user/user-page-data', '用户分页查询', '2', '', '用户分页查询', '2');
INSERT INTO `t_permission` VALUES ('1cf4f6eeff19a6fab6eb7fbcaeb1fb46', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/user/user-page', '皮肤管理', '1', '', '插件管理', '6');
INSERT INTO `t_permission` VALUES ('2de9951792266c1bd1b2de3926ea2558', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/user/user-page', '插件管理', '1', '', '插件管理', '5');
INSERT INTO `t_permission` VALUES ('3fcfb38b748a71d5de9192bb8ad1608d', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/permission/permission-delete', '权限删除', '2', '', '权限删除', '4');
INSERT INTO `t_permission` VALUES ('42337d91507df7cb8e6f926ca22df265', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/user/user-page', '用户管理', '1', '', '用户管理', '2');
INSERT INTO `t_permission` VALUES ('565b9d7371a36099fc598fbf24709fc2', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/role/role-delete', '角色删除', '2', '', '角色删除', '3');
INSERT INTO `t_permission` VALUES ('6fb16af9095202bcfd71ffcb5cebd896', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/role/role-edit', '角色编辑', '2', '', '角色编辑', '3');
INSERT INTO `t_permission` VALUES ('760228cfeab3640219deae51cc3b0b69', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/permission/permission-add', '权限添加', '2', '', '权限添加', '4');
INSERT INTO `t_permission` VALUES ('7f37a751181aa8cd019b4663e197a11d', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/permission/permission-edit', '权限编辑', '2', '', '权限编辑', '4');
INSERT INTO `t_permission` VALUES ('9b3bfb46abeaa6d7bb7bee44466079bf', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/role/role-page', '角色管理', '1', '', '角色管理', '3');
INSERT INTO `t_permission` VALUES ('9df9a5e5795450a82a944a7da5e58d0e', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/rolepermission/rp-save', '角色授权接口', '2', '', '角色授权接口', '3');
INSERT INTO `t_permission` VALUES ('b09fe0458a5f652100c8a1083a1928dd', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/permission/permission-parent', '权限父节点查询', '2', '', '权限父节点查询', '4');
INSERT INTO `t_permission` VALUES ('b5f51641bb5d82900f0bbd55acdb8d2a', 'root', 'systemSetting', '系统设置', '0', 'menu-icon fa fa-cog', '系统设置', '1');
INSERT INTO `t_permission` VALUES ('de81bd38bcfb555406326377c076b3c6', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/permission/permission-page', '权限管理', '1', '', '权限管理', '4');
INSERT INTO `t_permission` VALUES ('e862309a22ee6d1768de6bc23c428d20', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/permission/permission-page-data', '权限分页查询', '2', '', '权限分页查询', '4');
INSERT INTO `t_permission` VALUES ('f5a32ad182cd3a684ad66a14b920faae', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/role/role-page-data', '角色查询', '2', '', '角色查询', '3');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
  `name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色名称',
  `description` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色描述',
  `sort` int(4) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色表';

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('0', 'SUPER', '超级管理员', '0');
INSERT INTO `t_role` VALUES ('1ba7ed6c0c64eb144213c84d617fe8f1', 'ADMIN', '管理员', '1');

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `id` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限表ID',
  `role_id` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色ID',
  `permission_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色权限表';

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES ('11ce10a34b0c71d571e414fe6b99622a', '0', '6fb16af9095202bcfd71ffcb5cebd896');
INSERT INTO `t_role_permission` VALUES ('1602d8212cf4e4eb2c5a523ea235b854', '0', '760228cfeab3640219deae51cc3b0b69');
INSERT INTO `t_role_permission` VALUES ('356fc93e684a880b986e7d62793a5b20', '0', '2de9951792266c1bd1b2de3926ea2558');
INSERT INTO `t_role_permission` VALUES ('3d0de59cd3e2940d4258f695cff72b23', '0', 'b09fe0458a5f652100c8a1083a1928dd');
INSERT INTO `t_role_permission` VALUES ('535a50a2c5f66d9ee25dd656cf9cf406', '0', 'de81bd38bcfb555406326377c076b3c6');
INSERT INTO `t_role_permission` VALUES ('55dd28bdc3927f8be33980c10ce0b5f6', '0', '00afe8f2689424796a0a45f431f548ec');
INSERT INTO `t_role_permission` VALUES ('5f0a95b3a40341b2e97a80c53ba1a0ea', '0', 'f5a32ad182cd3a684ad66a14b920faae');
INSERT INTO `t_role_permission` VALUES ('6d7c45bf4fb202c6f51a8eba677200b0', '0', '3fcfb38b748a71d5de9192bb8ad1608d');
INSERT INTO `t_role_permission` VALUES ('a91e32157d5b4128d9e8461e4932558d', '0', '42337d91507df7cb8e6f926ca22df265');
INSERT INTO `t_role_permission` VALUES ('b15de8b67548c50f42b8e4dba076c425', '0', '9df9a5e5795450a82a944a7da5e58d0e');
INSERT INTO `t_role_permission` VALUES ('b326c80c7c9c0781d2fdd990210a5c5d', '0', 'e862309a22ee6d1768de6bc23c428d20');
INSERT INTO `t_role_permission` VALUES ('b7c332b4dd69f5ea8f860bfe229351cc', '0', '1cf4f6eeff19a6fab6eb7fbcaeb1fb46');
INSERT INTO `t_role_permission` VALUES ('bcf5fa552eb661ae34863dc11ab8a526', '0', '9b3bfb46abeaa6d7bb7bee44466079bf');
INSERT INTO `t_role_permission` VALUES ('c18e9f1a7bd928c8c5578a229c2cdc45', '0', '7f37a751181aa8cd019b4663e197a11d');
INSERT INTO `t_role_permission` VALUES ('cc08164eda7cf9219e6e021bd8ff9710', '0', '565b9d7371a36099fc598fbf24709fc2');
INSERT INTO `t_role_permission` VALUES ('d9d2a25b3d20dcc0a8848c4dc2aa6e5a', '0', '0e43438893f3b401c360fe7e82b4a3fa');

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
INSERT INTO `t_user` VALUES ('0', 'super', '$2a$10$IbFU7vRzexKkqGG2J630AOBGpq6C6PgsNqHuaefz.ObYHnttgkzgu', '111', '111', '111', '1', '111', null);
INSERT INTO `t_user` VALUES ('10', 'lisi1', null, '111', '111', '111', '1', '111', null);
INSERT INTO `t_user` VALUES ('11', 'zhangsan1', null, '111', '111', '111', '1', '111', null);
INSERT INTO `t_user` VALUES ('12', 'lisi2', null, '111', '111', '111', '1', '111', null);
INSERT INTO `t_user` VALUES ('2', 'lisi3', null, '111', '111', '111', '1', '111', null);
INSERT INTO `t_user` VALUES ('3', 'zhangsan2', null, '111', '111', '111', '1', '111', null);
INSERT INTO `t_user` VALUES ('4', 'lisi4', null, '111', '111', '111', '1', '111', null);
INSERT INTO `t_user` VALUES ('5', 'zhangsan3', null, '111', '111', '111', '1', '111', null);
INSERT INTO `t_user` VALUES ('6', 'lisi5', null, '111', '111', '111', '1', '111', null);
INSERT INTO `t_user` VALUES ('7', 'zhangsan4', null, '111', '111', '111', '1', '111', null);
INSERT INTO `t_user` VALUES ('8', 'lisi6', null, '111', '111', '111', '1', '111', null);
INSERT INTO `t_user` VALUES ('9', 'zhangsan5', null, '111', '111', '111', '1', '111', null);

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户角色表ID',
  `user_id` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户ID',
  `role_id` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户角色表';

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('1', '0', '0');

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
