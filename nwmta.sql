/*
Navicat MySQL Data Transfer

Source Server         : Házi szerver
Source Server Version : 50508
Source Host           : localhost:3306
Source Database       : newmta

Target Server Type    : MYSQL
Target Server Version : 50508
File Encoding         : 65001

Date: 2025-03-24 09:53:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `atms`
-- ----------------------------
DROP TABLE IF EXISTS `atms`;
CREATE TABLE `atms` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `xPos` int(255) DEFAULT NULL,
  `yPos` int(255) DEFAULT NULL,
  `zPos` int(255) DEFAULT NULL,
  `interior` int(255) DEFAULT NULL,
  `dimension` int(255) DEFAULT NULL,
  `rotation` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- ----------------------------
-- Records of atms
-- ----------------------------
