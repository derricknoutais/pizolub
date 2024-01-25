#
************************************************************
# Sequel Pro SQL dump
# Version 4541
#
#
http:
//www.sequelpro.com/
#
https:
//github.com/sequelpro/sequelpro
#
#
Host:
127.0.0.1
(MySQL 5.7.20)
#
Database:
pizo
# Generation
Time:
2018-11-01 21:41:17 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table clients
# ------------------------------------------------------------

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;

INSERT INTO `clients` (`id`,
`nom`)
VALUES
(1,'ENGEN'),
(2,'OILIBYA'),
(3,'PETRO GABON'),
(4,'TOTAL'),
(5,'PIZO');

/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fournisseurs
# ------------------------------------------------------------

LOCK TABLES `fournisseurs` WRITE;
/*!40000 ALTER TABLE `fournisseurs` DISABLE KEYS */;

INSERT INTO `fournisseurs` (`
id`,
`nom
`)
VALUES
(1,'LUBRIZOL'),
(2,'LIBYA OIL SUPPLY'),
(3,'ORONITE'),
(4,'TOTAL O.M.'),
(5,'TOTAL LUBS'),
(6,'ENGEN');

/*!40000 ALTER TABLE `fournisseurs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table produit_bases
# ------------------------------------------------------------

LOCK TABLES `produit_bases` WRITE;
/*!40000 ALTER TABLE `produit_bases` DISABLE KEYS */;

INSERT INTO `produit_bases` (`
id`,
`nom
`, `type`, `fournisseur_id`, `cump`, `quantité`, `valeur`)
VALUES
(1,'150 NS','Huile Base',NULL,NULL,0,NULL),
(2,'600 NS','Huile Base',NULL,5000,-800,-4000000),
(3,'500 NS','Huile Base',NULL,NULL,0,NULL),
(4,'BS 150 HVI ','Huile Base',NULL,NULL,0,NULL),
(5,'CHEVRON NEUTRAL 100R','Huile Base',NULL,NULL,0,NULL),
(6,'CHEVRON NEUTRAL 220R','Huile Base',NULL,NULL,0,NULL),
(7,'CHEVRON NEUTRAL 600R','Huile Base',NULL,NULL,0,NULL),
(8,'YUBASE 4','Huile Base',NULL,NULL,0,NULL),
(9,'POWER OIL TO 1020','Huile Base',NULL,NULL,0,NULL),
(10,'ANGLAMOL 6085','Additif',1,NULL,0,NULL),
(11,'LUBBRIZOL 4980A','Additif',1,NULL,0,NULL),
(12,'LUBRIZOL 5703','Additif',1,NULL,0,NULL),
(13,'LUBRIZOL 7077','Additif',1,NULL,0,NULL),
(14,'LUBRIZOL 8900','Additif',1,NULL,0,NULL),
(15,'LUBRIZOL 16010','Additif',1,NULL,0,NULL),
(16,'LUBRIZOL 424R','Additif',1,NULL,0,NULL),
(17,'LUBRIZOL 8686','Additif',1,NULL,0,NULL),
(18,'LUBRIZOL 1047U','Additif',1,NULL,0,NULL),
(19,'EXXSOL D 80','Additif',2,NULL,0,NULL),
(20,'HITEC 2235 (OLCN 2346)','Additif',2,NULL,0,NULL),
(21,'LUBRIZOL 424R (OLCN 2262)','Additif',2,NULL,0,NULL),
(22,'LUBBRIZOL 1045 (OLCN 2267)','Additif',2,NULL,0,NULL),
(23,'LUBBRIZOL 5060','Additif',2,NULL,0,NULL),
(24,'LUBBRIZOL 5304','Additif',2,NULL,0,NULL),
(25,'LUBRIZOL LUBBRIZOL 5703 (OLCN 2248)','Additif',2,NULL,0,NULL),
(26,'LUBBRIZOL 7749B (OLCN 2243)','Additif',2,NULL,0,NULL),
(27,'LUBBRIZOL 9220 (OLCN 2271)','Additif',2,NULL,0,NULL),
(28,'LUBBRIZOL 9692A (OLCN 2311)','Additif',2,NULL,0,NULL),
(29,'LUBBRIZOL 16008 (OLCN 2306)','Additif',2,NULL,0,NULL),
(30,'OLCN 2244','Additif',2,NULL,0,NULL),
(31,'OLCN 2254','Additif',2,NULL,0,NULL),
(32,'OLCN 2255','Additif',2,NULL,0,NULL),
(33,'OLCN 2296 (BOOSTER 1)','Additif',2,NULL,0,NULL),
(34,'OLCN 2297 (PACK 1)','Additif',2,NULL,0,NULL),
(35,'OLCN 2301 (VM)','Additif',2,NULL,0,NULL),
(36,'OLCN 2307','Additif',2,NULL,0,NULL),
(37,'OLCN 2360','Additif',2,NULL,0,NULL),
(38,'ADDITIN RC 9207','Additif',2,NULL,0,NULL),
(39,'OLOA 340 R','Additif',3,NULL,0,NULL),
(40,'OLOA 4594 R','Additif',3,NULL,0,NULL),
(41,'OLOA 9362','Additif',3,NULL,0,NULL),
(42,'OLOA 9790 F ','Additif',3,NULL,0,NULL),
(43,'OLOA 19803','Additif',3,NULL,0,NULL),
(44,'OLOA 26008 A','Additif',3,NULL,0,NULL),
(45,'OLOA 59762','Additif',3,NULL,0,NULL),
(46,'OLOA 59766','Additif',3,NULL,0,NULL),
(47,'OLOA 59770','Additif',3,NULL,0,NULL),
(48,'PARATONE 8006','Additif',3,NULL,0,NULL),
(49,'OLOA 50704','Additif',3,NULL,0,NULL),
(50,'OLOA 48021','Additif',3,NULL,0,NULL),
(51,'AUTOMATE BLUE 8G','Additif',3,NULL,0,NULL),
(52,'A 02 2929','Additif',4,NULL,0,NULL),
(53,'A 109191','Additif',4,NULL,0,NULL),
(54,'A 114747 (CUBITAINER)','Additif',4,NULL,0,NULL),
(55,'A 122121','Additif',4,NULL,0,NULL),
(56,'A 126666','Additif',4,NULL,0,NULL),
(57,'B 025959','Additif',4,NULL,0,NULL),
(58,'B 20909','Additif',4,NULL,0,NULL),
(59,'B 02 3333 ','Additif',4,NULL,0,NULL),
(60,'B 02 3333','Additif',4,NULL,0,NULL),
(61,'B 108080','Additif',4,NULL,0,NULL),
(62,'B 122727','Additif',4,NULL,0,NULL),
(63,'B 131717','Additif',4,NULL,0,NULL),
(64,'C 02 6666','Additif',4,NULL,0,NULL),
(65,'C 107575','Additif',4,NULL,0,NULL),
(66,'C 107676','Additif',4,NULL,0,NULL),
(67,'C 111010','Additif',4,NULL,0,NULL),
(68,'C 111010','Additif',4,NULL,0,NULL),
(69,'C 111616','Additif',4,NULL,0,NULL),
(70,'C 113030','Additif',4,NULL,0,NULL),
(71,'C 114444','Additif',4,NULL,0,NULL),
(72,'C 121818','Additif',4,NULL,0,NULL),
(73,'C 122121','Additif',4,NULL,0,NULL),
(74,'CONCENTRE PNEUMA L 3783','Additif',4,NULL,0,NULL),
(75,'D 037979','Additif',4,NULL,0,NULL),
(76,'D 57575','Additif',4,NULL,0,NULL),
(77,'D 79090','Additif',4,NULL,0,NULL),
(78,'D 101414','Additif',4,NULL,0,NULL),
(79,'D 105555','Additif',4,NULL,0,NULL),
(80,'D 101616','Additif',4,NULL,0,NULL),
(81,'D 117373','Additif',4,NULL,0,NULL),
(82,'ETHANOX 4701','Additif',4,NULL,0,NULL),
(83,'IRGANOX L135','Additif',4,NULL,0,NULL),
(84,'L 033838','Additif',4,NULL,0,NULL),
(85,'MF 1273','Additif',4,NULL,0,NULL),
(86,'X 027070','Additif',4,NULL,0,NULL),
(87,'X 131111','Additif',4,NULL,0,NULL),
(88,'X 121717','Additif',4,NULL,0,NULL),
(89,'SOL ANTIMOUSSE AZ','Additif',4,NULL,0,NULL),
(90,'HYDROLSEAL G232H','Additif',4,NULL,0,NULL),
(91,'A 109191','Additif',5,NULL,0,NULL),
(92,'DISOPAC','Additif',5,NULL,0,NULL),
(93,'DISOPAC DD','Additif',5,NULL,0,NULL),
(94,'HYPAC','Additif',5,NULL,0,NULL),
(95,'L104848','Additif',5,NULL,0,NULL),
(96,'MAR 427 R','Additif',5,NULL,0,NULL),
(97,'MAR 489 S','Additif',5,NULL,0,NULL),
(98,'MAR 501 S','Additif',5,NULL,0,NULL),
(99,'MAR 502 S','Additif',5,NULL,0,NULL),
(100,'MAR 515 U','Additif',5,NULL,0,NULL),
(101,'TALUPAC B','Additif',5,NULL,0,NULL),
(102,'STOCK 823','Additif',6,NULL,0,NULL),
(103,'STOCK 943','Additif',6,NULL,0,NULL),
(104,'STOCK 1007 (BLUE DYE)','Additif',6,NULL,0,NULL),
(105,'STOCK 7485 (CG1002)','Additif',6,NULL,0,NULL),
(106,'STOCK 8527','Additif',6,NULL,0,NULL),
(107,'STOCK 8684','Additif',6,NULL,0,NULL),
(108,'STOCK 15937','Additif',6,NULL,0,NULL),
(109,'STOCK 12156','Additif',6,NULL,0,NULL),
(110,'STOCK 13873','Additif',6,NULL,0,NULL),
(111,'STOCK 15429 (POWER OIL TO 1020)','Additif',6,NULL,0,NULL),
(112,'STOCK 15630','Additif',6,NULL,0,NULL),
(113,'STOCK 17149','Additif',6,NULL,0,NULL),
(114,'STOCK 17722','Additif',6,NULL,0,NULL),
(115,'STOCK 18350','Additif',6,NULL,0,NULL),
(116,'STOCK 18351','Additif',6,NULL,0,NULL),
(117,'STOCK 18356','Additif',6,NULL,0,NULL),
(118,'STOCK 7082','Additif',6,NULL,0,NULL),
(119,'STOCK 19625','Additif',6,NULL,0,NULL);

/*!40000 ALTER TABLE `produit_bases` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table produit_finis
# ------------------------------------------------------------

LOCK TABLES `produit_finis` WRITE;
/*!40000 ALTER TABLE `produit_finis` DISABLE KEYS */;

INSERT INTO `produit_finis` (`
id`,
`client_id
`, `nom`, `conditionnement`, `poids_emballage`, `quantité`, `cpm`, `valeur`, `created_at`, `updated_at`)
VALUES
(2,1,'ENGEN DIESEL 600 SUPER 15W40','C24X1L',21.6,0,0,0,NULL,NULL),
(3,1,'ENGEN DIESEL 600 SUPER 15W40','C4X5L',18,0,0,0,NULL,NULL),
(4,1,'ENGEN DIESEL 600 SUPER 15W40','C4X5L',18,100,50003,5000300,NULL,'2018-10-18 23:07:20'),
(5,1,'ENGEN DIESEL 600 SUPER 15W40','FUTS',185,0,0,0,NULL,NULL),
(6,1,'ENGEN DIESEL 500 SUPER 15W40','FUTS',185,0,0,0,NULL,NULL),
(7,1,'ENGEN XTREME 15W40','C24X1L',21.6,0,0,0,NULL,NULL),
(8,1,'ENGEN XTREME 15W40','C4X5L',18,0,0,0,NULL,NULL),
(9,1,'ENGEN XTREME 15W40','FUTS',185,0,0,0,NULL,NULL),
(10,1,'ENGEN SUPER 20W50','C24X1L',21.6,0,0,0,NULL,NULL),
(11,1,'ENGEN SUPER 20W50','C6X4L',21.6,0,0,0,NULL,NULL),
(12,1,'ENGEN SUPER 20W50','FUTS',185,0,0,0,NULL,NULL),
(13,1,'ENGEN PROTECTA HI-MILEAGE 20W50','C24X1L',21.6,0,0,0,NULL,NULL),
(14,1,'ENGEN PROTECTA HI-MILEAGE 20W50','C6X4L',21.6,0,0,0,NULL,NULL),
(15,1,'ENGEN PROTECTA HI-MILEAGE 20W50','C4X5L',18,0,0,0,NULL,NULL),
(16,1,'ENGEN PROTECTA HI-MILEAGE 20W50','FUTS',185,0,0,0,NULL,NULL),
(17,1,'ENGEN PREMIUM MOTOR OIL 40','C24X1L',21.6,0,0,0,NULL,NULL),
(18,1,'ENGEN PREMIUM MOTOR OIL 40','C4X5L',18,0,0,0,NULL,NULL),
(19,1,'ENGEN PREMIUM MOTOR OIL 40','FUTS',185,0,0,0,NULL,NULL),
(20,1,'ENGEN DIESELUBE 540','FUTS',185,0,0,0,NULL,NULL),
(21,1,'ENGEN DIESELUBE 530','FUTS',185,0,0,0,NULL,NULL),
(22,1,'ENGEN DIESELUBE 510','FUTS',180,0,0,0,NULL,NULL),
(23,1,'ENGEN AGRIFLUID ','FUTS',180,0,0,0,NULL,NULL),
(24,1,'ATF 22D','FUTS',180,0,0,0,NULL,NULL),
(25,1,'GEARLUBE HP 80W-A','FUTS',185,0,0,0,NULL,NULL),
(26,1,'GEARLUBE HP 80W90','FUTS',185,0,0,0,NULL,NULL),
(27,1,'GEARLUBE EP 80W90','C24X1L',21.6,0,0,0,NULL,NULL),
(28,1,'GEARLUBE EP 80W90','FUTS',185,0,0,0,NULL,NULL),
(29,1,'GEARLUBE EP 85W140','FUTS',185,0,0,0,NULL,NULL),
(30,1,'ENGEN TRANSFLUID TO-4 SAE 50','FUTS',185,0,0,0,NULL,NULL),
(31,1,'ENGEN SUPER OUTBOARD TC-W3','C24X1L',21.6,0,0,0,NULL,NULL),
(32,1,'ENGEN SUPER OUTBOARD TC-W3','C4X5L',21.6,0,0,0,NULL,NULL),
(33,1,'ENGEN SUPER OUTBOARD TC-W3','C6X4L',21.6,0,0,0,NULL,NULL),
(34,1,'ENGEN SUPER OUTBOARD TC-W3','FUTS',180,0,0,0,NULL,NULL),
(35,1,'ENGEN TWO STROKE SELFMIX','C24X1L',21.6,0,0,0,NULL,NULL),
(36,1,'ENGEN TWO STROKE SELFMIX','FUTS',180,0,0,0,NULL,NULL),
(37,1,'ENGEN TWO STROKE SUPER','C24X1L',21.6,0,0,0,NULL,NULL),
(38,1,'ENGEN TWO STROKE SUPER','FUTS',180,0,0,0,NULL,NULL),
(39,1,'ENGEN TQH 10/46','FUTS',180,0,0,0,NULL,NULL),
(40,1,'ENGEN TQH 10/68','FUTS',185,0,0,0,NULL,NULL),
(41,1,'ENGEN TQH 20/32','FUTS',180,0,0,0,NULL,NULL),
(42,1,'ENGEN TQH 20/46','FUTS',180,0,0,0,NULL,NULL),
(43,1,'ENGEN TQH 20/68','FUTS',185,0,0,0,NULL,NULL),
(44,1,'ENGEN TQH 20/100','FUTS',185,0,0,0,NULL,NULL),
(45,1,'GENGEAR 68','FUTS',185,0,0,0,NULL,NULL),
(46,1,'GENGEAR 100','FUTS',185,0,0,0,NULL,NULL),
(47,1,'GENGEAR 150','FUTS',185,0,0,0,NULL,NULL),
(48,1,'GENGEAR 220','FUTS',185,0,0,0,NULL,NULL),
(49,1,'GENGEAR 320','FUTS',185,0,0,0,NULL,NULL),
(50,1,'GENGEAR 460','FUTS',185,0,0,0,NULL,NULL),
(51,1,'GENGEAR 680','FUTS',185,0,0,0,NULL,NULL),
(52,1,'GENGEAR 1000','FUTS',185,0,0,0,NULL,NULL),
(53,1,'GENCYL 460','FUTS',185,0,0,0,NULL,NULL),
(54,1,'PETRONAS GEO S 40','FUTS',185,0,0,0,NULL,NULL),
(55,1,'HUILE DECLASSEE','FUTS',180,0,0,0,NULL,NULL),
(56,1,'POWEROIL TO 1020','FUTS',180,0,0,0,NULL,NULL),
(57,2,'ACCEL ULTRA 20W50','FUTS',185,0,0,0,NULL,NULL),
(58,2,'ACCEL ULTRA 20W50','C24X1L',21.6,0,0,0,NULL,NULL),
(59,2,'ACCEL ULTRA 20W50','C6X4L',21.6,0,0,0,NULL,NULL),
(60,2,'ACCEL XL10  20W50','C12X1L',10.8,0,0,0,NULL,NULL),
(61,2,'ACCEL XL10  20W50','C4X5L',18,0,0,0,NULL,NULL),
(62,2,'DEOMAX HD 10W','FUTS',180,0,0,0,NULL,NULL),
(63,2,'DEOMAX HD 30','FUTS',185,0,0,0,NULL,NULL),
(64,2,'DEOMAX DM5 SAE 40','FUTS',185,0,0,0,NULL,NULL),
(65,2,'DEOMAX HD 40','C24X1L',21.6,0,0,0,NULL,NULL),
(66,2,'DEOMAX HD 40','C6X4L',21.6,0,0,0,NULL,NULL),
(67,2,'DEOMAX HD 50','FUTS',185,0,0,0,NULL,NULL),
(68,2,'DEOMAX DM12 15W40','FUTS',185,0,0,0,NULL,NULL),
(69,2,'DEOMAX SHP 15W40','C24X1L',21.6,0,0,0,NULL,NULL),
(70,2,'DEOMAX SHP 15W40','C6X4L',21.6,0,0,0,NULL,NULL),
(71,2,'DEOMAX DM 5 SAE 40','C12X1L',18,0,0,0,NULL,NULL),
(72,2,'DEOMAX DM 5 SAE 40','C4X5L',21.6,0,0,0,NULL,NULL),
(73,2,'DEOMAX DM 12 15W40','C12X1L',10.8,0,0,0,NULL,NULL),
(74,2,'DEOMAX DM 12 15W40','C4X5L',21.6,0,0,0,NULL,NULL),
(75,2,'DIESEL SAFARI OIL 40','FUTS',185,0,0,0,NULL,NULL),
(76,2,'DIESEL SAFARI OIL 40','VRAC',1,0,0,0,NULL,NULL),
(77,2,'GEAR OIL HD  80W90   GL-4','FUTS',185,0,0,0,NULL,NULL),
(78,2,'GEAR OIL 80W90          GL-5','C24X1L',21.6,0,0,0,NULL,NULL),
(79,2,'GEAR OIL XHD  80W90   ','C12X1L',10.8,0,0,0,NULL,NULL),
(80,2,'GEAR OIL XHD  80W90   ','FUTS',185,0,0,0,NULL,NULL),
(81,2,'GEAR OIL 85W140','FUTS',185,0,0,0,NULL,NULL),
(82,2,'GEAR OIL XHD 85W140','FUTS',185,0,0,0,NULL,NULL),
(83,2,'HP 300A MOTOR OIL 40','C6X4L',21.6,0,0,0,NULL,NULL),
(84,2,'HYDROL HTE 32','FUTS',180,0,0,0,NULL,NULL),
(85,2,'HYDROL 46','FUTS',180,0,0,0,NULL,NULL),
(86,2,'HYDROL 68','FUTS',185,0,0,0,NULL,NULL),
(87,2,'HYDROL 100','FUTS',185,0,0,0,NULL,NULL),
(88,2,'MARINEGARD 312','FUTS',185,0,0,0,NULL,NULL),
(89,2,'MARINEGARD 412','FUTS',185,0,0,0,NULL,NULL),
(90,2,'MARINEGARD 570','FUTS',185,0,0,0,NULL,NULL),
(91,2,'QUEST 2T','FUTS',180,0,0,0,NULL,NULL),
(92,2,'QUEST 2T','C12X1L',10.8,0,0,0,NULL,NULL),
(93,2,'RED FLUSH OIL','FUTS',180,0,0,0,NULL,NULL),
(94,2,'THERMIC OIL','FUTS',180,0,0,0,NULL,NULL),
(95,2,'TORQGEAR XP 68','FUTS',185,0,0,0,NULL,NULL),
(96,2,'TORQGEAR XP 100','FUTS',185,0,0,0,NULL,NULL),
(97,2,'TORQGEAR XP 150','FUTS',185,0,0,0,NULL,NULL),
(98,2,'TORQGEAR XP 220','FUTS',185,0,0,0,NULL,NULL),
(99,2,'TORQGEAR XP 320','FUTS',185,0,0,0,NULL,NULL),
(100,2,'TORQGEAR XP 460','FUTS',185,0,0,0,NULL,NULL),
(101,2,'TRANS FD 50','FUTS',185,0,0,0,NULL,NULL),
(102,2,'SAFARI OIL 40','C24X1L',21.6,0,0,0,NULL,NULL),
(103,2,'SAFARI OIL 40','C6X4L',21.6,0,0,0,NULL,NULL),
(104,2,'SAFARI OIL 40','FUTS',185,0,0,0,NULL,NULL),
(105,3,'HUILE DECLASSEE','Fûts',180,0,0,0,NULL,NULL),
(106,3,'PETRO  MOTEUR 10W','Futs',180,0,0,0,NULL,NULL),
(107,3,'PETRO OKAN DRIVER 40','Fûts',185,0,0,0,NULL,NULL),
(108,3,'PETRO MOTEUR 50','Fûts',185,0,0,0,NULL,NULL),
(109,3,'PETRO DIESEL 15W40','Fûts',185,0,0,0,NULL,NULL),
(110,3,'PETRO  DIESEL SUPER 15W40','Fûts',185,0,0,0,NULL,NULL),
(111,3,'PETRO HYDRAULIQUE 32','Futs',180,0,0,0,NULL,NULL),
(112,3,'PETRO HYDRAULIQUE 46','Futs',180,0,0,0,NULL,NULL),
(113,3,'PETRO HYDRAULIQUE 68','Fûts',185,0,0,0,NULL,NULL),
(114,3,'PETRO HYDRAULIQUE 100','Fûts',185,0,0,0,NULL,NULL),
(115,3,'PETRO TRANSMISSION 80W90','Fûts',185,0,0,0,NULL,NULL),
(116,3,'PETRO TRANSMISSION 85W140','Fûts',185,0,0,0,NULL,NULL),
(117,3,'HUILE THERMIQUE','Futs',180,0,0,0,NULL,NULL),
(118,3,'PETRO ENGRENAGE 150','Futs',185,0,0,0,NULL,NULL),
(119,3,'PETRO ENGRENAGE 220','Futs',185,0,0,0,NULL,NULL),
(120,3,'PETRO ENGRENAGE 320','Futs',185,0,0,0,NULL,NULL),
(121,3,'PETRO ENGRENAGE 460','Futs',185,0,0,0,NULL,NULL),
(122,3,'PETRO OKAN OUTBOARD 2T','Futs',180,0,0,0,NULL,NULL),
(123,5,'PIZO ATF 22D','Futs',185,0,0,0,NULL,NULL),
(124,5,'PIZO 15W40 CI-4','Futs',185,0,0,0,NULL,NULL),
(125,5,'PIZO HYDRAULIQUE 68 HM','Futs',180,0,0,0,NULL,NULL),
(126,5,'PIZO TRANSMISSION 80W90 GL-5','Futs',180,0,0,0,NULL,NULL),
(127,5,'PIZO TRANSMISSION 85W140 GL-5','Futs',185,0,0,0,NULL,NULL),
(128,5,'PIZO MOTEUR 10W','Futs',180,0,0,0,NULL,NULL),
(129,5,'PIZO HUILE DE CHAINE','Futs',180,0,0,0,NULL,NULL),
(130,5,'PIZO ENGRENAGES 460','Futs',185,0,0,0,NULL,NULL),
(131,5,'SIVVA SAE 40','C4*5L',18,0,0,0,NULL,NULL),
(132,5,'SIVVA SAE 40','Futs',185,0,0,0,NULL,NULL),
(133,5,'ATF DEXRON II','Futs',180,0,0,0,NULL,NULL),
(134,5,'PIZO 2T TCW','Futs',180,0,0,0,NULL,NULL),
(135,5,'PIZO MOTEUR DIESEL 15W40','Futs',185,0,0,0,NULL,NULL),
(136,5,'APC MOTEUR DIESEL 15W40','Futs',185,0,0,0,NULL,NULL),
(137,4,'TOTAL 2 TEMPS Z','C122T',21.6,0,0,0,NULL,NULL),
(138,4,'TOTAL  2  TEMPS Z','FUTS',180,0,0,0,NULL,NULL),
(139,4,'TOTAL ATF 22 D','FUTS',180,0,0,0,NULL,NULL),
(140,4,'TOTAL  AZOLLA  ZS  22','FUTS',180,0,0,0,NULL,NULL),
(141,4,'TOTAL  AZOLLA  ZS  32','FUTS',180,0,0,0,NULL,NULL),
(142,4,'TOTAL  AZOLLA  ZS  46','FUTS',180,0,0,0,NULL,NULL),
(143,4,'TOTAL  AZOLLA  ZS  68','B20L',18,0,0,0,NULL,NULL),
(144,4,'TOTAL  AZOLLA  ZS  68','FUTS',185,0,0,0,NULL,NULL),
(145,4,'TOTAL  AZOLLA  ZS  100','FUTS',185,0,0,0,NULL,NULL),
(146,4,'TOTAL  AZOLLA  ZS  150','FUTS',185,0,0,0,NULL,NULL),
(147,4,'TOTAL  CARTER EP 68','FUTS',185,0,0,0,NULL,NULL),
(148,4,'TOTAL  CARTER EP 100','FUTS',185,0,0,0,NULL,NULL),
(149,4,'TOTAL  CARTER EP 150','FUTS',185,0,0,0,NULL,NULL),
(150,4,'TOTAL  CARTER EP 220','FUTS',185,0,0,0,NULL,NULL),
(151,4,'TOTAL  CARTER EP 320','FUTS',185,0,0,0,NULL,NULL),
(152,4,'TOTAL  CARTER EP 460','FUTS',185,0,0,0,NULL,NULL),
(153,4,'TOTAL  CARTER  EP  680','FUTS',185,0,0,0,NULL,NULL),
(154,4,'TOTAL  CARTER  EP  1000','FUTS',185,0,0,0,NULL,NULL),
(155,4,'TOTAL  CARTER  EP  3000','FUTS',185,0,0,0,NULL,NULL),
(156,4,'TOTAL  FLUID II D','FUTS',185,0,0,0,NULL,NULL),
(157,4,'TOTAL DYNATRANS AC 30','FUTS',185,0,0,0,NULL,NULL),
(158,4,'TOTAL DYNATRANS AC 50','FUTS',185,0,0,0,NULL,NULL),
(159,4,'TOTAL DYNATRANS AC 50','VRAC',1,0,0,0,NULL,NULL),
(160,4,'TOTAL  EP  80W85','FUTS',180,0,0,0,NULL,NULL),
(161,4,'TOTAL  EP  80W90','FUTS',185,0,0,0,NULL,NULL),
(162,4,'TOTAL  EPB  85W90','FUTS',185,0,0,0,NULL,NULL),
(163,4,'TOTAL  EQUIVIS ZS 32','FUTS',180,0,0,0,NULL,NULL),
(164,4,'TOTAL  EQUIVIS  ZS  46','FUTS',180,0,0,0,NULL,NULL),
(165,4,'TOTAL  EQUIVIS  ZS  68','FUTS',185,0,0,0,NULL,NULL),
(166,4,'TOTAL  EQUIVIS  ZS  100','FUTS',185,0,0,0,NULL,NULL),
(167,4,'TOTAL MOTOR OIL SAE 40','FUTS',185,0,0,0,NULL,NULL),
(168,4,'TOTAL MOTOR OIL SAE 40','C20X1L',18,0,0,0,NULL,NULL),
(169,4,'TOTAL MOTOR OIL SAE 40','C6X5L',27,0,0,0,NULL,NULL),
(170,4,'TOTAL MOTOR OIL SAE 40','VRAC',900,0,0,0,NULL,NULL),
(171,4,'TOTAL NATERIA MH 40','FUTS',185,0,0,0,NULL,NULL),
(172,4,'TOTAL NATERIA V 40','FUTS',185,0,0,0,NULL,NULL),
(173,4,'TOTAL NEPTUNA SUPER 2T SPORT','C20X1L',18,0,0,0,NULL,NULL),
(174,4,'TOTAL NEPTUNA SUPER 2T SPORT','C12X2L',21.6,0,0,0,NULL,NULL),
(175,4,'TOTAL NEPTUNA SUPER 2T SPORT','FUTS',180,0,0,0,NULL,NULL),
(176,4,'TOTAL PNEUMA 100','FUTS',185,0,0,0,NULL,NULL),
(177,4,'TOTAL  QUARTZ  5000  SAE  20W50','C20X1L',18,0,0,0,NULL,NULL),
(178,4,'TOTAL  QUARTZ  5000  SAE  20W50','C6X5L',27,0,0,0,NULL,NULL),
(179,4,'TOTAL  QUARTZ  5000  SAE  20W50','FUTS',185,0,0,0,NULL,NULL),
(180,4,'TOTAL  RUBIA  G13  ','FUTS',185,0,0,0,NULL,NULL),
(181,4,'TOTAL  RUBIA  S  10W','FUTS',180,0,0,0,NULL,NULL),
(182,4,'TOTAL  RUBIA  S  10W','VRAC',4400,0,0,0,NULL,NULL),
(183,4,'TOTAL  RUBIA  S  30','FUTS',185,0,0,0,NULL,NULL),
(184,4,'TOTAL  RUBIA  S  40','FUTS',185,0,0,0,NULL,NULL),
(185,4,'TOTAL  RUBIA  S  40','C20X1L',18,0,0,0,NULL,NULL),
(186,4,'TOTAL  RUBIA  S  40','C6X5L',27,0,0,0,NULL,NULL),
(187,4,'TOTAL  RUBIA  S  50','FUTS',185,0,0,0,NULL,NULL),
(188,4,'TOTAL  RUBIA  4400 15W40','FUTS',185,0,0,0,NULL,NULL),
(189,4,'TOTAL  RUBIA  4400 15W40','C20X1L',18,0,0,0,NULL,NULL),
(190,4,'TOTAL  RUBIA  4400 15W40','C6X5L',27,0,0,0,NULL,NULL),
(191,4,'TOTAL  RUBIA  TIR  7400  15W40','FUTS',185,0,0,0,NULL,NULL),
(192,4,'TOTAL  RUBIA FLEET HD 300  15W40','FUTS',185,0,0,0,NULL,NULL),
(193,4,'TOTAL  SERIOLA  1510','FUTS',180,0,0,0,NULL,NULL),
(194,4,'TOTAL  SERIOLA  1510','VRAC',0,0,0,0,NULL,NULL),
(195,4,'TOTAL  SERIOLA ETA 100','FUTS',180,0,0,0,NULL,NULL),
(196,4,'TOTAL  SPECIALE PIROGUE','C20X1L',18,0,0,0,NULL,NULL),
(197,4,'TOTAL  SPECIALE PIROGUE','C12X2L',21.6,0,0,0,NULL,NULL),
(198,4,'TOTAL  SPECIALE PIROGUE','FUTS',180,0,0,0,NULL,NULL),
(199,4,'TOTAL  SPECIALE CHAINE','FUTS',180,0,0,0,NULL,NULL),
(200,4,'TOTAL  TOTALSOL','FUTS',170,0,0,0,NULL,NULL),
(201,4,'TOTAL  TRANSMIS. TM  80W90','C12X2L',21.6,0,0,0,NULL,NULL),
(202,4,'TOTAL  TRANSMIS. TM  80W90','FUTS',185,0,0,0,NULL,NULL),
(203,4,'TOTAL  TRANSMIS. TM  85W90','FUTS',185,0,0,0,NULL,NULL),
(204,4,'TOTAL  TRANSMIS. TM  85W140','FUTS',185,0,0,0,NULL,NULL);

/*!40000 ALTER TABLE `produit_finis` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette 2TEMPS Z (2L)', '4', 'Étiquette', '2500');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette MOTOR OIL 40  (1L)', '4', 'Étiquette', '0');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette MOTOR OIL 40  (4L)', '4', 'Étiquette', '0');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette MOTOR OIL 40  (5L)', '4', 'Étiquette', '8500');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette NEPTUNA 2T SUPER SPORT (1L)', '4', 'Étiquette', '8000');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette NEPTUNA 2T SUPER SPORT (2L)', '4', 'Étiquette', '4000');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette QUARTZ 2500 SAE 40 (1L)', '4', 'Étiquette', '0');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette QUARTZ 2500 SAE 40 (4L)', '4', 'Étiquette', '0');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette QUARTZ 5000 20W50 (1L)', '4', 'Étiquette', '0');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette QUARTZ 5000 20W50 (4L)', '4', 'Étiquette', '0');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette QUARTZ 5000 20W50 (5L)', '4', 'Étiquette', '9500');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette RUBIA S 40 (1L)', '4', 'Étiquette', '0');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette RUBIA S 40 (4L)', '4', 'Étiquette', '12500');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette RUBIA S 40 (5L)', '4', 'Étiquette', '2500');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette RUBIA 4400 15W40  (1L)', '4', 'Étiquette', '36000');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette RUBIA 4400 15W40  (5L)', '4', 'Étiquette', '15500');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette TRANSMISSION TM 80W90 (2L)', '4', 'Étiquette', '4300');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette SPECIALE PIROGUE (1L)', '4', 'Étiquette', '17000');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette SPECIALE PIROGUE (2L)', '4', 'Étiquette', '6000');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('ETIQUETTES BANALISEES FUTS', '4', 'Étiquette', '0');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('ETIQUETTES BANALISEES FUTS', '4', 'Étiquette', '0');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette PREMIUM 40 (1L) RECTO', '6', 'Étiquette', '30000');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette PREMIUM 40 (1L) VERSO', '6', 'Étiquette', '30000');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette PREMIUM 40 (5 L)  RECTO', '6', 'Étiquette', '13300');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette PREMIUM 40 (5 L)  VERSO', '6', 'Étiquette', '12100');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette DIESELUBE 600 SUPER 15W40 (1L) R', '6', 'Étiquette', '11000');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette DIESELUBE 600 SUPER 15W40 (1L) V', '6', 'Étiquette', '11000');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette DIESELUBE 600 SUPER 15W40 (5L) R', '6', 'Étiquette', '9200');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette DIESELUBE 600 SUPER 15W40 (5L) V', '6', 'Étiquette', '9200');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette SUPER OUTBOARD TC-W3 (1L) R', '6', 'Étiquette', '2000');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette SUPER OUTBOARD TC-W3 (1L) V', '6', 'Étiquette', '2000');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette SUPER OUTBOARD TC-W3 (5L) R', '6', 'Étiquette', '4200');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette SUPER OUTBOARD TC-W3 (5L) V', '6', 'Étiquette', '4300');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette XTREME 15W-40 (1L) RECTO', '6', 'Étiquette', '10000');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette XTREME 15W-40 (1L) VERSO', '6', 'Étiquette', '10000');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette XTREME 15W-40 (5L) R', '6', 'Étiquette', '9000');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette XTREME 15W-40 (5L) V', '6', 'Étiquette', '9000');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette TWO STROKE SUPER (1L) RECTO', '6', 'Étiquette', '2000');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette TWO STROKE SUPER (1L) VERSO', '6', 'Étiquette', '2000');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette PROTECTA HI-MILEAGE 20W50 (1L) R', '6', 'Étiquette', '23900');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette PROTECTA HI-MILEAGE 20W50 (1L) V', '6', 'Étiquette', '23900');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette PROTECTA HI-MILEAGE 20W50 (5L) R', '6', 'Étiquette', '14000');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette PROTECTA HI-MILEAGE 20W50 (5L) V', '6', 'Étiquette', '14000');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette PROTECTA HI-MILEAGER (5L) V', '6', 'Étiquette', '0');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette PROTECTA HI-MILEAGER (5L) V', '6', 'Étiquette', '0');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette PROTECTA HI-MILEAGER (5L) V', '6', 'Étiquette', '0');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette PROTECTA HI-MILEAGER (5L) V', '6', 'Étiquette', '0');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette PROTECTA HI-MILEAGER (5L) V', '6', 'Étiquette', '0');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette PROTECTA HI-MILEAGER (5L) V', '6', 'Étiquette', '0');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette PROTECTA HI-MILEAGER (5L) V', '6', 'Étiquette', '0');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette PROTECTA HI-MILEAGER (5L) V', '6', 'Étiquette', '0');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette PROTECTA HI-MILEAGER (5L) V', '6', 'Étiquette', '0');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette PROTECTA HI-MILEAGER (5L) V', '6', 'Étiquette', '0');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette PROTECTA HI-MILEAGER (5L) V', '6', 'Étiquette', '0');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette GEARLUBE EP 80W90 (1L) R', '6', 'Étiquette', '3000');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette GEARLUBE EP 80W90 (1L) V', '6', 'Étiquette', '3000');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette ACCEL XL 10 20W50 1L RECTO', '2', 'Étiquette', '8500');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette ACCEL XL 10 20W50 1L VERSO', '2', 'Étiquette', '8500');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette ACCEL XL 10 20W50 5L RECTO', '2', 'Étiquette', '300');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette ACCEL XL 10 20W50 5L VERSO', '2', 'Étiquette', '300');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette DEOMAX DM 5 SAE 40 1L RECTO', '2', 'Étiquette', '3200');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette DEOMAX DM 5 SAE 40 1L VERSO', '2', 'Étiquette', '3200');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette DEOMAX DM 5 SAE 40 5L RECTO', '2', 'Étiquette', '10000');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette DEOMAX DM 5 SAE 40 5L VERSO', '2', 'Étiquette', '10000');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette DEOMAX DM 12 15W40 1L RECTO', '2', 'Étiquette', '8300');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette DEOMAX DM 12 15W40 1L VERSO', '2', 'Étiquette', '8300');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette DEOMAX DM 12 15W40 5L RECTO', '2', 'Étiquette', '500');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette DEOMAX DM 12 15W40 5L VERSO', '2', 'Étiquette', '500');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette GEAROIL 80W90 1L RECTO', '2', 'Étiquette', '0');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette GEAROIL 80W90 1L VERSO', '2', 'Étiquette', '0');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette QUEST 2 TEMPS 1L RECTO', '2', 'Étiquette', '1200');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette QUEST 2 TEMPS 1L VERSO', '2', 'Étiquette', '1200');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette GEAROIL XHD 80W90 1L RECTO', '2', 'Étiquette', '3500');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette GEAR OIL XHD 80W90 1L VERSO', '2', 'Étiquette', '3500');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette  SAFARI OIL 40 1L  RECTO', '2', 'Étiquette', '10000');
INSERT INTO produit_bases
    (nom,fournisseur_id,type,quantité)
VALUES
    ('Étiquette  SAFARI OIL 40 4L  RECTO', '2', 'Étiquette', '13000');
