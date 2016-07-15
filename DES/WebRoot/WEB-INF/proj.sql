-- MySQL dump 10.13  Distrib 5.5.17, for Win32 (x86)
--
-- Host: localhost    Database: proj
-- ------------------------------------------------------
-- Server version	5.5.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `COMMENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `COMMENT` varchar(255) DEFAULT NULL,
  `COMMENTTIME` varchar(255) DEFAULT NULL,
  `GOODSINFO_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  PRIMARY KEY (`COMMENT_ID`),
  KEY `FK63717A3F85C13B98` (`GOODSINFO_ID`),
  KEY `FK63717A3FA28B86DC` (`USER_ID`),
  CONSTRAINT `FK63717A3F85C13B98` FOREIGN KEY (`GOODSINFO_ID`) REFERENCES `goodsinfo` (`GOODSINFO_ID`),
  CONSTRAINT `FK63717A3FA28B86DC` FOREIGN KEY (`USER_ID`) REFERENCES `des_user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'fd','2016-06-30 10:14:54',16,2),(2,'地点','2016-06-30 11:57:33',15,1),(3,'XD','2016-07-08 21:53:32',16,1),(4,'XD','2016-07-08 21:53:49',16,1),(5,'DA','2016-07-08 21:54:05',14,1),(6,'DD','2016-07-08 21:54:58',16,1),(7,'D','2016-07-08 21:55:13',14,1),(8,'DD','2016-07-08 21:56:15',16,1),(9,'S','2016-07-08 21:58:43',16,1),(10,'SS','2016-07-08 21:59:29',16,1),(11,'S','2016-07-08 22:01:18',16,1);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL` varchar(255) DEFAULT NULL,
  `FIRSTNAME` varchar(255) DEFAULT NULL,
  `LASTNAME` varchar(255) DEFAULT NULL,
  `TELEPHONE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `des_user`
--

DROP TABLE IF EXISTS `des_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `des_user` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PASSWORD` varchar(255) NOT NULL,
  `USERNAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `des_user`
--

LOCK TABLES `des_user` WRITE;
/*!40000 ALTER TABLE `des_user` DISABLE KEYS */;
INSERT INTO `des_user` VALUES (1,'admin','cv'),(2,'admin','中文'),(3,'admin','cvs');
/*!40000 ALTER TABLE `des_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goodsinfo`
--

DROP TABLE IF EXISTS `goodsinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goodsinfo` (
  `GOODSINFO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DETAIL` varchar(255) DEFAULT NULL,
  `GOODSNAME` varchar(255) NOT NULL,
  `LINKNAME` varchar(255) NOT NULL,
  `NEWCOMMENT` varchar(255) NOT NULL,
  `PHONE` varchar(255) NOT NULL,
  `PHOTO` varchar(255) DEFAULT NULL,
  `PRICE` int(11) NOT NULL,
  `PUBLISHTIME` varchar(255) NOT NULL,
  `READTIMES` int(11) NOT NULL,
  `TITLE` varchar(255) NOT NULL,
  `TYPE` varchar(255) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  PRIMARY KEY (`GOODSINFO_ID`),
  KEY `FKF94170E4A28B86DC` (`USER_ID`),
  CONSTRAINT `FKF94170E4A28B86DC` FOREIGN KEY (`USER_ID`) REFERENCES `des_user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goodsinfo`
--

LOCK TABLES `goodsinfo` WRITE;
/*!40000 ALTER TABLE `goodsinfo` DISABLE KEYS */;
INSERT INTO `goodsinfo` VALUES (1,'西农六号门外红绿灯附近斑竹村7幢\r\n两室两厅中主卧出租（可立即入住） 双人床 梳妆台 立式大衣柜\r\n空调 冰箱 全新 洗衣机 家电厨具宽带齐全 可连校园网 500元/月 \r\n欢迎单身女生入住（谢绝情侣） 环境清幽 晚上安静 考研上班都适合 可看房\r\n联系电话186233497','房屋','css','2016-06-30 09:33:38','1232343','/DES/upload/14672504189207e6e.jpg;/DES/upload/14672504189218eda.jpg;/DES/upload/1467250418921aa7.jpg;/DES/upload/1467250418930adcc.jpg;',500,'2016-06-30',0,'斑竹村两室两厅主卧出租，女生合租，立即入住','房屋',1),(2,'北区校内在幼儿园附近下面，有一大单间，和一独卫出租，内有空调，液晶 电视， 宽带，洗衣机，热水器 ，房间宽敞，明亮，位置好，楼层好，今天刚出来，有需要的感快啊 电话\r\n136083192','房屋','cdj','2016-06-30 09:36:04','13214243','/DES/upload/14672505641541a03.jpg;/DES/upload/146725056415458825.jpg;',400,'2016-06-30',0,'校内精装一大单间,和一独卫长，短出租','房屋',1),(3,'广告还在，说明还有房屋出租; ~) \r\n西南大学，天生丽街2号楼（农业银行楼上）三室0厅的套房中，还有1个主卧出租（带独立卫生间），隔壁二个卧室住的是女生（随时可以入住，限长租）)\r\n套内单间房屋，租金760元月(其中物管、电梯、清洁费、公共部分能耗费、污水处理费、20M电信宽带费 需要单独缴纳),欢迎随时看房。(随时可以入住)。 \r\n （水电气均是和学校水电气同样的价格，三个卧室电表都是单独的）\r\n\r\n联系电话:138 8399 6958 中介勿扰 (非中介) \r\n','房屋','cdj','2016-06-30 09:39:59','1535642343','/DES/upload/14672507999360fb1a.jpg;/DES/upload/14672507999372af86.jpg;/DES/upload/14672507999382e18c.jpg;/DES/upload/1467250799939fed8129c.jpg;',546,'2016-06-30',0,'（非中介）天生丽街 2号楼 套内主卧单间 出租 (限长租，有图片)','房屋',1),(4,'详情如图，双碟刹山地车，前轮有点漏气，可在美食城西大单车行花个几块钱补一下，车子性能还不错，楼主曾经骑行过合川、金刀峡。\r\n现瑕疵有：1.前轮好像有点漏气，但不是特别楼那种 2.变速调节器坏了一个角，但不影响变速\r\n3.碟刹由于使用时间较长，性能不是特别好，但可以安全行驶。\r\n价格暂定100，送多功能加气筒一个，车锁一个 喜欢可以联系来楠四看车。联系方式18883735','自走车','dxd','2016-06-30 09:43:15','18884343','/DES/upload/1467250995929d6ede2.png;',100,'2016-06-30',0,'大四毕业，碟刹自行车便宜甩了','交通工具',1),(5,'爱玛9.9成新60v电动车亏本出售（一个人能跑60码，没电了最低都有40码左右，搭个人竹园上坡没有问题），在北碚唯一一家爱玛车行入手，使用一周了，因为某种原因必须卖车官方正品报价4180元，入手价格3600元，（爱玛车行答应我大四拿回去1500元回收）现在亏本转让，有意者速度私聊，非诚勿扰。送70元的25米线插板+一个60多的车锁麻烦大家想清楚了来，不要来水我，我是真心要卖。不了解爱玛车行情的乱出价的就不要来了！！','电动车','ddx','2016-06-30 09:46:46','13243519','/DES/upload/14672512064021c84b4.jpg;/DES/upload/146725120640366a0.jpg;',1500,'2016-06-30',0,'正品爱玛9.9成新60v电动车亏本出售','交通工具',1),(6,'基本就是这样，确定鞋本身没有明显瑕疵影响穿着效果，粗跟，走不了路纯属楼主自己愚蠢，只穿出去过一次可能有人觉得有点旧也没办法，购买时原价159，现在100转好了。也可以刀。放的很久了，盒子不行了，鞋子一直压箱底保存的很好，现在10元学姐学妹求带走！联系方式18883255580接短信，或者在楼下回复吧~ PS：其实只是觉得占位置，所以真的喜欢的同学合理的刀都是可以的！ 以及北区可以送货','女鞋','qbd','2016-06-30 09:49:29','1535642343','/DES/upload/14672513696321f0f855f.jpg;/DES/upload/14672513696326fb26a.jpg;/DES/upload/1467251369633eb436.jpg;',100,'2016-06-30',0,'闲置38码达芙妮女鞋~','生活用品',2),(7,'随手拯救仓鼠症晚期患者！ 联络方式：18883255\r\n先联系我确认后到我宿舍来取呦！\r\n满10元及以上可以送个货到宿舍楼啥的（^—^）','杂物','fsc','2016-06-30 09:51:47','18884323','/DES/upload/1467251507186851f7b7.jpg;/DES/upload/146725150718774e.jpg;/DES/upload/1467251507187877.jpg;/DES/upload/14672515071876227.jpg;',0,'2016-06-30',0,'大四宿舍甩卖！杂物系列~餐盒、收纳桶、水杯、美发用品等~','生活用品',2),(8,'统计学、财政学、金融企业会计、中级财务会计、金融市场学、基础会计、金融工程、新制度经济学等。 都是金融学二专会用得到的书，很难买得到，本人毕业离校，一次性处理，一口价25，有需要的联系我。: 电话：188832622    QQ：4691048','书籍','dxd','2016-06-30 09:53:07','13243519','/DES/upload/1467251587503a49.jpg;',25,'2016-06-30',0,'金融学二专的相关教材书，需要的点进来','书籍',2),(9,'联系电话  185244112  最好短信','考研书籍','ddx','2016-06-30 09:57:20','1535642343','/DES/upload/14672518405218488e7.gif;/DES/upload/1467251840521cfd923.gif;',11,'2016-06-30',0,'大四清仓 有考研资料','书籍',2),(10,'出售土木工程 \r\n二专同学必备\r\n电话 153103454\r\n 要的赶紧了啊 有优惠','书籍','cdj','2016-06-30 09:58:46','1535642343','/DES/upload/1467251926316d62db9.jpg;',5,'2016-06-30',0,' 出售土木工程用书','书籍',2),(11,'\r\n考研书籍10元一箱，肖秀荣系列百分之七十新的，单买薄的每本1元，厚的2元，还有其他英语二专书籍，薄的1元，厚的2元。考研专业书为川大语言学。有买有送~\r\n联系电话189961164，最好短信','书籍','cdj','2016-06-30 09:59:45','13243519','/DES/upload/1467251985890f8d341fb.png;',12,'2016-06-30',0,'毕业书籍大甩卖','书籍',1),(12,'红米2a 8.5成新出售无任何问题，本人换了红米note,这部闲置手机有需要的拿走，350可小刀，非诚勿扰。 ','红米手机','fsc','2016-06-30 10:04:46','15232591','/DES/upload/146725228662025c8450.jpg;/DES/upload/14672522866456442be.jpg;/DES/upload/146725228664650156.jpg;/DES/upload/146725228664783584.jpg;/DES/upload/14672522866478469590.jpg;',350,'2016-06-30',1,'红米2a手机对价出售 联系18883243762','手机',1),(13,'华为C8813Q,九成新，帮同学卖的，低价400元转让！有意者请电话联系183757280，或是QQ15540775也可以，','华为手机','cji','2016-06-30 10:06:34','1232343','/DES/upload/14672523940259e1.jpg;/DES/upload/14672523940268844f.jpg;/DES/upload/1467252394026c3d87.jpg;',400,'2016-06-30',2,'华为C8813Q,九成新，帮同学卖的，低价400元转让！','手机',1),(14,'原价1099，买了2个月的小米4c便准版全网通，现在价格600块钱卖，有发票，不议价，手机无任何问题，成色几乎全新，保护的很好，无一点划伤，有一个保护套（小黄人的），还有一个自动感应的防护套。手机136505422    qq8515996','小米手机','dxd','2016-07-08 21:55:13','1535642343','/DES/upload/14672524747614b6c21c4.png;/DES/upload/14672524747626b940.png;/DES/upload/146725247476370c46.png;',599,'2016-06-30',5,'全网通小米手机4c','手机',2),(15,'9.5成新 荣耀7， 后置2010万像素摄像头，前置800万像素摄像头。用了不到一年，筹钱买苹果！！有意者请联系张同学QQ：12848458','华为手机','css','2016-06-30 11:57:33','1535642343','/DES/upload/14672525600247549.jpg;/DES/upload/1467252560052465fea.jpg;/DES/upload/1467252560052f4a4280.jpg;',0,'2016-06-30',6,'9.5成新 荣耀honor7 出售，1000元可小刀。','手机',2),(16,'xxx',' 悬疑小说','cdj','2016-07-08 22:01:18','13214243','',0,'2016-06-30',7,'xxxxxxxxxxxx','手机',2);
/*!40000 ALTER TABLE `goodsinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `MESSAGE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ISREAD` varchar(255) NOT NULL,
  `MESSAGE` varchar(255) NOT NULL,
  `RECEIVER` int(11) DEFAULT NULL,
  `SENDER` int(11) DEFAULT NULL,
  `SENDTIME` varchar(255) NOT NULL,
  PRIMARY KEY (`MESSAGE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'hasRead','aa',2,1,'2016-06-30 10:22:47'),(2,'not','你好\r\n',2,1,'2016-06-30 10:23:05'),(3,'not','ge',2,1,'2016-06-30 10:23:11'),(4,'not','nihao',1,2,'2016-06-30 10:23:26'),(5,'hasRead','haoahoa',1,2,'2016-06-30 10:23:30'),(6,'not','SA',2,1,'2016-07-08 21:52:10');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-10 21:24:25
