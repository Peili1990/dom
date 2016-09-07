/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : dom

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-09-07 19:15:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `d_character`
-- ----------------------------
DROP TABLE IF EXISTS `d_character`;
CREATE TABLE `d_character` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `sex` int(1) DEFAULT NULL COMMENT '0 男 1 女 2 可男可女',
  `age` int(5) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `killer_avatar` varchar(255) DEFAULT NULL,
  `has_sp` varchar(1) DEFAULT NULL,
  `tag` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_character
-- ----------------------------
INSERT INTO `d_character` VALUES ('1', '爱德华', '0', '24', 'characterAvatar/0145.jpg', 'characterAvatar/0146.jpg', '1', null);
INSERT INTO `d_character` VALUES ('2', '马丁', '0', '31', 'characterAvatar/0147.jpg', 'characterAvatar/0148.jpg', '0', null);
INSERT INTO `d_character` VALUES ('3', '托马斯', '0', '29', 'characterAvatar/0149.jpg', 'characterAvatar/0150.jpg', '0', null);
INSERT INTO `d_character` VALUES ('4', '白瑞摩', '0', '33', 'characterAvatar/0151.jpg', 'characterAvatar/0152.jpg', '0', null);
INSERT INTO `d_character` VALUES ('5', '伊卡', '1', '20', 'characterAvatar/0153.jpg', 'characterAvatar/0154.jpg', '1', null);
INSERT INTO `d_character` VALUES ('6', '珀利', '1', '24', 'characterAvatar/0155.jpg', 'characterAvatar/0156.jpg', '0', null);
INSERT INTO `d_character` VALUES ('7', '莫利', '1', '28', 'characterAvatar/0157.jpg', 'characterAvatar/0158.jpg', '1', null);
INSERT INTO `d_character` VALUES ('8', '沃兹沃斯', '1', '27', 'characterAvatar/0159.jpg', 'characterAvatar/0160.jpg', '0', null);
INSERT INTO `d_character` VALUES ('9', '伊奥克', '0', '21', 'characterAvatar/0161.jpg', 'characterAvatar/0162.jpg', '0', null);
INSERT INTO `d_character` VALUES ('10', '奈斯', '0', '50', 'characterAvatar/0163.jpg', 'characterAvatar/0164.jpg', '0', null);
INSERT INTO `d_character` VALUES ('11', '曼顿', '0', '56', 'characterAvatar/0165.jpg', 'characterAvatar/0166.jpg', '0', null);
INSERT INTO `d_character` VALUES ('12', '朗斯特里特', '0', '43', 'characterAvatar/0167.jpg', 'characterAvatar/0168.jpg', '0', null);
INSERT INTO `d_character` VALUES ('13', '普拉马逊斯', '0', '45', 'characterAvatar/0169.jpg', 'characterAvatar/0170.jpg', '0', null);
INSERT INTO `d_character` VALUES ('14', '舒马赫', '1', '53', 'characterAvatar/0171.jpg', 'characterAvatar/0172.jpg', '0', null);
INSERT INTO `d_character` VALUES ('15', '道格拉斯', '1', '47', 'characterAvatar/0173.jpg', 'characterAvatar/0174.jpg', '0', null);
INSERT INTO `d_character` VALUES ('16', '科尔比', '1', '40', 'characterAvatar/0175.jpg', 'characterAvatar/0176.jpg', '0', null);
INSERT INTO `d_character` VALUES ('17', '欧希玛', '1', '49', 'characterAvatar/0177.jpg', 'characterAvatar/0178.jpg', '0', null);
INSERT INTO `d_character` VALUES ('18', '梅特卡夫', '0', '38', 'characterAvatar/0179.jpg', 'characterAvatar/0180.jpg', '0', null);
INSERT INTO `d_character` VALUES ('19', '哈代', '0', '63', 'characterAvatar/0181.jpg', 'characterAvatar/0182.jpg', '1', null);
INSERT INTO `d_character` VALUES ('20', '盖茨', '0', '66', 'characterAvatar/0183.jpg', 'characterAvatar/0184.jpg', '0', null);
INSERT INTO `d_character` VALUES ('21', '斯达福斯', '0', '67', 'characterAvatar/0185.jpg', 'characterAvatar/0186.jpg', '0', null);
INSERT INTO `d_character` VALUES ('22', '托兰', '0', '74', 'characterAvatar/0187.jpg', 'characterAvatar/0188.jpg', '0', null);
INSERT INTO `d_character` VALUES ('23', '查西', '1', '71', 'characterAvatar/0189.jpg', 'characterAvatar/0190.jpg', '0', null);
INSERT INTO `d_character` VALUES ('24', '斯布兰奇', '1', '64', 'characterAvatar/0191.jpg', 'characterAvatar/0192.jpg', '0', null);
INSERT INTO `d_character` VALUES ('25', '坦尼森', '1', '69', 'characterAvatar/0193.jpg', 'characterAvatar/0194.jpg', '0', null);
INSERT INTO `d_character` VALUES ('26', '德雷顿', '1', '65', 'characterAvatar/0195.jpg', 'characterAvatar/0196.jpg', '0', null);
INSERT INTO `d_character` VALUES ('27', '奎勒', '0', '78', 'characterAvatar/0197.jpg', 'characterAvatar/0198.jpg', '0', null);
INSERT INTO `d_character` VALUES ('28', '威廉姆斯', '0', '48', 'characterAvatar/0217.jpg', 'characterAvatar/0218.jpg', '1', null);
INSERT INTO `d_character` VALUES ('29', '尤里', '0', '36', 'characterAvatar/0219.jpg', 'characterAvatar/0220.jpg', '0', null);
INSERT INTO `d_character` VALUES ('30', '安德安纳', '0', '30', 'characterAvatar/0221.jpg', 'characterAvatar/0222.jpg', '0', null);
INSERT INTO `d_character` VALUES ('31', '劳伦', '0', '52', 'characterAvatar/0223.jpg', 'characterAvatar/0224.jpg', '1', null);
INSERT INTO `d_character` VALUES ('32', '豪', '1', '46', 'characterAvatar/0225.jpg', 'characterAvatar/0226.jpg', '0', null);
INSERT INTO `d_character` VALUES ('33', '阿修', '1', '45', 'characterAvatar/0227.jpg', 'characterAvatar/0228.jpg', '0', null);
INSERT INTO `d_character` VALUES ('34', '卡布莱', '1', '55', 'characterAvatar/0229.jpg', 'characterAvatar/0230.jpg', '0', null);
INSERT INTO `d_character` VALUES ('35', '叶什（妹）', '1', '22', 'characterAvatar/0231.jpg', 'characterAvatar/0232.jpg', '0', null);
INSERT INTO `d_character` VALUES ('36', '扬', '1', '26', 'characterAvatar/0233.jpg', 'characterAvatar/0234.jpg', '0', null);
INSERT INTO `d_character` VALUES ('37', '赫本', '1', '23', 'characterAvatar/0235.jpg', 'characterAvatar/0236.jpg', '0', null);
INSERT INTO `d_character` VALUES ('38', '卓尔', '0', '39', 'characterAvatar/0237.jpg', 'characterAvatar/0238.jpg', '1', null);
INSERT INTO `d_character` VALUES ('39', '艾尔威', '1', '73', 'characterAvatar/0239.jpg', 'characterAvatar/0240.jpg', '0', null);
INSERT INTO `d_character` VALUES ('40', '山纳', '0', '54', 'characterAvatar/0241.jpg', 'characterAvatar/0242.jpg', '0', null);
INSERT INTO `d_character` VALUES ('41', '叶什（兄）', '0', '35', 'characterAvatar/0243.jpg', 'characterAvatar/0244.jpg', '1', null);
INSERT INTO `d_character` VALUES ('42', '钱德勒', '2', '41', 'characterAvatar/0247.jpg', 'characterAvatar/0250.jpg', '0', null);
INSERT INTO `d_character` VALUES ('43', '霍尔', '1', '20', 'characterAvatar/0252.jpg', 'characterAvatar/0253.jpg', '1', null);
INSERT INTO `d_character` VALUES ('44', '恩菲尔德', '1', '0', 'characterAvatar/0254.jpg', 'characterAvatar/0255.jpg', '0', null);
INSERT INTO `d_character` VALUES ('45', '布莱克', '0', '80', 'characterAvatar/0256.jpg', 'characterAvatar/0257.jpg', '0', null);
INSERT INTO `d_character` VALUES ('46', '李', '0', '62', 'characterAvatar/0258.jpg', 'characterAvatar/0259.jpg', '0', null);
INSERT INTO `d_character` VALUES ('47', '厄金特', '1', '76', 'characterAvatar/0260.jpg', 'characterAvatar/0261.jpg', '0', null);
INSERT INTO `d_character` VALUES ('48', '昆西', '1', '34', 'characterAvatar/0262.jpg', 'characterAvatar/0263.jpg', '0', null);
INSERT INTO `d_character` VALUES ('49', '马克唐', '0', '77', 'characterAvatar/0265.jpg', 'characterAvatar/0266.jpg', '0', null);
INSERT INTO `d_character` VALUES ('50', '约翰逊', '1', '51', 'characterAvatar/0267.jpg', 'characterAvatar/0268.jpg', '1', null);
INSERT INTO `d_character` VALUES ('51', '欧内斯特', '1', '60', 'characterAvatar/0269.jpg', 'characterAvatar/0270.jpg', '0', null);
INSERT INTO `d_character` VALUES ('52', '浮士德', '0', '58', 'characterAvatar/0271.jpg', 'characterAvatar/0272.jpg', '0', null);
INSERT INTO `d_character` VALUES ('53', '德.圣地亚哥', '0', '72', 'characterAvatar/0273.jpg', 'characterAvatar/0274.jpg', '0', null);
INSERT INTO `d_character` VALUES ('54', '温切斯特', '2', '68', 'characterAvatar/0277.jpg', 'characterAvatar/0280.jpg', '0', null);

-- ----------------------------
-- Table structure for `d_form`
-- ----------------------------
DROP TABLE IF EXISTS `d_form`;
CREATE TABLE `d_form` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `game_id` bigint(11) DEFAULT NULL,
  `header` varchar(32) DEFAULT NULL,
  `content` longtext,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_form
-- ----------------------------
INSERT INTO `d_form` VALUES ('29', '1', '游戏开始前', null, '2016-07-25 18:05:09', null);

-- ----------------------------
-- Table structure for `d_game`
-- ----------------------------
DROP TABLE IF EXISTS `d_game`;
CREATE TABLE `d_game` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(32) DEFAULT NULL,
  `character_select` varchar(1) DEFAULT NULL COMMENT 'A 个人选择 B 3选1',
  `player_num` int(5) DEFAULT NULL,
  `status` int(5) DEFAULT NULL COMMENT '0 取消 1 报名中 2 报名结束 3游戏开始前 4 进行中 5 复盘中 9 已结束',
  `estimated_start_date` date DEFAULT NULL,
  `actual_start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `final_result` int(1) DEFAULT NULL COMMENT '1 好人方胜利 2 杀手方胜利 3 契约方胜利 9流局',
  `qq_group` varchar(32) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_game
-- ----------------------------
INSERT INTO `d_game` VALUES ('1', '16NV', 'B', '22', '9', '2016-07-15', '2016-09-07', '2016-09-07', '1', null, null);
INSERT INTO `d_game` VALUES ('5', '20NV', 'A', '19', '1', '2016-07-26', null, null, null, '132697360', '');

-- ----------------------------
-- Table structure for `d_inv_code`
-- ----------------------------
DROP TABLE IF EXISTS `d_inv_code`;
CREATE TABLE `d_inv_code` (
  `id` bigint(11) NOT NULL,
  `inv_code` varchar(32) DEFAULT NULL,
  `used` int(1) DEFAULT NULL,
  `user_id` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_inv_code
-- ----------------------------
INSERT INTO `d_inv_code` VALUES ('1', '1a2b3c', '1', '31');
INSERT INTO `d_inv_code` VALUES ('2', '1112s3', '1', '33');
INSERT INTO `d_inv_code` VALUES ('3', 'cccbbb', '1', '34');

-- ----------------------------
-- Table structure for `d_kick_record`
-- ----------------------------
DROP TABLE IF EXISTS `d_kick_record`;
CREATE TABLE `d_kick_record` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `game_id` bigint(11) DEFAULT NULL,
  `judger_user_id` bigint(11) DEFAULT NULL,
  `player_user_id` bigint(11) DEFAULT NULL,
  `reason` varchar(64) DEFAULT NULL,
  `kick_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_kick_record
-- ----------------------------
INSERT INTO `d_kick_record` VALUES ('5', '5', '22', '23', '混子', '2016-07-29 18:06:04');
INSERT INTO `d_kick_record` VALUES ('6', '5', '22', '23', '混子', '2016-07-29 18:09:30');

-- ----------------------------
-- Table structure for `d_newspaper`
-- ----------------------------
DROP TABLE IF EXISTS `d_newspaper`;
CREATE TABLE `d_newspaper` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `game_id` bigint(11) DEFAULT NULL,
  `header` varchar(32) DEFAULT NULL,
  `headline` varchar(64) DEFAULT NULL,
  `headline_body` text,
  `subedition` text,
  `important_notice` text,
  `seat_table` text,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `type` int(1) unsigned zerofill DEFAULT '0' COMMENT '1 夜刊 2 日刊',
  `status` int(1) DEFAULT NULL COMMENT '2 已结束发言 1 已发布 0 未发布',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_newspaper
-- ----------------------------
INSERT INTO `d_newspaper` VALUES ('1', '5', '7月5日日刊（开版公告）', '小镇受西部铁路公司200万美元投资垂青', '本市西部仅两站<br>维多利亚讯 据可靠消息，今日下午，西部铁路公司董事会发言人特理·亨德曼表明，其第二大股东亨利.刘易斯（左图）即将对本市行政区域内的维多利亚镇进行大规模投资，由铁路运输业带动铁矿、石油的初期计划已经草拟成案。经济学家称该举措即将带来临近地区就业的重整，治安专家则担心大额外来人员对本地区的影响。中部铁运则表明，在铁路运重创的6月后进行这种冒险之举不具长期眼光。<br>维多利亚镇普通镇民，书记官温彻斯特太太表示，“这预示一种时代的变化。当蒸汽机车最终被内燃机车取代的时候，我们知道有些东西不同了。”', '2版政治：在野党质疑政府监管<br>2版经济：周边带动理论 <br>2版金融：华尔街芝加哥工业指数上升24% <br>7版：维多利亚镇的介绍 <br><br>4版<br>西部铁路公司收到匿名警告信 犯罪专家称或非无稽之谈 <br>芝加哥讯 西部铁路公司芝加哥分所近日收到恐吓信，据平克顿侦探所透露，此信来向可推为维多利亚镇。目前警方没有明确透露信的具体内容，但据称为某一组织的某些人员向西部铁路公司某些高层追索“欠款”，并扬言“你们，都得死”。 <br>有证券交易所表明，6月后的会计工作使证券持有人对西部铁路公司表示乐观，然而始终有声音质疑为何西部铁路公司能在6月的N.劳兄弟公司铁路重大事故后保持账面未有亏损。', '哈代死亡。<br><br>哈代遗言：', '<table>\r\n				<tbody>\r\n					<tr>\r\n						<td>恩菲尔德</td>\r\n						<td align=\"center\">霍尔</td>\r\n						<td align=\"right\">欧内斯特</td>\r\n					</tr>\r\n					<tr>\r\n						<td></td>\r\n						<td></td>\r\n						<td align=\"right\">叶妹</td>\r\n					</tr>\r\n					<tr>\r\n						<td>叶兄</td>\r\n						<td></td>\r\n						<td align=\"right\">安德安纳</td>\r\n					</tr>\r\n					<tr>\r\n						<td>哈代【死亡】</td>\r\n						<td></td>\r\n						<td align=\"right\">马克唐</td>\r\n					</tr>\r\n					<tr>\r\n						<td>白瑞摩</td>\r\n						<td></td>\r\n						<td align=\"right\">圣地亚哥</td>\r\n					</tr>\r\n					<tr>\r\n						<td>赫本</td>\r\n						<td></td>\r\n						<td align=\"right\">科尔比</td>\r\n					</tr>\r\n					<tr>\r\n						<td>莫利</td>\r\n						<td></td>\r\n						<td align=\"right\">（布莱克）</td>\r\n					</tr>\r\n					<tr>\r\n						<td>普拉马逊斯</td>\r\n						<td></td>\r\n						<td align=\"right\">昆西</td>\r\n					</tr>\r\n					<tr>\r\n						<td>艾尔威</td>\r\n						<td align=\"center\">劳伦</td>\r\n						<td align=\"right\">伊卡</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>', '2016-07-25 18:03:37', null, '2', '1');
INSERT INTO `d_newspaper` VALUES ('2', '1', '7月5日夜刊（开版公告）', '小镇受西部铁路公司200万美元投资垂青', '本市西部仅两站<br>维多利亚讯 据可靠消息，今日下午，西部铁路公司董事会发言人特理·亨德曼表明，其第二大股东亨利.刘易斯（左图）即将对本市行政区域内的维多利亚镇进行大规模投资，由铁路运输业带动铁矿、石油的初期计划已经草拟成案。经济学家称该举措即将带来临近地区就业的重整，治安专家则担心大额外来人员对本地区的影响。中部铁运则表明，在铁路运重创的6月后进行这种冒险之举不具长期眼光。<br>维多利亚镇普通镇民，书记官温彻斯特太太表示，“这预示一种时代的变化。当蒸汽机车最终被内燃机车取代的时候，我们知道有些东西不同了。”', '2版政治：在野党质疑政府监管<br>2版经济：周边带动理论 <br>2版金融：华尔街芝加哥工业指数上升24%  <br>5版 柏林会议进展不顺 <br>6版 清帝国使者离开纽约 <br>7版：维多利亚镇的介绍<br>8版 独立日烟火不慎造成男童落水 <br><br>4版<br>西部铁路公司收到匿名警告信 犯罪专家称或非无稽之谈 <br>芝加哥讯 西部铁路公司芝加哥分所近日收到恐吓信，据平克顿侦探所透露，此信来向可推为维多利亚镇。目前警方没有明确透露信的具体内容，但据称为某一组织的某些人员向西部铁路公司某些高层追索“欠款”，并扬言“你们，都得死”。 <br>有证券交易所表明，6月后的会计工作使证券持有人对西部铁路公司表示乐观，然而始终有声音质疑为何西部铁路公司能在6月的N.劳兄弟公司铁路重大事故后保持账面未有亏损。', '哈代死亡。<br><br>哈代遗言：', '<table><tbody><tr><td>珀利</td><td align=\"center\">伊卡</td><td align=\"right\">山纳</td></tr><tr><td></td><td></td><td align=\"right\">哈代</td></tr><tr><td>马丁</td><td></td><td align=\"right\">爱德华</td></tr><tr><td>昆西</td><td></td><td align=\"right\">叶什（妹）</td></tr><tr><td>温切斯特</td><td></td><td align=\"right\">卓尔</td></tr><tr><td>叶什（兄）</td><td></td><td align=\"right\">白瑞摩</td></tr><tr><td>厄金特</td><td></td><td align=\"right\">赫本</td></tr><tr><td>奎勒</td><td></td><td align=\"right\">安德安纳</td></tr><tr><td>伊奥克</td><td align=\"center\">斯达福斯</td><td align=\"right\">科尔比</td></tr></tbody></table>', '2016-07-27 17:07:07', '2016-08-05 10:43:07', '2', '1');
INSERT INTO `d_newspaper` VALUES ('3', '1', '7月6日日刊', '', '', '', '哈代死亡。<br><br>哈代遗言：', null, '2016-08-10 18:34:03', '2016-09-07 11:48:58', '1', '1');

-- ----------------------------
-- Table structure for `d_offline_message`
-- ----------------------------
DROP TABLE IF EXISTS `d_offline_message`;
CREATE TABLE `d_offline_message` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `chat_id` varchar(32) DEFAULT NULL,
  `from_user_id` bigint(11) DEFAULT NULL,
  `to_user_id` bigint(11) DEFAULT NULL,
  `content` text,
  `create_time` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_offline_message
-- ----------------------------
INSERT INTO `d_offline_message` VALUES ('2', '2-9', '2', '9', '你好', '2016-08-15 16:04:32');

-- ----------------------------
-- Table structure for `d_offline_speech`
-- ----------------------------
DROP TABLE IF EXISTS `d_offline_speech`;
CREATE TABLE `d_offline_speech` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) DEFAULT NULL,
  `speech_id` bigint(11) DEFAULT NULL,
  `newspaper_id` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2696 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_offline_speech
-- ----------------------------
INSERT INTO `d_offline_speech` VALUES ('2629', '2', '173', '2');
INSERT INTO `d_offline_speech` VALUES ('2630', '3', '173', '2');
INSERT INTO `d_offline_speech` VALUES ('2631', '4', '173', '2');
INSERT INTO `d_offline_speech` VALUES ('2632', '6', '173', '2');
INSERT INTO `d_offline_speech` VALUES ('2633', '5', '173', '2');
INSERT INTO `d_offline_speech` VALUES ('2634', '7', '173', '2');
INSERT INTO `d_offline_speech` VALUES ('2635', '8', '173', '2');
INSERT INTO `d_offline_speech` VALUES ('2636', '9', '173', '2');
INSERT INTO `d_offline_speech` VALUES ('2637', '10', '173', '2');
INSERT INTO `d_offline_speech` VALUES ('2638', '11', '173', '2');
INSERT INTO `d_offline_speech` VALUES ('2639', '12', '173', '2');
INSERT INTO `d_offline_speech` VALUES ('2640', '13', '173', '2');
INSERT INTO `d_offline_speech` VALUES ('2641', '14', '173', '2');
INSERT INTO `d_offline_speech` VALUES ('2642', '15', '173', '2');
INSERT INTO `d_offline_speech` VALUES ('2643', '16', '173', '2');
INSERT INTO `d_offline_speech` VALUES ('2644', '17', '173', '2');
INSERT INTO `d_offline_speech` VALUES ('2645', '18', '173', '2');
INSERT INTO `d_offline_speech` VALUES ('2646', '19', '173', '2');
INSERT INTO `d_offline_speech` VALUES ('2647', '20', '173', '2');
INSERT INTO `d_offline_speech` VALUES ('2648', '21', '173', '2');
INSERT INTO `d_offline_speech` VALUES ('2649', '27', '173', '2');
INSERT INTO `d_offline_speech` VALUES ('2650', '28', '173', '2');
INSERT INTO `d_offline_speech` VALUES ('2651', '29', '173', '2');
INSERT INTO `d_offline_speech` VALUES ('2652', '3', '174', '2');
INSERT INTO `d_offline_speech` VALUES ('2653', '4', '174', '2');
INSERT INTO `d_offline_speech` VALUES ('2654', '6', '174', '2');
INSERT INTO `d_offline_speech` VALUES ('2655', '5', '174', '2');
INSERT INTO `d_offline_speech` VALUES ('2656', '7', '174', '2');
INSERT INTO `d_offline_speech` VALUES ('2657', '8', '174', '2');
INSERT INTO `d_offline_speech` VALUES ('2658', '9', '174', '2');
INSERT INTO `d_offline_speech` VALUES ('2659', '10', '174', '2');
INSERT INTO `d_offline_speech` VALUES ('2660', '11', '174', '2');
INSERT INTO `d_offline_speech` VALUES ('2661', '12', '174', '2');
INSERT INTO `d_offline_speech` VALUES ('2662', '13', '174', '2');
INSERT INTO `d_offline_speech` VALUES ('2663', '14', '174', '2');
INSERT INTO `d_offline_speech` VALUES ('2664', '15', '174', '2');
INSERT INTO `d_offline_speech` VALUES ('2665', '16', '174', '2');
INSERT INTO `d_offline_speech` VALUES ('2666', '17', '174', '2');
INSERT INTO `d_offline_speech` VALUES ('2667', '18', '174', '2');
INSERT INTO `d_offline_speech` VALUES ('2668', '19', '174', '2');
INSERT INTO `d_offline_speech` VALUES ('2669', '20', '174', '2');
INSERT INTO `d_offline_speech` VALUES ('2670', '21', '174', '2');
INSERT INTO `d_offline_speech` VALUES ('2671', '27', '174', '2');
INSERT INTO `d_offline_speech` VALUES ('2672', '28', '174', '2');
INSERT INTO `d_offline_speech` VALUES ('2673', '29', '174', '2');
INSERT INTO `d_offline_speech` VALUES ('2674', '3', '175', '2');
INSERT INTO `d_offline_speech` VALUES ('2675', '4', '175', '2');
INSERT INTO `d_offline_speech` VALUES ('2676', '6', '175', '2');
INSERT INTO `d_offline_speech` VALUES ('2677', '5', '175', '2');
INSERT INTO `d_offline_speech` VALUES ('2678', '7', '175', '2');
INSERT INTO `d_offline_speech` VALUES ('2679', '8', '175', '2');
INSERT INTO `d_offline_speech` VALUES ('2680', '9', '175', '2');
INSERT INTO `d_offline_speech` VALUES ('2681', '10', '175', '2');
INSERT INTO `d_offline_speech` VALUES ('2682', '11', '175', '2');
INSERT INTO `d_offline_speech` VALUES ('2683', '12', '175', '2');
INSERT INTO `d_offline_speech` VALUES ('2684', '13', '175', '2');
INSERT INTO `d_offline_speech` VALUES ('2685', '14', '175', '2');
INSERT INTO `d_offline_speech` VALUES ('2686', '15', '175', '2');
INSERT INTO `d_offline_speech` VALUES ('2687', '16', '175', '2');
INSERT INTO `d_offline_speech` VALUES ('2688', '17', '175', '2');
INSERT INTO `d_offline_speech` VALUES ('2689', '18', '175', '2');
INSERT INTO `d_offline_speech` VALUES ('2690', '19', '175', '2');
INSERT INTO `d_offline_speech` VALUES ('2691', '20', '175', '2');
INSERT INTO `d_offline_speech` VALUES ('2692', '21', '175', '2');
INSERT INTO `d_offline_speech` VALUES ('2693', '27', '175', '2');
INSERT INTO `d_offline_speech` VALUES ('2694', '28', '175', '2');
INSERT INTO `d_offline_speech` VALUES ('2695', '29', '175', '2');

-- ----------------------------
-- Table structure for `d_player`
-- ----------------------------
DROP TABLE IF EXISTS `d_player`;
CREATE TABLE `d_player` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) DEFAULT NULL,
  `role` varchar(32) DEFAULT NULL,
  `game_id` bigint(11) DEFAULT NULL,
  `status` int(5) DEFAULT NULL COMMENT '0 已报名 1待选外在角色 2待3选1 3已选外在身份 4已查看实际身份 7备选法官 8法官 9 已结束',
  `apply_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_player
-- ----------------------------
INSERT INTO `d_player` VALUES ('1', '2', 'judger', '1', '8', '0000-00-00 00:00:00');
INSERT INTO `d_player` VALUES ('2', '3', 'judger', '1', '8', '0000-00-00 00:00:00');
INSERT INTO `d_player` VALUES ('5', '4', 'player', '1', '3', '2016-07-11 14:38:24');
INSERT INTO `d_player` VALUES ('8', '6', 'player', '1', '3', '2016-07-15 11:45:32');
INSERT INTO `d_player` VALUES ('10', '1', 'player', '1', '3', '2016-07-18 10:02:41');
INSERT INTO `d_player` VALUES ('11', '5', 'player', '1', '3', '2016-07-18 11:01:23');
INSERT INTO `d_player` VALUES ('12', '7', 'player', '1', '3', '2016-07-18 11:01:39');
INSERT INTO `d_player` VALUES ('13', '8', 'player', '1', '3', '2016-07-18 11:01:52');
INSERT INTO `d_player` VALUES ('14', '9', 'player', '1', '3', '2016-07-18 11:02:01');
INSERT INTO `d_player` VALUES ('15', '10', 'player', '1', '3', '2016-07-18 11:02:22');
INSERT INTO `d_player` VALUES ('16', '11', 'player', '1', '3', '2016-07-18 11:02:31');
INSERT INTO `d_player` VALUES ('17', '12', 'player', '1', '3', '2016-07-18 11:02:40');
INSERT INTO `d_player` VALUES ('18', '13', 'player', '1', '3', '2016-07-18 11:02:48');
INSERT INTO `d_player` VALUES ('19', '14', 'player', '1', '3', '2016-07-18 11:03:31');
INSERT INTO `d_player` VALUES ('20', '15', 'player', '1', '3', '2016-07-18 11:03:36');
INSERT INTO `d_player` VALUES ('21', '16', 'player', '1', '3', '2016-07-18 11:03:42');
INSERT INTO `d_player` VALUES ('22', '17', 'player', '1', '3', '2016-07-18 11:04:10');
INSERT INTO `d_player` VALUES ('23', '18', 'player', '1', '3', '2016-07-18 11:04:15');
INSERT INTO `d_player` VALUES ('24', '19', 'player', '1', '3', '2016-07-18 11:04:21');
INSERT INTO `d_player` VALUES ('25', '20', 'player', '1', '3', '2016-07-18 11:04:26');
INSERT INTO `d_player` VALUES ('26', '21', 'player', '1', '3', '2016-07-18 11:04:31');
INSERT INTO `d_player` VALUES ('30', '22', 'judger', '5', '8', '2016-07-25 18:03:28');
INSERT INTO `d_player` VALUES ('33', '24', 'player', '5', '3', '2016-07-29 15:55:44');
INSERT INTO `d_player` VALUES ('36', '23', 'player', '5', '1', '2016-07-29 18:09:50');
INSERT INTO `d_player` VALUES ('37', '25', 'player', '5', '1', '2016-08-11 10:37:56');
INSERT INTO `d_player` VALUES ('38', '26', 'player', '5', '1', '2016-08-17 15:26:48');
INSERT INTO `d_player` VALUES ('39', '27', 'player', '1', '3', '2016-08-18 14:42:04');
INSERT INTO `d_player` VALUES ('40', '28', 'player', '1', '3', '2016-08-18 14:43:57');
INSERT INTO `d_player` VALUES ('41', '29', 'player', '1', '1', '2016-08-18 14:44:10');
INSERT INTO `d_player` VALUES ('42', '33', 'player', '5', '1', '2016-09-02 17:39:49');

-- ----------------------------
-- Table structure for `d_player_record`
-- ----------------------------
DROP TABLE IF EXISTS `d_player_record`;
CREATE TABLE `d_player_record` (
  `player_id` bigint(11) NOT NULL,
  `character_id` int(5) DEFAULT NULL,
  `is_sp` varchar(1) DEFAULT '' COMMENT '是否是sp',
  `apply_pioneer` varchar(1) DEFAULT NULL,
  `sign` int(5) DEFAULT '0',
  `identity_desc` varchar(32) DEFAULT NULL,
  `position` int(2) DEFAULT NULL,
  `camp` int(1) DEFAULT NULL,
  `is_life` int(1) DEFAULT NULL COMMENT '0 死亡 1 存活 ',
  `is_mute` int(1) DEFAULT NULL COMMENT '0 未被禁言 1 被禁言',
  `action` varchar(255) DEFAULT NULL,
  `privilege` varchar(255) DEFAULT NULL,
  `feedback` varchar(255) DEFAULT NULL,
  `vote` varchar(255) DEFAULT NULL,
  `submit_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_player_record
-- ----------------------------
INSERT INTO `d_player_record` VALUES ('5', '35', '0', '1', '11', '平民  ', '0', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('8', '38', '0', '1', '8', '刺客  ', '1', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('10', '42', '1', '1', '14', '杀手（手枪）  ', '2', '2', '1', '0', '红色信封 山纳', '', '', '', '2016-09-06 13:44:55', '');
INSERT INTO `d_player_record` VALUES ('11', '43', '0', '1', '4', '警察（雨伞）  ', '3', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('12', '33', '0', '0', '20', '间谍  ', '4', '2', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('13', '26', '0', '1', '10', '官员  ', '5', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('14', '52', '0', '0', '15', '杀手（毒药瓶）  ', '6', '2', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('15', '48', '0', '0', '7', '牧师  ', '7', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('16', '37', '0', '0', '6', '警察（天窗）  ', '8', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('17', '22', '0', '1', '11', '平民  ', '9', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('18', '34', '0', '0', '11', '平民  ', '10', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('19', '10', '0', '0', '9', '医生  ', '11', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('20', '8', '0', '0', '11', '平民  ', '12', '1', '1', '0', '刺杀霍尔', '', '', '马克唐', '2016-08-11 10:28:25', '');
INSERT INTO `d_player_record` VALUES ('21', '36', '0', '0', '3', '警察（星型警徽）  ', '13', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('22', '29', '1', '0', '11', '平民  ', '14', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('23', '1', '1', '1', '12', '先驱  ', '15', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('24', '3', '0', '1', '16', '杀手（套索）  ', '16', '2', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('25', '44', '1', '1', '11', '平民  ', '17', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('26', '41', '0', '0', '23', '帮众  ', '18', '2', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('33', '2', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `d_player_record` VALUES ('39', '54', '1', '0', '22', '暴徒  ', '19', '2', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('40', '21', '0', '0', '21', '巫师  ', '20', '2', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('41', '47', '0', '0', '19', '小偷  ', '21', '2', '1', '0', '', '', '', '', null, '');

-- ----------------------------
-- Table structure for `d_replace_skin`
-- ----------------------------
DROP TABLE IF EXISTS `d_replace_skin`;
CREATE TABLE `d_replace_skin` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `player_id` bigint(11) DEFAULT NULL,
  `character_name` varchar(32) DEFAULT NULL,
  `character_avatar` varchar(32) DEFAULT NULL,
  `is_mute` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_replace_skin
-- ----------------------------
INSERT INTO `d_replace_skin` VALUES ('1', '10', '钱德勒', 'characterAvatar/0245.jpg', '0');

-- ----------------------------
-- Table structure for `d_sign`
-- ----------------------------
DROP TABLE IF EXISTS `d_sign`;
CREATE TABLE `d_sign` (
  `id` int(5) NOT NULL DEFAULT '0',
  `identity` varchar(32) DEFAULT NULL,
  `desc` varchar(32) DEFAULT NULL,
  `camp` int(1) DEFAULT NULL COMMENT '1 好人方 2 杀手方 3 契约方',
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_sign
-- ----------------------------
INSERT INTO `d_sign` VALUES ('1', '警察', '手铐', '1', 'signAvatar/0101.jpg');
INSERT INTO `d_sign` VALUES ('2', '警察', '放大镜', '1', 'signAvatar/0102.jpg');
INSERT INTO `d_sign` VALUES ('3', '警察', '星型警徽', '1', 'signAvatar/0103.jpg');
INSERT INTO `d_sign` VALUES ('4', '警察', '雨伞', '1', 'signAvatar/0104.jpg');
INSERT INTO `d_sign` VALUES ('5', '警察', '问号', '1', 'signAvatar/0105.jpg');
INSERT INTO `d_sign` VALUES ('6', '警察', '天窗', '1', 'signAvatar/0106.jpg');
INSERT INTO `d_sign` VALUES ('7', '牧师', '十字架', '1', 'signAvatar/0107.jpg');
INSERT INTO `d_sign` VALUES ('8', '刺客', '弓箭', '1', 'signAvatar/0108.jpg');
INSERT INTO `d_sign` VALUES ('9', '医生', '针筒', '1', 'signAvatar/0109.jpg');
INSERT INTO `d_sign` VALUES ('10', '官员', '橡皮印章', '1', 'signAvatar/0110.jpg');
INSERT INTO `d_sign` VALUES ('11', '平民', '钱币', '1', 'signAvatar/0112.jpg');
INSERT INTO `d_sign` VALUES ('12', '先驱', '燃烧的钱币', '1', 'signAvatar/0113.jpg');
INSERT INTO `d_sign` VALUES ('13', '杀手', '刀', '2', 'signAvatar/0114.jpg');
INSERT INTO `d_sign` VALUES ('14', '杀手', '手枪', '2', 'signAvatar/0115.jpg');
INSERT INTO `d_sign` VALUES ('15', '杀手', '毒药瓶', '2', 'signAvatar/0116.jpg');
INSERT INTO `d_sign` VALUES ('16', '杀手', '套索', '2', 'signAvatar/0117.jpg');
INSERT INTO `d_sign` VALUES ('17', '杀手', '棍', '2', 'signAvatar/0118.jpg');
INSERT INTO `d_sign` VALUES ('18', '杀手', '扑克牌', '2', 'signAvatar/0119.jpg');
INSERT INTO `d_sign` VALUES ('19', '小偷', '钳子', '2', 'signAvatar/0121.jpg');
INSERT INTO `d_sign` VALUES ('20', '间谍', '眼镜', '2', 'signAvatar/0122.jpg');
INSERT INTO `d_sign` VALUES ('21', '巫师', '手杖', '2', 'signAvatar/0123.jpg');
INSERT INTO `d_sign` VALUES ('22', '暴徒', '炸药', '2', 'signAvatar/0124.jpg');
INSERT INTO `d_sign` VALUES ('23', '帮众', '沾血的钱币', '2', 'signAvatar/0125.jpg');
INSERT INTO `d_sign` VALUES ('24', null, '契约', '3', 'signAvatar/0264.jpg');
INSERT INTO `d_sign` VALUES ('25', null, '双管猎枪', '2', 'signAvatar/0111.jpg');
INSERT INTO `d_sign` VALUES ('26', null, '预告信', '2', 'signAvatar/0120.jpg');
INSERT INTO `d_sign` VALUES ('27', null, '未知', null, 'signAvatar/0251.jpg');
INSERT INTO `d_sign` VALUES ('28', null, '雪茄', '0', 'signAvatar/0126.jpg');

-- ----------------------------
-- Table structure for `d_speech`
-- ----------------------------
DROP TABLE IF EXISTS `d_speech`;
CREATE TABLE `d_speech` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `player_id` bigint(11) DEFAULT NULL,
  `character_name` varchar(32) DEFAULT NULL,
  `character_avatar` varchar(64) DEFAULT NULL,
  `newspaper_id` bigint(11) DEFAULT NULL,
  `content` text,
  `create_time` varchar(32) DEFAULT NULL,
  `type` int(1) DEFAULT NULL COMMENT '1 发言 2 动作 3 公告',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_speech
-- ----------------------------
INSERT INTO `d_speech` VALUES ('173', '10', '恩菲尔德', 'characterAvatar/0254.jpg', '2', '哈哈啊哈哈', '2016/09/06 18:31:28', '1');
INSERT INTO `d_speech` VALUES ('174', '10', '钱德勒', 'characterAvatar/0245.jpg', '2', '大家好', '2016/09/07 11:33:20', '1');
INSERT INTO `d_speech` VALUES ('175', '10', '钱德勒', 'characterAvatar/0245.jpg', '2', '*钱德勒 睡觉', '2016/09/07 11:33:48', '2');

-- ----------------------------
-- Table structure for `d_user`
-- ----------------------------
DROP TABLE IF EXISTS `d_user`;
CREATE TABLE `d_user` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `motto` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_user
-- ----------------------------
INSERT INTO `d_user` VALUES ('1', 'jack3173', 'yesterday', '小风', '我是茉莉，钢琴师', null, null, '2016-09-06 15:11:36', 'userAvatar/1.jpg');
INSERT INTO `d_user` VALUES ('2', 'jack3174', 'yesterday', '大风', '这个人很懒，什么都没写', null, '2016-07-05 13:47:10', null, 'userAvatar/1.jpg');
INSERT INTO `d_user` VALUES ('3', 'jack3175', 'yesterday', '微风', '这个人很懒，什么都没写', null, '2016-07-06 13:12:35', null, null);
INSERT INTO `d_user` VALUES ('4', 'jack3176', 'yesterday', '飓风', '这个人很懒，什么都没写', null, '2016-07-06 15:54:53', null, null);
INSERT INTO `d_user` VALUES ('5', 'jack3178', 'yesterday', '轻风', '这个人很懒，什么都没写', null, '2016-07-11 14:50:47', null, null);
INSERT INTO `d_user` VALUES ('6', 'jack3179', 'yesterday', '凉风', '这个人很懒，什么都没写', null, '2016-07-15 11:45:15', null, null);
INSERT INTO `d_user` VALUES ('7', 'jack3180', 'yesterday', '大大', '这个人很懒，什么都没写', null, '2016-07-18 10:39:08', null, null);
INSERT INTO `d_user` VALUES ('8', 'jack3181', 'yesterday', '小小', '这个人很懒，什么都没写', null, '2016-07-19 10:39:26', null, null);
INSERT INTO `d_user` VALUES ('9', 'jack3182', 'yesterday', '多多', '这个人很懒，什么都没写', null, '2016-07-18 10:39:50', null, null);
INSERT INTO `d_user` VALUES ('10', 'jack3183', 'yesterday', '少少', '这个人很懒，什么都没写', null, '2016-07-18 10:40:26', null, null);
INSERT INTO `d_user` VALUES ('11', 'jack3184', 'yesterday', '慢慢', '这个人很懒，什么都没写', null, '2016-07-18 10:40:45', null, null);
INSERT INTO `d_user` VALUES ('12', 'jack3185', 'yesterday', '快快', '这个人很懒，什么都没写', null, '2016-07-18 10:41:03', null, null);
INSERT INTO `d_user` VALUES ('13', 'jack3186', 'yesterday', '宁静', '这个人很懒，什么都没写', null, '2016-07-19 10:41:23', null, null);
INSERT INTO `d_user` VALUES ('14', 'jack3187', 'yesterday', '行行', '这个人很懒，什么都没写', null, '2016-07-18 10:41:38', null, null);
INSERT INTO `d_user` VALUES ('15', 'jack3188', 'yesterday', '是的', '这个人很懒，什么都没写', null, '2016-07-18 10:58:11', null, null);
INSERT INTO `d_user` VALUES ('16', 'jack3189', 'yesterday', '期望', '这个人很懒，什么都没写', null, '2016-07-18 10:58:27', null, null);
INSERT INTO `d_user` VALUES ('17', 'jack3190', 'yesterday', '欧尼', '这个人很懒，什么都没写', null, '2016-07-18 10:58:45', null, null);
INSERT INTO `d_user` VALUES ('18', 'jack3191', 'yesterday', '而我', '这个人很懒，什么都没写', null, '2016-07-18 10:59:04', null, null);
INSERT INTO `d_user` VALUES ('19', 'jack3192', 'yesterday', '人头', '这个人很懒，什么都没写', null, '2016-07-18 10:59:18', null, null);
INSERT INTO `d_user` VALUES ('20', 'jack3193', 'yesterday', '框架', '这个人很懒，什么都没写', null, '2016-07-18 10:59:32', null, null);
INSERT INTO `d_user` VALUES ('21', 'jack3194', 'yesterday', '吃饭', '这个人很懒，什么都没写', null, '2016-07-18 11:00:25', null, null);
INSERT INTO `d_user` VALUES ('22', 'jack3172', 'yesterday', '美美', '这个人很懒，什么都没写', null, '2016-07-25 17:52:37', null, null);
INSERT INTO `d_user` VALUES ('23', 'jack3171', 'yesterday', '飞飞', '这个人很懒，什么都没写', null, '2016-07-29 10:51:08', null, null);
INSERT INTO `d_user` VALUES ('24', 'jack3170', 'yesterday', '随机', '这个人很懒，什么都没写', null, '2016-07-29 15:55:30', null, null);
INSERT INTO `d_user` VALUES ('25', 'jack3199', 'yesterday', '魅力', null, null, '2016-08-11 10:37:30', null, null);
INSERT INTO `d_user` VALUES ('26', 'jack3198', 'yesterday', '车辆', null, null, '2016-08-17 15:26:38', null, null);
INSERT INTO `d_user` VALUES ('27', 'jack3165', 'yesterday', '看看', null, null, '2016-08-18 14:41:52', null, null);
INSERT INTO `d_user` VALUES ('28', 'jack3166', 'yesterday', '射门', null, null, '2016-08-18 14:43:13', null, null);
INSERT INTO `d_user` VALUES ('29', 'jack3163', 'yesterday', '健康', null, null, '2016-08-18 14:43:33', null, null);
INSERT INTO `d_user` VALUES ('30', 'jack7777', 'yesterday', '合理', null, null, '2016-08-30 18:59:48', null, null);
INSERT INTO `d_user` VALUES ('31', 'jack31999', 'yesterday', '佛像', null, null, '2016-08-30 19:01:29', null, null);
INSERT INTO `d_user` VALUES ('33', 'jack3155', 'yesterday', '花花', '\"这个人太懒，什么都没写\"', null, '2016-09-02 17:21:57', null, 'userAvatar/33.jpg');
INSERT INTO `d_user` VALUES ('34', 'jack3133', 'yesterday', '哈哈', '这个人太懒，什么都没写', null, '2016-09-06 18:47:48', null, 'userAvatar/default.jpg');
