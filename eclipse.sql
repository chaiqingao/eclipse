/*
Navicat MySQL Data Transfer

Source Server         : mysqlnav
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : eclipse

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2020-09-22 10:50:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for chinaeclipse
-- ----------------------------
DROP TABLE IF EXISTS `chinaeclipse`;
CREATE TABLE `chinaeclipse` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date` varchar(255) DEFAULT NULL,
  `date_str` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `location_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chinaeclipse
-- ----------------------------
INSERT INTO `chinaeclipse` VALUES ('1', '2009/7/22', '20090722', '全食', '安徽，湖北，湖南，江苏，江西，上海，四川，西藏，云南，浙江', 'Anhui, Hubei, Hunan, Jiangsu, Jiangxi, Shanghai, Sichuan, Xizang, Yunnan, Zhejiang');
INSERT INTO `chinaeclipse` VALUES ('2', '2010/1/15', '20100115', '环食', '安徽，贵州，河南，湖北，湖南，江苏，山东，四川，云南', 'Anhui, Guizhou, Henan, Hubei, Hunan, Jiangsu, Shandong, Sichuan, Yunnan');
INSERT INTO `chinaeclipse` VALUES ('3', '2012/5/21', '20120521', '环食', '福建，广东，广西，江西，台湾，浙江', 'Fujian, Guangdong, Guangxi, Jiangxi, Taiwan, Zhejiang');
INSERT INTO `chinaeclipse` VALUES ('4', '2020/6/21', '20200621', '环食', '福建，广东，广西，贵州，江西，四川，台湾，西藏', 'Fujian, Guangdong, Guangxi, Guizhou, Jiangxi, Sichuan, Taiwan, Xizang');
INSERT INTO `chinaeclipse` VALUES ('5', '2030/6/1', '20300601', '环食', '黑龙江，内蒙古', 'Heilongjiang, Neimenggu');
INSERT INTO `chinaeclipse` VALUES ('6', '2034/3/20', '20340320', '全食', '西藏', 'Xizang');
INSERT INTO `chinaeclipse` VALUES ('7', '2035/9/2', '20350902', '全食', '北京，甘肃，河北，辽宁，内蒙古，天津，新疆', 'Beijing, Gansu, Hebei, Liaoning, Neimenggu, Tianjin, Xinjiang');
INSERT INTO `chinaeclipse` VALUES ('8', '2041/10/25', '20411025', '环食', '吉林，辽宁，内蒙古', 'Jilin, Liaoning, Neimenggu');
INSERT INTO `chinaeclipse` VALUES ('9', '2060/4/30', '20600430', '全食', '甘肃，青海，陕西，新疆', 'Gansu, Qinghai, Shaanxi, Xinjiang');
INSERT INTO `chinaeclipse` VALUES ('10', '2063/8/24', '20630824', '全食', '吉林，内蒙古，新疆', 'Jilin, Neimenggu, Xinjiang');
INSERT INTO `chinaeclipse` VALUES ('11', '2064/2/17', '20640217', '环食', '甘肃，黑龙江，吉林，内蒙古，宁夏，青海，山西，西藏', 'Gansu, Heilongjiang, Jilin, Neimenggu, Ningxia, Qinghai, Shanxi, Xizang');
INSERT INTO `chinaeclipse` VALUES ('12', '2070/4/11', '20700411', '全食', '台湾', 'Taiwan');
INSERT INTO `chinaeclipse` VALUES ('13', '2074/1/27', '20740127', '环食', '福建，广东，广西，江西', 'Fujian, Guangdong, Guangxi, Jiangxi');
INSERT INTO `chinaeclipse` VALUES ('14', '2085/6/22', '20850622', '环食', '福建，贵州，湖南，江西，云南，浙江', 'Fujian, Guizhou, Hunan, Jiangxi, Yunnan, Zhejiang');
INSERT INTO `chinaeclipse` VALUES ('15', '2088/4/21', '20880421', '全食', '甘肃，新疆', 'Gansu, Xinjiang');
INSERT INTO `chinaeclipse` VALUES ('16', '2089/10/4', '20891004', '全食', '重庆，福建，湖南，江西，四川', 'Chongqing, Fujian, Hunan, Jiangxi, Sichuan');
INSERT INTO `chinaeclipse` VALUES ('17', '2095/11/27', '20951127', '环食', ' 辽宁', 'Liaoning');

-- ----------------------------
-- Table structure for postscripts
-- ----------------------------
DROP TABLE IF EXISTS `postscripts`;
CREATE TABLE `postscripts` (
  `﻿pid` int(255) NOT NULL AUTO_INCREMENT,
  `Pos_lon` varchar(255) DEFAULT NULL,
  `Pos_lat` varchar(255) DEFAULT NULL,
  `pUserid` varchar(255) DEFAULT NULL,
  `pUserName` varchar(255) DEFAULT NULL,
  `pTitle` varchar(255) DEFAULT NULL,
  `pContent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`﻿pid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of postscripts
-- ----------------------------
INSERT INTO `postscripts` VALUES ('1', '121', '31', '1', '西湖小子', '我在上海追日', '在外滩看日食别有风味呢。');
INSERT INTO `postscripts` VALUES ('2', '116', '40', '2', '京人', '古城红日', '阳光落在斑驳的红色城墙上，落下了多少时光。');
INSERT INTO `postscripts` VALUES ('3', '114', '30', '3', '江汉美', '黄鹤楼登高望远', '昔人已乘黄鹤去，此地空余黄鹤楼。日暮乡关何处是？烟波江上使人愁。');
INSERT INTO `postscripts` VALUES ('4', '139', '25', '4', '天空之树', '我在东京寻觅爱情', '东京爱情物语是真的吗？');
INSERT INTO `postscripts` VALUES ('5', '113', '23', '5', '靓仔', '日食可以食呀', '睇日食睇肚饿了。');
INSERT INTO `postscripts` VALUES ('6', '2', '49', '1', '西湖小子', '凌晨四点的巴黎', '早起练球。');

-- ----------------------------
-- Table structure for scenicspot
-- ----------------------------
DROP TABLE IF EXISTS `scenicspot`;
CREATE TABLE `scenicspot` (
  `﻿SID` int(255) NOT NULL AUTO_INCREMENT,
  `SNameShort` varchar(255) DEFAULT NULL,
  `SName` varchar(255) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `Longitude` varchar(255) DEFAULT NULL,
  `Latitude` varchar(255) DEFAULT NULL,
  `ImgSrc` varchar(255) DEFAULT NULL,
  `Info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`﻿SID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scenicspot
-- ----------------------------
INSERT INTO `scenicspot` VALUES ('1', '东方明珠', '上海东方明珠广播电视塔', '中国上海', '121.51', '31.25', 'OrientalPearlTower.jpg', '东方明珠广播电视塔是上海的标志性文化景观之一，位于浦东新区陆家嘴，塔高约468米。该建筑于1991年7月兴建，1995年5月投入使用，承担上海6套无线电视发射业务，地区覆盖半径80公里。');
INSERT INTO `scenicspot` VALUES ('2', '故宫', '北京故宫博物院', '中国北京', '116.38', '39.9', 'PalaceMuseum.jpg', '北京故宫是中国明清两代的皇家宫殿，旧称紫禁城，位于北京中轴线的中心。北京故宫以三大殿为中心，占地面积72万平方米，建筑面积约15万平方米，有大小宫殿七十多座，房屋九千余间。');
INSERT INTO `scenicspot` VALUES ('3', '黄鹤楼', '武汉黄鹤楼', '中国武汉', '114.3', '30.5', 'YellowCraneTower.jpg', '黄鹤楼位于湖北省武汉市长江南岸的武昌蛇山之巅，濒临万里长江，是“江南三大名楼”之一，自古享有“天下江山第一楼“和“天下绝景”之称。黄鹤楼是武汉市标志性建筑，与晴川阁、古琴台并称“武汉三大名胜”。');
INSERT INTO `scenicspot` VALUES ('4', '广州塔', '广州新电视塔', '中国广州', '113.32', '23.11', 'CantonTower.jpg', '广州塔，昵称小蛮腰。位于广州市海珠区（艺洲岛）赤岗塔附近，距离珠江南岸125米。总高度600米，是中国第一高塔，世界第四高塔。');
INSERT INTO `scenicspot` VALUES ('5', '布达拉宫', '拉萨布达拉宫', '中国西藏', '91.11', '29.65', 'PotalaPalace.jpg', '布达拉宫，坐落于中国西藏自治区的首府拉萨市区西北玛布日山上，是世界上海拔最高，集宫殿、城堡和寺院于一体的宏伟建筑，也是西藏最庞大、最完整的古代宫堡建筑群。');
INSERT INTO `scenicspot` VALUES ('6', '东京塔', '日本东京塔', '日本东京', '139.74', '25.65', 'TokyoTower.jpg', '东京塔是东京的地标性建筑物，位于东京都港区芝公园，高332.6米。东京塔在150米处设有大瞭望台，249.9米处设有特别瞭望台，可一览东京都内景色，晴朗之日可远眺富士山。');
INSERT INTO `scenicspot` VALUES ('7', '泰姬陵', '印度阿格拉泰姬陵', '印度阿格拉', '78.04', '17.16', 'TajMahal.jpg', '泰姬陵，是印度知名度最高的古迹之一，世界文化遗产，被评选为“世界新七大奇迹”。泰姬陵全称为“泰姬·玛哈拉”，是一座用白色大理石建成的巨大陵墓清真寺，是莫卧儿皇帝沙·贾汗为纪念其妃子于1631年至1653年在阿格拉而建的。');
INSERT INTO `scenicspot` VALUES ('8', '哈利法塔', '迪拜哈利法塔', '阿联酋迪拜', '55.27', '25.19', 'KhalifaTower.jpg', '哈利法塔，原名迪拜塔，高828米，楼层总数162层，是世界第一高楼与人工构造物。');
INSERT INTO `scenicspot` VALUES ('9', '红场', '俄罗斯莫斯科红场', '俄罗斯莫斯科', '37.62', '55.75', 'RedSquare.jpg', '红场位于俄罗斯首都莫斯科市中心，临莫斯科河，是莫斯科最古老的广场 ，是俄罗斯重要节日举行群众集会、大型庆典和阅兵活动之处，是世界著名旅游景点。');
INSERT INTO `scenicspot` VALUES ('10', '罗马斗兽场', '意大利古罗马竞技场', '意大利罗马', '12.48', '41.88', 'Colosseo.jpg', '罗马斗兽场，原名弗拉维圆形剧场。是古罗马帝国专供奴隶主、贵族和自由民观看斗兽或奴隶角斗的地方。建于72-80年间，遗址位于意大利首都罗马市中心，它在威尼斯广场的南面，古罗马市场附近。');
INSERT INTO `scenicspot` VALUES ('11', '埃菲尔铁塔', '巴黎埃菲尔铁塔', '法国巴黎', '2.28', '48.85', 'EiffelTower.jpg', '埃菲尔铁塔矗立在塞纳河南岸法国巴黎的战神广场，于1889年建成，是当时世界上最高的建筑物。埃菲尔铁塔得名于设计它的著名建筑师、结构工程师古斯塔夫·埃菲尔。');
INSERT INTO `scenicspot` VALUES ('12', '格林尼治天文台', '英国格林尼治皇家天文台', '英国伦敦', '0', '51.47', 'RGO.jpg', '格林尼治天文台，于1675年创建于英国伦敦泰晤士河畔的皇家格林尼治花园，是世界上著名的综合性天文台。');
INSERT INTO `scenicspot` VALUES ('13', '新加坡摩天轮', '新加坡飞行者摩天观景轮', '新加坡', '103.86', '1.29', 'SingaporeFlyer.jpg', '新加坡飞行者摩天观景轮，是一个位于新加坡的巨型摩天轮，共有28个观光客舱，高165米相当于42层楼高，比英国伦敦的“千禧眼”还要高30米。');
INSERT INTO `scenicspot` VALUES ('14', '悉尼歌剧院', '澳大利亚悉尼歌剧院', '澳大利亚悉尼', '151.22', '-33.86', 'SydneyOperaHouse.jpg', '悉尼歌剧院，位于澳大利亚新南威尔士州悉尼市区北部的便利朗角，总建筑面积88000平方米，有一个2700座的音乐厅，一个1550座的歌剧院和一个420座的小剧场，是澳大利亚地标式建筑。');
INSERT INTO `scenicspot` VALUES ('15', '自由女神像', '自由女神铜像国家纪念碑', '美国纽约', '-74.04', '40.69', 'StatueOfLiberty.jpg', '自由女神像是一个巨大的新古典主义雕塑，现矗立在美国纽约自由岛。这座铜雕像是法国人民送给美国人民的礼物。她用右手将火炬举在头顶上，左手书籍的罗马数字为美国独立宣言起草的日期。');
INSERT INTO `scenicspot` VALUES ('16', '金门大桥', '旧金山金门大桥', '美国旧金山', '-122.47', '37.82', 'GoldenGateBridge.jpg', '金门大桥是美国境内连接旧金山与加利福尼亚州的跨海通道，位于金门海峡之上，线路全长2780米，主桥全长1967.3米，是美国旧金山市的主要象征。');
INSERT INTO `scenicspot` VALUES ('17', '里约基督像', '里约热内卢救世基督像', '巴西里约热内卢', '-70.05', '-32.82', 'CristoRedentor.jpg', '里约热内卢救世基督像，座落在里约热内卢国家森林公园中高710米的科科瓦多山顶之上，落成于1931年，总高38米，重1145吨。耶稣张开双臂欢迎来自世界各地的游客，是巴西人民热情接纳和宽阔胸怀的象征。');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `﻿uid` int(255) NOT NULL AUTO_INCREMENT,
  `uName` varchar(255) DEFAULT NULL,
  `Pos_lon` varchar(255) DEFAULT NULL,
  `Pos_lat` varchar(255) DEFAULT NULL,
  `Signature` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`﻿uid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '西湖小子', '120', '30', '湖光山色惹人驻足。');
INSERT INTO `users` VALUES ('2', '京人', '116', '40', '我的中国心，我的中国梦！');
INSERT INTO `users` VALUES ('3', '江汉美', '114', '30', '疫情无情人有情。');
INSERT INTO `users` VALUES ('4', '天空之树', '139', '25', '山川异域，日月同天。');
INSERT INTO `users` VALUES ('5', '靓仔', '113', '23', '我要食肠粉！！');

-- ----------------------------
-- Table structure for worldeclipse
-- ----------------------------
DROP TABLE IF EXISTS `worldeclipse`;
CREATE TABLE `worldeclipse` (
  `﻿ID` int(11) NOT NULL AUTO_INCREMENT,
  `Year` varchar(255) DEFAULT NULL,
  `Month` varchar(255) DEFAULT NULL,
  `Day` varchar(255) DEFAULT NULL,
  `TD` varchar(255) DEFAULT NULL,
  `SarosNum` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Mag` varchar(255) DEFAULT NULL,
  `SunAlt` varchar(255) DEFAULT NULL,
  `PathWidth` int(11) DEFAULT NULL,
  `Duration` varchar(255) DEFAULT NULL,
  `Latitude` int(11) DEFAULT NULL,
  `Longitude` int(11) DEFAULT NULL,
  PRIMARY KEY (`﻿ID`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of worldeclipse
-- ----------------------------
INSERT INTO `worldeclipse` VALUES ('1', '2001', 'Jun', '21', '12:04:46', '18', 'T', '1.0495', '55', '200', '04m57s', '-11', '3');
INSERT INTO `worldeclipse` VALUES ('2', '2001', 'Dec', '14', '20:53:01', '24', 'A', '0.9681', '66', '126', '03m53s', '1', '-131');
INSERT INTO `worldeclipse` VALUES ('3', '2002', 'Jun', '10', '23:45:22', '30', 'A', '0.9962', '78', '13', '00m23s', '35', '-179');
INSERT INTO `worldeclipse` VALUES ('4', '2002', 'Dec', '4', '7:32:16', '36', 'T', '1.0244', '72', '87', '02m04s', '-39', '60');
INSERT INTO `worldeclipse` VALUES ('5', '2003', 'May', '31', '4:09:22', '42', 'An', '0.9384', '3', '100', '03m37s', '67', '-24');
INSERT INTO `worldeclipse` VALUES ('6', '2003', 'Nov', '23', '22:50:22', '48', 'T', '1.0379', '15', '495', '01m57s', '-73', '88');
INSERT INTO `worldeclipse` VALUES ('7', '2004', 'Apr', '19', '13:35:05', '53', 'P', '0.7367', '0', '7500', '0', '-62', '44');
INSERT INTO `worldeclipse` VALUES ('8', '2004', 'Oct', '14', '3:00:23', '59', 'P', '0.9282', '0', '7500', '0', '61', '-154');
INSERT INTO `worldeclipse` VALUES ('9', '2005', 'Apr', '8', '20:36:51', '65', 'H', '1.0074', '70', '27', '00m42s', '-11', '-119');
INSERT INTO `worldeclipse` VALUES ('10', '2005', 'Oct', '3', '10:32:47', '71', 'A', '0.9576', '71', '162', '04m32s', '13', '29');
INSERT INTO `worldeclipse` VALUES ('11', '2006', 'Mar', '29', '10:12:23', '77', 'T', '1.0515', '67', '184', '04m07s', '23', '17');
INSERT INTO `worldeclipse` VALUES ('12', '2006', 'Sep', '22', '11:41:16', '83', 'A', '0.9352', '66', '261', '07m09s', '-21', '-9');
INSERT INTO `worldeclipse` VALUES ('13', '2007', 'Mar', '19', '2:32:57', '89', 'P', '0.8756', '0', '7500', '0', '61', '55');
INSERT INTO `worldeclipse` VALUES ('14', '2007', 'Sep', '11', '12:32:24', '95', 'P', '0.7507', '0', '7500', '0', '-61', '-90');
INSERT INTO `worldeclipse` VALUES ('15', '2008', 'Feb', '7', '3:56:10', '100', 'A', '0.965', '16', '444', '02m12s', '-68', '-150');
INSERT INTO `worldeclipse` VALUES ('16', '2008', 'Aug', '1', '10:22:12', '106', 'T', '1.0394', '34', '237', '02m27s', '66', '72');
INSERT INTO `worldeclipse` VALUES ('17', '2009', 'Jan', '26', '7:59:45', '112', 'A', '0.9282', '73', '280', '07m54s', '-34', '70');
INSERT INTO `worldeclipse` VALUES ('18', '2009', 'Jul', '22', '2:36:25', '118', 'T', '1.0799', '86', '258', '06m39s', '24', '144');
INSERT INTO `worldeclipse` VALUES ('19', '2010', 'Jan', '15', '7:07:39', '124', 'A', '0.919', '66', '333', '11m08s', '2', '69');
INSERT INTO `worldeclipse` VALUES ('20', '2010', 'Jul', '11', '19:34:38', '130', 'T', '1.058', '47', '259', '05m20s', '-20', '-122');
INSERT INTO `worldeclipse` VALUES ('21', '2011', 'Jan', '4', '8:51:42', '136', 'P', '0.8576', '0', '7500', '0', '65', '21');
INSERT INTO `worldeclipse` VALUES ('22', '2011', 'Jun', '1', '21:17:18', '141', 'P', '0.601', '0', '7500', '0', '68', '47');
INSERT INTO `worldeclipse` VALUES ('23', '2011', 'Jul', '1', '8:39:30', '142', 'Pb', '0.0971', '0', '100', '0', '-65', '29');
INSERT INTO `worldeclipse` VALUES ('24', '2011', 'Nov', '25', '6:21:24', '147', 'P', '0.9047', '0', '7500', '0', '-69', '-82');
INSERT INTO `worldeclipse` VALUES ('25', '2012', 'May', '20', '23:53:54', '153', 'A', '0.9439', '61', '237', '05m46s', '49', '176');
INSERT INTO `worldeclipse` VALUES ('26', '2012', 'Nov', '13', '22:12:55', '159', 'T', '1.05', '68', '179', '04m02s', '-40', '-161');
INSERT INTO `worldeclipse` VALUES ('27', '2013', 'May', '10', '0:26:20', '165', 'A', '0.9544', '74', '173', '06m03s', '2', '175');
INSERT INTO `worldeclipse` VALUES ('28', '2013', 'Nov', '3', '12:47:36', '171', 'H3', '1.0159', '71', '58', '01m40s', '3', '-12');
INSERT INTO `worldeclipse` VALUES ('29', '2014', 'Apr', '29', '6:04:33', '177', 'A-', '0.9868', '0', '100', '0', '-71', '131');
INSERT INTO `worldeclipse` VALUES ('30', '2014', 'Oct', '23', '21:45:39', '183', 'P', '0.8114', '0', '7500', '0', '71', '-97');
INSERT INTO `worldeclipse` VALUES ('31', '2015', 'Mar', '20', '9:46:47', '188', 'T', '1.0445', '18', '463', '02m47s', '64', '-7');
INSERT INTO `worldeclipse` VALUES ('32', '2015', 'Sep', '13', '6:55:19', '194', 'P', '0.7875', '0', '7500', '0', '-72', '-2');
INSERT INTO `worldeclipse` VALUES ('33', '2016', 'Mar', '9', '1:58:19', '200', 'T', '1.045', '75', '155', '04m09s', '10', '149');
INSERT INTO `worldeclipse` VALUES ('34', '2016', 'Sep', '1', '9:08:02', '206', 'A', '0.9736', '70', '100', '03m06s', '-11', '38');
INSERT INTO `worldeclipse` VALUES ('35', '2017', 'Feb', '26', '14:54:33', '212', 'A', '0.9922', '63', '31', '00m44s', '-35', '-31');
INSERT INTO `worldeclipse` VALUES ('36', '2017', 'Aug', '21', '18:26:40', '218', 'T', '1.0306', '64', '115', '02m40s', '37', '-88');
INSERT INTO `worldeclipse` VALUES ('37', '2018', 'Feb', '15', '20:52:33', '224', 'P', '0.5991', '0', '7500', '0', '-71', '1');
INSERT INTO `worldeclipse` VALUES ('38', '2018', 'Jul', '13', '3:02:16', '229', 'P', '0.3365', '0', '7500', '0', '-68', '127');
INSERT INTO `worldeclipse` VALUES ('39', '2018', 'Aug', '11', '9:47:28', '230', 'P', '0.7368', '0', '7500', '0', '70', '174');
INSERT INTO `worldeclipse` VALUES ('40', '2019', 'Jan', '6', '1:42:38', '235', 'P', '0.7145', '0', '7500', '0', '67', '154');
INSERT INTO `worldeclipse` VALUES ('41', '2019', 'Jul', '2', '19:24:07', '241', 'T', '1.0459', '50', '201', '04m33s', '-17', '-109');
INSERT INTO `worldeclipse` VALUES ('42', '2019', 'Dec', '26', '5:18:53', '247', 'A', '0.9701', '66', '118', '03m40s', '1', '102');
INSERT INTO `worldeclipse` VALUES ('43', '2020', 'Jun', '21', '6:41:15', '253', 'Am', '0.994', '83', '21', '00m38s', '31', '80');
INSERT INTO `worldeclipse` VALUES ('44', '2020', 'Dec', '14', '16:14:39', '259', 'T', '1.0254', '73', '90', '02m10s', '-40', '-68');
INSERT INTO `worldeclipse` VALUES ('45', '2021', 'Jun', '10', '10:43:07', '265', 'A', '0.9435', '23', '527', '03m51s', '81', '-67');
INSERT INTO `worldeclipse` VALUES ('46', '2021', 'Dec', '4', '7:34:38', '271', 'T', '1.0367', '17', '419', '01m54s', '-77', '-46');
INSERT INTO `worldeclipse` VALUES ('47', '2022', 'Apr', '30', '20:42:36', '276', 'P', '0.6396', '0', '7500', '0', '-62', '-71');
INSERT INTO `worldeclipse` VALUES ('48', '2022', 'Oct', '25', '11:01:20', '282', 'P', '0.8619', '0', '7500', '0', '62', '77');
INSERT INTO `worldeclipse` VALUES ('49', '2023', 'Apr', '20', '4:17:56', '288', 'H', '1.0132', '67', '49', '01m16s', '-10', '126');
INSERT INTO `worldeclipse` VALUES ('50', '2023', 'Oct', '14', '18:00:41', '294', 'A', '0.952', '68', '187', '05m17s', '11', '-83');
INSERT INTO `worldeclipse` VALUES ('51', '2024', 'Apr', '8', '18:18:29', '300', 'T', '1.0566', '70', '198', '04m28s', '25', '-104');
INSERT INTO `worldeclipse` VALUES ('52', '2024', 'Oct', '2', '18:46:13', '306', 'A', '0.9326', '69', '266', '07m25s', '-22', '-114');
INSERT INTO `worldeclipse` VALUES ('53', '2025', 'Mar', '29', '10:48:36', '312', 'P', '0.9376', '0', '7500', '0', '61', '-77');
INSERT INTO `worldeclipse` VALUES ('54', '2025', 'Sep', '21', '19:43:04', '318', 'P', '0.855', '0', '7500', '0', '-61', '154');
INSERT INTO `worldeclipse` VALUES ('55', '2026', 'Feb', '17', '12:13:06', '323', 'A', '0.963', '12', '616', '02m20s', '-65', '87');
INSERT INTO `worldeclipse` VALUES ('56', '2026', 'Aug', '12', '17:47:06', '329', 'T', '1.0386', '26', '294', '02m18s', '65', '-25');
INSERT INTO `worldeclipse` VALUES ('57', '2027', 'Feb', '6', '16:00:48', '335', 'A', '0.9281', '73', '282', '07m51s', '-31', '-48');
INSERT INTO `worldeclipse` VALUES ('58', '2027', 'Aug', '2', '10:07:50', '341', 'T', '1.079', '82', '258', '06m23s', '26', '33');
INSERT INTO `worldeclipse` VALUES ('59', '2028', 'Jan', '26', '15:08:59', '347', 'A', '0.9208', '67', '323', '10m27s', '3', '-52');
INSERT INTO `worldeclipse` VALUES ('60', '2028', 'Jul', '22', '2:56:40', '353', 'T', '1.056', '53', '230', '05m10s', '-16', '127');
INSERT INTO `worldeclipse` VALUES ('61', '2029', 'Jan', '14', '17:13:48', '359', 'P', '0.8714', '0', '7500', '0', '64', '-114');
INSERT INTO `worldeclipse` VALUES ('62', '2029', 'Jun', '12', '4:06:13', '364', 'P', '0.4576', '0', '7500', '0', '67', '-66');
INSERT INTO `worldeclipse` VALUES ('63', '2029', 'Jul', '11', '15:37:19', '365', 'P', '0.2303', '0', '7500', '0', '-64', '-86');
INSERT INTO `worldeclipse` VALUES ('64', '2029', 'Dec', '5', '15:03:58', '370', 'P', '0.8911', '0', '7500', '0', '-68', '136');
INSERT INTO `worldeclipse` VALUES ('65', '2030', 'Jun', '1', '6:29:13', '376', 'A', '0.9443', '55', '250', '05m21s', '57', '80');
INSERT INTO `worldeclipse` VALUES ('66', '2030', 'Nov', '25', '6:51:37', '382', 'T', '1.0468', '67', '169', '03m44s', '-44', '71');
INSERT INTO `worldeclipse` VALUES ('67', '2031', 'May', '21', '7:16:04', '388', 'A', '0.9589', '79', '152', '05m26s', '9', '72');
INSERT INTO `worldeclipse` VALUES ('68', '2031', 'Nov', '14', '21:07:31', '394', 'H', '1.0106', '72', '38', '01m08s', '-1', '-138');
INSERT INTO `worldeclipse` VALUES ('69', '2032', 'May', '9', '13:26:42', '400', 'A', '0.9957', '20', '44', '00m22s', '-51', '-7');
INSERT INTO `worldeclipse` VALUES ('70', '2032', 'Nov', '3', '5:34:13', '406', 'P', '0.8554', '0', '7500', '0', '70', '133');
INSERT INTO `worldeclipse` VALUES ('71', '2033', 'Mar', '30', '18:02:36', '411', 'T', '1.0462', '11', '781', '02m37s', '71', '-156');
INSERT INTO `worldeclipse` VALUES ('72', '2033', 'Sep', '23', '13:54:31', '417', 'P', '0.689', '0', '7500', '0', '-72', '-121');
INSERT INTO `worldeclipse` VALUES ('73', '2034', 'Mar', '20', '10:18:45', '423', 'T', '1.0458', '73', '159', '04m09s', '16', '22');
INSERT INTO `worldeclipse` VALUES ('74', '2034', 'Sep', '12', '16:19:28', '429', 'A', '0.9736', '67', '102', '02m58s', '-18', '-73');
INSERT INTO `worldeclipse` VALUES ('75', '2035', 'Mar', '9', '23:05:54', '435', 'A', '0.9919', '64', '31', '00m48s', '-29', '-155');
INSERT INTO `worldeclipse` VALUES ('76', '2035', 'Sep', '2', '1:56:46', '441', 'T', '1.032', '68', '116', '02m54s', '29', '158');
INSERT INTO `worldeclipse` VALUES ('77', '2036', 'Feb', '27', '4:46:49', '447', 'P', '0.6286', '0', '7500', '0', '-72', '-131');
INSERT INTO `worldeclipse` VALUES ('78', '2036', 'Jul', '23', '10:32:06', '452', 'P', '0.1991', '0', '7500', '0', '-69', '4');
INSERT INTO `worldeclipse` VALUES ('79', '2036', 'Aug', '21', '17:25:45', '453', 'P', '0.8622', '0', '7500', '0', '71', '47');
INSERT INTO `worldeclipse` VALUES ('80', '2037', 'Jan', '16', '9:48:55', '458', 'P', '0.7049', '0', '7500', '0', '69', '21');
INSERT INTO `worldeclipse` VALUES ('81', '2037', 'Jul', '13', '2:40:36', '464', 'T', '1.0413', '43', '201', '03m58s', '-25', '139');
INSERT INTO `worldeclipse` VALUES ('82', '2038', 'Jan', '5', '13:47:11', '470', 'A', '0.9728', '65', '107', '03m18s', '2', '-25');
INSERT INTO `worldeclipse` VALUES ('83', '2038', 'Jul', '2', '13:32:55', '476', 'A', '0.9911', '88', '31', '01m00s', '25', '-22');
INSERT INTO `worldeclipse` VALUES ('84', '2038', 'Dec', '26', '1:00:10', '482', 'T', '1.0268', '73', '95', '02m18s', '-40', '164');
INSERT INTO `worldeclipse` VALUES ('85', '2039', 'Jun', '21', '17:12:54', '488', 'A', '0.9454', '33', '365', '04m05s', '79', '-102');
INSERT INTO `worldeclipse` VALUES ('86', '2039', 'Dec', '15', '16:23:46', '494', 'T', '1.0356', '18', '380', '01m51s', '-81', '173');
INSERT INTO `worldeclipse` VALUES ('87', '2040', 'May', '11', '3:43:02', '499', 'P', '0.5306', '0', '7500', '0', '-63', '174');
INSERT INTO `worldeclipse` VALUES ('88', '2040', 'Nov', '4', '19:09:02', '505', 'P', '0.8074', '0', '7500', '0', '62', '-53');
INSERT INTO `worldeclipse` VALUES ('89', '2041', 'Apr', '30', '11:52:21', '511', 'T', '1.0189', '63', '72', '01m51s', '-10', '12');
INSERT INTO `worldeclipse` VALUES ('90', '2041', 'Oct', '25', '1:36:22', '517', 'A', '0.9467', '66', '213', '06m07s', '10', '163');
INSERT INTO `worldeclipse` VALUES ('91', '2042', 'Apr', '20', '2:17:30', '523', 'T', '1.0614', '73', '210', '04m51s', '27', '137');
INSERT INTO `worldeclipse` VALUES ('92', '2042', 'Oct', '14', '2:00:42', '529', 'A', '0.93', '72', '273', '07m44s', '-24', '138');
INSERT INTO `worldeclipse` VALUES ('93', '2043', 'Apr', '9', '18:57:49', '535', 'T+', '1.0095', '0', '100', '0', '61', '152');
INSERT INTO `worldeclipse` VALUES ('94', '2043', 'Oct', '3', '3:01:49', '541', 'A-', '0.9497', '0', '100', '0', '-61', '35');
INSERT INTO `worldeclipse` VALUES ('95', '2044', 'Feb', '28', '20:24:39', '546', 'As', '0.96', '4', '100', '02m27s', '-62', '-26');
INSERT INTO `worldeclipse` VALUES ('96', '2044', 'Aug', '23', '1:17:02', '552', 'T', '1.0364', '15', '453', '02m04s', '64', '-120');
INSERT INTO `worldeclipse` VALUES ('97', '2045', 'Feb', '16', '23:56:07', '558', 'A', '0.9285', '72', '281', '07m47s', '-28', '-166');
INSERT INTO `worldeclipse` VALUES ('98', '2045', 'Aug', '12', '17:42:39', '564', 'T', '1.0774', '78', '256', '06m06s', '26', '-79');
INSERT INTO `worldeclipse` VALUES ('99', '2046', 'Feb', '5', '23:06:26', '570', 'A', '0.9232', '68', '310', '09m42s', '5', '-171');
INSERT INTO `worldeclipse` VALUES ('100', '2046', 'Aug', '2', '10:21:13', '576', 'T', '1.0531', '58', '206', '04m51s', '-13', '15');
INSERT INTO `worldeclipse` VALUES ('101', '2047', 'Jan', '26', '1:33:18', '582', 'P', '0.8907', '0', '7500', '0', '63', '112');
INSERT INTO `worldeclipse` VALUES ('102', '2047', 'Jun', '23', '10:52:31', '587', 'P', '0.3129', '0', '7500', '0', '66', '-178');
INSERT INTO `worldeclipse` VALUES ('103', '2047', 'Jul', '22', '22:36:17', '588', 'P', '0.3604', '0', '7500', '0', '-63', '160');
INSERT INTO `worldeclipse` VALUES ('104', '2047', 'Dec', '16', '23:50:12', '593', 'P', '0.8816', '0', '7500', '0', '-66', '-7');
INSERT INTO `worldeclipse` VALUES ('105', '2048', 'Jun', '11', '12:58:53', '599', 'A', '0.9441', '49', '272', '04m58s', '64', '-12');
INSERT INTO `worldeclipse` VALUES ('106', '2048', 'Dec', '5', '15:35:27', '605', 'T', '1.044', '66', '160', '03m28s', '-46', '-56');
INSERT INTO `worldeclipse` VALUES ('107', '2049', 'May', '31', '13:59:59', '611', 'A', '0.9631', '83', '134', '04m45s', '15', '-30');
INSERT INTO `worldeclipse` VALUES ('108', '2049', 'Nov', '25', '5:33:48', '617', 'H', '1.0057', '73', '21', '00m38s', '-4', '95');
INSERT INTO `worldeclipse` VALUES ('109', '2050', 'May', '20', '20:42:50', '623', 'H', '1.0038', '29', '27', '00m21s', '-40', '-124');
INSERT INTO `worldeclipse` VALUES ('110', '2050', 'Nov', '14', '13:30:53', '629', 'P', '0.8874', '0', '7500', '0', '70', '1');
INSERT INTO `worldeclipse` VALUES ('111', '2051', 'Apr', '11', '2:10:39', '634', 'P', '0.9849', '0', '7500', '0', '72', '32');
INSERT INTO `worldeclipse` VALUES ('112', '2051', 'Oct', '4', '21:02:14', '640', 'P', '0.6024', '0', '7500', '0', '-72', '118');
INSERT INTO `worldeclipse` VALUES ('113', '2052', 'Mar', '30', '18:31:53', '646', 'T', '1.0466', '71', '164', '04m08s', '22', '-103');
INSERT INTO `worldeclipse` VALUES ('114', '2052', 'Sep', '22', '23:39:10', '652', 'A', '0.9734', '63', '106', '02m51s', '-26', '175');
INSERT INTO `worldeclipse` VALUES ('115', '2053', 'Mar', '20', '7:08:19', '658', 'A', '0.9919', '66', '31', '00m50s', '-23', '83');
INSERT INTO `worldeclipse` VALUES ('116', '2053', 'Sep', '12', '9:34:09', '664', 'T', '1.0328', '72', '116', '03m04s', '21', '42');
INSERT INTO `worldeclipse` VALUES ('117', '2054', 'Mar', '9', '12:33:40', '670', 'P', '0.6678', '0', '7500', '0', '-72', '98');
INSERT INTO `worldeclipse` VALUES ('118', '2054', 'Aug', '3', '18:04:02', '675', 'Pe', '0.0655', '0', '100', '0', '-70', '-121');
INSERT INTO `worldeclipse` VALUES ('119', '2054', 'Sep', '2', '1:09:34', '676', 'P', '0.9793', '0', '7500', '0', '72', '-82');
INSERT INTO `worldeclipse` VALUES ('120', '2055', 'Jan', '27', '17:54:05', '681', 'P', '0.6932', '0', '7500', '0', '70', '-112');
INSERT INTO `worldeclipse` VALUES ('121', '2055', 'Jul', '24', '9:57:50', '687', 'T', '1.0359', '37', '202', '03m17s', '-33', '26');
INSERT INTO `worldeclipse` VALUES ('122', '2056', 'Jan', '16', '22:16:45', '693', 'A', '0.9759', '65', '95', '02m52s', '4', '-154');
INSERT INTO `worldeclipse` VALUES ('123', '2056', 'Jul', '12', '20:21:59', '699', 'A', '0.9878', '88', '43', '01m26s', '19', '-124');
INSERT INTO `worldeclipse` VALUES ('124', '2057', 'Jan', '5', '9:47:52', '705', 'T', '1.0287', '73', '102', '02m29s', '-39', '35');
INSERT INTO `worldeclipse` VALUES ('125', '2057', 'Jul', '1', '23:40:15', '711', 'A', '0.9464', '41', '298', '04m22s', '71', '-176');
INSERT INTO `worldeclipse` VALUES ('126', '2057', 'Dec', '26', '1:14:35', '717', 'T', '1.0348', '19', '355', '01m50s', '-85', '22');
INSERT INTO `worldeclipse` VALUES ('127', '2058', 'May', '22', '10:39:25', '722', 'P', '0.4141', '0', '7500', '0', '-64', '61');
INSERT INTO `worldeclipse` VALUES ('128', '2058', 'Jun', '21', '0:19:35', '723', 'Pb', '0.126', '0', '100', '0', '66', '10');
INSERT INTO `worldeclipse` VALUES ('129', '2058', 'Nov', '16', '3:23:07', '728', 'P', '0.7644', '0', '7500', '0', '63', '174');
INSERT INTO `worldeclipse` VALUES ('130', '2059', 'May', '11', '19:22:16', '734', 'T', '1.0242', '59', '95', '02m23s', '-11', '-100');
INSERT INTO `worldeclipse` VALUES ('131', '2059', 'Nov', '5', '9:18:15', '740', 'A', '0.9417', '63', '238', '07m00s', '9', '47');
INSERT INTO `worldeclipse` VALUES ('132', '2060', 'Apr', '30', '10:10:00', '746', 'T', '1.066', '76', '222', '05m15s', '28', '21');
INSERT INTO `worldeclipse` VALUES ('133', '2060', 'Oct', '24', '9:24:10', '752', 'A', '0.9277', '75', '281', '08m06s', '-26', '28');
INSERT INTO `worldeclipse` VALUES ('134', '2061', 'Apr', '20', '2:56:49', '758', 'T', '1.0475', '16', '559', '02m37s', '65', '59');
INSERT INTO `worldeclipse` VALUES ('135', '2061', 'Oct', '13', '10:32:10', '764', 'A', '0.9469', '15', '743', '03m41s', '-62', '-54');
INSERT INTO `worldeclipse` VALUES ('136', '2062', 'Mar', '11', '4:26:16', '769', 'P', '0.9331', '0', '7500', '0', '-61', '-147');
INSERT INTO `worldeclipse` VALUES ('137', '2062', 'Sep', '3', '8:54:27', '775', 'P', '0.9749', '0', '7500', '0', '61', '150');
INSERT INTO `worldeclipse` VALUES ('138', '2063', 'Feb', '28', '7:43:30', '781', 'A', '0.9293', '70', '280', '07m41s', '-25', '78');
INSERT INTO `worldeclipse` VALUES ('139', '2063', 'Aug', '24', '1:22:11', '787', 'T', '1.075', '74', '252', '05m49s', '26', '168');
INSERT INTO `worldeclipse` VALUES ('140', '2064', 'Feb', '17', '7:00:23', '793', 'A', '0.9262', '69', '295', '08m56s', '7', '70');
INSERT INTO `worldeclipse` VALUES ('141', '2064', 'Aug', '12', '17:46:06', '799', 'T', '1.0495', '62', '184', '04m28s', '-11', '-96');
INSERT INTO `worldeclipse` VALUES ('142', '2065', 'Feb', '5', '9:52:26', '805', 'P', '0.9123', '0', '7500', '0', '62', '-22');
INSERT INTO `worldeclipse` VALUES ('143', '2065', 'Jul', '3', '17:33:52', '810', 'P', '0.1638', '0', '7500', '0', '65', '72');
INSERT INTO `worldeclipse` VALUES ('144', '2065', 'Aug', '2', '5:34:17', '811', 'P', '0.4903', '0', '7500', '0', '-63', '47');
INSERT INTO `worldeclipse` VALUES ('145', '2065', 'Dec', '27', '8:39:56', '816', 'P', '0.8769', '0', '7500', '0', '-65', '-149');
INSERT INTO `worldeclipse` VALUES ('146', '2066', 'Jun', '22', '19:25:48', '822', 'A', '0.9435', '43', '309', '04m40s', '70', '-96');
INSERT INTO `worldeclipse` VALUES ('147', '2066', 'Dec', '17', '0:23:40', '828', 'T', '1.0416', '66', '152', '03m14s', '-47', '176');
INSERT INTO `worldeclipse` VALUES ('148', '2067', 'Jun', '11', '20:42:26', '834', 'A', '0.967', '88', '119', '04m05s', '21', '-130');
INSERT INTO `worldeclipse` VALUES ('149', '2067', 'Dec', '6', '14:03:43', '840', 'H', '1.0011', '74', '4', '00m08s', '-6', '-32');
INSERT INTO `worldeclipse` VALUES ('150', '2068', 'May', '31', '3:56:39', '846', 'T', '1.011', '37', '63', '01m06s', '-31', '123');
INSERT INTO `worldeclipse` VALUES ('151', '2068', 'Nov', '24', '21:32:30', '852', 'P', '0.9109', '0', '7500', '0', '69', '-131');
INSERT INTO `worldeclipse` VALUES ('152', '2069', 'Apr', '21', '10:11:09', '857', 'P', '0.8992', '0', '7500', '0', '71', '-101');
INSERT INTO `worldeclipse` VALUES ('153', '2069', 'May', '20', '17:53:18', '858', 'Pb', '0.0879', '0', '100', '0', '-69', '-70');
INSERT INTO `worldeclipse` VALUES ('154', '2069', 'Oct', '15', '4:19:56', '863', 'P', '0.5298', '0', '7500', '0', '-72', '-5');
INSERT INTO `worldeclipse` VALUES ('155', '2070', 'Apr', '11', '2:36:09', '869', 'T', '1.0472', '68', '168', '04m04s', '29', '135');
INSERT INTO `worldeclipse` VALUES ('156', '2070', 'Oct', '4', '7:08:57', '875', 'A', '0.9731', '60', '110', '02m44s', '-33', '60');
INSERT INTO `worldeclipse` VALUES ('157', '2071', 'Mar', '31', '15:01:06', '881', 'A', '0.9919', '68', '31', '00m52s', '-17', '-37');
INSERT INTO `worldeclipse` VALUES ('158', '2071', 'Sep', '23', '17:20:28', '887', 'T', '1.0333', '75', '116', '03m11s', '14', '-77');
INSERT INTO `worldeclipse` VALUES ('159', '2072', 'Mar', '19', '20:10:31', '893', 'P', '0.7199', '0', '7500', '0', '-72', '-30');
INSERT INTO `worldeclipse` VALUES ('160', '2072', 'Sep', '12', '8:59:20', '899', 'T', '1.0558', '14', '732', '03m13s', '70', '102');
INSERT INTO `worldeclipse` VALUES ('161', '2073', 'Feb', '7', '1:55:59', '904', 'P', '0.6768', '0', '7500', '0', '70', '115');
INSERT INTO `worldeclipse` VALUES ('162', '2073', 'Aug', '3', '17:15:23', '910', 'T', '1.0294', '28', '206', '02m29s', '-43', '-89');
INSERT INTO `worldeclipse` VALUES ('163', '2074', 'Jan', '27', '6:44:15', '916', 'A', '0.9798', '65', '79', '02m21s', '7', '79');
INSERT INTO `worldeclipse` VALUES ('164', '2074', 'Jul', '24', '3:10:32', '922', 'A', '0.9838', '83', '58', '01m57s', '13', '134');
INSERT INTO `worldeclipse` VALUES ('165', '2075', 'Jan', '16', '18:36:04', '928', 'T', '1.0311', '74', '110', '02m42s', '-37', '-94');
INSERT INTO `worldeclipse` VALUES ('166', '2075', 'Jul', '13', '6:05:44', '934', 'A', '0.9467', '49', '262', '04m45s', '63', '95');
INSERT INTO `worldeclipse` VALUES ('167', '2076', 'Jan', '6', '10:07:27', '940', 'T', '1.0342', '20', '340', '01m49s', '-87', '-174');
INSERT INTO `worldeclipse` VALUES ('168', '2076', 'Jun', '1', '17:31:22', '945', 'P', '0.2897', '0', '7500', '0', '-64', '-51');
INSERT INTO `worldeclipse` VALUES ('169', '2076', 'Jul', '1', '6:50:43', '946', 'P', '0.2746', '0', '7500', '0', '67', '-98');
INSERT INTO `worldeclipse` VALUES ('170', '2076', 'Nov', '26', '11:43:01', '951', 'P', '0.7315', '0', '7500', '0', '64', '40');
INSERT INTO `worldeclipse` VALUES ('171', '2077', 'May', '22', '2:46:05', '957', 'T', '1.029', '55', '119', '02m54s', '-13', '148');
INSERT INTO `worldeclipse` VALUES ('172', '2077', 'Nov', '15', '17:07:56', '963', 'A', '0.9371', '62', '262', '07m54s', '8', '-71');
INSERT INTO `worldeclipse` VALUES ('173', '2078', 'May', '11', '17:56:55', '969', 'T', '1.0701', '79', '232', '05m40s', '28', '-94');
INSERT INTO `worldeclipse` VALUES ('174', '2078', 'Nov', '4', '16:55:44', '975', 'A', '0.9255', '77', '287', '08m29s', '-28', '-83');
INSERT INTO `worldeclipse` VALUES ('175', '2079', 'May', '1', '10:50:13', '981', 'T', '1.0512', '24', '406', '02m55s', '66', '-46');
INSERT INTO `worldeclipse` VALUES ('176', '2079', 'Oct', '24', '18:11:21', '987', 'A', '0.9484', '22', '495', '03m39s', '-63', '-161');
INSERT INTO `worldeclipse` VALUES ('177', '2080', 'Mar', '21', '12:20:15', '992', 'P', '0.8734', '0', '7500', '0', '-61', '86');
INSERT INTO `worldeclipse` VALUES ('178', '2080', 'Sep', '13', '16:38:09', '998', 'P', '0.8743', '0', '7500', '0', '61', '26');
INSERT INTO `worldeclipse` VALUES ('179', '2081', 'Mar', '10', '15:23:31', '1004', 'A', '0.9304', '68', '277', '07m36s', '-22', '-37');
INSERT INTO `worldeclipse` VALUES ('180', '2081', 'Sep', '3', '9:07:31', '1010', 'T', '1.072', '70', '247', '05m33s', '25', '54');
INSERT INTO `worldeclipse` VALUES ('181', '2082', 'Feb', '27', '14:47:00', '1016', 'A', '0.9298', '70', '277', '08m12s', '9', '-47');
INSERT INTO `worldeclipse` VALUES ('182', '2082', 'Aug', '24', '1:16:21', '1022', 'T', '1.0452', '66', '163', '04m01s', '-10', '152');
INSERT INTO `worldeclipse` VALUES ('183', '2083', 'Feb', '16', '18:06:36', '1028', 'P', '0.9433', '0', '7500', '0', '62', '-154');
INSERT INTO `worldeclipse` VALUES ('184', '2083', 'Jul', '15', '0:14:23', '1033', 'Pe', '0.0168', '0', '100', '0', '64', '-38');
INSERT INTO `worldeclipse` VALUES ('185', '2083', 'Aug', '13', '12:34:41', '1034', 'P', '0.6146', '0', '7500', '0', '-62', '-67');
INSERT INTO `worldeclipse` VALUES ('186', '2084', 'Jan', '7', '17:30:24', '1039', 'P', '0.8723', '0', '7500', '0', '-64', '69');
INSERT INTO `worldeclipse` VALUES ('187', '2084', 'Jul', '3', '1:50:26', '1045', 'A', '0.9421', '35', '377', '04m25s', '75', '-169');
INSERT INTO `worldeclipse` VALUES ('188', '2084', 'Dec', '27', '9:13:48', '1051', 'T', '1.0396', '66', '146', '03m04s', '-47', '48');
INSERT INTO `worldeclipse` VALUES ('189', '2085', 'Jun', '22', '3:21:16', '1057', 'A', '0.9704', '87', '106', '03m29s', '26', '131');
INSERT INTO `worldeclipse` VALUES ('190', '2085', 'Dec', '16', '22:37:48', '1063', 'A', '0.9971', '74', '10', '00m19s', '-7', '-161');
INSERT INTO `worldeclipse` VALUES ('191', '2086', 'Jun', '11', '11:07:14', '1069', 'T', '1.0174', '44', '86', '01m48s', '-23', '12');
INSERT INTO `worldeclipse` VALUES ('192', '2086', 'Dec', '6', '5:38:55', '1075', 'P', '0.9271', '0', '7500', '0', '67', '96');
INSERT INTO `worldeclipse` VALUES ('193', '2087', 'May', '2', '18:04:42', '1080', 'P', '0.8011', '0', '7500', '0', '70', '128');
INSERT INTO `worldeclipse` VALUES ('194', '2087', 'Jun', '1', '1:27:14', '1081', 'P', '0.2146', '0', '7500', '0', '-68', '165');
INSERT INTO `worldeclipse` VALUES ('195', '2087', 'Oct', '26', '11:46:57', '1086', 'P', '0.4696', '0', '7500', '0', '-71', '-131');
INSERT INTO `worldeclipse` VALUES ('196', '2088', 'Apr', '21', '10:31:49', '1092', 'T', '1.0474', '65', '173', '03m58s', '36', '15');
INSERT INTO `worldeclipse` VALUES ('197', '2088', 'Oct', '14', '14:48:05', '1098', 'A', '0.9727', '57', '115', '02m38s', '-40', '-56');
INSERT INTO `worldeclipse` VALUES ('198', '2089', 'Apr', '10', '22:44:42', '1104', 'A', '0.9919', '71', '30', '00m53s', '-10', '-155');
INSERT INTO `worldeclipse` VALUES ('199', '2089', 'Oct', '4', '1:15:23', '1110', 'T', '1.0333', '77', '115', '03m14s', '7', '163');
INSERT INTO `worldeclipse` VALUES ('200', '2090', 'Mar', '31', '3:38:08', '1116', 'P', '0.7843', '0', '7500', '0', '-72', '-156');
INSERT INTO `worldeclipse` VALUES ('201', '2090', 'Sep', '23', '16:56:36', '1122', 'T', '1.0562', '23', '463', '03m36s', '61', '-40');
INSERT INTO `worldeclipse` VALUES ('202', '2091', 'Feb', '18', '9:54:40', '1127', 'P', '0.6558', '0', '7500', '0', '71', '-18');
INSERT INTO `worldeclipse` VALUES ('203', '2091', 'Aug', '15', '0:34:43', '1133', 'T', '1.0216', '18', '236', '01m38s', '-56', '150');
INSERT INTO `worldeclipse` VALUES ('204', '2092', 'Feb', '7', '15:10:20', '1139', 'A', '0.984', '64', '62', '01m48s', '10', '-49');
INSERT INTO `worldeclipse` VALUES ('205', '2092', 'Aug', '3', '9:59:33', '1145', 'A', '0.9794', '78', '75', '02m31s', '6', '30');
INSERT INTO `worldeclipse` VALUES ('206', '2093', 'Jan', '27', '3:22:16', '1151', 'T', '1.034', '74', '119', '02m58s', '-34', '136');
INSERT INTO `worldeclipse` VALUES ('207', '2093', 'Jul', '23', '12:32:04', '1157', 'A', '0.9463', '55', '241', '05m11s', '55', '1');
INSERT INTO `worldeclipse` VALUES ('208', '2094', 'Jan', '16', '18:59:03', '1163', 'T', '1.0342', '21', '329', '01m51s', '-85', '-11');
INSERT INTO `worldeclipse` VALUES ('209', '2094', 'Jun', '13', '0:22:11', '1168', 'P', '0.1618', '0', '7500', '0', '-65', '-164');
INSERT INTO `worldeclipse` VALUES ('210', '2094', 'Jul', '12', '13:24:35', '1169', 'P', '0.4224', '0', '7500', '0', '68', '153');
INSERT INTO `worldeclipse` VALUES ('211', '2094', 'Dec', '7', '20:05:56', '1174', 'P', '0.7046', '0', '7500', '0', '65', '-95');
INSERT INTO `worldeclipse` VALUES ('212', '2095', 'Jun', '2', '10:07:40', '1180', 'T', '1.0332', '50', '145', '03m18s', '-17', '37');
INSERT INTO `worldeclipse` VALUES ('213', '2095', 'Nov', '27', '1:02:57', '1186', 'A', '0.933', '61', '285', '08m47s', '7', '170');
INSERT INTO `worldeclipse` VALUES ('214', '2096', 'May', '22', '1:37:14', '1192', 'T', '1.0737', '83', '241', '06m06s', '27', '153');
INSERT INTO `worldeclipse` VALUES ('215', '2096', 'Nov', '15', '0:36:15', '1198', 'A', '0.9237', '78', '294', '08m53s', '-30', '163');
INSERT INTO `worldeclipse` VALUES ('216', '2097', 'May', '11', '18:34:31', '1204', 'T', '1.0538', '31', '339', '03m10s', '67', '-150');
INSERT INTO `worldeclipse` VALUES ('217', '2097', 'Nov', '4', '2:01:25', '1210', 'A', '0.9494', '26', '411', '03m36s', '-66', '87');
INSERT INTO `worldeclipse` VALUES ('218', '2098', 'Apr', '1', '20:02:31', '1215', 'P', '0.7984', '0', '7500', '0', '-61', '-38');
INSERT INTO `worldeclipse` VALUES ('219', '2098', 'Sep', '25', '0:31:16', '1221', 'P', '0.7871', '0', '7500', '0', '61', '-101');
INSERT INTO `worldeclipse` VALUES ('220', '2098', 'Oct', '24', '10:36:11', '1222', 'Pb', '0.0056', '0', '100', '0', '-62', '-95');
INSERT INTO `worldeclipse` VALUES ('221', '2099', 'Mar', '21', '22:54:32', '1227', 'A', '0.9318', '66', '275', '07m32s', '-20', '-149');
INSERT INTO `worldeclipse` VALUES ('222', '2099', 'Sep', '14', '16:57:53', '1233', 'T', '1.0684', '67', '241', '05m18s', '23', '-63');
INSERT INTO `worldeclipse` VALUES ('223', '2100', 'Mar', '10', '22:28:11', '1239', 'A', '0.9338', '72', '257', '07m29s', '12', '-162');
INSERT INTO `worldeclipse` VALUES ('224', '2100', 'Sep', '4', '8:49:20', '1245', 'T', '1.0402', '70', '142', '03m32s', '-10', '39');
