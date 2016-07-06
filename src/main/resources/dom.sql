/*
Navicat MySQL Data Transfer

Source Server         : dom
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : dom

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-07-06 18:32:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `d_game`
-- ----------------------------
DROP TABLE IF EXISTS `d_game`;
CREATE TABLE `d_game` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `desc` varchar(32) DEFAULT NULL,
  `player_num` int(5) DEFAULT NULL,
  `status` int(5) DEFAULT NULL COMMENT '0 取消 1 报名中 2 报名结束 3 进行中 4 已结束',
  `estimated_start_date` date DEFAULT NULL,
  `actual_start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_game
-- ----------------------------
INSERT INTO `d_game` VALUES ('1', '16NV', '22', '1', '2016-07-14', null, null);

-- ----------------------------
-- Table structure for `d_player`
-- ----------------------------
DROP TABLE IF EXISTS `d_player`;
CREATE TABLE `d_player` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) DEFAULT NULL,
  `role` varchar(32) DEFAULT NULL,
  `game_id` bigint(11) DEFAULT NULL,
  `character_id` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_player
-- ----------------------------
INSERT INTO `d_player` VALUES ('1', '2', 'judger', '1', null);
INSERT INTO `d_player` VALUES ('2', '3', 'judger', '1', null);
INSERT INTO `d_player` VALUES ('7', '1', 'player', '1', null);

-- ----------------------------
-- Table structure for `d_user`
-- ----------------------------
DROP TABLE IF EXISTS `d_user`;
CREATE TABLE `d_user` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_user
-- ----------------------------
INSERT INTO `d_user` VALUES ('1', 'jack3173', 'yesterday', '小风', null, null);
INSERT INTO `d_user` VALUES ('2', 'jack3174', 'yesterday', '大风', '2016-07-05 13:47:10', null);
INSERT INTO `d_user` VALUES ('3', 'jack3175', 'yesterday', '微风', '2016-07-06 13:12:35', null);
INSERT INTO `d_user` VALUES ('4', 'jack3176', 'yesterday', '飓风', '2016-07-06 15:54:53', null);
