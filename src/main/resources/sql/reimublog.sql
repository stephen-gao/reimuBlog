/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 80016
Source Host           : 192.168.139.130:3306
Source Database       : reimublog

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2019-11-08 00:10:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `article_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文章ID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '文章内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES ('14a4fc0c023523ede5459750c725d657', '1911srXIM35e', '<p>vvvvvvvvv</p>\n', '2019-11-05 20:24:39', '2019-11-05 20:24:39');
INSERT INTO `t_article` VALUES ('58154a91adc814743f9bc93fbb3f62cd', '1911zAnShYlV', '<p>aaaa</p>\n', '2019-11-07 23:34:29', '2019-11-07 23:34:29');
INSERT INTO `t_article` VALUES ('892e946e4521612ffcca09f6229e6da5', '1911lG1TdjMz', '<p>aaaa</p>\n', '2019-11-05 12:21:53', '2019-11-05 12:21:53');
INSERT INTO `t_article` VALUES ('9411f6391c8b2c3cdb52f92e48d6a1f5', '1911JV8e7NGF', '<p>asdasdasdasdas</p>\n', '2019-11-07 23:26:28', '2019-11-07 23:26:28');
INSERT INTO `t_article` VALUES ('b73f9e9feef7649848c3447aaefe61e9', '1911UlZpshIj', '<p>qweqweqweqwe</p>\n', '2019-11-07 23:28:45', '2019-11-07 23:28:45');
INSERT INTO `t_article` VALUES ('c685382a4a3b04d055a3e80914434ce9', '1911T1nQ3MZz', '<p>asadasfvfdvdfv</p>\n', '2019-11-05 12:19:33', '2019-11-05 12:19:33');
INSERT INTO `t_article` VALUES ('dbd4c684646c4447322ef2c76b49e5b9', '191169XV1IGh', '<p>nmnmnm</p>\n', '2019-11-05 12:10:56', '2019-11-05 12:10:56');
INSERT INTO `t_article` VALUES ('fa82f421a05d30a9aebfd5cb65aefe35', '1911JkCADQOE', '<p>asdas</p>\n', '2019-11-07 23:36:48', '2019-11-07 23:36:48');

-- ----------------------------
-- Table structure for t_article_info
-- ----------------------------
DROP TABLE IF EXISTS `t_article_info`;
CREATE TABLE `t_article_info` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `author_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '作者ID',
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标题ID',
  `keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `category_id` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分类ID',
  `url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '访问地址',
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
INSERT INTO `t_article_info` VALUES ('191169XV1IGh', null, 'mnmnmnmnm', 'nmnm', 'nmnm', null, null, '10', '0', '5', '0', '2019-10-10 12:00:00', '2019-10-10 12:00:00');
INSERT INTO `t_article_info` VALUES ('1911JkCADQOE', '0', 'asas', 'asd', 'asd', '012a7375bf36dfa27c2b1c3dc058f28c', 'localhost:8080/a/1911JkCADQOE', '0', '0', '0', '0', '2019-11-07 23:36:48', '2019-11-07 23:36:48');
INSERT INTO `t_article_info` VALUES ('1911JV8e7NGF', null, 'asdasd asdasdas', 'asdasdas', 'asdasdas', null, 'default.url1911JV8e7NGF', '0', '0', '0', '0', '2019-11-07 23:26:28', '2019-11-07 23:26:28');
INSERT INTO `t_article_info` VALUES ('1911lG1TdjMz', null, 'aaaaa', 'aaaaa', 'aaa', null, null, '10', '0', '5', '0', '2019-11-05 20:21:53', '2019-11-05 20:21:53');
INSERT INTO `t_article_info` VALUES ('1911srXIM35e', null, 'vvvvvv', 'vvvvvvvvvv', 'vvvvvvvvvvvv', null, null, '10', '0', '5', '0', '2019-11-05 20:24:39', '2019-11-05 20:24:39');
INSERT INTO `t_article_info` VALUES ('1911T1nQ3MZz', null, 'dfvdfvdfv', 'dfvdfv', 'dfvdfvd', null, null, '10', '0', '5', '0', '2019-11-05 12:21:53', '2019-11-05 12:21:53');
INSERT INTO `t_article_info` VALUES ('1911UlZpshIj', null, 'qweqweqw', 'qweqw', 'qweqw', '012a7375bf36dfa27c2b1c3dc058f28c', 'localhost:8080/a/1911UlZpshIj', '0', '0', '0', '0', '2019-11-07 23:28:45', '2019-11-07 23:28:45');
INSERT INTO `t_article_info` VALUES ('1911zAnShYlV', null, 'aaaa', 'a', 'a', '012a7375bf36dfa27c2b1c3dc058f28c', 'localhost:8080/a/1911zAnShYlV', '0', '0', '0', '0', '2019-11-07 23:34:29', '2019-11-07 23:34:29');

-- ----------------------------
-- Table structure for t_article_src
-- ----------------------------
DROP TABLE IF EXISTS `t_article_src`;
CREATE TABLE `t_article_src` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `article_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文章ID',
  `content_src` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '原始内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_article_src
-- ----------------------------
INSERT INTO `t_article_src` VALUES ('07add05392447675b166812ba7aea7c0', '1911T1nQ3MZz', 'asadasfvfdvdfv', '2019-11-05 12:19:33', '2019-11-05 12:19:33');
INSERT INTO `t_article_src` VALUES ('096a998ff996eb20a4a24c344f4c826d', '1911UlZpshIj', 'qweqweqweqwe', '2019-11-07 23:28:45', '2019-11-07 23:28:45');
INSERT INTO `t_article_src` VALUES ('412e0ab145822eb34e0e11dd2ab5dc79', '1911srXIM35e', 'vvvvvvvvv', '2019-11-05 20:24:39', '2019-11-05 20:24:39');
INSERT INTO `t_article_src` VALUES ('61730f582cde9963e5a1747dd7ed4943', '1911JV8e7NGF', 'asdasdasdasdas', '2019-11-07 23:26:28', '2019-11-07 23:26:28');
INSERT INTO `t_article_src` VALUES ('7e6061811aa504e5c078008d1f54a4e2', '1911lG1TdjMz', 'aaaa', '2019-11-05 12:21:53', '2019-11-05 12:21:53');
INSERT INTO `t_article_src` VALUES ('8654e1ca0bef1e4eeabe41bae59f8ea0', '1911JkCADQOE', 'asdas', '2019-11-07 23:36:48', '2019-11-07 23:36:48');
INSERT INTO `t_article_src` VALUES ('8bc3e1e87f6e5c1c4798f9ed6a576626', '191169XV1IGh', 'nmnmnm', '2019-11-05 12:10:56', '2019-11-05 12:10:56');
INSERT INTO `t_article_src` VALUES ('934bd3fb8bf10609c0a83771143bfc39', '1911zAnShYlV', 'aaaa', '2019-11-07 23:34:29', '2019-11-07 23:34:29');

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分类名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('012a7375bf36dfa27c2b1c3dc058f28c', 'java', 'java');
INSERT INTO `t_category` VALUES ('46a483687bce42d8bb5ce295f958c63b', 'html', 'html');
INSERT INTO `t_category` VALUES ('ec5c6033df4b1206f2242daac0894da3', 'springboot', 'springboot');
INSERT INTO `t_category` VALUES ('f5e287a580f829ddf0cb2b6554d3d2ee', 'mysql', 'mysql');

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
INSERT INTO `t_permission` VALUES ('0fe4353e5ed416347684d32547c5c8a9', 'a707e27f38323471f3e452357287801b', '/common/page', '文章管理', '1', '', '文章管理', '220');
INSERT INTO `t_permission` VALUES ('1cf4f6eeff19a6fab6eb7fbcaeb1fb46', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/user/user-page', '皮肤管理', '1', '', '皮肤管理', '550');
INSERT INTO `t_permission` VALUES ('2de9951792266c1bd1b2de3926ea2558', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/user/user-page', '插件管理', '1', '', '插件管理', '540');
INSERT INTO `t_permission` VALUES ('2ec1c4b866955645baee8e3076b932b2', 'root', 'coffee', '广告', '0', 'menu-icon fa fa-coffee', '广告', '300');
INSERT INTO `t_permission` VALUES ('3fcfb38b748a71d5de9192bb8ad1608d', 'de81bd38bcfb555406326377c076b3c6', '/permission/permission-delete', '权限删除', '2', '', '权限删除', '534');
INSERT INTO `t_permission` VALUES ('42337d91507df7cb8e6f926ca22df265', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/user/user-page', '用户管理', '1', '', '用户管理', '510');
INSERT INTO `t_permission` VALUES ('565b9d7371a36099fc598fbf24709fc2', '9b3bfb46abeaa6d7bb7bee44466079bf', '/role/role-delete', '角色删除', '2', '', '角色删除', '524');
INSERT INTO `t_permission` VALUES ('6fb16af9095202bcfd71ffcb5cebd896', '9b3bfb46abeaa6d7bb7bee44466079bf', '/role/role-edit', '角色编辑', '2', '', '角色编辑', '523');
INSERT INTO `t_permission` VALUES ('74a179eb95480cc874f527b178ac3d03', 'a707e27f38323471f3e452357287801b', '/category/page', '分类管理', '1', '', '分类管理', '220');
INSERT INTO `t_permission` VALUES ('760228cfeab3640219deae51cc3b0b69', 'de81bd38bcfb555406326377c076b3c6', '/permission/permission-add', '权限添加', '2', '', '权限添加', '532');
INSERT INTO `t_permission` VALUES ('768482ddabf459b3a6b79360ab4090d2', '2ec1c4b866955645baee8e3076b932b2', '/coffee/page', '广告管理', '1', '', '广告管理', '310');
INSERT INTO `t_permission` VALUES ('7ccf03954968a566ec349aca74901267', 'root', 'statistics', '统计', '0', 'menu-icon fa fa-pie-chart', '统计', '100');
INSERT INTO `t_permission` VALUES ('7f37a751181aa8cd019b4663e197a11d', 'de81bd38bcfb555406326377c076b3c6', '/permission/permission-edit', '权限编辑', '2', '', '权限编辑', '533');
INSERT INTO `t_permission` VALUES ('9b3bfb46abeaa6d7bb7bee44466079bf', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/role/role-page', '角色管理', '1', '', '角色管理', '520');
INSERT INTO `t_permission` VALUES ('9df9a5e5795450a82a944a7da5e58d0e', '9b3bfb46abeaa6d7bb7bee44466079bf', '/rolepermission/rp-save', '角色授权接口', '2', '', '角色授权接口', '525');
INSERT INTO `t_permission` VALUES ('9e97e39161f4ddc595b4bbbe57d7b740', 'a707e27f38323471f3e452357287801b', '/common/add-page', '文章新建', '1', '', '文章新建', '210');
INSERT INTO `t_permission` VALUES ('a707e27f38323471f3e452357287801b', 'root', 'blog', '博客', '0', 'menu-icon fa fa-rss-square', '博客', '200');
INSERT INTO `t_permission` VALUES ('b09fe0458a5f652100c8a1083a1928dd', 'de81bd38bcfb555406326377c076b3c6', '/permission/permission-parent', '权限父节点查询', '2', '', '权限父节点查询', '535');
INSERT INTO `t_permission` VALUES ('b5f51641bb5d82900f0bbd55acdb8d2a', 'root', 'systemSetting', '系统', '0', 'menu-icon fa fa-cog', '系统', '500');
INSERT INTO `t_permission` VALUES ('d25cfd8dfc1486b788b675f0686859ad', '7ccf03954968a566ec349aca74901267', '/statistics/vistor', '访客统计', '1', '', '访客统计', '110');
INSERT INTO `t_permission` VALUES ('de81bd38bcfb555406326377c076b3c6', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/permission/permission-page', '权限管理', '1', '', '权限管理', '530');
INSERT INTO `t_permission` VALUES ('e862309a22ee6d1768de6bc23c428d20', 'de81bd38bcfb555406326377c076b3c6', '/permission/permission-page-data', '权限列表', '2', '', '权限列表', '531');
INSERT INTO `t_permission` VALUES ('f5a32ad182cd3a684ad66a14b920faae', '9b3bfb46abeaa6d7bb7bee44466079bf', '/role/role-page-data', '角色列表', '2', '', '角色列表', '521');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色名称',
  `description` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色描述',
  `sort` int(4) DEFAULT NULL COMMENT '排序',
  `gmt_create` timestamp NULL DEFAULT NULL,
  `gmt_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色表';

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('0', 'ADMIN', '管理员', '1', '2019-11-04 10:50:40', '2019-11-04 10:50:43');
INSERT INTO `t_role` VALUES ('2', 'USER', '普通用户', '2', '2019-11-04 10:50:34', '2019-11-04 10:50:36');
INSERT INTO `t_role` VALUES ('8', 'SUPER', '超级管理员', '0', '2019-11-04 10:50:28', '2019-11-04 10:50:32');

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
INSERT INTO `t_role_permission` VALUES ('28ce87570fe5cb3ac405854a07f6df0d', '0', 'e862309a22ee6d1768de6bc23c428d20');
INSERT INTO `t_role_permission` VALUES ('2f6e6753bf138d92df372fde349d09f1', '0', 'f5a32ad182cd3a684ad66a14b920faae');
INSERT INTO `t_role_permission` VALUES ('3143d6e0e6a3650dfd980895bccd0637', '0', '42337d91507df7cb8e6f926ca22df265');
INSERT INTO `t_role_permission` VALUES ('40df478cae0ff3ace9ffa7284381fdb6', '0', '768482ddabf459b3a6b79360ab4090d2');
INSERT INTO `t_role_permission` VALUES ('419f9f69b6ffacd4181110896f80b603', '0', '0fe4353e5ed416347684d32547c5c8a9');
INSERT INTO `t_role_permission` VALUES ('53be5f2f58ce581099a0bb0ba4cd39d1', '0', '7f37a751181aa8cd019b4663e197a11d');
INSERT INTO `t_role_permission` VALUES ('589b869b48e4f2a43226487664f25e29', '0', 'b09fe0458a5f652100c8a1083a1928dd');
INSERT INTO `t_role_permission` VALUES ('66821da5f2c9a88de84b38849786b517', '0', '565b9d7371a36099fc598fbf24709fc2');
INSERT INTO `t_role_permission` VALUES ('66a342ea8addcc38d790b51ce09ccf1b', '0', '2de9951792266c1bd1b2de3926ea2558');
INSERT INTO `t_role_permission` VALUES ('6ee3eb7d8cc7aae8c8a9a06a466f9940', '0', '0e43438893f3b401c360fe7e82b4a3fa');
INSERT INTO `t_role_permission` VALUES ('86c3b218efd6649d7c387426372a85c6', '0', '760228cfeab3640219deae51cc3b0b69');
INSERT INTO `t_role_permission` VALUES ('9cedb67f6d14401e510290a342d74ac5', '0', '1cf4f6eeff19a6fab6eb7fbcaeb1fb46');
INSERT INTO `t_role_permission` VALUES ('9d693569a14ba408e02249d183126260', '0', '9e97e39161f4ddc595b4bbbe57d7b740');
INSERT INTO `t_role_permission` VALUES ('9eebee49e8cfacbd702c13c2d388437e', '0', '9b3bfb46abeaa6d7bb7bee44466079bf');
INSERT INTO `t_role_permission` VALUES ('ae2855bab42dd6e699260ea2593700ef', '0', 'd25cfd8dfc1486b788b675f0686859ad');
INSERT INTO `t_role_permission` VALUES ('b374892904d82a432029e685ee997637', '0', 'de81bd38bcfb555406326377c076b3c6');
INSERT INTO `t_role_permission` VALUES ('bda710c41cc1a9e09e715a224f1670d6', '0', '6fb16af9095202bcfd71ffcb5cebd896');
INSERT INTO `t_role_permission` VALUES ('c1c41e7d10dd7eb970072b03342d6abf', '0', '74a179eb95480cc874f527b178ac3d03');
INSERT INTO `t_role_permission` VALUES ('c67b0b43d6632ca753da9353a2f64198', '0', '3fcfb38b748a71d5de9192bb8ad1608d');
INSERT INTO `t_role_permission` VALUES ('d7c220a0b8589969326c4f67933e8c42', '0', '00afe8f2689424796a0a45f431f548ec');
INSERT INTO `t_role_permission` VALUES ('db84f4812335329b13502ee469e209f1', '0', '9df9a5e5795450a82a944a7da5e58d0e');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `nickname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '昵称',
  `photo` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `gender` int(2) DEFAULT NULL COMMENT '性别',
  `information` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '简介',
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
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户ID',
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
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` int(4) DEFAULT NULL COMMENT '类型',
  `content_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '被访内容ID',
  `vistor_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '访问链接',
  `vistor_ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '来访IP',
  `vistor_time` datetime DEFAULT NULL COMMENT '来访时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_vistor_log
-- ----------------------------
