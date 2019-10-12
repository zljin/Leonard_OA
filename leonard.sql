/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : leonard

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2019-10-12 12:26:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for claim_voucher
-- ----------------------------
DROP TABLE IF EXISTS `claim_voucher`;
CREATE TABLE `claim_voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cause` varchar(100) DEFAULT NULL,
  `create_sn` char(5) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `next_deal_sn` char(5) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_2` (`next_deal_sn`),
  KEY `FK_Reference_3` (`create_sn`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`next_deal_sn`) REFERENCES `employee` (`sn`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`create_sn`) REFERENCES `employee` (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of claim_voucher
-- ----------------------------
INSERT INTO `claim_voucher` VALUES ('1', '加班车补', '10006', '2019-10-02 14:23:53', '10006', '30', '已打回');
INSERT INTO `claim_voucher` VALUES ('2', '出差机票', '10010', '2019-10-03 16:15:32', null, '1000', '已打款');
INSERT INTO `claim_voucher` VALUES ('3', '请客户吃饭', '10004', '2019-10-03 16:58:09', '10003', null, '已提交');
INSERT INTO `claim_voucher` VALUES ('4', '报销单测试', '10004', '2019-10-03 17:05:11', '10003', null, '已提交');
INSERT INTO `claim_voucher` VALUES ('5', '出差受伤2222', '10004', '2019-10-03 17:07:40', '10003', null, '已提交');
INSERT INTO `claim_voucher` VALUES ('6', '出差机票111', '10004', '2019-10-03 18:13:42', '10003', null, '已提交');
INSERT INTO `claim_voucher` VALUES ('7', '出差机票', '10010', '2019-10-11 11:32:53', null, '3000', '已打款');
INSERT INTO `claim_voucher` VALUES ('9', '在北京加班的餐补', '10010', '2019-10-11 16:16:43', '10002', '191', '已审核');

-- ----------------------------
-- Table structure for claim_voucher_item
-- ----------------------------
DROP TABLE IF EXISTS `claim_voucher_item`;
CREATE TABLE `claim_voucher_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `claim_voucher_id` int(11) DEFAULT NULL,
  `item` varchar(20) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_4` (`claim_voucher_id`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`claim_voucher_id`) REFERENCES `claim_voucher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of claim_voucher_item
-- ----------------------------
INSERT INTO `claim_voucher_item` VALUES ('1', '1', '交通', '30', '加班30元车补');
INSERT INTO `claim_voucher_item` VALUES ('2', '2', '交通', '1000', '飞往北京的机票');
INSERT INTO `claim_voucher_item` VALUES ('3', '3', '餐饮', '600', '公费报销吃饭');
INSERT INTO `claim_voucher_item` VALUES ('4', '4', '办公', '1000', '备注111');
INSERT INTO `claim_voucher_item` VALUES ('5', '5', '办公', '222', '医疗费');
INSERT INTO `claim_voucher_item` VALUES ('6', '6', '交通', '1111', '飞往广州的机票');
INSERT INTO `claim_voucher_item` VALUES ('7', '7', '交通', '1000', '飞往北京的机票');
INSERT INTO `claim_voucher_item` VALUES ('8', '7', '交通', '2000', '飞往美国洛杉矶的机票');
INSERT INTO `claim_voucher_item` VALUES ('9', '9', '餐饮', '100', '北京烤鸭');
INSERT INTO `claim_voucher_item` VALUES ('10', '9', '餐饮', '91', '长沙臭豆腐');

-- ----------------------------
-- Table structure for deal_record
-- ----------------------------
DROP TABLE IF EXISTS `deal_record`;
CREATE TABLE `deal_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `claim_voucher_id` int(11) DEFAULT NULL,
  `deal_sn` char(5) DEFAULT NULL,
  `deal_time` datetime DEFAULT NULL,
  `deal_way` varchar(20) DEFAULT NULL,
  `deal_result` varchar(20) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_5` (`claim_voucher_id`),
  KEY `FK_Reference_6` (`deal_sn`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`claim_voucher_id`) REFERENCES `claim_voucher` (`id`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`deal_sn`) REFERENCES `employee` (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deal_record
-- ----------------------------
INSERT INTO `deal_record` VALUES ('1', '2', '10010', '2019-10-03 16:24:59', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES ('2', '1', '10006', '2019-10-03 16:37:20', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES ('3', '3', '10004', '2019-10-03 16:58:13', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES ('4', '4', '10004', '2019-10-03 17:05:24', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES ('5', '5', '10004', '2019-10-03 17:09:02', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES ('6', '6', '10004', '2019-10-03 18:13:54', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES ('7', '2', '10006', '2019-10-04 13:07:47', '通过', '已审核', '');
INSERT INTO `deal_record` VALUES ('8', '2', '10002', '2019-10-04 13:08:27', '打款', '已打款', '');
INSERT INTO `deal_record` VALUES ('9', '1', '10006', '2019-10-10 15:21:04', '打回', '已打回', '');
INSERT INTO `deal_record` VALUES ('10', '1', '10006', '2019-10-10 15:30:29', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES ('11', '7', '10010', '2019-10-11 16:15:20', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES ('12', '7', '10006', '2019-10-12 10:30:23', '通过', '已审核', '');
INSERT INTO `deal_record` VALUES ('13', '7', '10002', '2019-10-12 10:31:49', '打款', '已打款', '牛逼');
INSERT INTO `deal_record` VALUES ('14', '9', '10010', '2019-10-12 10:45:03', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES ('15', '9', '10006', '2019-10-12 10:52:47', '通过', '已审核', '');
INSERT INTO `deal_record` VALUES ('16', '1', '10006', '2019-10-12 11:01:31', '打回', '已打回', 'what fuck');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `sn` char(5) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('10001', '总经理办公室', '星星大厦E座1201');
INSERT INTO `department` VALUES ('10002', '财务部', '星星大厦E座1202');
INSERT INTO `department` VALUES ('10003', '事业部', '星星大厦E座1101');
INSERT INTO `department` VALUES ('10004', '开发部', '广州华景软件园B栋202');
INSERT INTO `department` VALUES ('10005', '运维部', '中国移动南方基地');
INSERT INTO `department` VALUES ('10006', '测试部', '广州华景软件园B栋202');
INSERT INTO `department` VALUES ('10020', '监察部', '计算机科学与工程学院');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `sn` char(5) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `department_sn` char(5) DEFAULT NULL,
  `post` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sn`),
  KEY `FK_Reference_1` (`department_sn`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`department_sn`) REFERENCES `department` (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('10001', '000000', '刘备', '10001', '总经理');
INSERT INTO `employee` VALUES ('10002', '000000', '孙尚香', '10002', '财务');
INSERT INTO `employee` VALUES ('10003', '000000', '关羽', '10003', '部门经理');
INSERT INTO `employee` VALUES ('10004', '000000', '周仓', '10003', '员工');
INSERT INTO `employee` VALUES ('10006', '000000', '姚明', '10006', '部门经理');
INSERT INTO `employee` VALUES ('10010', '19981998', '麦迪', '10006', '员工');
INSERT INTO `employee` VALUES ('10011', '000000', '阿泰斯特', '10003', '员工');
