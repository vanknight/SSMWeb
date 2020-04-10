-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: ssm_shop
-- ------------------------------------------------------
-- Server version	5.7.17-log

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

DROP DATABASE IF EXISTS `ssm_shop`;
CREATE DATABASE `ssm_shop`;
USE `ssm_shop`;
SET FOREIGN_KEY_CHECKS = 0;
--
-- Table structure for table `commodity`
--

DROP TABLE IF EXISTS `commodity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commodity` (
  `commodity_id` varchar(64) NOT NULL,
  `commodity_name` varchar(64) DEFAULT NULL,
  `market_price` double DEFAULT NULL,
  `shop_price` double DEFAULT NULL,
  `commodity_rating` double DEFAULT '5',
  `commodity_image` text,
  `commodity_date` date DEFAULT NULL,
  `commodity_hot` int(2) DEFAULT NULL,
  `commodity_desc` text,
  `commodity_stock` bigint(20) DEFAULT NULL,
  `type_id` varchar(64) DEFAULT NULL,
  `state` int(2) DEFAULT '0',
  PRIMARY KEY (`commodity_id`),
  KEY `sfk_0001` (`type_id`),
  CONSTRAINT `p_c_fk_0001` FOREIGN KEY (`type_id`) REFERENCES `commodity_type` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodity`
--

LOCK TABLES `commodity` WRITE;
/*!40000 ALTER TABLE `commodity` DISABLE KEYS */;
INSERT INTO `commodity` VALUES ('05i6bw4vjj','秋冬毛衣白色年轻人',150,110,5,'products/temp/yuHxSciE-c3TtlT4Q.jpg','2018-12-29',1,'夏季清凉，潮流，有型夏季清凉，潮流，有型夏季清凉，潮流，有型夏季清凉，潮流，有型夏季清凉，潮流，有型夏季清凉，潮流，有型',1000,'5',0),('092af6b005f94545ad33abeb7fe90b4c','夏季黑色外套',80,69,5,'products/temp/CrbdaTc0-XXWPEEAS.jpg','2018-12-29',1,'夏季清凉，潮流，有型夏季清凉，潮流，有型夏季清凉，潮流，有型夏季清凉，潮流，有型夏季清凉，潮流，有型夏季清凉，潮流，有型',1000,'1',0),('1b6d3ef5103341b6ac8d804b3be08820','龙猫玉项链',200,180,5,'products/temp/fVqjCNuE-hT4skXk6.jpg','2018-12-27',1,'项链是用金银、珠宝等制成的挂在颈上的链条形状的首饰，是人体的装饰品之一，也是最早出现的首饰。项链除了具有装饰功能之外，有些项链还具有特殊显示作用，如佛弟子的念珠与天主教徒的十字架链。',1000,'4',0),('1fea0d2a265e4775a47dc30bafdf1260','夏季韩款潮流T恤',80,69,5,'products/temp/Ft5Eq2U9-a30eAGYr.jpg','2018-12-29',1,'夏季清凉，潮流，有型夏季清凉，潮流，有型夏季清凉，潮流，有型夏季清凉，潮流，有型夏季清凉，潮流，有型夏季清凉，潮流，有型',1000,'1',0),('26b5672c618e437c8752796e51ff73e4','橘红色外套冬季上衣保暖',300,280,5,'products/temp/yWQS7D5l-bkhxJZiL.jpg','2018-12-29',1,'冬季保暖外套加厚加绒，全新款式，不同大小不同风格任你挑选，现在限时打折。',1000,'3',0),('34ub3q4y','美丽贝壳银项链',2000,1000,4.5,'products/temp/bkokD8bG-h0vY89qI.jpg','2018-12-24',1,'项链是用金银、珠宝等制成的挂在颈上的链条形状的首饰，是人体的装饰品之一，也是最早出现的首饰。项链除了具有装饰功能之外，有些项链还具有特殊显示作用，如佛弟子的念珠与天主教徒的十字架链。',4998,'2',0),('34vu45iw','夏季美丽长裙',100,90,4.5,'products/temp/FpUkaJY6-3pEQIJtG.jpg','2018-12-02',1,'2018夏季新款鱼尾裙碎花吊带一字肩连衣裙长裙女，腰型: 松紧，适用年龄: 18-24周岁2018夏季新款鱼尾裙碎花吊带一字肩连衣裙长裙女，腰型: 松紧，适用年龄: 18-24周岁2018夏季新款鱼尾裙碎花吊带一字肩连衣裙长裙女，腰型: 松紧，适用年龄: 18-24周岁',400000,'1',0),('385b7utyuj','琥珀项链',1000,900,4.5,'products/temp/KuU5ORpv-v7ubhIJq.jpg','2018-11-27',1,'项链是用金银、珠宝等制成的挂在颈上的链条形状的首饰，是人体的装饰品之一，也是最早出现的首饰。项链除了具有装饰功能之外，有些项链还具有特殊显示作用，如佛弟子的念珠与天主教徒的十字架链。',750000,'4',0),('3b6iu35uj','女性条纹群',100,90,3,'products/temp/Xh1F8wWn-oZ3HWgyx.jpg','2018-12-07',1,'顺应潮流的褐色秀发佩戴着粉色的发夹，两侧的秀发散发出迷人高贵气息，可爱不失高贵，爽朗大方。嫩绿短袖衬衫带来青春洋溢的运动心情。前襟黑色蝴蝶结既时尚又倾心。金黄色背带裙非常惹眼，明快鲜艳的颜色时时刻刻引人注目',345312,'1',0),('3n84whrthrh','经典金戒指',500,409,4.5,'products/temp/BxSdLD1C-CQcwt3kw.jpg','2018-12-24',1,'项链是用金银、珠宝等制成的挂在颈上的链条形状的首饰，是人体的装饰品之一，也是最早出现的首饰。项链除了具有装饰功能之外，有些项链还具有特殊显示作用，如佛弟子的念珠与天主教徒的十字架链。',7959,'2',0),('4210df7068934b5987930592bf8cc974','秋季外套白色米黄色',120,110,5,'products/temp/KIOKbdIH-oXzKxTA7.jpg','2018-12-29',1,'秋季保暖外套透气，全新款式，不同大小不同风格任你挑选，现在限时打折。',1000,'5',0),('43vunw64ibu6','冬季黑色外套上衣',100,90,5,'products/temp/myBmBrNB-laMHbNds.jpg','2018-12-29',1,'冬季保暖外套加厚加绒，全新款式，不同大小不同风格任你挑选，现在限时打折。',300,'3',0),('45ubwv45u','潮流透气T恤',300,160,4.833333333333333,'products/temp/Y8aYuMjg-6BrM9IwC.jpg','2018-12-24',1,'夏季清凉，潮流，有型夏季清凉，潮流，有型夏季清凉，潮流，有型夏季清凉，潮流，有型夏季清凉，潮流，有型夏季清凉，潮流，有型夏季清凉，潮流，有型',99,'1',0),('46c8e4gr5df','米色外套冬季保暖外套',200,170,4.5,'products/temp/clT1ZEnT-exhvuUnc.jpg','2018-12-24',1,'冬季保暖外套加厚加绒，全新款式，不同大小不同风格任你挑选，现在限时打折。',30000,'3',0),('4b6wuibtfj','保暖透气卫衣',250,100,4.5,'products/temp/uJxyT7jU-bKmWKShO.jpg','2018-12-24',0,'秋季保暖外套加厚加绒，全新款式，不同大小不同风格任你挑选，现在限时打折。',300,'5',0),('4h5q4oi4o4q','日式保暖透气卫衣',200,150,4.5,'products/temp/AlxVrpqG-7V7hDp6k.jpg','2018-12-24',1,'秋季保暖外套加厚加绒，全新款式，不同大小不同风格任你挑选，现在限时打折。',200,'5',0),('4vi8b3qvudh','925银手链女士美丽',200,1900,5,'products/temp/LMBBBynj-3mmbp38W.jpg','2018-12-29',1,'美丽金银首饰，美丽动人，尊贵美丽金银首饰，美丽动人，尊贵美丽金银首饰，美丽动人，尊贵',100,'2',0),('4wbuw4bj','潮流韩版卫衣',222,200,4.5,'products/temp/8216Ok0g-aX5bpuVH.jpg','2018-12-24',1,'秋季保暖外套加厚加绒，全新款式，不同大小不同风格任你挑选，现在限时打折。',98,'5',0),('55343c6787774d76bf8f4bfef7ca44da','足金戒指送女友',300,289,5,'products/temp/idLBPFP8-5HluN3eT.jpg','2018-12-29',1,'美丽金银首饰，美丽动人，尊贵美丽金银首饰，美丽动人，尊贵美丽金银首饰，美丽动人，尊贵',1000,'2',0),('56en56vujrh','黑色潮流保暖透气卫衣',200,100,4.5,'products/temp/LkmWDELJ-WlPYvdYN.jpg','2018-12-24',1,'秋季保暖外套加厚加绒，全新款式，不同大小不同风格任你挑选，现在限时打折。',2000,'5',0),('56i465rt1j2fg1kj','冬季毛衣酒红色',190,180,5,'products/temp/4EBHRIIP-DuXNeZSA.jpg','2018-12-29',1,'冬季保暖毛衣加厚加绒，全新款式，不同大小不同风格任你挑选，现在限时打折。',1000,'3',0),('5886694655204437be6d22a32f6550d9','环扣金项链',200,180,5,'products/temp/zVjQLZVF-d9unttoh.jpg','2018-12-29',1,'项链是用金银、珠宝等制成的挂在颈上的链条形状的首饰，是人体的装饰品之一，也是最早出现的首饰。项链除了具有装饰功能之外，有些项链还具有特殊显示作用，如佛弟子的念珠与天主教徒的十字架链。',1000,'2',0),('5b9vyrtj','大气珍珠项链',1000,900,4.5,'products/temp/1kiKNZtu-xdFaThvj.jpg','2018-12-07',1,'项链是用金银、珠宝等制成的挂在颈上的链条形状的首饰，是人体的装饰品之一，也是最早出现的首饰。项链除了具有装饰功能之外，有些项链还具有特殊显示作用，如佛弟子的念珠与天主教徒的十字架链。',531231,'4',0),('5bj5kievy5q49wbvh','蓝宝石手链',1000,900,4.5,'products/temp/AQRYbKFC-vsS6bcIt.jpg','2018-12-07',1,'蓝宝石，尊贵的体现，蓝宝石，尊贵的体现，蓝宝石，尊贵的体现，蓝宝石，尊贵的体现',743453,'4',0),('67bvuq45u','极品钻戒送女友送老婆',1000,900,4.5,'products/temp/XdS7SPJ2-J5K51NY4.jpg','2018-12-07',1,'钻戒，是戴在手指上的钻石珠宝。钻石是宝石中最坚硬的一种，古罗马人一直认为它代表生命和永恒，到了15世纪更被认定为代表坚贞不渝的结婚象征意义。戴戒指是爱的语言。',437845,'4',0),('67eniwbjt','祖母绿项链',1000,900,4.5,'products/temp/rf7yRHVo-BH8VdjYW.jpg','2018-12-07',1,'项链是用金银、珠宝等制成的挂在颈上的链条形状的首饰，是人体的装饰品之一，也是最早出现的首饰。项链除了具有装饰功能之外，有些项链还具有特殊显示作用，如佛弟子的念珠与天主教徒的十字架链。',123453,'4',0),('6d4f531nbcvn','橘黄色冬季外套',200,190,5,'products/temp/M8TfwLB9-avN58Smj.jpg','2018-12-29',1,'冬季保暖外套加厚加绒，全新款式，不同大小不同风格任你挑选，现在限时打折。',1000,'3',0),('6d5f1g3dsg','棉衣冬季保暖外套',200,199,4.5,'products/temp/hok6TGtV-c0IVSB6U.jpg','2018-12-24',0,'冬季保暖外套加厚加绒，全新款式，不同大小不同风格任你挑选，现在限时打折。',1000,'3',0),('6s41hs21fgj','冬季黑色保暖外套',240,200,4.5,'products/temp/HP4D80PR-vwGY6Hdh.jpg','2018-12-31',1,'冬季保暖外套加厚加绒，全新款式，不同大小不同风格任你挑选，现在限时打折。',2998,'3',0),('6ub365i3','白色夏季T恤',100,90,4.5,'products/temp/9zNECi5g-ijNp39kU.jpg','2018-12-07',1,'新品 夏装 欧美风格 雪纺条纹 蝙蝠衫 宽松 短袖t恤条纹蝙蝠衫在哪个夏天都不过时配上更不过时的竖条纹，便成了这款经典的夏日单品不但有多种条纹颜色可供选择雪纺的垂顺感也让穿着者多了一份洒脱与飘逸',300000,'1',0),('79919d4a156e4a53a674765b45e90feb','血琥珀可雕刻项链',200,150,5,'products/temp/RGPnxQio-ILVyKaRi.jpg','2018-12-29',1,'项链是用金银、珠宝等制成的挂在颈上的链条形状的首饰，是人体的装饰品之一，也是最早出现的首饰。项链除了具有装饰功能之外，有些项链还具有特殊显示作用，如佛弟子的念珠与天主教徒的十字架链。',1000,'4',0),('8f1995a91a3b40568a18107f7a74fd21','小鱼儿金项链可爱',323,300,5,'products/temp/bMCxLHyP-0OkhLFTF.jpg','2018-12-29',1,'项链是用金银、珠宝等制成的挂在颈上的链条形状的首饰，是人体的装饰品之一，也是最早出现的首饰。项链除了具有装饰功能之外，有些项链还具有特殊显示作用，如佛弟子的念珠与天主教徒的十字架链。',1000,'2',0),('90ed4b213b0d4f3e8ccfcb0e33c7b05e','血琥珀项链',320,300,5,'products/temp/GzWDUR1w-81lli43y.jpg','2018-12-29',1,'项链是用金银、珠宝等制成的挂在颈上的链条形状的首饰，是人体的装饰品之一，也是最早出现的首饰。项链除了具有装饰功能之外，有些项链还具有特殊显示作用，如佛弟子的念珠与天主教徒的十字架链。',1000,'4',0),('94d63268a7c149a1932bd86cc16c51db','红宝石戒指',200,190,5,'products/temp/wmaV1rzM-ego4N33D.jpg','2018-12-29',1,'红宝石，尊贵的体现，红宝石，尊贵的体现，红宝石，尊贵的体现，红宝石，尊贵的体现',1000,'4',0),('99bf78661f80432c8332cc91c69e90f4','黑琥珀项链神秘',190,180,5,'products/temp/vIoxpYOm-bS5pMrs4.jpg','2018-12-29',1,'项链是用金银、珠宝等制成的挂在颈上的链条形状的首饰，是人体的装饰品之一，也是最早出现的首饰。项链除了具有装饰功能之外，有些项链还具有特殊显示作用，如佛弟子的念珠与天主教徒的十字架链。',1000,'4',0),('9ba22d802be241ce8c812054d50967ac','秋季黑白日式外套上衣',200,180,5,'products/temp/PuNy9VXg-wTtBWFrE.jpg','2018-12-29',1,'秋季保暖外套加厚加绒，全新款式，不同大小不同风格任你挑选，现在限时打折。',1000,'5',0),('9e6vue5uj','米色青年卫衣',200,100,4.5,'products/temp/Okws3FBZ-rgpyHZke.jpg','2018-12-24',1,'秋季保暖外套加厚加绒，全新款式，不同大小不同风格任你挑选，现在限时打折。',2000,'5',0),('9ewr8g45d31h','冬季风衣保暖外套',220,200,4.5,'products/temp/GyJNfYi9-4PUvq66h.jpg','2018-12-24',1,'冬季保暖外套加厚加绒，全新款式，不同大小不同风格任你挑选，现在限时打折。',3000,'3',0),('a0696bcb9a104514874555b5b717f2fb','999银手镯送父母长辈',500,499,5,'products/temp/2yr5NJTW-qdIc4vnz.jpg','2018-12-29',1,'美丽金银首饰，美丽动人，尊贵美丽金银首饰，美丽动人，尊贵美丽金银首饰，美丽动人，尊贵',1000,'2',0),('a178fdad1586490698913c201778e6b0','999千足金手滑',400,380,5,'products/temp/VxMcpMJY-qVoifd75.jpg','2018-12-29',1,'美丽金银首饰，美丽动人，尊贵美丽金银首饰，美丽动人，尊贵美丽金银首饰，美丽动人，尊贵',1000,'2',0),('a4c1faa5b605412badf4efd0f3c53013','千足金项链',900,890,5,'products/temp/Couob4Lh-dyNBAHTt.jpg','2018-12-29',1,'美丽金银首饰，美丽动人，尊贵美丽金银首饰，美丽动人，尊贵美丽金银首饰，美丽动人，尊贵',1000,'2',0),('a98rtbj4a5tj','女性冬季保暖外套',200,180,4.5,'products/temp/GpHxh53P-spZ1y41E.jpg','2018-12-24',1,'冬季保暖外套加厚加绒，全新款式，不同大小不同风格任你挑选，现在限时打折。',2000,'3',0),('a9k4g1mzf2gm','秋季毛衣保暖透气',150,120,5,'products/temp/wZwU3Wb6-9xxsv356.jpg','2018-12-29',1,'秋季保暖透气潮流衣，秋季保暖透气潮流衣，秋季保暖透气潮流衣，秋季保暖透气潮流衣',NULL,'5',0),('aad82938f10b4a988913c0f69ad32824','珍珠项链浪漫典雅',130,120,5,'products/temp/t4PeDkDK-NyHt7kxs.jpg','2018-12-29',1,'项链是用金银、珠宝等制成的挂在颈上的链条形状的首饰，是人体的装饰品之一，也是最早出现的首饰。项链除了具有装饰功能之外，有些项链还具有特殊显示作用，如佛弟子的念珠与天主教徒的十字架链。',1000,'4',0),('ab219d2f766e4ea48d701c3697e316a1','夏季撞色透气外套',100,80,5,'products/temp/swq8gqCW-xzMolqiw.jpg','2018-12-29',1,'美丽金银首饰，美丽动人，尊贵美丽金银首饰，美丽动人，尊贵美丽金银首饰，美丽动人，尊贵',1000,'1',0),('b05cb62f2c2a4c51932658f948f9bec5','滚动金项链',150,140,5,'products/temp/iPPzVXHm-ruTCjWaW.jpg','2018-12-29',1,'项链是用金银、珠宝等制成的挂在颈上的链条形状的首饰，是人体的装饰品之一，也是最早出现的首饰。项链除了具有装饰功能之外，有些项链还具有特殊显示作用，如佛弟子的念珠与天主教徒的十字架链。',1000,'2',0),('b2u7568365u','男性潮流T恤',100,90,4.5,'products/temp/2GDF899n-fkpagjHZ.jpg','2018-12-02',1,'夏季清凉，潮流有型，棉衣夏季清凉，潮流有型，棉衣夏季清凉，潮流有型，棉衣夏季清凉，潮流有型，棉衣夏季清凉，潮流有型，棉衣夏季清凉，潮流有型，棉衣',30000,'1',0),('b56iebgj','经典银环戒指',604,600,4.5,'products/temp/uKFySB75-SKmwiiM0.jpg','2018-12-07',1,'项链是用金银、珠宝等制成的挂在颈上的链条形状的首饰，是人体的装饰品之一，也是最早出现的首饰。项链除了具有装饰功能之外，有些项链还具有特殊显示作用，如佛弟子的念珠与天主教徒的十字架链。',12323,'2',0),('b5c74a8da266433fb39593bfdb6456c4','冬季撞色外套潮流',220,210,5,'products/temp/ofllBGoE-Rz0KVc5l.jpg','2018-12-29',1,'冬季保暖外套加厚加绒，全新款式，不同大小不同风格任你挑选，现在限时打折。',1000,'3',0),('b98522abeef4474486c9f3247980c2b7','夏季透气外套潮流',110,100,5,'products/temp/wFn6w3gR-cREdD7Gj.jpg','2018-12-29',1,'夏季清凉，潮流有型，棉衣夏季清凉，潮流有型，棉衣夏季清凉，潮流有型，棉衣夏季清凉，潮流有型，棉衣夏季清凉，潮流有型，棉衣夏季清凉，潮流有型，棉衣',1000,'1',0),('cw9eg4h65d1h','黑色冬季保暖外套',200,199,4.5,'products/temp/Z4Yy1Xw6-OvR0iVwB.jpg','2018-12-24',1,'秋季保暖外套加厚加绒，全新款式，不同大小不同风格任你挑选，现在限时打折。',1000,'5',0),('d60ae3a3658244599e892a3fdb741591','冬季黑色潮流T恤',80,70,5,'products/temp/SA2uTrnx-T1uiOtrn.jpg','2018-12-29',1,'冬季保暖外套加厚加绒，全新款式，不同大小不同风格任你挑选，现在限时打折。',1000,'1',0),('dfhfdh','情侣925银戒指',706,750,4.5,'products/temp/9G7GeW2n-1ZRWXWKd.jpg','2018-12-07',1,'项链是用金银、珠宝等制成的挂在颈上的链条形状的首饰，是人体的装饰品之一，也是最早出现的首饰。项链除了具有装饰功能之外，有些项链还具有特殊显示作用，如佛弟子的念珠与天主教徒的十字架链。',782542,'2',0),('e6g415dh','冬季打折促销灰色保暖外套',200,190,4.5,'products/temp/6Rq4AJsq-PzBqGjU4.jpg','2018-12-31',1,'冬季保暖外套加厚加绒，全新款式，不同大小不同风格任你挑选，现在限时打折。',1000,'3',0),('f3fe9b347e7942058f59bc5d2728231d','秋季毛衣2件',200,180,5,'products/temp/CChMradG-r7JcuLT6.jpg','2018-12-29',1,'秋季毛衣外套加厚加绒，全新款式，不同大小不同风格任你挑选，现在限时打折。',1000,'5',0),('ffxndf','纯金戒指',12000,11000,4.5,'products/temp/1zjeoUMv-6ltAaI6t.jpg','2018-12-07',0,'项链是用金银、珠宝等制成的挂在颈上的链条形状的首饰，是人体的装饰品之一，也是最早出现的首饰。项链除了具有装饰功能之外，有些项链还具有特殊显示作用，如佛弟子的念珠与天主教徒的十字架链。',15304,'2',0),('fgj56wv','玉髓挂饰',1000,900,4.5,'products/temp/uemP1iZo-7O9bSUsl.jpg','2018-12-07',1,'冰种玉髓、以其清莹透彻的质感、天然、亮丽的色彩优势，已然成为翡翠玉石以及彩宝市场中的新宠。',453453,'4',0),('g98ds64f1g','单件卫衣冬季',200,166,4.5,'products/temp/T8egqRpz-gy46Hwtm.jpg','2018-12-31',0,'冬季保暖外套加厚加绒，全新款式，不同大小不同风格任你挑选，现在限时打折。',4522,'3',0),('hjdgfj653butyj','夏季三件T恤划算',100,90,4.5,'products/temp/VyZ4mERI-yIaEsZCO.jpg','2018-12-07',1,'2018春秋装新款少年清凉一夏，有型又潮2018春秋装新款少年清凉一夏，有型又潮',312312,'1',0),('k76prnbvhfh','925O形银项链',1000,900,4.5,'products/temp/j1B1mVOh-yxn2SVd1.jpg','2018-12-07',1,'925银，让银的光泽、亮度和硬度都有所改善，使银具有了理想的硬度、亮度及光泽，及抗氧化性。而且能够镶嵌各种宝石，从此银首饰以色泽光鲜、款式别致、工艺精美价格中档的时尚品位',23453,'2',0),('q3ubeth','红宝石项链',1000,900,4.5,'products/temp/YBUOWHxZ-dDxgzW6w.jpg','2018-12-07',1,'项链是用金银、珠宝等制成的挂在颈上的链条形状的首饰，是人体的装饰品之一，也是最早出现的首饰。项链除了具有装饰功能之外，有些项链还具有特殊显示作用，如佛弟子的念珠与天主教徒的十字架链。',453123,'4',0),('tu76i67o4u','T恤运动潮男酒红色',100,90,4.5,'products/temp/COAVKHC7-bWBKYpbg.jpg','2018-12-02',1,'运动背心男士潮牌修身型跨栏夏季坎肩篮球砍袖健身宽松无袖t恤男运动背心男士潮牌修身型跨栏夏季坎肩篮球砍袖健身宽松无袖t恤男运动背心男士潮牌修身型跨栏夏季坎肩篮球砍袖健身宽松无袖t恤男运动背心男士潮牌修身型跨栏夏季坎肩篮球砍袖健身宽松无袖t恤男',3000000,'1',0),('vh5b6i','精美宝石项链',123,123,4.5,'products/temp/CD9l7ybM-y59trEFY.jpg','2018-12-18',1,'爱迪美情侣戒指女食指戒网红镀金原创小众设计戒指尾戒女小指纯银全场包邮代写贺卡爱迪美情侣戒指女食指戒网红镀金原创小众设计戒指尾戒女小指纯银全场包邮代写贺卡爱迪美情侣戒指女食指戒网红镀金原创小众设计戒指尾戒女小指纯银全场包邮代写贺卡爱迪美情侣戒指女食指戒网红镀金原创小众设计戒指尾戒女小指纯银全场包邮代写贺卡爱迪美情侣戒指女食指戒网红镀金原创小众设计戒指尾戒女小指纯银全场包邮代写贺卡',12312,'4',0),('vq35yb46i','舍利子项链',1000,900,4.5,'products/temp/ChLewEvX-iKpZbTVK.jpg','2018-12-02',1,'淡水珍珠项链\n女款正圆强光 送妈妈送爱人 8-9MM 精挑款\n商品毛重：100.00g\n商品产地：中国大陆\n颜色：白色配链材质：925银\n适用场景：日常佩戴\n珍珠规格：8-9mm\n项链扣材质：925银适用人群：女性',453123,'4',0),('vr45wiw5vh','防寒外套风衣有型',200,100,4.5,'products/temp/R8wGabhN-YSUwKs3O.jpg','2018-12-24',1,'秋季保暖外套加厚加绒，全新款式，不同大小不同风格任你挑选，现在限时打折。',1000,'5',0),('w9874i5r31hfh','白色冬季保暖外套',225,220,4.5,'products/temp/Cv8H5P6Q-vRcSz3So.jpg','2018-12-24',1,'秋季保暖外套加厚加绒，全新款式，不同大小不同风格任你挑选，现在限时打折。',10000,'5',0),('yiub4utbuie','夏季T恤2件',100,90,4.5,'products/temp/RXRSaeCd-3OvfDYBP.jpg','2018-12-07',1,'新品 夏装 欧美风格 雪纺条纹 蝙蝠衫 宽松 短袖t恤条纹蝙蝠衫在哪个夏天都不过时配上更不过时的竖条纹，便成了这款经典的夏日单品不但有多种条纹颜色可供选择雪纺的垂顺感也让穿着者多了一份洒脱与飘逸',300000,'1',0),('z31b8ea46rh','黑色卫衣保暖',230,210,4.5,'products/temp/yhkQJouj-asupmVp7.jpg','2018-12-24',1,'冬季保暖外套加厚加绒，全新款式，不同大小不同风格任你挑选，现在限时打折。',2000,'3',0);
/*!40000 ALTER TABLE `commodity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commodity_collections`
--

DROP TABLE IF EXISTS `commodity_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commodity_collections` (
  `collections_id` int(64) NOT NULL AUTO_INCREMENT,
  `uid` bigint(64) DEFAULT NULL,
  `commodity_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`collections_id`),
  KEY `w_u_fk_0001` (`uid`),
  KEY `w_p_fk_0002` (`commodity_id`),
  CONSTRAINT `w_p_fk_0001` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `w_p_fk_0002` FOREIGN KEY (`commodity_id`) REFERENCES `commodity` (`commodity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodity_collections`
--

LOCK TABLES `commodity_collections` WRITE;
/*!40000 ALTER TABLE `commodity_collections` DISABLE KEYS */;
INSERT INTO `commodity_collections` VALUES (4,5,'4wbuw4bj'),(5,5,'34ub3q4y'),(6,5,'6s41hs21fgj'),(7,5,'dfhfdh');
/*!40000 ALTER TABLE `commodity_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `commodity_collections_user`
--

DROP TABLE IF EXISTS `commodity_collections_user`;
/*!50001 DROP VIEW IF EXISTS `commodity_collections_user`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `commodity_collections_user` AS SELECT 
 1 AS `commodity_id`,
 1 AS `state`,
 1 AS `uid`,
 1 AS `username`,
 1 AS `collections_id`,
 1 AS `commodity_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `commodity_details`
--

DROP TABLE IF EXISTS `commodity_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commodity_details` (
  `details_id` int(64) NOT NULL AUTO_INCREMENT,
  `images` text,
  `commodity_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`details_id`),
  KEY `commodity_details___fk__c_id` (`commodity_id`),
  CONSTRAINT `commodity_details___fk__c_id` FOREIGN KEY (`commodity_id`) REFERENCES `commodity` (`commodity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodity_details`
--

LOCK TABLES `commodity_details` WRITE;
/*!40000 ALTER TABLE `commodity_details` DISABLE KEYS */;
INSERT INTO `commodity_details` VALUES (1,'products/details/l3bFnOnu-1bFqyW0Z.jpg;','34ub3q4y');
/*!40000 ALTER TABLE `commodity_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commodity_order`
--

DROP TABLE IF EXISTS `commodity_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commodity_order` (
  `order_id` varchar(64) NOT NULL,
  `order_update_time` datetime DEFAULT NULL,
  `order_price` double DEFAULT NULL,
  `express_delivery_fee` double DEFAULT '0',
  `order_status` int(2) DEFAULT NULL COMMENT '0-未付款\n1-已付款未收货\n2-已付款已收货\n3-已退款退货',
  `consignee_address` text,
  `consignee_name` varchar(64) DEFAULT NULL,
  `consignee_phone` varchar(64) DEFAULT NULL,
  `uid` bigint(64) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk__uid__001` (`uid`),
  CONSTRAINT `c_o_fk_uid__001` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodity_order`
--

LOCK TABLES `commodity_order` WRITE;
/*!40000 ALTER TABLE `commodity_order` DISABLE KEYS */;
INSERT INTO `commodity_order` VALUES ('3b6a8f7127c64121a7ead1c1d7351d54','2018-12-24 17:09:27',1319,0,2,'广东-佛山-123-','service','123',5),('4a0ca7754537427399901e358eac0763','2018-12-24 17:25:26',2400,0,3,'上海-长宁区-123-','service','123',5),('7caa01ccb3204c45a99ff7fb75fe31bc','2018-12-24 17:07:59',522,0,0,NULL,NULL,NULL,5),('815397df41974e35909faa5ad25e6a09','2018-12-24 17:07:39',90,0,0,NULL,NULL,NULL,5),('8bef09968a2f41469b51e52c9188f521','2018-12-24 17:07:47',90,0,0,NULL,NULL,NULL,5),('cb3733f6b9dd42e8be84b8f74a54cba3','2018-12-24 17:07:43',90,0,0,NULL,NULL,NULL,5),('ee6fea65aa4a439cac5d3731697e10fe','2018-12-24 17:11:29',400,0,1,'上海-静安区-123-','service','123',5);
/*!40000 ALTER TABLE `commodity_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commodity_order_items`
--

DROP TABLE IF EXISTS `commodity_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commodity_order_items` (
  `order_items_id` varchar(64) NOT NULL,
  `order_items_count` int(32) DEFAULT NULL,
  `order_items_price` double DEFAULT NULL,
  `order_items_state` int(11) DEFAULT '0',
  `order_id` varchar(64) DEFAULT NULL,
  `commodity_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`order_items_id`),
  KEY `fk_0001` (`commodity_id`),
  KEY `fk_0002` (`order_id`),
  CONSTRAINT `oi_o_fk_0001` FOREIGN KEY (`order_id`) REFERENCES `commodity_order` (`order_id`),
  CONSTRAINT `oi_p_fk_0001` FOREIGN KEY (`commodity_id`) REFERENCES `commodity` (`commodity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodity_order_items`
--

LOCK TABLES `commodity_order_items` WRITE;
/*!40000 ALTER TABLE `commodity_order_items` DISABLE KEYS */;
INSERT INTO `commodity_order_items` VALUES ('1e3a5606709f42648d467d7d03ea5e13',2,400,1,'4a0ca7754537427399901e358eac0763','4wbuw4bj'),('2a81fbd0f5f7408d9f32b19d7931bd4e',2,400,1,'ee6fea65aa4a439cac5d3731697e10fe','6s41hs21fgj'),('30b47da67f7249088120d4b7fe1d3c52',2,332,0,'7caa01ccb3204c45a99ff7fb75fe31bc','g98ds64f1g'),('67fbb8a6487b4e0794813f2ed1cd8c8b',1,190,0,'7caa01ccb3204c45a99ff7fb75fe31bc','e6g415dh'),('6c66cf441e2345eb953b4a860436e0e9',1,160,2,'3b6a8f7127c64121a7ead1c1d7351d54','45ubwv45u'),('7c205607b308455d9f0f70a6ac959233',1,90,0,'815397df41974e35909faa5ad25e6a09','yiub4utbuie'),('a158c9a4cbb44994ac931f5193a06df4',2,2000,1,'4a0ca7754537427399901e358eac0763','34ub3q4y'),('a9b0b237ec0a45c39e27f23c7d2295d4',1,409,1,'3b6a8f7127c64121a7ead1c1d7351d54','3n84whrthrh'),('b7d00601b23749b7bc83241f0504bde2',1,90,0,'cb3733f6b9dd42e8be84b8f74a54cba3','3b6iu35uj'),('cc36209ff6c74176a3269eafbad521b2',1,90,0,'8bef09968a2f41469b51e52c9188f521','6ub365i3'),('e0a95f09b11d4d48885a3848cbbb1bf5',1,750,1,'3b6a8f7127c64121a7ead1c1d7351d54','dfhfdh');
/*!40000 ALTER TABLE `commodity_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `commodity_order_logistic`
--

DROP TABLE IF EXISTS `commodity_order_logistic`;
/*!50001 DROP VIEW IF EXISTS `commodity_order_logistic`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `commodity_order_logistic` AS SELECT 
 1 AS `order_id`,
 1 AS `order_update_time`,
 1 AS `order_price`,
 1 AS `express_delivery_fee`,
 1 AS `order_status`,
 1 AS `consignee_address`,
 1 AS `consignee_name`,
 1 AS `consignee_phone`,
 1 AS `uid`,
 1 AS `logistics_id`,
 1 AS `logistic_code`,
 1 AS `shipper_code`,
 1 AS `remarks`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `commodity_review`
--

DROP TABLE IF EXISTS `commodity_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commodity_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `review_images` text,
  `review_content` varchar(255) DEFAULT '',
  `review_date` datetime DEFAULT NULL,
  `review_rating` double DEFAULT '0',
  `commodity_id` varchar(64) DEFAULT NULL,
  `uid` bigint(64) DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `commodity_review___fk__oi_id` (`commodity_id`),
  KEY `commodity_review___fk__uid` (`uid`),
  CONSTRAINT `commodity_review___fk__oi_id` FOREIGN KEY (`commodity_id`) REFERENCES `commodity` (`commodity_id`),
  CONSTRAINT `commodity_review___fk__uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodity_review`
--

LOCK TABLES `commodity_review` WRITE;
/*!40000 ALTER TABLE `commodity_review` DISABLE KEYS */;
INSERT INTO `commodity_review` VALUES (15,NULL,'还行','2018-12-24 17:16:10',5,'34ub3q4y',5),(16,NULL,'还行','2018-12-24 17:16:11',4,'34vu45iw',14),(17,NULL,'还行','2018-12-24 17:16:12',4,'385b7utyuj',5),(18,NULL,'不错','2018-12-24 17:16:12',4.5,'3b6iu35uj',14),(19,NULL,'不错','2018-12-24 17:16:13',4.5,'3n84whrthrh',5),(20,NULL,'还行','2018-12-24 17:16:13',5,'45ubwv45u',15),(21,NULL,'还行','2018-12-24 17:16:14',4.5,'46c8e4gr5df',5),(22,NULL,'不错','2018-12-24 17:16:14',4,'4b6wuibtfj',15),(23,NULL,'还行','2018-12-24 17:16:16',5,'4h5q4oi4o4q',5),(24,NULL,'还行','2018-12-24 17:18:10',4.5,'4wbuw4bj',14),(25,NULL,'还行','2018-12-24 17:18:11',4,'56en56vujrh',5),(26,NULL,'还行','2018-12-24 17:18:11',4,'5b9vyrtj',5),(27,NULL,'还行','2018-12-24 17:18:12',5,'5bj5kievy5q49wbvh',15),(28,NULL,'不错','2018-12-24 17:18:12',4,'67bvuq45u',5),(29,NULL,'还行','2018-12-24 17:18:13',4.5,'67eniwbjt',15),(30,NULL,'还行','2018-12-24 17:18:13',4.5,'6d5f1g3dsg',14),(31,NULL,'还行','2018-12-24 17:18:14',4,'6s41hs21fgj',14),(32,NULL,'不错','2018-12-24 17:26:37',4.5,'dfhfdh',5),(33,NULL,'很舒适，很合身','2019-01-02 09:49:34',4.5,'45ubwv45u',5);
/*!40000 ALTER TABLE `commodity_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `commodity_review_user`
--

DROP TABLE IF EXISTS `commodity_review_user`;
/*!50001 DROP VIEW IF EXISTS `commodity_review_user`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `commodity_review_user` AS SELECT 
 1 AS `review_id`,
 1 AS `review_images`,
 1 AS `review_content`,
 1 AS `review_date`,
 1 AS `review_rating`,
 1 AS `commodity_id`,
 1 AS `username`,
 1 AS `name`,
 1 AS `email`,
 1 AS `telephone`,
 1 AS `birthday`,
 1 AS `sex`,
 1 AS `uid`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `commodity_type`
--

DROP TABLE IF EXISTS `commodity_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commodity_type` (
  `type_id` varchar(64) NOT NULL,
  `type_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodity_type`
--

LOCK TABLES `commodity_type` WRITE;
/*!40000 ALTER TABLE `commodity_type` DISABLE KEYS */;
INSERT INTO `commodity_type` VALUES ('1','夏季衣物'),('2','金银首饰'),('3','冬季衣服'),('4','宝石首饰'),('5','秋季衣服');
/*!40000 ALTER TABLE `commodity_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logistics`
--

DROP TABLE IF EXISTS `logistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logistics` (
  `logistics_id` varchar(64) NOT NULL,
  `order_id` varchar(64) DEFAULT NULL,
  `logistic_code` varchar(64) DEFAULT NULL,
  `shipper_code` varchar(32) DEFAULT NULL,
  `remarks` text,
  PRIMARY KEY (`logistics_id`),
  KEY `ex__001` (`order_id`),
  CONSTRAINT `e_o_fk_0001` FOREIGN KEY (`order_id`) REFERENCES `commodity_order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logistics`
--

LOCK TABLES `logistics` WRITE;
/*!40000 ALTER TABLE `logistics` DISABLE KEYS */;
INSERT INTO `logistics` VALUES ('6851325a323443679a3391d90f43b217','ee6fea65aa4a439cac5d3731697e10fe',NULL,NULL,NULL),('863f40ea237747d9a4440cb5eb21fe05','7caa01ccb3204c45a99ff7fb75fe31bc',NULL,NULL,NULL),('959a4af467db4843bd1b5285edbc29e6','cb3733f6b9dd42e8be84b8f74a54cba3',NULL,NULL,NULL),('b67e4a5ebe894accb196888fe3c34db1','3b6a8f7127c64121a7ead1c1d7351d54','803354159046422652','YTO',NULL),('c09129631bf2476bb164c92a2bdeadd6','8bef09968a2f41469b51e52c9188f521',NULL,NULL,NULL),('e2f58fb28369437cbd1b43c5346f809e','815397df41974e35909faa5ad25e6a09',NULL,NULL,NULL),('fae8252cc2114ca7b21b4b79bfa7cbdd','4a0ca7754537427399901e358eac0763',NULL,NULL,NULL);
/*!40000 ALTER TABLE `logistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `order_order_items`
--

DROP TABLE IF EXISTS `order_order_items`;
/*!50001 DROP VIEW IF EXISTS `order_order_items`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `order_order_items` AS SELECT 
 1 AS `order_id`,
 1 AS `order_update_time`,
 1 AS `order_price`,
 1 AS `express_delivery_fee`,
 1 AS `consignee_address`,
 1 AS `order_status`,
 1 AS `consignee_name`,
 1 AS `consignee_phone`,
 1 AS `order_items_id`,
 1 AS `order_items_count`,
 1 AS `order_items_price`,
 1 AS `order_items_state`,
 1 AS `commodity_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopping_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `commodity_id` varchar(64) NOT NULL,
  `cart_count` int(32) DEFAULT '0',
  `cart_subtotal` double DEFAULT '0',
  `uid` bigint(64) NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `uid_fk_0001` (`uid`),
  KEY `pid_fk_0001` (`commodity_id`),
  CONSTRAINT `c_p_fk_0001` FOREIGN KEY (`commodity_id`) REFERENCES `commodity` (`commodity_id`),
  CONSTRAINT `c_p_fk_001` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
INSERT INTO `shopping_cart` VALUES (18,'ab219d2f766e4ea48d701c3697e316a1',2,160,5);
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` bigint(64) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `telephone` varchar(64) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `state` int(2) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (5,'service','202cb962ac59075b964b07152d234b70','service','service@knight.com','123','1989-12-31','男',2,''),(14,'tom','e10adc3949ba59abbe56e057f20f883e','123','21@qq.com','123','1949-06-09','男',1,''),(15,'service2','e124b87085aa0ab53f238c1df97a1d02','123123','1902858521@qq.com','123','2018-12-20','男',1,'');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

SET FOREIGN_KEY_CHECKS = 1;
--
-- Final view structure for view `commodity_collections_user`
--

/*!50001 DROP VIEW IF EXISTS `commodity_collections_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `commodity_collections_user` AS select `commodity`.`commodity_id` AS `commodity_id`,`commodity`.`state` AS `state`,`commodity_collections`.`uid` AS `uid`,`user`.`username` AS `username`,`commodity_collections`.`collections_id` AS `collections_id`,`commodity`.`commodity_name` AS `commodity_name` from ((`commodity` join `commodity_collections` on((`commodity_collections`.`commodity_id` = `commodity`.`commodity_id`))) join `user` on((`commodity_collections`.`uid` = `user`.`uid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `commodity_order_logistic`
--

/*!50001 DROP VIEW IF EXISTS `commodity_order_logistic`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `commodity_order_logistic` AS select `commodity_order`.`order_id` AS `order_id`,`commodity_order`.`order_update_time` AS `order_update_time`,`commodity_order`.`order_price` AS `order_price`,`commodity_order`.`express_delivery_fee` AS `express_delivery_fee`,`commodity_order`.`order_status` AS `order_status`,`commodity_order`.`consignee_address` AS `consignee_address`,`commodity_order`.`consignee_name` AS `consignee_name`,`commodity_order`.`consignee_phone` AS `consignee_phone`,`commodity_order`.`uid` AS `uid`,`logistics`.`logistics_id` AS `logistics_id`,`logistics`.`logistic_code` AS `logistic_code`,`logistics`.`shipper_code` AS `shipper_code`,`logistics`.`remarks` AS `remarks` from (`commodity_order` join `logistics` on((`logistics`.`order_id` = `commodity_order`.`order_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `commodity_review_user`
--

/*!50001 DROP VIEW IF EXISTS `commodity_review_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `commodity_review_user` AS select `commodity_review`.`review_id` AS `review_id`,`commodity_review`.`review_images` AS `review_images`,`commodity_review`.`review_content` AS `review_content`,`commodity_review`.`review_date` AS `review_date`,`commodity_review`.`review_rating` AS `review_rating`,`commodity_review`.`commodity_id` AS `commodity_id`,`user`.`username` AS `username`,`user`.`name` AS `name`,`user`.`email` AS `email`,`user`.`telephone` AS `telephone`,`user`.`birthday` AS `birthday`,`user`.`sex` AS `sex`,`commodity_review`.`uid` AS `uid` from (`commodity_review` join `user` on((`commodity_review`.`uid` = `user`.`uid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_order_items`
--

/*!50001 DROP VIEW IF EXISTS `order_order_items`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_order_items` AS select `commodity_order`.`order_id` AS `order_id`,`commodity_order`.`order_update_time` AS `order_update_time`,`commodity_order`.`order_price` AS `order_price`,`commodity_order`.`express_delivery_fee` AS `express_delivery_fee`,`commodity_order`.`consignee_address` AS `consignee_address`,`commodity_order`.`order_status` AS `order_status`,`commodity_order`.`consignee_name` AS `consignee_name`,`commodity_order`.`consignee_phone` AS `consignee_phone`,`commodity_order_items`.`order_items_id` AS `order_items_id`,`commodity_order_items`.`order_items_count` AS `order_items_count`,`commodity_order_items`.`order_items_price` AS `order_items_price`,`commodity_order_items`.`order_items_state` AS `order_items_state`,`commodity_order_items`.`commodity_id` AS `commodity_id` from (`commodity_order` join `commodity_order_items` on((`commodity_order_items`.`order_id` = `commodity_order`.`order_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-02 12:17:31
