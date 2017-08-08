/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.23 : Database - eshop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`eshop` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `eshop`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员编号',
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `PWD` varchar(100) DEFAULT NULL COMMENT '密码',
  `PRIVILEDGE` int(11) DEFAULT NULL COMMENT '权限，0表示拥有所有权限',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`ID`,`USERNAME`,`PWD`,`PRIVILEDGE`) values (1,'刘高云','199325',0);

/*Table structure for table `appeal` */

DROP TABLE IF EXISTS `appeal`;

CREATE TABLE `appeal` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '申诉项的ID',
  `complainantID` int(11) NOT NULL COMMENT '申诉人ID',
  `respondentID` int(11) NOT NULL COMMENT '被申诉人ID',
  `orderID` int(11) NOT NULL COMMENT '订单ID,关联信息',
  `reason` varchar(1000) DEFAULT NULL COMMENT '具体申诉缘由',
  `reply` varchar(1000) DEFAULT NULL COMMENT '答复信息',
  `submitTime` datetime DEFAULT NULL COMMENT '申诉提交时间',
  PRIMARY KEY (`ID`),
  KEY `complainantID` (`complainantID`),
  KEY `respondentID` (`respondentID`),
  KEY `orderID` (`orderID`),
  CONSTRAINT `appeal_ibfk_1` FOREIGN KEY (`complainantID`) REFERENCES `student` (`ID`),
  CONSTRAINT `appeal_ibfk_2` FOREIGN KEY (`respondentID`) REFERENCES `student` (`ID`),
  CONSTRAINT `appeal_ibfk_3` FOREIGN KEY (`orderID`) REFERENCES `orders` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `appeal` */

insert  into `appeal`(`ID`,`complainantID`,`respondentID`,`orderID`,`reason`,`reply`,`submitTime`) values (2,15,16,25,'wu',NULL,'2015-07-31 21:10:04');

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '书本编号',
  `NAME` varchar(100) DEFAULT NULL COMMENT '书名',
  `AUTHOR` varchar(100) DEFAULT NULL COMMENT '作者或主编',
  `PRICE` int(11) DEFAULT NULL COMMENT '书的等值积分价格',
  `TYPE` varchar(100) DEFAULT NULL COMMENT '书的类型',
  `OWNID` int(11) DEFAULT NULL COMMENT '书的拥有者的ID',
  `PIC` varchar(200) DEFAULT NULL COMMENT '书籍标有价格的一个封面图片的文件名',
  `STATE` varchar(100) DEFAULT NULL COMMENT '书的状态，例如待审核、已通过',
  `PRESS` varchar(200) DEFAULT NULL COMMENT '出版社',
  `SUBJECT` varchar(100) DEFAULT NULL COMMENT '学科',
  `SUBTIME` datetime DEFAULT NULL COMMENT '书籍提交注册请求的时间',
  PRIMARY KEY (`ID`),
  KEY `OWNID` (`OWNID`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`OWNID`) REFERENCES `student` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

/*Data for the table `book` */

insert  into `book`(`ID`,`NAME`,`AUTHOR`,`PRICE`,`TYPE`,`OWNID`,`PIC`,`STATE`,`PRESS`,`SUBJECT`,`SUBTIME`) values (12,'自慢',NULL,5,'教材',15,'1435543170768.jpg','冻结','电子工业出版社','经济','2015-07-12 12:36:09'),(13,'书名1',NULL,6,'论文',16,'1442991779137.jpg','冻结','清华大学出版社','管理','2015-07-12 12:36:14'),(15,'书籍2',NULL,5,'报刊',15,'1442991779137.jpg','冻结','高等教育出版社','外语','2015-07-12 12:36:19'),(16,'书籍3',NULL,1,'名著',16,'1435543170768.jpg','正在售出','机械工业出版社','医学','2015-07-12 12:36:21'),(21,'书籍7',NULL,1,'散文集',16,'1457693774868.png','冻结','高等教育出版社','管理','2015-07-12 12:36:27'),(25,'2','B',3,'杂志',19,'1440660018266.jpg','冻结','译林出版社','政治',NULL),(28,'考研英语词汇','俞敏洪',23,'其他',19,'1442233685630.png','正在售出','群言出版社','信息与计算科学',NULL),(31,'王者归来','杜雨霏',2,'技术',15,'1442991779137.jpg','正在售出','清华大学出版社','科学',NULL),(41,'java语言程序设计','梁勇 ',3,'教材',23,'1457622415509.png','正在售出','机械工业出版社','计算机',NULL),(42,'SQL必知必会','[美]Ben Forta ',2,'技术类',15,'1457685624768.png','正在售出','人民教育出版社','计算机科学',NULL),(43,'人类简史','Yuval Noah ',3,'教材',23,'1457691712286.png','冻结','中信出版社','社会学',NULL),(44,'微服务架构与实现','王磊',3,'技术类',23,'1457691957841.png','冻结','电子工业出版社','计算机科学与技术',NULL),(45,'数字系统设计','夏宇闻',4,'教材',23,'1457692033198.png','正在售出','高等教育出版社','计算机科学与技术',NULL),(46,'疯狂Swift讲义','李刚',4,'技术类',23,'1457692585225.png','正在售出','电子工业出版社','计算机科学与技术',NULL),(47,'大数据思维与决策','伊恩·艾瑞斯',3,'技术类',23,'1457692824092.png','正在售出','人民邮电出版社','计算机科学与技术',NULL),(48,'国际经济法','余劲松',3,'教材',23,'1442991779137.jpg','正在售出','北京大学出版社','计算机科学与技术',NULL),(49,'家园','余劲松',3,'其他',23,'1457693032617.jpg','正在售出','译林出版社','计算机科学与技术',NULL),(50,'自然的基因','理查德',2,'其他',23,'1457693176286.png','正在售出','人民教育出版社','自然科学',NULL),(51,'Java Web 开发技术','软件开发技术联盟',4,'技术类',23,'1457693355220.png','正在售出','清华大学出版社','计算机科学与技术',NULL),(52,'Objective C高级编程','软件开发技术联盟',4,'教材',23,'1457693485777.png','正在售出','人民邮电出版社','计算机科学与技术',NULL),(53,'正义女生不睁眼','知乎',3,'杂志',15,'1457693662404.png','正在售出','中信出版社','其他',NULL),(54,'机器学习','周志华',3,'教材',15,'1457693774868.png','正在售出','清华大学出版社','通信技术',NULL),(55,'锋利的jQuery','单东林',4,'技术类',23,'1457693938545.png','待审核','人民邮电出版社','软件工程',NULL),(56,'浪潮之巅','吴军',3,'技术类',23,'1457693999615.png','待审核','人民邮电出版社','软件工程',NULL),(57,'数学之美','吴军',2,'其他',23,'1457694078040.png','待审核','人民邮电出版社','数学',NULL),(58,'Python算法教程','悦西亚L.卡尔森',3,'技术类',23,'1457694262691.png','待审核','人民邮电出版社','数学',NULL),(59,'C++ Primer','斯坦利',3,'技术类',23,'1457694409032.png','待审核','电子工业出版社','计算机科学与技术',NULL),(60,'数据库系统概论','王珊',2,'教材',23,'1457694525869.png','待审核','高等教育出版社','计算机科学与技术',NULL),(61,'Redis实战','悦西亚L.卡尔森',4,'技术类',23,'1457694812604.png','正在售出','人民邮电出版社','计算机科学与技术',NULL),(64,'ii','p\'p',2,'论文',15,'1457694409032.png','待审核','高等教育出版社','o\'o',NULL),(65,'ii','p\'p',2,'论文',15,'1457694525869.png','待审核','','o\'o',NULL);

/*Table structure for table `credit_transfer` */

DROP TABLE IF EXISTS `credit_transfer`;

CREATE TABLE `credit_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `credit_from` int(11) DEFAULT NULL,
  `credit_to` int(11) DEFAULT NULL,
  `credit` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `info` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `from` (`credit_from`),
  KEY `to` (`credit_to`),
  CONSTRAINT `credit_transfer_ibfk_1` FOREIGN KEY (`credit_from`) REFERENCES `student` (`ID`),
  CONSTRAINT `credit_transfer_ibfk_2` FOREIGN KEY (`credit_to`) REFERENCES `student` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `credit_transfer` */

insert  into `credit_transfer`(`id`,`credit_from`,`credit_to`,`credit`,`date`,`info`) values (1,15,16,99,'2015-08-10 00:00:00',''),(2,15,16,0,'2015-08-10 00:00:00',''),(3,15,19,8,'2015-09-23 00:00:00','呼呼');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单流水号',
  `SALER_ID` int(11) NOT NULL COMMENT '售书者的ID',
  `BUYER_ID` int(11) NOT NULL COMMENT '买书者的ID',
  `BOOK_ID` int(11) NOT NULL COMMENT '书的ID',
  `SUB_DATE` datetime DEFAULT NULL COMMENT '订单提交的日期',
  `COUNT` int(11) DEFAULT NULL COMMENT '订单的金额（积分）',
  `STATE` varchar(100) DEFAULT NULL COMMENT '订单的状态，例如未支付、已支付、已完成、已退订、已过期等',
  PRIMARY KEY (`ID`),
  KEY `orders_ibfk_1` (`SALER_ID`),
  KEY `orders_ibfk_2` (`BUYER_ID`),
  KEY `orders_ibfk_3` (`BOOK_ID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`SALER_ID`) REFERENCES `student` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`BUYER_ID`) REFERENCES `student` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`BOOK_ID`) REFERENCES `book` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`ID`,`SALER_ID`,`BUYER_ID`,`BOOK_ID`,`SUB_DATE`,`COUNT`,`STATE`) values (25,16,15,21,'2015-07-12 00:00:00',1,'退款完成'),(31,16,15,16,'2015-07-18 00:00:00',1,'已完成'),(47,15,15,16,'2015-08-31 22:44:08',1,'退款完成'),(49,19,19,21,'2015-09-03 15:05:21',1,'待付款'),(50,19,15,28,'2015-09-22 00:00:00',1,'已支付'),(51,15,19,31,'2015-09-23 00:00:00',1,'待付款'),(52,15,19,12,'2015-09-25 00:00:00',1,'待付款'),(53,15,19,15,'2015-09-25 00:00:00',1,'待付款'),(55,23,15,43,'2016-03-14 00:00:00',1,'已支付'),(56,15,15,21,'2016-03-14 21:14:06',1,'已支付'),(57,15,15,13,'2016-03-14 21:14:06',1,'待付款'),(58,23,15,44,'2016-03-23 00:00:00',1,'待付款');

/*Table structure for table `shoplist` */

DROP TABLE IF EXISTS `shoplist`;

CREATE TABLE `shoplist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `std_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `preshoptime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `std_id` (`std_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `shoplist_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `student` (`ID`),
  CONSTRAINT `shoplist_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `shoplist` */

insert  into `shoplist`(`id`,`std_id`,`book_id`,`preshoptime`) values (2,19,13,'2015-09-25 00:00:00'),(3,23,13,'2016-03-10 00:00:00'),(6,15,44,'2016-03-12 00:00:00'),(7,15,61,'2016-03-25 00:00:00');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id编号',
  `USERNAME` varchar(100) NOT NULL COMMENT '用户名',
  `PWD` varchar(100) NOT NULL COMMENT '密码',
  `STDNUM` varchar(100) DEFAULT NULL COMMENT '学号',
  `REALNAME` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `GRADE` varchar(100) DEFAULT NULL COMMENT '年级',
  `MAJOR` varchar(100) DEFAULT NULL COMMENT '专业',
  `BALANCE` int(11) DEFAULT NULL COMMENT '账户余额',
  `LEVEL` int(11) DEFAULT NULL COMMENT '信用评级',
  `EMAIL` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  `PHONENUMBER` varchar(11) DEFAULT NULL COMMENT '手机号',
  `HEADPIC` varchar(200) DEFAULT NULL COMMENT '用户头像存储路径',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`ID`,`USERNAME`,`PWD`,`STDNUM`,`REALNAME`,`GRADE`,`MAJOR`,`BALANCE`,`LEVEL`,`EMAIL`,`PHONENUMBER`,`HEADPIC`) values (15,'刘高云','3e8bc70daa73864138c1bb9fd3e08d34','1235057','刘高云','大一','信息与计算科学',67,1,'1187557456@qq.com','18811597049','1457783126363.jpg'),(16,'张三','3e8bc70daa73864138c1bb9fd3e08d34','1240001','张三','大一','统计学',113,1,'zhangsan@126.com','18811597141','1441032774823.jpg'),(19,'杜雨霏','4a23013aed93f6cef1556b46ae3c2cc3','1404701','杜雨霏','大一','信息与计算科学',1008,NULL,'yf.du@163.com','13621194770','1441713380386.jpg'),(21,'金金','3e8bc70daa73864138c1bb9fd3e08d34','1404701','金金','大一','信息与计算科学',10,NULL,'yf.du@163.com','11111111111','1442996135455.jpg'),(23,'hmj','04708dbf0b1be37431cd114d3f47078e','1404702','候梅洁','大一','信息与计算科学',63,NULL,'1512339883@qq.com','13661275778','1457783349936.jpg'),(24,'123','202cb962ac59075b964b07152d234b70','1404703','hmj','大一','信息与计算科学',23,NULL,'1512339883@qq.com','13661275778','1457622782528.jpg');

/*Table structure for table `video` */

DROP TABLE IF EXISTS `video`;

CREATE TABLE `video` (
  `ID` varchar(8) NOT NULL,
  `FORMAT` varchar(20) NOT NULL COMMENT '视频格式',
  `PATH` varchar(200) NOT NULL COMMENT '视频存放路径',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `video` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
