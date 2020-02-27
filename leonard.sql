/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : leonard

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2020-02-15 15:52:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for attach_file
-- ----------------------------
DROP TABLE IF EXISTS `attach_file`;
CREATE TABLE `attach_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attach_file
-- ----------------------------
INSERT INTO `attach_file` VALUES ('1', '1_报销单.jpg', 'F:\\java_idea\\leonard\\zlj_web\\target\\zlj_web\\upload', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of claim_voucher
-- ----------------------------
INSERT INTO `claim_voucher` VALUES ('1', '怀化学院招待费用报销单(报销银行卡号:333-4444-55555)', '10031', '2020-02-15 15:21:09', null, '2001', '已打款');
INSERT INTO `claim_voucher` VALUES ('2', '加班出车补费', '10021', '2020-02-15 15:33:12', null, '500', '已打款');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of claim_voucher_item
-- ----------------------------
INSERT INTO `claim_voucher_item` VALUES ('1', '1', '交通', '500', '工具:高铁');
INSERT INTO `claim_voucher_item` VALUES ('2', '1', '餐饮', '500', '地点:皇族大酒店 招待对象:王某某 时间:2020-02-02');
INSERT INTO `claim_voucher_item` VALUES ('3', '1', '住宿', '1001', '地点:皇族大酒店E楼202');
INSERT INTO `claim_voucher_item` VALUES ('4', '2', '交通', '500', '滴滴车票');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deal_record
-- ----------------------------
INSERT INTO `deal_record` VALUES ('1', '1', '10031', '2020-02-15 15:21:53', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES ('2', '1', '10030', '2020-02-15 15:28:57', '通过', '待复审', '审批通过');
INSERT INTO `deal_record` VALUES ('3', '1', '10001', '2020-02-15 15:30:07', '通过', '已审核', '总经理复审通过');
INSERT INTO `deal_record` VALUES ('4', '1', '10002', '2020-02-15 15:31:25', '打款', '已打款', '得到卡号,已经到款请知晓');
INSERT INTO `deal_record` VALUES ('5', '2', '10021', '2020-02-15 15:33:20', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES ('6', '2', '10020', '2020-02-15 15:33:35', '通过', '已审核', '审批通过');
INSERT INTO `deal_record` VALUES ('7', '2', '10002', '2020-02-15 15:34:14', '打款', '已打款', '打款成功');

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
INSERT INTO `department` VALUES ('10001', '总经理办公室', '大汉希尔顿E座1201');
INSERT INTO `department` VALUES ('10002', '财务部', '大汉希尔顿E座1202');
INSERT INTO `department` VALUES ('10003', '研发部', '大汉希尔顿E座1101');
INSERT INTO `department` VALUES ('10004', '开发部', '广州华景软件园B栋202');
INSERT INTO `department` VALUES ('10005', '运维部', '中国移动南方基地');
INSERT INTO `department` VALUES ('10006', '测试1部', '广州华景软件园B栋202');
INSERT INTO `department` VALUES ('10007', '外交部', '北京体育中心');
INSERT INTO `department` VALUES ('10020', '测试2部', '计算机科学与工程学院');

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
INSERT INTO `employee` VALUES ('10001', '000000', '科比', '10001', '总经理');
INSERT INTO `employee` VALUES ('10002', '000000', '詹姆斯', '10002', '财务');
INSERT INTO `employee` VALUES ('10010', '000000', '伦纳德', '10003', '部门经理');
INSERT INTO `employee` VALUES ('10011', '000000', '乔治', '10003', '员工');
INSERT INTO `employee` VALUES ('10020', '000000', '库里', '10006', '部门经理');
INSERT INTO `employee` VALUES ('10021', '000000', '汤普森', '10006', '员工');
INSERT INTO `employee` VALUES ('10022', '000000', '格林', '10006', '员工');
INSERT INTO `employee` VALUES ('10030', '000000', '欧文', '10007', '部门经理');
INSERT INTO `employee` VALUES ('10031', '000000', '塔图姆', '10007', '员工');
