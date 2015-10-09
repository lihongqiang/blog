/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50546
Source Host           : localhost:3306
Source Database       : blogver1

Target Server Type    : MYSQL
Target Server Version : 50546
File Encoding         : 65001

Date: 2015-10-09 23:29:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL DEFAULT '',
  `content` mediumtext,
  `pubtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `blogid` int(11) NOT NULL DEFAULT '0',
  `sortid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '今天我做好了一件事情', '今天我做好了一件事情，一件很酷的事情。', '2015-10-06 00:00:00', '1', '1');
INSERT INTO `article` VALUES ('2', '你在他乡还好吗？', '你还好吗?问候你一句。', '2015-10-06 00:00:00', '1', '3');
INSERT INTO `article` VALUES ('3', '你好，时间', '你好世界我的时间。', '2015-10-06 00:00:00', '2009', '3');
INSERT INTO `article` VALUES ('4', '我很好', '我很好', '2015-10-06 00:00:00', '1', '1');

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(20) NOT NULL DEFAULT '',
  `subject` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `image` varchar(100) DEFAULT NULL,
  `visitcount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('1', 'admin', '123456', 'lhq', '415200973@qq.com', 'image/default.jpg', '1');

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) NOT NULL DEFAULT '',
  `content` mediumtext,
  `pubtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `articleid` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('1', '不错不错', '写的很好呀', '2015-10-06 15:30:30', '1', '127.0.0.1');
INSERT INTO `feedback` VALUES ('2', '你好', '<FONT color=#ffff00>做的 不错呀！<BR></FONT>', '2015-10-06 15:30:30', '1', '127.0.0.1');
INSERT INTO `feedback` VALUES ('3', '你好', '往往往往<BR>', '2015-10-06 15:30:30', '2', '127.0.0.1');
INSERT INTO `feedback` VALUES ('4', '北方的狼', '<BR><FONT color=#ff6633>看了不错哦！</FONT>', '2015-10-06 15:30:30', '1', '127.0.0.1');

-- ----------------------------
-- Table structure for links
-- ----------------------------
DROP TABLE IF EXISTS `links`;
CREATE TABLE `links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `blogid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of links
-- ----------------------------
INSERT INTO `links` VALUES ('1', '网址导航', 'http://www.hao123.com', '1');
INSERT INTO `links` VALUES ('3', '百度', 'www.baidu.com', '1');

-- ----------------------------
-- Table structure for sort
-- ----------------------------
DROP TABLE IF EXISTS `sort`;
CREATE TABLE `sort` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `blogid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of sort
-- ----------------------------
INSERT INTO `sort` VALUES ('1', '个人日记', '1');
INSERT INTO `sort` VALUES ('3', '个人博客', '1');
