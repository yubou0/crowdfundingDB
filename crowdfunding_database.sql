CREATE DATABASE  IF NOT EXISTS `db_111403019` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_111403019`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 192.168.56.101    Database: db_111403019
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `member` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `cellphone_number` varchar(20) NOT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `cellphone_number_UNIQUE` (`cellphone_number`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'李小明','in.consequat@yahoo.com','366 苗栗縣銅鑼鄉民權中路319號','0921003614'),(2,'王小新','adipiscing.enim.mi@outlook.com','600 嘉義市東區世賢八路24號','0988008346'),(3,'張小紅','nullam.velit@yahoo.com','325 桃園市龍潭區淮子埔七路29號','0922830125'),(4,'陳小玉','sed.auctor@hotmail.com','540 南投縣南投市三和六路1499號','0958351743'),(5,'林小青','sagittis.nullam@google.com','508 彰化縣和美鎮潭北路1500號','0912587773'),(6,'黃小剛','nec.leo.morbi@protonmail.com','711 臺南市歸仁區崙頂二街1111號','0960105109'),(7,'廖小白','sociosqu.ad@yahoo.com','411 臺中市太平區北田南路14號','0961749001'),(8,'吳小蘭','proin.non@protonmail.com','801 高雄市前金區自立九路18號','0928735721'),(9,'劉小波','arcu.vel.quam@hotmail.com','201 基隆市信義區義四路222號','0968169143'),(10,'柯小智','dui.quis.accumsan@google.com','622 嘉義縣大林鎮早知到街31號','0970691667'),(11,'test Li','test@example.com','NCU','0123456789');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_tb`
--

DROP TABLE IF EXISTS `password_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `password_tb` (
  `password_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `salt` char(65) NOT NULL,
  `hashed_pwd` char(255) NOT NULL,
  PRIMARY KEY (`password_id`),
  KEY `fk3_idx` (`member_id`),
  CONSTRAINT `fk3` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_tb`
--

LOCK TABLES `password_tb` WRITE;
/*!40000 ALTER TABLE `password_tb` DISABLE KEYS */;
INSERT INTO `password_tb` VALUES (1,1,'0oplfZ16tyLX','9d5ec65935ab2991386a2df50db27491'),(2,2,'7gB%z9Svg8EW','37d3f919a7230c12a33ad33bb6a62940'),(3,3,'JJQF0j%tkx3i','d2898e8f01641dc2f1c7ae967f589764'),(4,4,'Rv$uGmL&C!%g','6072444ce37a3e5e18db29c07d9bff2f'),(5,5,'XcZg6Be^cU2y','58e537835456d27b4861bf1d0848c341'),(6,6,'aZjy*GvZt@s*','bad812356d04169c5231aca6dbf2e895'),(7,7,'j8tI5!wG88PM','ce94f4cd7665791f28eb1b0339e1a146'),(8,8,'n7UDOe0uspZk','79f1c375a8045aae0647826d07cc6f77'),(9,9,'wlmM33nAD@SR','8a6b92d74b7c32075652a700e57a2bc7'),(10,10,'&@^ODhk0MH&l','302b047e1bd5db87510915390368a5ac'),(11,11,'testsaltvalue','testpassword123');
/*!40000 ALTER TABLE `password_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposal`
--

DROP TABLE IF EXISTS `proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proposal` (
  `proposal_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int DEFAULT NULL,
  `proposer_name` varchar(255) DEFAULT NULL,
  `proposal_title` varchar(255) NOT NULL,
  `proposal_content` text NOT NULL,
  `category` varchar(50) NOT NULL,
  `amount_raised` decimal(13,2) NOT NULL,
  `goal` decimal(13,2) NOT NULL,
  `status` varchar(15) DEFAULT NULL,
  `view_num` int NOT NULL,
  `start_date` date NOT NULL,
  `due_date` date NOT NULL,
  PRIMARY KEY (`proposal_id`),
  KEY `fk1_idx` (`member_id`),
  CONSTRAINT `fk1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal`
--

LOCK TABLES `proposal` WRITE;
/*!40000 ALTER TABLE `proposal` DISABLE KEYS */;
INSERT INTO `proposal` VALUES (1,1,'李小明','The All 100周年紀念【回憶重溫】音樂再現，穿越時光之牆！獨家合作：星宇樂團x陳藝、彩色西瓜樂團。','在這場特別的百年紀念活動中，我們將透過星宇樂團和彩色西瓜樂團的精彩表演，帶您穿越時光，重溫過去的音樂經典。這將是一場難忘的音樂之旅，讓我們一起共同回憶、感受、並創造新的回憶！','音樂',9600.00,100000.00,'EXPIRED',43,'2024-01-16','2024-02-16'),(2,2,'王小新','【台灣風情】EZPACK 隨身斜背包，多功能口袋設計，讓你輕鬆出門！','EZPACK 隨身斜背包是您出門的最佳選擇！不僅設計時尚，而且充滿台灣風情。多功能口袋設計，讓您可以輕鬆攜帶所需物品，無論是日常生活還是旅行，都能夠輕鬆自在！','時尚',4500.00,5000.00,'Ongoing',1150,'2024-04-30','2024-05-30'),(3,2,'王小新','持續支持性別平等！「共融」紙藝便籤夾，讓你與性別平等同行！','我們堅定地支持性別平等，並致力於打破性別界限。這款「共融」紙藝便籤夾不僅實用，更是一種對性別平等的呼籲和支持。讓我們攜手共同建立一個更加公平、平等的社會！','藝術',2250.00,30000.00,'Ongoing',8,'2024-04-17','2024-05-17'),(4,2,'王小新','【令人驚艷】台灣新鳳梨品種：芒果鳳梨，帶給你獨特的口感體驗！','芒果鳳梨，這種全新的台灣特色水果，結合了芒果的香甜和鳳梨的清爽，帶給您絕佳的口感體驗！讓我們一起享受這份令人驚艷的美味！','飲食',4300.00,2000.00,'Ongoing',236,'2024-03-21','2024-05-21'),(5,4,'陳小玉','鋼鼓音樂熱潮！加入Formosa Beats，成為鋼鼓樂手！','Formosa Beats 是您成為鋼鼓樂手的最佳選擇！我們提供專業的鋼鼓教學和表演，讓您在音樂的世界中展現自己的才華，一起享受鋼鼓音樂的熱潮！','音樂',14400.00,35000.00,'Ongoing',251,'2024-05-01','2024-06-01'),(6,6,'黃小剛','【絕妙設計】ZLight MINi補光折疊穩定器，自拍必備良伴！','ZLight MINi補光折疊穩定器，是您自拍時的最佳助手！絕妙的設計和高品質的補光效果，讓您在自拍時輕鬆展現最佳狀態，捕捉每一個美好時刻！','攝影',10500.00,10000.00,'Expired',5893,'2024-01-06','2024-03-06'),(7,6,'黃小剛','日系可愛風格電動麻將組','讓我們一起來享受日系可愛風格的電動麻將組帶來的樂趣吧！這款電動麻將組不僅外觀可愛，而且操作簡單，讓您無論在家中還是外出，都能夠享受麻將的樂趣！','遊戲',10000.00,300000.00,'Ongoing',31,'2024-05-03','2024-06-03'),(8,8,'吳小蘭','一機搞定木工創意！DIY木工四合一工具，享受手作樂趣！','您是否喜歡親手製作木工作品？現在有了DIY木工四合一工具，您可以輕鬆應對各種木工創意！無論是裁切、鑽床、砂光還是車輪，都能在這一款工具上輕松實現！讓我們一起享受手作樂趣，創造出屬於自己的精美木工作品！','教育',0.00,100000.00,'Prepublish',0,'2024-07-04','2024-08-04'),(9,8,'吳小蘭','探索神秘命運！奇幻狗狗塔羅牌，解讀未來之謎！','每個人心中都有著一份對未來的好奇與渴望，而奇幻狗狗塔羅牌將為您打開神秘的命運之門！透過這套獨特的塔羅牌，您將能夠解讀未來的種種謎團，探索自己的命運之路。讓我們一起勇敢地面對未來，探索命運的奧秘！','藝術',19000.00,20000.00,'Ongoing',57,'2024-04-18','2024-06-18'),(10,9,'劉小波','weye美妝專業烘乾機，讓你的化妝品保持乾爽清潔！，拒絕刷菌上臉！','每天使用的化妝品是否也讓您感到困擾？現在有了weye美妝專業烘乾機，讓您的化妝品保持乾爽清潔，徹底拒絕刷菌上臉的煩惱！這款烘乾機擁有UV紫外線滅菌功能，能夠有效殺滅化妝品中的細菌，讓您的皮膚更加健康，化妝效果更加持久！','科技',0.00,30000.00,'Terminated',3148,'2024-02-26','2024-04-26'),(11,NULL,'','【潮流精品】SWAGPACK 斜背包，時尚設計，展現個人風格！','您是否渴望擁有一款時尚又實用的斜背包？SWAGPACK 斜背包將會是您的最佳選擇！時尚設計，展現個人風格，無論是日常穿搭還是旅行出行，都能夠襯托出您獨特的品味和風格！讓我們一起成為街頭的時尚潮流！','時尚',450.00,8000.00,'Terminated',124,'2024-04-10','2024-05-10'),(12,10,'柯小智','【世界上重量最輕折傘 】UM slim 秒收輕便雨傘，讓你無負擔','UM slim 秒收輕便雨傘不僅是一件抗風雨的實用工具，更是一種生活方式的象徵。它的獨特之處在於它的極輕極薄設計，成為世界上重量最輕的折傘之一。這款雨傢採用先進的材料和工藝，使其重量極輕，方便攜帶，無論是放在包包裡、手提袋還是口袋中，都絲毫不會增添負擔。其獨特的秒收設計讓您在下雨時迅速打開，隨時為您提供防雨保護，同時收起來也同樣輕鬆迅速。UM slim 雨傘的便攜性和實用性將讓您在雨天的城市生活中輕鬆自在，無懼風雨。','時尚',8400.00,10000.00,'Terminated',825,'2024-02-01','2024-04-01');
/*!40000 ALTER TABLE `proposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposal_following`
--

DROP TABLE IF EXISTS `proposal_following`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proposal_following` (
  `following_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `proposal_id` int DEFAULT NULL,
  PRIMARY KEY (`following_id`),
  KEY `fk7_idx` (`member_id`),
  KEY `fk8_idx` (`proposal_id`),
  CONSTRAINT `fk7` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk8` FOREIGN KEY (`proposal_id`) REFERENCES `proposal` (`proposal_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal_following`
--

LOCK TABLES `proposal_following` WRITE;
/*!40000 ALTER TABLE `proposal_following` DISABLE KEYS */;
INSERT INTO `proposal_following` VALUES (1,1,2),(2,1,3),(3,1,4),(4,2,7),(5,3,1),(6,3,9),(7,3,5),(8,3,4),(9,4,1),(10,5,2),(11,5,3),(12,5,9),(13,7,1),(14,7,5),(15,7,7),(16,7,6),(17,8,7),(18,9,9),(19,10,1);
/*!40000 ALTER TABLE `proposal_following` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposal_option`
--

DROP TABLE IF EXISTS `proposal_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proposal_option` (
  `proposal_option_id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int NOT NULL,
  `option_name` varchar(255) NOT NULL,
  `unit_price` decimal(13,2) NOT NULL,
  PRIMARY KEY (`proposal_option_id`),
  KEY `fk4_idx` (`proposal_id`),
  CONSTRAINT `fk4` FOREIGN KEY (`proposal_id`) REFERENCES `proposal` (`proposal_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal_option`
--

LOCK TABLES `proposal_option` WRITE;
/*!40000 ALTER TABLE `proposal_option` DISABLE KEYS */;
INSERT INTO `proposal_option` VALUES (1,1,'The All 100周年紀念【回憶重溫】',2400.00),(2,2,'斜背包 - A款式',350.00),(3,2,'斜背包 - B款式',550.00),(4,3,'紙藝便籤夾 - A套組',250.00),(5,3,'紙藝便籤夾 - B套組',350.00),(6,3,'紙藝便籤夾 - C套組',450.00),(7,4,'芒果鳳梨 - 5入',500.00),(8,4,'芒果鳳梨 - 10入',900.00),(9,5,'鋼鼓學院 - A課程',3600.00),(10,5,'鋼鼓學院 - B課程',4800.00),(11,5,'鋼鼓學院 - C課程',6000.00),(12,6,'ZLight MINi補光折疊穩定器 - A套組',3000.00),(13,6,'ZLight MINi補光折疊穩定器 - B套組',3500.00),(14,7,'日系可愛風格電動麻將組',10000.00),(15,8,'DIY木工四合一工具',2000.00),(16,9,'奇幻狗狗塔羅牌 - 柴犬套組',1000.00),(17,9,'奇幻狗狗塔羅牌 - 哈士奇套組',1000.00),(18,9,'奇幻狗狗塔羅牌 - 拉布拉多套組',1000.00),(19,9,'單純想贊助',1000.00),(20,10,'美妝工具烘乾機',800.00),(21,11,'斜背包 - A款式',450.00),(22,11,'斜背包 - B款式',550.00),(23,12,'輕便雨傘 - A款式',1200.00),(24,12,'輕便雨傘 - B款式',1200.00),(25,12,'輕便雨傘 - C款式',1200.00),(26,1,'test',8520.00);
/*!40000 ALTER TABLE `proposal_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `record` (
  `record_id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int NOT NULL,
  `proposal_option_id` int NOT NULL,
  `member_id` int NOT NULL,
  `review` text,
  `rating` int DEFAULT NULL,
  `response` text,
  PRIMARY KEY (`record_id`),
  KEY `fk9_idx` (`proposal_id`),
  KEY `fk10_idx` (`member_id`),
  KEY `fk15_idx` (`proposal_option_id`),
  CONSTRAINT `fk10` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk15` FOREIGN KEY (`proposal_option_id`) REFERENCES `proposal_option` (`proposal_option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk9` FOREIGN KEY (`proposal_id`) REFERENCES `proposal` (`proposal_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record`
--

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
INSERT INTO `record` VALUES (1,12,23,1,'物流速度太慢了，等了很久才收到貨，產品品質也一般。',3,'非常抱歉給您帶來不便，我們會加強物流管理，並對產品質量進行檢查，感謝您的反饋。'),(2,6,13,1,'這款產品的CP值很高，值得推薦。',4,'非常感謝您的推薦，我們會繼續努力，提供更多高CP值的產品！'),(3,3,6,1,NULL,NULL,NULL),(4,7,14,3,'使用過程中發現了一些小問題，希望能改進。',3,'感謝您的反饋，請您聯繫我們的客服，我們會盡快解決您的問題並進行改進。'),(5,9,17,3,'價錢合理，品質優良，使用體驗也很好，是個不錯的選擇。',4,NULL),(6,11,21,3,'產品一般，與預期有差距。',3,NULL),(7,1,1,5,'包裝有點簡陋，產品本身還可以，但感覺CP值不高。',3,'感謝您的反饋，我們會改進包裝並進一步提升產品CP值，希望下次能讓您更滿意。'),(8,4,8,4,NULL,NULL,NULL),(9,5,9,7,'使用感受不錯',3,'感謝您的肯定，我們會繼續努力，為您提供更好的使用體驗。'),(10,4,7,7,NULL,NULL,NULL),(11,2,3,7,'產品有損壞，雖然客服處理了，但感覺購物體驗不好。',2,NULL),(12,12,24,8,'品質不錯',NULL,NULL),(13,6,13,8,NULL,NULL,NULL),(14,2,2,8,'包裝破損，收到時有些失望，產品倒是正常。',3,'抱歉讓您失望了，我們會改進包裝，確保未來的物流過程中不再出現這樣的問題。'),(15,9,19,10,'這款產品真的很不錯',5,'非常感謝您的肯定，我們會繼續努力，提供更多優質產品！'),(16,9,19,10,'這款產品品質很好，做工精細，使用起來非常方便。非常推薦！',5,'非常感謝您的推薦，我們很高興您喜歡這款產品，期待您再次光臨。'),(17,1,1,10,'用了一段時間後出現問題，感覺產品質量有待提高。',3,'非常抱歉讓您遇到這個問題，請聯繫客服，我們會提供解決方案並改進產品質量。'),(18,9,16,10,'產品描述與實物有些出入，感覺有點被誤導了，不是很滿意。',2,'對不起給您帶來困擾，我們會重新審視產品描述，確保與實物一致，感謝您的反饋。'),(19,9,17,10,'非常實用，設計也很美觀，完全滿足我的需求。',5,NULL),(20,9,18,10,'使用時感覺不太順手，設計有待改進。',3,'感謝您的反饋，我們會仔細研究改進設計，讓使用體驗更加順暢。');
/*!40000 ALTER TABLE `record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsor_record`
--

DROP TABLE IF EXISTS `sponsor_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sponsor_record` (
  `sponsor_record_id` int NOT NULL AUTO_INCREMENT,
  `sponsor_id` int NOT NULL,
  `proposal_option_id` int NOT NULL,
  `purchase_valume` int NOT NULL,
  `total_price` decimal(13,2) NOT NULL,
  PRIMARY KEY (`sponsor_record_id`),
  KEY `fk5_idx` (`sponsor_id`),
  KEY `fk6_idx` (`proposal_option_id`),
  CONSTRAINT `fk5` FOREIGN KEY (`sponsor_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk6` FOREIGN KEY (`proposal_option_id`) REFERENCES `proposal_option` (`proposal_option_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor_record`
--

LOCK TABLES `sponsor_record` WRITE;
/*!40000 ALTER TABLE `sponsor_record` DISABLE KEYS */;
INSERT INTO `sponsor_record` VALUES (1,1,23,3,3600.00),(2,1,13,2,7000.00),(3,1,6,5,2250.00),(4,3,14,1,10000.00),(5,3,17,4,4000.00),(6,3,21,1,450.00),(7,5,1,3,7200.00),(8,4,8,2,1800.00),(9,7,9,4,14400.00),(10,7,7,5,2500.00),(11,7,3,5,2750.00),(12,8,24,4,4800.00),(13,8,13,1,3500.00),(14,8,2,5,1750.00),(15,10,19,1,1000.00),(16,10,19,2,2000.00),(17,10,1,1,2400.00),(18,10,16,5,5000.00),(19,10,17,4,4000.00),(20,10,18,3,3000.00);
/*!40000 ALTER TABLE `sponsor_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_111403019'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_CreateProposalOption` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `sp_CreateProposalOption`(
    IN p_proposal_option_id INT,
    IN p_proposal_id INT,
    IN p_proposal_option_name VARCHAR(255),
    IN p_price DECIMAL(13,2),
    OUT p_affected_row_num INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET p_affected_row_num = 0;
        ROLLBACK;
    END;

    START TRANSACTION;

    INSERT INTO proposal_option (proposal_option_id, proposal_id, option_name, unit_price)
    VALUES (p_proposal_option_id, p_proposal_id, p_proposal_option_name, p_price);
    
    SET p_affected_row_num = ROW_COUNT();

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_CreateSponsorRecord` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `sp_CreateSponsorRecord`(
    IN p_sponsor_record_id INT,
    IN p_sponsor_id INT,
    IN p_proposal_option_id INT,
    IN p_purchase_volume INT,
    OUT p_affected_row_num INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- 處理異常情況
        SET p_affected_row_num = 0;
        ROLLBACK;
    END;

    START TRANSACTION;

    -- 插入記錄
    INSERT INTO sponsor_record (sponsor_record_id, sponsor_id, proposal_option_id, purchase_valume, total_price)
    VALUES (
        p_sponsor_record_id, 
        p_sponsor_id, 
        p_proposal_option_id, 
        p_purchase_volume, 
        p_purchase_volume * (SELECT unit_price FROM proposal_option WHERE proposal_option_id = p_proposal_option_id)
    );

    -- 設置受影響的行數
    SET p_affected_row_num = ROW_COUNT();

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetFollowedProposalsByMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `sp_GetFollowedProposalsByMember`(
    IN p_member_id INT
)
BEGIN
    SELECT 
        pf.member_id,
        p.proposal_id,
        p.proposal_title,
        p.amount_raised,
        p.goal
    FROM 
        proposal_following pf
    JOIN 
        proposal p ON pf.proposal_id = p.proposal_id
    WHERE 
        pf.member_id = p_member_id
        AND p.status = 'Ongoing';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetOngoingProposalOptionbyRating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `sp_GetOngoingProposalOptionbyRating`(
    IN p_rating INT
)
BEGIN
    SELECT 
        p.proposal_id,
        p.proposal_title,
        po.option_name AS proposal_option_name,
        CAST(SUM(r.rating) / COUNT(r.rating) AS DECIMAL(3,2)) AS rating_avg
    FROM 
        proposal_option po
    JOIN 
        proposal p ON po.proposal_id = p.proposal_id
    LEFT JOIN 
        record r ON po.proposal_option_id = r.proposal_option_id
    WHERE 
        p.status = 'ONGOING'
        AND r.rating IS NOT NULL
    GROUP BY 
        p.proposal_id, p.proposal_title, po.option_name
    HAVING 
        rating_avg >= p_rating
    ORDER BY 
        rating_avg DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetProposalByCompletionRate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `sp_GetProposalByCompletionRate`(
    IN p_ratio FLOAT
)
BEGIN
    SELECT 
        p.proposal_id,
        p.proposal_title,
        p.amount_raised,
        p.goal,
        (p.amount_raised / p.goal) AS ratio
    FROM 
        proposal p
    WHERE 
        (p.amount_raised / p.goal) >= p_ratio
    ORDER BY 
        ratio DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetRecommendedProposals` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `sp_GetRecommendedProposals`(
    IN p_member_id INT
)
BEGIN
    -- 用一個臨時表來存推薦結果
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_recommended_proposals (
        proposal_id INT,
        proposal_title VARCHAR(255),
        status VARCHAR(15),
        view_num INT
    );

    -- 插入和 member_id 贊助相同提案的人也贊助過的其他提案，而且是Ongoing，也不是自己的提案
    INSERT INTO temp_recommended_proposals
    SELECT DISTINCT p.proposal_id, p.proposal_title, p.status, p.view_num
    FROM sponsor_record sr
    JOIN proposal_option po ON sr.proposal_option_id = po.proposal_option_id
    JOIN proposal p ON po.proposal_id = p.proposal_id
    WHERE sr.sponsor_id != p_member_id
      AND p.status = 'ONGOING'
      AND p.proposal_id NOT IN (
          SELECT po.proposal_id
          FROM sponsor_record sr
          JOIN proposal_option po ON sr.proposal_option_id = po.proposal_option_id
          WHERE sr.sponsor_id = p_member_id
      )
      AND sr.sponsor_id IN (
          SELECT DISTINCT sr2.sponsor_id
          FROM sponsor_record sr2
          JOIN proposal_option po2 ON sr2.proposal_option_id = po2.proposal_option_id
          WHERE po2.proposal_id IN (
              SELECT po3.proposal_id
              FROM sponsor_record sr3
              JOIN proposal_option po3 ON sr3.proposal_option_id = po3.proposal_option_id
              WHERE sr3.sponsor_id = p_member_id
          )
      );

    -- 如果沒有推薦，射出點閱最多的前五項
    IF (SELECT COUNT(*) FROM temp_recommended_proposals) = 0 THEN
        INSERT INTO temp_recommended_proposals
        SELECT p.proposal_id, p.proposal_title, p.status, p.view_num
        FROM proposal p
        WHERE p.status = 'ONGOING'
        ORDER BY p.view_num DESC
        LIMIT 5;
    END IF;

    -- 選擇結果
    SELECT proposal_id, proposal_title, status, view_num
    FROM temp_recommended_proposals;

    -- 刪除臨時表
    DROP TEMPORARY TABLE IF EXISTS temp_recommended_proposals;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetUnrepliedReviews` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `sp_GetUnrepliedReviews`(
    IN p_member_id INT
)
BEGIN
    SELECT 
        m.member_id AS proposer_id,
        p.proposal_id,
        p.proposal_title,
        r.record_id AS review_id,
        r.review,
        r.response
    FROM 
        proposal p
    JOIN 
        member m ON p.member_id = m.member_id
    JOIN 
        record r ON p.proposal_id = r.proposal_id
    WHERE 
        p.member_id = p_member_id
        AND r.response IS NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `sp_Login`(
    IN p_email VARCHAR(255),
    IN p_hashedPwd CHAR(255),
    OUT p_status_code INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET p_status_code = 3;
    END;

    -- 检查会员是否存在
    IF EXISTS (SELECT 1 FROM member m JOIN password_tb p ON m.member_id = p.member_id WHERE m.email = p_email AND p.hashed_pwd = p_hashedPwd) THEN
        SET p_status_code = 1;
    ELSEIF EXISTS (SELECT 1 FROM member WHERE email = p_email) THEN
        -- 密码错误
        SET p_status_code = 2;
    ELSE
        -- 会员不存在
        SET p_status_code = 3;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_RegisterMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `sp_RegisterMember`(
    IN p_email VARCHAR(255),
    IN p_hashedPwd CHAR(255),
    IN p_salt CHAR(65),
    IN p_name VARCHAR(255),
    IN p_address VARCHAR(255),
    IN p_cellphone_number VARCHAR(20),
    OUT p_status_code INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET p_status_code = 3;
        ROLLBACK;
    END;

    START TRANSACTION;

    -- 检查Email是否已存在
    IF EXISTS (SELECT 1 FROM member WHERE email = p_email) THEN
        SET p_status_code = 2;
    ELSE
        BEGIN
            -- 插入新的会员记录
            INSERT INTO member (email, name, address, cellphone_number)
            VALUES (p_email, p_name, p_address, p_cellphone_number);
            
            -- 获取新插入的会员ID
            SET @new_member_id = LAST_INSERT_ID();
            
            -- 插入salt和hashed_pwd记录
            INSERT INTO password_tb (member_id, salt, hashed_pwd)
            VALUES (@new_member_id, p_salt, p_hashedPwd);
            
            -- 注册成功
            SET p_status_code = 1;
        END;
    END IF;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdateProposalStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `sp_UpdateProposalStatus`(
    IN p_proposal_id INT,
    IN p_status INT,
    OUT p_affected_row_num INT
)
BEGIN
    DECLARE v_status VARCHAR(15);
    
    CASE p_status
        WHEN 1 THEN SET v_status = 'Pre-publish';
        WHEN 2 THEN SET v_status = 'Ongoing';
        WHEN 3 THEN SET v_status = 'EXPIRED';
        WHEN 4 THEN SET v_status = 'Terminated';
        ELSE SET v_status = NULL;
    END CASE;

    IF v_status IS NOT NULL THEN
        BEGIN
            DECLARE EXIT HANDLER FOR SQLEXCEPTION
            BEGIN
                SET p_affected_row_num = 0;
                ROLLBACK;
            END;

            START TRANSACTION;

            UPDATE proposal
            SET status = v_status
            WHERE proposal_id = p_proposal_id;

            SET p_affected_row_num = ROW_COUNT();

            COMMIT;
        END;
    ELSE
        SET p_affected_row_num = 0;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdatePwd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `sp_UpdatePwd`(
    IN p_member_id INT,
    IN p_original_hashPwd CHAR(255),
    IN p_hashedPwd CHAR(255),
    IN p_salt CHAR(65),
    OUT p_status_code INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET p_status_code = 3;
        ROLLBACK;
    END;

    START TRANSACTION;

    -- 检查原始密码是否正确
    IF EXISTS (SELECT 1 FROM password_tb WHERE member_id = p_member_id AND hashed_pwd = p_original_hashPwd) THEN
        BEGIN
            -- 更新密码和salt
            UPDATE password_tb
            SET hashed_pwd = p_hashedPwd, salt = p_salt
            WHERE member_id = p_member_id;
            
            -- 修改成功
            SET p_status_code = 1;
        END;
    ELSE
        -- 原密码错误
        SET p_status_code = 2;
    END IF;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-10 17:52:16
