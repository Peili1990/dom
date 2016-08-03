/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : dom

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-08-03 18:12:15
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
  `has_sp` varchar(1) DEFAULT NULL,
  `tag` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_character
-- ----------------------------
INSERT INTO `d_character` VALUES ('1', '爱德华', '0', '24', null, '1', null);
INSERT INTO `d_character` VALUES ('2', '马丁', '0', '31', null, '0', null);
INSERT INTO `d_character` VALUES ('3', '托马斯', '0', '29', null, '0', null);
INSERT INTO `d_character` VALUES ('4', '白瑞摩', '0', '33', null, '0', null);
INSERT INTO `d_character` VALUES ('5', '伊卡', '1', '20', null, '1', null);
INSERT INTO `d_character` VALUES ('6', '珀利', '1', '24', null, '0', null);
INSERT INTO `d_character` VALUES ('7', '莫利', '1', '28', null, '1', null);
INSERT INTO `d_character` VALUES ('8', '沃兹沃斯', '1', '27', null, '0', null);
INSERT INTO `d_character` VALUES ('9', '伊奥克', '0', '21', null, '0', null);
INSERT INTO `d_character` VALUES ('10', '奈斯', '0', '50', null, '0', null);
INSERT INTO `d_character` VALUES ('11', '曼顿', '0', '56', null, '0', null);
INSERT INTO `d_character` VALUES ('12', '朗斯特里特', '0', '43', null, '0', null);
INSERT INTO `d_character` VALUES ('13', '普拉马逊斯', '0', '45', null, '0', null);
INSERT INTO `d_character` VALUES ('14', '舒马赫', '1', '53', null, '0', null);
INSERT INTO `d_character` VALUES ('15', '道格拉斯', '1', '47', null, '0', null);
INSERT INTO `d_character` VALUES ('16', '科尔比', '1', '40', null, '0', null);
INSERT INTO `d_character` VALUES ('17', '欧希玛', '1', '49', null, '0', null);
INSERT INTO `d_character` VALUES ('18', '梅特卡夫', '0', '38', null, '0', null);
INSERT INTO `d_character` VALUES ('19', '哈代', '0', '63', null, '1', null);
INSERT INTO `d_character` VALUES ('20', '盖茨', '0', '66', null, '0', null);
INSERT INTO `d_character` VALUES ('21', '斯达福斯', '1', '67', null, '0', null);
INSERT INTO `d_character` VALUES ('22', '托兰', '1', '74', null, '0', null);
INSERT INTO `d_character` VALUES ('23', '查西', '0', '71', null, '0', null);
INSERT INTO `d_character` VALUES ('24', '斯布兰奇', '1', '64', null, '0', null);
INSERT INTO `d_character` VALUES ('25', '坦尼森', '1', '69', null, '0', null);
INSERT INTO `d_character` VALUES ('26', '德雷顿', '1', '65', null, '0', null);
INSERT INTO `d_character` VALUES ('27', '奎勒', '0', '78', null, '0', null);
INSERT INTO `d_character` VALUES ('28', '威廉姆斯', '0', '48', null, '1', null);
INSERT INTO `d_character` VALUES ('29', '尤里', '0', '36', null, '0', null);
INSERT INTO `d_character` VALUES ('30', '安德安纳', '0', '30', null, '0', null);
INSERT INTO `d_character` VALUES ('31', '劳伦', '0', '52', null, '1', null);
INSERT INTO `d_character` VALUES ('32', '豪', '1', '46', null, '0', null);
INSERT INTO `d_character` VALUES ('33', '阿修', '1', '45', null, '0', null);
INSERT INTO `d_character` VALUES ('34', '卡布莱', '1', '55', null, '0', null);
INSERT INTO `d_character` VALUES ('35', '叶什（妹）', '1', '22', null, '0', null);
INSERT INTO `d_character` VALUES ('36', '扬', '1', '26', null, '0', null);
INSERT INTO `d_character` VALUES ('37', '赫本', '1', '23', null, '0', null);
INSERT INTO `d_character` VALUES ('38', '卓尔', '0', '39', null, '1', null);
INSERT INTO `d_character` VALUES ('39', '艾尔威', '1', '73', null, '0', null);
INSERT INTO `d_character` VALUES ('40', '山纳', '0', '54', null, '0', null);
INSERT INTO `d_character` VALUES ('41', '叶什（兄）', '0', '35', null, '1', null);
INSERT INTO `d_character` VALUES ('42', '钱德勒', '2', '41', null, '0', null);
INSERT INTO `d_character` VALUES ('43', '霍尔', '1', '20', null, '1', null);
INSERT INTO `d_character` VALUES ('44', '恩菲尔德', '1', '0', null, '0', null);
INSERT INTO `d_character` VALUES ('45', '布莱克', '0', '80', null, '0', null);
INSERT INTO `d_character` VALUES ('46', '李', '0', '62', null, '0', null);
INSERT INTO `d_character` VALUES ('47', '厄金特', '1', '76', null, '0', null);
INSERT INTO `d_character` VALUES ('48', '昆西', '1', '34', null, '0', null);
INSERT INTO `d_character` VALUES ('49', '马克唐', '0', '77', null, '0', null);
INSERT INTO `d_character` VALUES ('50', '约翰逊', '1', '51', null, '1', null);
INSERT INTO `d_character` VALUES ('51', '欧内斯特', '1', '60', null, '0', null);
INSERT INTO `d_character` VALUES ('52', '浮士德', '0', '58', null, '0', null);
INSERT INTO `d_character` VALUES ('53', '德.圣地亚哥', '0', '72', null, '0', null);
INSERT INTO `d_character` VALUES ('54', '温切斯特', '2', '68', null, '0', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_form
-- ----------------------------
INSERT INTO `d_form` VALUES ('28', '1', '游戏开始前', '[{\"playerId\":5,\"characterName\":\"珀利\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"杀手（毒药瓶）\",\"camp\":2,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":8,\"characterName\":\"sp伊卡\",\"isSp\":\"1\",\"sign\":null,\"identityDesc\":\"官员\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":10,\"characterName\":\"山纳\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"暴徒\",\"camp\":2,\"isLife\":1,\"isMute\":0,\"action\":\"查验A\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":11,\"characterName\":\"sp哈代\",\"isSp\":\"1\",\"sign\":null,\"identityDesc\":\"平民\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":12,\"characterName\":\"爱德华\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"先驱\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":13,\"characterName\":\"叶什（妹）\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"巫师\",\"camp\":2,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":14,\"characterName\":\"卓尔\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"间谍\",\"camp\":2,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":15,\"characterName\":\"白瑞摩\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"警察（雨伞）\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":16,\"characterName\":\"赫本\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"平民\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":17,\"characterName\":\"安德安纳\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"医生\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":18,\"characterName\":\"科尔比\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"刺客\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":19,\"characterName\":\"斯达福斯\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"杀手（手枪）\",\"camp\":2,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":20,\"characterName\":\"伊奥克\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"平民\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":21,\"characterName\":\"奎勒\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"平民\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":22,\"characterName\":\"厄金特\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"警察（放大镜）\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":23,\"characterName\":\"sp叶什（兄）\",\"isSp\":\"1\",\"sign\":null,\"identityDesc\":\"小偷\",\"camp\":2,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":24,\"characterName\":\"温切斯特\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"牧师\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":25,\"characterName\":\"昆西\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"平民\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":26,\"characterName\":\"马丁\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"帮众\",\"camp\":2,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"}]', '2016-07-25 18:04:41', '2016-07-25 18:05:09');
INSERT INTO `d_form` VALUES ('29', '1', '第一夜', null, '2016-07-25 18:05:09', null);

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
  `qq_group` varchar(32) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_game
-- ----------------------------
INSERT INTO `d_game` VALUES ('1', '16NV', 'B', '19', '3', '2016-07-15', null, null, null, null);
INSERT INTO `d_game` VALUES ('5', '20NV', 'A', '19', '1', '2016-07-26', null, null, '132697360', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_newspaper
-- ----------------------------
INSERT INTO `d_newspaper` VALUES ('1', '5', '7月5日日刊（开版公告）', '小镇受西部铁路公司200万美元投资垂青', '本市西部仅两站<br>维多利亚讯 据可靠消息，今日下午，西部铁路公司董事会发言人特理·亨德曼表明，其第二大股东亨利.刘易斯（左图）即将对本市行政区域内的维多利亚镇进行大规模投资，由铁路运输业带动铁矿、石油的初期计划已经草拟成案。经济学家称该举措即将带来临近地区就业的重整，治安专家则担心大额外来人员对本地区的影响。中部铁运则表明，在铁路运重创的6月后进行这种冒险之举不具长期眼光。<br>维多利亚镇普通镇民，书记官温彻斯特太太表示，“这预示一种时代的变化。当蒸汽机车最终被内燃机车取代的时候，我们知道有些东西不同了。”', '2版政治：在野党质疑政府监管<br>2版经济：周边带动理论 <br>2版金融：华尔街芝加哥工业指数上升24% <br>7版：维多利亚镇的介绍 <br><br>4版<br>西部铁路公司收到匿名警告信 犯罪专家称或非无稽之谈 <br>芝加哥讯 西部铁路公司芝加哥分所近日收到恐吓信，据平克顿侦探所透露，此信来向可推为维多利亚镇。目前警方没有明确透露信的具体内容，但据称为某一组织的某些人员向西部铁路公司某些高层追索“欠款”，并扬言“你们，都得死”。 <br>有证券交易所表明，6月后的会计工作使证券持有人对西部铁路公司表示乐观，然而始终有声音质疑为何西部铁路公司能在6月的N.劳兄弟公司铁路重大事故后保持账面未有亏损。', '哈代死亡。<br><br>哈代遗言：', '<table>\r\n				<tbody>\r\n					<tr>\r\n						<td>恩菲尔德</td>\r\n						<td align=\"center\">霍尔</td>\r\n						<td align=\"right\">欧内斯特</td>\r\n					</tr>\r\n					<tr>\r\n						<td></td>\r\n						<td></td>\r\n						<td align=\"right\">叶妹</td>\r\n					</tr>\r\n					<tr>\r\n						<td>叶兄</td>\r\n						<td></td>\r\n						<td align=\"right\">安德安纳</td>\r\n					</tr>\r\n					<tr>\r\n						<td>哈代【死亡】</td>\r\n						<td></td>\r\n						<td align=\"right\">马克唐</td>\r\n					</tr>\r\n					<tr>\r\n						<td>白瑞摩</td>\r\n						<td></td>\r\n						<td align=\"right\">圣地亚哥</td>\r\n					</tr>\r\n					<tr>\r\n						<td>赫本</td>\r\n						<td></td>\r\n						<td align=\"right\">科尔比</td>\r\n					</tr>\r\n					<tr>\r\n						<td>莫利</td>\r\n						<td></td>\r\n						<td align=\"right\">（布莱克）</td>\r\n					</tr>\r\n					<tr>\r\n						<td>普拉马逊斯</td>\r\n						<td></td>\r\n						<td align=\"right\">昆西</td>\r\n					</tr>\r\n					<tr>\r\n						<td>艾尔威</td>\r\n						<td align=\"center\">劳伦</td>\r\n						<td align=\"right\">伊卡</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>', '2016-07-25 18:03:37', null, null, '1');
INSERT INTO `d_newspaper` VALUES ('2', '1', '7月5日夜刊（开版公告）', '小镇受西部铁路公司200万美元投资垂青', '本市西部仅两站<br>维多利亚讯 据可靠消息，今日下午，西部铁路公司董事会发言人特理·亨德曼表明，其第二大股东亨利.刘易斯（左图）即将对本市行政区域内的维多利亚镇进行大规模投资，由铁路运输业带动铁矿、石油的初期计划已经草拟成案。经济学家称该举措即将带来临近地区就业的重整，治安专家则担心大额外来人员对本地区的影响。中部铁运则表明，在铁路运重创的6月后进行这种冒险之举不具长期眼光。<br>维多利亚镇普通镇民，书记官温彻斯特太太表示，“这预示一种时代的变化。当蒸汽机车最终被内燃机车取代的时候，我们知道有些东西不同了。”', '2版政治：在野党质疑政府监管<br>2版经济：周边带动理论 <br>2版金融：华尔街芝加哥工业指数上升24%  <br>5版 柏林会议进展不顺 <br>6版 清帝国使者离开纽约 <br>7版：维多利亚镇的介绍<br>8版 独立日烟火不慎造成男童落水 <br><br>4版<br>西部铁路公司收到匿名警告信 犯罪专家称或非无稽之谈 <br>芝加哥讯 西部铁路公司芝加哥分所近日收到恐吓信，据平克顿侦探所透露，此信来向可推为维多利亚镇。目前警方没有明确透露信的具体内容，但据称为某一组织的某些人员向西部铁路公司某些高层追索“欠款”，并扬言“你们，都得死”。 <br>有证券交易所表明，6月后的会计工作使证券持有人对西部铁路公司表示乐观，然而始终有声音质疑为何西部铁路公司能在6月的N.劳兄弟公司铁路重大事故后保持账面未有亏损。', '哈代死亡。<br><br>哈代遗言：', '<table><tbody><tr><td>珀利</td><td align=\"center\">伊卡</td><td align=\"right\">山纳</td></tr><tr><td></td><td></td><td align=\"right\">哈代</td></tr><tr><td>马丁</td><td></td><td align=\"right\">爱德华</td></tr><tr><td>昆西</td><td></td><td align=\"right\">叶什（妹）</td></tr><tr><td>温切斯特</td><td></td><td align=\"right\">卓尔</td></tr><tr><td>叶什（兄）</td><td></td><td align=\"right\">白瑞摩</td></tr><tr><td>厄金特</td><td></td><td align=\"right\">赫本</td></tr><tr><td>奎勒</td><td></td><td align=\"right\">安德安纳</td></tr><tr><td>伊奥克</td><td align=\"center\">斯达福斯</td><td align=\"right\">科尔比</td></tr></tbody></table>', '2016-07-27 17:07:07', '2016-07-28 15:38:24', '1', '1');

-- ----------------------------
-- Table structure for `d_offline_message`
-- ----------------------------
DROP TABLE IF EXISTS `d_offline_message`;
CREATE TABLE `d_offline_message` (
  `id` bigint(11) NOT NULL,
  `user_id` bigint(11) DEFAULT NULL,
  `chat_id` bigint(11) DEFAULT NULL,
  `content` text,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_offline_message
-- ----------------------------

-- ----------------------------
-- Table structure for `d_offline_speech`
-- ----------------------------
DROP TABLE IF EXISTS `d_offline_speech`;
CREATE TABLE `d_offline_speech` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) DEFAULT NULL,
  `speech_id` bigint(11) DEFAULT NULL,
  `newspapaer_id` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=846 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_offline_speech
-- ----------------------------
INSERT INTO `d_offline_speech` VALUES ('759', '6', '45', '0');
INSERT INTO `d_offline_speech` VALUES ('760', '5', '45', '0');
INSERT INTO `d_offline_speech` VALUES ('761', '7', '45', '0');
INSERT INTO `d_offline_speech` VALUES ('762', '8', '45', '0');
INSERT INTO `d_offline_speech` VALUES ('763', '9', '45', '0');
INSERT INTO `d_offline_speech` VALUES ('764', '10', '45', '0');
INSERT INTO `d_offline_speech` VALUES ('765', '11', '45', '0');
INSERT INTO `d_offline_speech` VALUES ('766', '12', '45', '0');
INSERT INTO `d_offline_speech` VALUES ('767', '13', '45', '0');
INSERT INTO `d_offline_speech` VALUES ('768', '14', '45', '0');
INSERT INTO `d_offline_speech` VALUES ('769', '15', '45', '0');
INSERT INTO `d_offline_speech` VALUES ('770', '16', '45', '0');
INSERT INTO `d_offline_speech` VALUES ('771', '17', '45', '0');
INSERT INTO `d_offline_speech` VALUES ('772', '18', '45', '0');
INSERT INTO `d_offline_speech` VALUES ('773', '19', '45', '0');
INSERT INTO `d_offline_speech` VALUES ('774', '20', '45', '0');
INSERT INTO `d_offline_speech` VALUES ('775', '21', '45', '0');
INSERT INTO `d_offline_speech` VALUES ('776', '6', '46', '0');
INSERT INTO `d_offline_speech` VALUES ('777', '5', '46', '0');
INSERT INTO `d_offline_speech` VALUES ('778', '7', '46', '0');
INSERT INTO `d_offline_speech` VALUES ('779', '8', '46', '0');
INSERT INTO `d_offline_speech` VALUES ('780', '9', '46', '0');
INSERT INTO `d_offline_speech` VALUES ('781', '10', '46', '0');
INSERT INTO `d_offline_speech` VALUES ('782', '11', '46', '0');
INSERT INTO `d_offline_speech` VALUES ('783', '12', '46', '0');
INSERT INTO `d_offline_speech` VALUES ('784', '13', '46', '0');
INSERT INTO `d_offline_speech` VALUES ('785', '14', '46', '0');
INSERT INTO `d_offline_speech` VALUES ('786', '15', '46', '0');
INSERT INTO `d_offline_speech` VALUES ('787', '16', '46', '0');
INSERT INTO `d_offline_speech` VALUES ('788', '17', '46', '0');
INSERT INTO `d_offline_speech` VALUES ('789', '18', '46', '0');
INSERT INTO `d_offline_speech` VALUES ('790', '19', '46', '0');
INSERT INTO `d_offline_speech` VALUES ('791', '20', '46', '0');
INSERT INTO `d_offline_speech` VALUES ('792', '21', '46', '0');
INSERT INTO `d_offline_speech` VALUES ('793', '6', '47', '0');
INSERT INTO `d_offline_speech` VALUES ('794', '5', '47', '0');
INSERT INTO `d_offline_speech` VALUES ('795', '7', '47', '0');
INSERT INTO `d_offline_speech` VALUES ('796', '8', '47', '0');
INSERT INTO `d_offline_speech` VALUES ('797', '9', '47', '0');
INSERT INTO `d_offline_speech` VALUES ('798', '10', '47', '0');
INSERT INTO `d_offline_speech` VALUES ('799', '11', '47', '0');
INSERT INTO `d_offline_speech` VALUES ('800', '12', '47', '0');
INSERT INTO `d_offline_speech` VALUES ('801', '13', '47', '0');
INSERT INTO `d_offline_speech` VALUES ('802', '14', '47', '0');
INSERT INTO `d_offline_speech` VALUES ('803', '15', '47', '0');
INSERT INTO `d_offline_speech` VALUES ('804', '16', '47', '0');
INSERT INTO `d_offline_speech` VALUES ('805', '17', '47', '0');
INSERT INTO `d_offline_speech` VALUES ('806', '18', '47', '0');
INSERT INTO `d_offline_speech` VALUES ('807', '19', '47', '0');
INSERT INTO `d_offline_speech` VALUES ('808', '20', '47', '0');
INSERT INTO `d_offline_speech` VALUES ('809', '21', '47', '0');
INSERT INTO `d_offline_speech` VALUES ('810', '4', '48', '0');
INSERT INTO `d_offline_speech` VALUES ('811', '6', '48', '0');
INSERT INTO `d_offline_speech` VALUES ('812', '1', '48', '0');
INSERT INTO `d_offline_speech` VALUES ('813', '5', '48', '0');
INSERT INTO `d_offline_speech` VALUES ('814', '8', '48', '0');
INSERT INTO `d_offline_speech` VALUES ('815', '9', '48', '0');
INSERT INTO `d_offline_speech` VALUES ('816', '10', '48', '0');
INSERT INTO `d_offline_speech` VALUES ('817', '11', '48', '0');
INSERT INTO `d_offline_speech` VALUES ('818', '12', '48', '0');
INSERT INTO `d_offline_speech` VALUES ('819', '13', '48', '0');
INSERT INTO `d_offline_speech` VALUES ('820', '14', '48', '0');
INSERT INTO `d_offline_speech` VALUES ('821', '15', '48', '0');
INSERT INTO `d_offline_speech` VALUES ('822', '16', '48', '0');
INSERT INTO `d_offline_speech` VALUES ('823', '17', '48', '0');
INSERT INTO `d_offline_speech` VALUES ('824', '18', '48', '0');
INSERT INTO `d_offline_speech` VALUES ('825', '19', '48', '0');
INSERT INTO `d_offline_speech` VALUES ('826', '20', '48', '0');
INSERT INTO `d_offline_speech` VALUES ('827', '21', '48', '0');
INSERT INTO `d_offline_speech` VALUES ('828', '4', '49', '0');
INSERT INTO `d_offline_speech` VALUES ('829', '1', '49', '0');
INSERT INTO `d_offline_speech` VALUES ('830', '5', '49', '0');
INSERT INTO `d_offline_speech` VALUES ('831', '7', '49', '0');
INSERT INTO `d_offline_speech` VALUES ('832', '8', '49', '0');
INSERT INTO `d_offline_speech` VALUES ('833', '9', '49', '0');
INSERT INTO `d_offline_speech` VALUES ('834', '10', '49', '0');
INSERT INTO `d_offline_speech` VALUES ('835', '11', '49', '0');
INSERT INTO `d_offline_speech` VALUES ('836', '12', '49', '0');
INSERT INTO `d_offline_speech` VALUES ('837', '13', '49', '0');
INSERT INTO `d_offline_speech` VALUES ('838', '14', '49', '0');
INSERT INTO `d_offline_speech` VALUES ('839', '15', '49', '0');
INSERT INTO `d_offline_speech` VALUES ('840', '16', '49', '0');
INSERT INTO `d_offline_speech` VALUES ('841', '17', '49', '0');
INSERT INTO `d_offline_speech` VALUES ('842', '18', '49', '0');
INSERT INTO `d_offline_speech` VALUES ('843', '19', '49', '0');
INSERT INTO `d_offline_speech` VALUES ('844', '20', '49', '0');
INSERT INTO `d_offline_speech` VALUES ('845', '21', '49', '0');

-- ----------------------------
-- Table structure for `d_player`
-- ----------------------------
DROP TABLE IF EXISTS `d_player`;
CREATE TABLE `d_player` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) DEFAULT NULL,
  `role` varchar(32) DEFAULT NULL,
  `game_id` bigint(11) DEFAULT NULL,
  `status` int(5) DEFAULT NULL COMMENT '0 已报名 1待选外在角色 2待3选1 3已选外在身份 4已查看实际身份 9 已结束',
  `apply_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_player
-- ----------------------------
INSERT INTO `d_player` VALUES ('1', '2', 'judger', '1', null, '0000-00-00 00:00:00');
INSERT INTO `d_player` VALUES ('2', '3', 'judger', '1', null, '0000-00-00 00:00:00');
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
INSERT INTO `d_player` VALUES ('30', '22', 'judger', '5', null, '2016-07-25 18:03:28');
INSERT INTO `d_player` VALUES ('33', '24', 'player', '5', '3', '2016-07-29 15:55:44');
INSERT INTO `d_player` VALUES ('36', '23', 'player', '5', '1', '2016-07-29 18:09:50');

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
INSERT INTO `d_player_record` VALUES ('5', '6', '0', '1', '15', '杀手（毒药瓶）', '2', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('8', '5', '1', '0', '10', '官员', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('10', '40', '0', '0', '22', '暴徒', '2', '1', '0', '红色信封 山纳', '', '', '', '2016-07-29 16:38:23', '');
INSERT INTO `d_player_record` VALUES ('11', '19', '1', '0', '11', '平民', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('12', '1', '0', '1', '12', '先驱', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('13', '35', '0', '0', '21', '巫师', '2', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('14', '38', '0', '0', '20', '间谍', '2', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('15', '4', '0', '0', '4', '警察（雨伞）', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('16', '37', '0', '0', '11', '平民', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('17', '30', '0', '0', '9', '医生', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('18', '16', '0', '0', '8', '刺客', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('19', '21', '0', '0', '14', '杀手（手枪）', '2', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('20', '9', '0', '0', '11', '平民', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('21', '27', '0', '0', '11', '平民', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('22', '47', '0', '1', '2', '警察（放大镜）', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('23', '41', '1', '0', '19', '小偷', '2', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('24', '54', '0', '0', '7', '牧师', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('25', '48', '0', '0', '11', '平民', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('26', '2', '0', '1', '23', '帮众', '2', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('33', '2', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);

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
INSERT INTO `d_sign` VALUES ('1', '警察', '手铐', '1', null);
INSERT INTO `d_sign` VALUES ('2', '警察', '放大镜', '1', null);
INSERT INTO `d_sign` VALUES ('3', '警察', '星型警徽', '1', null);
INSERT INTO `d_sign` VALUES ('4', '警察', '雨伞', '1', null);
INSERT INTO `d_sign` VALUES ('5', '警察', '问号', '1', null);
INSERT INTO `d_sign` VALUES ('6', '警察', '天窗', '1', null);
INSERT INTO `d_sign` VALUES ('7', '牧师', '十字架', '1', null);
INSERT INTO `d_sign` VALUES ('8', '刺客', '弓箭', '1', null);
INSERT INTO `d_sign` VALUES ('9', '医生', '针筒', '1', null);
INSERT INTO `d_sign` VALUES ('10', '官员', '橡皮印章', '1', null);
INSERT INTO `d_sign` VALUES ('11', '平民', '钱币', '1', null);
INSERT INTO `d_sign` VALUES ('12', '先驱', '燃烧的钱币', '1', null);
INSERT INTO `d_sign` VALUES ('13', '杀手', '刀', '2', null);
INSERT INTO `d_sign` VALUES ('14', '杀手', '手枪', '2', null);
INSERT INTO `d_sign` VALUES ('15', '杀手', '毒药瓶', '2', null);
INSERT INTO `d_sign` VALUES ('16', '杀手', '套索', '2', null);
INSERT INTO `d_sign` VALUES ('17', '杀手', '棍', '2', null);
INSERT INTO `d_sign` VALUES ('18', '杀手', '扑克牌', '2', null);
INSERT INTO `d_sign` VALUES ('19', '小偷', '钳子', '2', null);
INSERT INTO `d_sign` VALUES ('20', '间谍', '眼镜', '2', null);
INSERT INTO `d_sign` VALUES ('21', '巫师', '手杖', '2', null);
INSERT INTO `d_sign` VALUES ('22', '暴徒', '炸药', '2', null);
INSERT INTO `d_sign` VALUES ('23', '帮众', '沾血的钱币', '2', null);
INSERT INTO `d_sign` VALUES ('24', null, '契约', '3', null);

-- ----------------------------
-- Table structure for `d_speech`
-- ----------------------------
DROP TABLE IF EXISTS `d_speech`;
CREATE TABLE `d_speech` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `player_id` bigint(11) DEFAULT NULL,
  `character_id` int(5) DEFAULT NULL,
  `newspaper_id` bigint(11) DEFAULT NULL,
  `content` text,
  `create_time` datetime DEFAULT NULL,
  `type` int(1) DEFAULT NULL COMMENT '1 发言 2 动作',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_speech
-- ----------------------------
INSERT INTO `d_speech` VALUES ('1', '10', '40', '2', '123', '2016-08-02 16:14:20', '1');
INSERT INTO `d_speech` VALUES ('2', '10', '40', '2', '我就是我，是不一样的烟火', '2016-08-03 11:07:16', '1');
INSERT INTO `d_speech` VALUES ('7', '10', '40', '2', '我就是我，是不一样的烟火\n谁敢杀我！', '2016-08-03 11:40:34', '1');
INSERT INTO `d_speech` VALUES ('8', '10', '40', '2', '叔叔说\n实话实说', '2016-08-03 11:41:34', '1');
INSERT INTO `d_speech` VALUES ('9', '10', '40', '2', '123h \n萨芬金坷垃神经分裂\n啊是', '2016-08-03 11:41:54', '1');
INSERT INTO `d_speech` VALUES ('10', '10', '40', '2', '上的发挥空间\n是否还记得', '2016-08-03 11:42:12', '1');
INSERT INTO `d_speech` VALUES ('11', '10', '40', '2', '啊啊啊啊', '2016-08-03 11:43:13', '1');
INSERT INTO `d_speech` VALUES ('12', '10', '40', '2', '', '2016-08-03 11:43:17', '1');
INSERT INTO `d_speech` VALUES ('13', '10', '40', '2', '撒发生', '2016-08-03 11:43:42', '1');
INSERT INTO `d_speech` VALUES ('14', '10', '40', '2', '1234', '2016-08-03 13:22:31', '1');
INSERT INTO `d_speech` VALUES ('15', '10', '40', '2', '123', '2016-08-03 13:22:57', '1');
INSERT INTO `d_speech` VALUES ('16', '10', '40', '2', '12345', '2016-08-03 13:23:31', '1');
INSERT INTO `d_speech` VALUES ('17', '10', '40', '2', '123', '2016-08-03 13:25:10', '1');
INSERT INTO `d_speech` VALUES ('18', '10', '40', '2', '1231', '2016-08-03 13:26:46', '1');
INSERT INTO `d_speech` VALUES ('19', '10', '40', '2', '123', '2016-08-03 13:28:31', '1');
INSERT INTO `d_speech` VALUES ('20', '10', '40', '2', '3543', '2016-08-03 13:28:36', '1');
INSERT INTO `d_speech` VALUES ('21', '5', '6', '2', '哈哈哈', '2016-08-03 13:30:01', '1');
INSERT INTO `d_speech` VALUES ('22', '5', '6', '2', '哈哈哈', '2016-08-03 13:30:17', '1');
INSERT INTO `d_speech` VALUES ('23', '5', '6', '2', '我就说他是假的吧', '2016-08-03 13:30:46', '1');
INSERT INTO `d_speech` VALUES ('24', '10', '40', '2', '1234', '2016-08-03 13:39:32', '1');
INSERT INTO `d_speech` VALUES ('25', '10', '40', '2', '我就是我<br>是不一样的焰火', '2016-08-03 13:49:49', '1');
INSERT INTO `d_speech` VALUES ('26', '10', '40', '2', '1234', '2016-08-03 13:54:58', '1');
INSERT INTO `d_speech` VALUES ('27', '10', '40', '2', '6533453', '2016-08-03 13:55:03', '1');
INSERT INTO `d_speech` VALUES ('28', '10', '40', '2', '500', '2016-08-03 13:55:55', '1');
INSERT INTO `d_speech` VALUES ('29', '10', '40', '2', '677', '2016-08-03 13:55:58', '1');
INSERT INTO `d_speech` VALUES ('30', '10', '40', '2', '123', '2016-08-03 14:51:39', '1');
INSERT INTO `d_speech` VALUES ('31', '5', '6', '2', '383772', '2016-08-03 14:52:03', '1');
INSERT INTO `d_speech` VALUES ('32', '5', '6', '2', '', '2016-08-03 14:52:03', '1');
INSERT INTO `d_speech` VALUES ('33', '5', '6', '2', '', '2016-08-03 14:53:04', '1');
INSERT INTO `d_speech` VALUES ('34', '5', '6', '2', '饿的说', '2016-08-03 14:53:05', '1');
INSERT INTO `d_speech` VALUES ('35', '5', '6', '2', '活活烧死', '2016-08-03 14:53:17', '1');
INSERT INTO `d_speech` VALUES ('36', '5', '6', '2', '', '2016-08-03 14:53:17', '1');
INSERT INTO `d_speech` VALUES ('37', '10', '40', '2', '123', '2016-08-03 14:53:48', '1');
INSERT INTO `d_speech` VALUES ('38', '10', '40', '2', '123', '2016-08-03 14:53:57', '1');
INSERT INTO `d_speech` VALUES ('39', '10', '40', '2', '123', '2016-08-03 14:54:25', '1');
INSERT INTO `d_speech` VALUES ('40', '10', '40', '2', '123', '2016-08-03 14:55:40', '1');
INSERT INTO `d_speech` VALUES ('41', '10', '40', '2', '123', '2016-08-03 14:55:45', '1');
INSERT INTO `d_speech` VALUES ('42', '10', '40', '2', '123', '2016-08-03 14:58:19', '1');
INSERT INTO `d_speech` VALUES ('43', '10', '40', '2', '123', '2016-08-03 14:58:23', '1');
INSERT INTO `d_speech` VALUES ('44', '10', '40', '2', '123', '2016-08-03 14:58:27', '1');
INSERT INTO `d_speech` VALUES ('45', '10', '40', '2', '123', '2016-08-03 15:11:26', '1');
INSERT INTO `d_speech` VALUES ('46', '10', '40', '2', '123', '2016-08-03 15:24:14', '1');
INSERT INTO `d_speech` VALUES ('47', '5', '6', '2', '1234', '2016-08-03 15:25:01', '1');
INSERT INTO `d_speech` VALUES ('48', '12', '1', '2', '123', '2016-08-03 17:28:16', '1');
INSERT INTO `d_speech` VALUES ('49', '12', '1', '2', '1234', '2016-08-03 17:29:00', '1');

-- ----------------------------
-- Table structure for `d_user`
-- ----------------------------
DROP TABLE IF EXISTS `d_user`;
CREATE TABLE `d_user` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_user
-- ----------------------------
INSERT INTO `d_user` VALUES ('1', 'jack3173', 'yesterday', '小风', null, null, null);
INSERT INTO `d_user` VALUES ('2', 'jack3174', 'yesterday', '大风', null, '2016-07-05 13:47:10', null);
INSERT INTO `d_user` VALUES ('3', 'jack3175', 'yesterday', '微风', null, '2016-07-06 13:12:35', null);
INSERT INTO `d_user` VALUES ('4', 'jack3176', 'yesterday', '飓风', null, '2016-07-06 15:54:53', null);
INSERT INTO `d_user` VALUES ('5', 'jack3178', 'yesterday', '轻风', null, '2016-07-11 14:50:47', null);
INSERT INTO `d_user` VALUES ('6', 'jack3179', 'yesterday', '凉风', null, '2016-07-15 11:45:15', null);
INSERT INTO `d_user` VALUES ('7', 'jack3180', 'yesterday', '大大', null, '2016-07-18 10:39:08', null);
INSERT INTO `d_user` VALUES ('8', 'jack3181', 'yesterday', '小小', null, '2016-07-19 10:39:26', null);
INSERT INTO `d_user` VALUES ('9', 'jack3182', 'yesterday', '多多', null, '2016-07-18 10:39:50', null);
INSERT INTO `d_user` VALUES ('10', 'jack3183', 'yesterday', '少少', null, '2016-07-18 10:40:26', null);
INSERT INTO `d_user` VALUES ('11', 'jack3184', 'yesterday', '慢慢', null, '2016-07-18 10:40:45', null);
INSERT INTO `d_user` VALUES ('12', 'jack3185', 'yesterday', '快快', null, '2016-07-18 10:41:03', null);
INSERT INTO `d_user` VALUES ('13', 'jack3186', 'yesterday', '宁静', null, '2016-07-19 10:41:23', null);
INSERT INTO `d_user` VALUES ('14', 'jack3187', 'yesterday', '行行', null, '2016-07-18 10:41:38', null);
INSERT INTO `d_user` VALUES ('15', 'jack3188', 'yesterday', '是的', null, '2016-07-18 10:58:11', null);
INSERT INTO `d_user` VALUES ('16', 'jack3189', 'yesterday', '期望', null, '2016-07-18 10:58:27', null);
INSERT INTO `d_user` VALUES ('17', 'jack3190', 'yesterday', '欧尼', null, '2016-07-18 10:58:45', null);
INSERT INTO `d_user` VALUES ('18', 'jack3191', 'yesterday', '而我', null, '2016-07-18 10:59:04', null);
INSERT INTO `d_user` VALUES ('19', 'jack3192', 'yesterday', '人头', null, '2016-07-18 10:59:18', null);
INSERT INTO `d_user` VALUES ('20', 'jack3193', 'yesterday', '框架', null, '2016-07-18 10:59:32', null);
INSERT INTO `d_user` VALUES ('21', 'jack3194', 'yesterday', '吃饭', null, '2016-07-18 11:00:25', null);
INSERT INTO `d_user` VALUES ('22', 'jack3172', 'yesterday', '美美', null, '2016-07-25 17:52:37', null);
INSERT INTO `d_user` VALUES ('23', 'jack3171', 'yesterday', '飞飞', null, '2016-07-29 10:51:08', null);
INSERT INTO `d_user` VALUES ('24', 'jack3170', 'yesterday', '随机', null, '2016-07-29 15:55:30', null);
