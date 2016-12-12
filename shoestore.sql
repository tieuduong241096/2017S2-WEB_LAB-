/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : shoestore

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2016-11-28 10:16:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `password` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `brandid` int(11) NOT NULL auto_increment,
  `brandname` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`brandid`),
  KEY `brandid` USING BTREE (`brandid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', 'Nike');
INSERT INTO `brand` VALUES ('2', 'Adidas');
INSERT INTO `brand` VALUES ('3', 'Vans');
INSERT INTO `brand` VALUES ('4', 'Converse');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `categoryid` int(11) NOT NULL auto_increment,
  `categoryname` varchar(255) collate utf8_unicode_ci default NULL,
  `brandid` int(11) default NULL,
  PRIMARY KEY  (`categoryid`),
  KEY `brandid` USING BTREE (`brandid`),
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`brandid`) REFERENCES `brand` (`brandid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'Running', '1');
INSERT INTO `category` VALUES ('2', 'Basketball', '1');
INSERT INTO `category` VALUES ('3', 'Soccer', '1');
INSERT INTO `category` VALUES ('4', 'Training & Gym', '1');
INSERT INTO `category` VALUES ('5', 'Sportswear', '1');
INSERT INTO `category` VALUES ('6', 'Jordan', '1');
INSERT INTO `category` VALUES ('7', 'Originals', '2');
INSERT INTO `category` VALUES ('8', 'NEO', '2');
INSERT INTO `category` VALUES ('9', 'Stella McCartney', '2');
INSERT INTO `category` VALUES ('10', 'Athletics', '2');
INSERT INTO `category` VALUES ('11', 'SK8-HI', '3');
INSERT INTO `category` VALUES ('12', 'Old Skool', '3');
INSERT INTO `category` VALUES ('13', 'Authentic', '3');
INSERT INTO `category` VALUES ('14', 'Slip On', '3');
INSERT INTO `category` VALUES ('15', 'Chuck II', '4');
INSERT INTO `category` VALUES ('16', 'All Star', '4');
INSERT INTO `category` VALUES ('17', 'Jack Purcell', '4');
INSERT INTO `category` VALUES ('18', 'Andy Warhol', '4');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productid` int(11) unsigned NOT NULL auto_increment,
  `productname` varchar(255) collate utf8_unicode_ci default NULL,
  `productprice` double default NULL,
  `productimage` varchar(255) collate utf8_unicode_ci default NULL,
  `productquantity` int(100) default NULL,
  `description` varchar(255) collate utf8_unicode_ci default NULL,
  `discount` double default NULL,
  `brandid` int(11) default NULL,
  `categoryid` int(11) default NULL,
  PRIMARY KEY  (`productid`),
  KEY `brandid` USING BTREE (`brandid`),
  KEY `categoryid` USING BTREE (`categoryid`),
  KEY `productid` USING BTREE (`productid`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`brandid`) REFERENCES `brand` (`brandid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`categoryid`) REFERENCES `category` (`categoryid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', 'Nike Air Max 2017', '190', '1.jpg', '20', null, '0', '1', '1');
INSERT INTO `product` VALUES ('2', 'Nike Free RN Flyknit', '130', '2.jpg', '20', null, '0', '1', '1');
INSERT INTO `product` VALUES ('3', 'Nike Air Zoom Pegasus 33', '110', '3.jpg', '20', null, '0', '1', '1');
INSERT INTO `product` VALUES ('4', 'Nike LunarEpic Low Flyknit', '160', '4.jpg', '20', null, '0', '1', '1');
INSERT INTO `product` VALUES ('5', 'Nike LunarEpic Flyknit Shield', '200', '5.jpg', '20', null, '0', '1', '1');
INSERT INTO `product` VALUES ('6', 'Nike Air Zoom Pegasus 33 Shield', '125', '6.jpg', '20', null, '0', '1', '1');
INSERT INTO `product` VALUES ('7', 'Nike Zoom LeBron Soldier 10', '140', '7.jpg', '20', null, '0', '1', '2');
INSERT INTO `product` VALUES ('8', 'Nike Zoom KD 9', '150', '8.jpg', '20', null, '0', '1', '2');
INSERT INTO `product` VALUES ('9', 'Kobe XI Elite', '200', '9.jpg', '20', null, '0', '1', '2');
INSERT INTO `product` VALUES ('10', 'Kyrie 2', '120', '10.jpg', '20', null, '0', '1', '2');
INSERT INTO `product` VALUES ('11', 'Kobe XI', '160', '11.jpg', '20', null, '0', '1', '2');
INSERT INTO `product` VALUES ('12', 'Air Jordan XXXI', '185', '12.jpg', '20', '', '0', '1', '2');
INSERT INTO `product` VALUES ('13', 'Nike Mercurial Superfly V', '315', '13.jpg', '20', null, '0', '1', '3');
INSERT INTO `product` VALUES ('14', 'Nike Mercurial Vapor XI CR7', '255', '14.jpg', '20', null, '0', '1', '3');
INSERT INTO `product` VALUES ('15', 'Nike MercurialX Proximo', '175', '15.jpg', '20', null, '0', '1', '3');
INSERT INTO `product` VALUES ('16', 'Nike MercurialX Finale II ', '100', '16.jpg', '20', null, '0', '1', '3');
INSERT INTO `product` VALUES ('17', 'Nike Mercurial Vapor XI', '270', '17.jpg', '20', null, '0', '1', '3');
INSERT INTO `product` VALUES ('18', 'Nike Jr. Mercurial Superfly V', '190', '18.jpg', '20', null, '0', '1', '3');
INSERT INTO `product` VALUES ('19', 'Nike Free Train Force Flyknit DangeRuss Wilson', '160', '19.jpg', '20', null, '0', '1', '4');
INSERT INTO `product` VALUES ('20', 'Nike Metcon 2 \'Meltdown\'', '140', '20.jpg', '20', null, '0', '1', '4');
INSERT INTO `product` VALUES ('21', 'Nike Metcon 2', '130', '21.jpg', '20', null, '0', '1', '4');
INSERT INTO `product` VALUES ('22', 'Nike Zoom Train Complete', '110', '22.jpg', '20', null, '0', '1', '4');
INSERT INTO `product` VALUES ('23', 'Nike Free Train Versatility', '90', '23.jpg', '20', null, '0', '1', '4');
INSERT INTO `product` VALUES ('24', 'Nike Train Prime Iron DF', '80', '24.jpg', '20', null, '0', '1', '4');
INSERT INTO `product` VALUES ('25', 'Nike Lunar Force 1 Duckboot', '165', '25.jpg', '20', null, '0', '1', '5');
INSERT INTO `product` VALUES ('26', 'Nike Air Force 1 High 07 LV8 WB', '140', '26.jpg', '20', null, '0', '1', '5');
INSERT INTO `product` VALUES ('27', 'Nike Sock Dart SE Premium', '140', '27.jpg', '20', null, '0', '1', '5');
INSERT INTO `product` VALUES ('28', 'Nike Air Max Zero Essential', '130', '28.jpg', '20', null, '0', '1', '5');
INSERT INTO `product` VALUES ('29', 'Nike Roshe Two SE', '100', '29.jpg', '20', null, '0', '1', '5');
INSERT INTO `product` VALUES ('30', 'Nike Air Max 90 Pendleton QS', '160', '30.jpg', '20', null, '0', '1', '5');
INSERT INTO `product` VALUES ('31', 'Air Jordan XXXI Premium', '185', '31.jpg', '20', null, '0', '1', '6');
INSERT INTO `product` VALUES ('32', 'Air Jordan XXXI', '185', '32.jpg', '20', null, '0', '1', '6');
INSERT INTO `product` VALUES ('33', 'Jordan Extra.Fly', '120', '33.jpg', '20', null, '0', '1', '6');
INSERT INTO `product` VALUES ('34', 'Jordan Super.Fly 5', '140', '34.jpg', '20', null, '0', '1', '6');
INSERT INTO `product` VALUES ('35', 'Air Jordan 3 Retro', '190', '35.jpg', '20', null, '0', '1', '6');
INSERT INTO `product` VALUES ('36', 'Jordan Reveal', '115', '36.jpg', '20', null, '0', '1', '6');
INSERT INTO `product` VALUES ('37', 'Palace Indoor', '120', '37.jpg', '20', null, '0', '2', '1');
INSERT INTO `product` VALUES ('38', 'Tubular instinct', '200', '38.jpg', '20', null, '0', '2', '1');
INSERT INTO `product` VALUES ('39', 'Tubular invader', '210', '39.jpg', '20', null, '0', '2', '1');
INSERT INTO `product` VALUES ('40', 'Tubular Radial', '150', '40.jpg', '20', null, '0', '2', '1');
INSERT INTO `product` VALUES ('41', 'Tubular Radial Primeknit', '180', '41.jpg', '20', null, '0', '2', '1');
INSERT INTO `product` VALUES ('42', 'Tubular Doom', '160', '42.jpg', '20', null, '0', '2', '1');

-- ----------------------------
-- Table structure for receipt
-- ----------------------------
DROP TABLE IF EXISTS `receipt`;
CREATE TABLE `receipt` (
  `receiptid` int(11) NOT NULL,
  `bookdate` datetime default NULL,
  `paymode` varchar(50) collate utf8_unicode_ci default NULL,
  `shipdate` datetime default NULL,
  `shipaddress` varchar(50) collate utf8_unicode_ci default NULL,
  `userid` int(11) default NULL,
  `status` varchar(30) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`receiptid`),
  KEY `userid` USING BTREE (`userid`),
  CONSTRAINT `receipt_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of receipt
-- ----------------------------

-- ----------------------------
-- Table structure for receiptdetail
-- ----------------------------
DROP TABLE IF EXISTS `receiptdetail`;
CREATE TABLE `receiptdetail` (
  `receiptdetailid` int(20) NOT NULL auto_increment,
  `quantity` int(20) default NULL,
  `price` double default NULL,
  `receiptid` int(11) default NULL,
  `productid` int(11) unsigned default NULL,
  PRIMARY KEY  (`receiptdetailid`),
  KEY `productid` (`productid`),
  KEY `receiptid` (`receiptid`),
  CONSTRAINT `receiptdetail_ibfk_2` FOREIGN KEY (`receiptid`) REFERENCES `receipt` (`receiptid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `receiptdetail_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of receiptdetail
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL auto_increment,
  `username` varchar(255) collate utf8_unicode_ci default NULL,
  `password` varchar(255) collate utf8_unicode_ci default NULL,
  `fullname` varchar(255) collate utf8_unicode_ci default NULL,
  `status` bit(1) default NULL,
  `age` int(50) default NULL,
  `gender` bit(1) default NULL,
  `address` varchar(255) collate utf8_unicode_ci default NULL,
  `email` varchar(255) collate utf8_unicode_ci default NULL,
  `phone` varchar(15) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
