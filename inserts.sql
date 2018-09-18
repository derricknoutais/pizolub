


# Dump of table fournisseurs
# ------------------------------------------------------------

LOCK TABLES `fournisseurs` WRITE;
/*!40000 ALTER TABLE `fournisseurs` DISABLE KEYS */;

INSERT INTO `fournisseurs` (`id`, `nom`)
VALUES
    (1,'ENGEN S.A.'),
    (2,'INDEPENDANT/ORONITE'),
    (3,'LIBYA OIL '),
    (4,'MOBIL'),
    (5,'PETRO GABON'),
    (6,'SHELL'),
    (7,'TOTAL'),
    (8,'TOTAL LUBS');

/*!40000 ALTER TABLE `fournisseurs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table produit_bases
# ------------------------------------------------------------

LOCK TABLES `produit_bases` WRITE;
/*!40000 ALTER TABLE `produit_bases` DISABLE KEYS */;
INSERT INTO `produit_bases` (`id`,`nom`, `type`, `fournisseur_id`, `cump`, `quantité`, `valeur`)
VALUES
(110, '150 NS', 'Huile Base', NULL, NULL, 0, NULL),
(111, '600 NS', 'Huile Base', NULL, NULL, 0, NULL),
(112, 'BSS', 'Huile Base', NULL, NULL, 0, NULL),
(113, '500 NS', 'Huile Base', NULL, NULL, 0, NULL),
(114, 'CORE 150', 'Huile Base', NULL, NULL, 0, NULL),
(115, 'CORE 600 ', 'Huile Base', NULL, NULL, 0, NULL),
(116, 'CORE 2500', 'Huile Base', NULL, NULL, 0, NULL),
(117, '100 NS', 'Huile Base', NULL, NULL, 0, NULL),
(118, '85 NS', 'Huile Base', NULL, NULL, 0, NULL),
(119, 'PETROLE', 'Huile Base', NULL, NULL, 0, NULL);

INSERT INTO `produit_bases` (`id`, `nom`, `type`, `fournisseur_id`, `cump`, `quantité`, `valeur`)
VALUES
    (2,'STOCK 1007
(BLUE DYE)','Additif',1,NULL,NULL,NULL),
    (3,'STOCK 12156','Additif',1,NULL,NULL,NULL),
    (4,'STOCK 13873','Additif',1,NULL,NULL,NULL),
    (5,'STOCK 15429
(POWER OIL TO 1020)','Additif',1,NULL,NULL,NULL),
    (6,'STOCK 15630','Additif',1,NULL,NULL,NULL),
    (7,'STOCK 15937','Additif',1,NULL,NULL,NULL),
    (8,'STOCK 17149','Additif',1,NULL,NULL,NULL),
    (9,'STOCK 17722','Additif',1,NULL,NULL,NULL),
    (10,'STOCK 18350','Additif',1,NULL,NULL,NULL),
    (11,'STOCK 18351','Additif',1,NULL,NULL,NULL),
    (12,'STOCK 18356','Additif',1,NULL,NULL,NULL),
    (13,'STOCK 19625','Additif',1,NULL,NULL,NULL),
    (14,'STOCK 7082','Additif',1,NULL,NULL,NULL),
    (15,'STOCK 7485
(CG1002)','Additif',1,NULL,NULL,NULL),
    (16,'STOCK 823','Additif',1,NULL,NULL,NULL),
    (17,'STOCK 8527','Additif',1,NULL,NULL,NULL),
    (18,'STOCK 8684','Additif',1,NULL,NULL,NULL),
    (19,'STOCK 943','Additif',1,NULL,NULL,NULL),
    (20,'OLOA 19803','Additif',2,NULL,NULL,NULL),
    (21,'OLOA 26008 A','Additif',2,NULL,NULL,NULL),
    (22,'OLOA 340 R','Additif',2,NULL,NULL,NULL),
    (23,'OLOA 4594 R','Additif',2,NULL,NULL,NULL),
    (24,'OLOA 48021','Additif',2,NULL,NULL,NULL),
    (25,'OLOA 50704','Additif',2,NULL,NULL,NULL),
    (26,'OLOA 59762','Additif',2,NULL,NULL,NULL),
    (27,'OLOA 59766','Additif',2,NULL,NULL,NULL),
    (28,'OLOA 59770','Additif',2,NULL,NULL,NULL),
    (29,'OLOA 9362','Additif',2,NULL,NULL,NULL),
    (30,'OLOA 9790 F','Additif',2,NULL,NULL,NULL),
    (31,'PARATONE 8006','Additif',2,NULL,NULL,NULL),
    (32,'ADDITIN RC 9207','Additif',3,NULL,NULL,NULL),
    (33,'EXXSOL D 80','Additif',3,NULL,NULL,NULL),
    (34,'HITEC 2235
(OLCN 2346)','Additif',3,NULL,NULL,NULL),
    (35,'INFINEUM D 2321','Additif',3,NULL,NULL,NULL),
    (36,'LUBRIZOL 5060','Additif',3,NULL,NULL,NULL),
    (37,'LUBRIZOL 5304','Additif',3,NULL,NULL,NULL),
    (38,'OLCN 2244','Additif',3,NULL,NULL,NULL),
    (39,'OLCN 2254','Additif',3,NULL,NULL,NULL),
    (40,'OLCN 2255','Additif',3,NULL,NULL,NULL),
    (41,'OLCN 2296
(BOOSTER 1)','Additif',3,NULL,NULL,NULL),
    (42,'OLCN 2297
(PACK 1)','Additif',3,NULL,NULL,NULL),
    (43,'OLCN 2301
(VM)','Additif',3,NULL,NULL,NULL),
    (44,'OLCN 2307','Additif',3,NULL,NULL,NULL),
    (45,'OLCN 2360','Additif',3,NULL,NULL,NULL),
    (46,'OLCN2306
(LUBRIZOL  16008)','Additif',3,NULL,NULL,NULL),
    (47,'OLCN 2271
(LUBRIZOL  9220)','Additif',3,NULL,NULL,NULL),
    (48,'OLCN 2311
(LUBRIZOL 9692A)','Additif',3,NULL,NULL,NULL),
    (49,'OLCN 2267
(LUBRIZOL 1045)','Additif',3,NULL,NULL,NULL),
    (50,'OLCN2262
(LUBRIZOL 424 R)','Additif',3,NULL,NULL,NULL),
    (51,'OLCN 2248
(LUBRIZOL 5703)','Additif',3,NULL,NULL,NULL),
    (52,'OLCN 2243
(LUBRIZOL 7749B)','Additif',3,NULL,NULL,NULL),
    (53,'SHELL CHEMICALS','Additif',4,NULL,NULL,NULL),
    (54,'STOCK 1185,5','Additif',4,NULL,NULL,NULL),
    (55,'ANGLAMOL 6085','Additif',5,NULL,NULL,NULL),
    (56,'LUBRIZOL 1047U','Additif',5,NULL,NULL,NULL),
    (57,'LUBRIZOL 16010','Additif',5,NULL,NULL,NULL),
    (58,'LUBRIZOL 424R','Additif',5,NULL,NULL,NULL),
    (59,'LUBRIZOL 4980A','Additif',5,NULL,NULL,NULL),
    (60,'LUBRIZOL 5703','Additif',5,NULL,NULL,NULL),
    (61,'LUBRIZOL 7077','Additif',5,NULL,NULL,NULL),
    (62,'LUBRIZOL 8686','Additif',5,NULL,NULL,NULL),
    (63,'LUBRIZOL 8900','Additif',5,NULL,NULL,NULL),
    (64,'GR 77','Additif',6,NULL,NULL,NULL),
    (65,'LUBAD 1431','Additif',6,NULL,NULL,NULL),
    (66,'LUBAD 444','Additif',6,NULL,NULL,NULL),
    (67,'LUBAD J
(ETHANOX 4710)','Additif',6,NULL,NULL,NULL),
    (68,'A022929','Additif',7,NULL,NULL,NULL),
    (69,'A 122121','Additif',7,NULL,NULL,NULL),
    (70,'A 126666','Additif',7,NULL,NULL,NULL),
    (71,'A114747
( Cubitainer)','Additif',7,NULL,NULL,NULL),
    (72,'B023333','Additif',7,NULL,NULL,NULL),
    (73,'B025959','Additif',7,NULL,NULL,NULL),
    (74,'B108080','Additif',7,NULL,NULL,NULL),
    (75,'B131717','Additif',7,NULL,NULL,NULL),
    (76,'B20909','Additif',7,NULL,NULL,NULL),
    (77,'C026666 ','Additif',7,NULL,NULL,NULL),
    (78,'C107676','Additif',7,NULL,NULL,NULL),
    (79,'C111010','Additif',7,NULL,NULL,NULL),
    (80,'C111616','Additif',7,NULL,NULL,NULL),
    (81,'C114444','Additif',7,NULL,NULL,NULL),
    (82,'CONCENTRE PNEUMA L 3783','Additif',7,NULL,NULL,NULL),
    (83,'D037979','Additif',7,NULL,NULL,NULL),
    (84,'D101414','Additif',7,NULL,NULL,NULL),
    (85,'D101616','Additif',7,NULL,NULL,NULL),
    (86,'D105555','Additif',7,NULL,NULL,NULL),
    (87,'D117373','Additif',7,NULL,NULL,NULL),
    (88,'D57575','Additif',7,NULL,NULL,NULL),
    (89,'D79090  ','Additif',7,NULL,NULL,NULL),
    (90,'ETHANOX 4701','Additif',7,NULL,NULL,NULL),
    (91,'HYDROLSEAL G23H','Additif',7,NULL,NULL,NULL),
    (92,'IRGANOX L135','Additif',7,NULL,NULL,NULL),
    (93,'L033838','Additif',7,NULL,NULL,NULL),
    (94,'MF 1273','Additif',7,NULL,NULL,NULL),
    (95,'SOL ANTIMOUSSE AZ','Additif',7,NULL,NULL,NULL),
    (96,'X121717 ','Additif',7,NULL,NULL,NULL),
    (97,'X131111','Additif',7,NULL,NULL,NULL),
    (98,'AUTOMATE BLUE 8G','Additif',7,NULL,NULL,NULL),
    (99,'A 109191','Additif',8,NULL,NULL,NULL),
    (100,'DISOPAC','Additif',8,NULL,NULL,NULL),
    (101,'DISOPAC DD','Additif',8,NULL,NULL,NULL),
    (102,'HYPAC','Additif',8,NULL,NULL,NULL),
    (103,'L104848','Additif',8,NULL,NULL,NULL),
    (104,'MAR 427 R','Additif',8,NULL,NULL,NULL),
    (105,'MAR 489 S','Additif',8,NULL,NULL,NULL),
    (106,'MAR 501 S','Additif',8,NULL,NULL,NULL),
    (107,'MAR 502 S','Additif',8,NULL,NULL,NULL),
    (108,'MAR 515 U','Additif',8,NULL,NULL,NULL),
    (109,'TALUPAC B','Additif',8,NULL,NULL,NULL);

/*!40000 ALTER TABLE `produit_bases` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` (`id`, `nom`)
VALUES
    (1, 'ENGEN'),
    (2, 'OILIBYA'),
    (3, 'PETRO GABON'),
    (4, 'TOTAL'),
    (5, 'PIZO');

/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;


INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN DIESEL 600 SUPER 15W40','C24X1L','21.6','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN DIESEL 600 SUPER 15W40','C4X5L','18','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN DIESEL 600 SUPER 15W40','C4X5L','18','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN DIESEL 600 SUPER 15W40','FUTS','185','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN DIESEL 500 SUPER 15W40','FUTS','185','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN XTREME 15W40','C24X1L','21.6','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN XTREME 15W40','C4X5L','18','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN XTREME 15W40','FUTS','185','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN SUPER 20W50','C24X1L','21.6','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN SUPER 20W50','C6X4L','21.6','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN SUPER 20W50','FUTS','185','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN PROTECTA HI-MILEAGE 20W50','C24X1L','21.6','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN PROTECTA HI-MILEAGE 20W50','C6X4L','21.6','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN PROTECTA HI-MILEAGE 20W50','C4X5L','18','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN PROTECTA HI-MILEAGE 20W50','FUTS','185','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN PREMIUM MOTOR OIL 40','C24X1L','21.6','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN PREMIUM MOTOR OIL 40','C4X5L','18','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN PREMIUM MOTOR OIL 40','FUTS','185','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN DIESELUBE 540','FUTS','185','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN DIESELUBE 530','FUTS','185','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN DIESELUBE 510','FUTS','180','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN AGRIFLUID ','FUTS','180','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ATF 22D','FUTS','180','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('GEARLUBE HP 80W-A','FUTS','185','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('GEARLUBE HP 80W90','FUTS','185','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('GEARLUBE EP 80W90','C24X1L','21.6','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('GEARLUBE EP 80W90','FUTS','185','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('GEARLUBE EP 85W140','FUTS','185','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN TRANSFLUID TO-4 SAE 50','FUTS','185','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN SUPER OUTBOARD TC-W3','C24X1L','21.6','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN SUPER OUTBOARD TC-W3','C4X5L','21.6','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN SUPER OUTBOARD TC-W3','C6X4L','21.6','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN SUPER OUTBOARD TC-W3','FUTS','180','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN TWO STROKE SELFMIX','C24X1L','21.6','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN TWO STROKE SELFMIX','FUTS','180','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN TWO STROKE SUPER','C24X1L','21.6','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN TWO STROKE SUPER','FUTS','180','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN TQH 10/46','FUTS','180','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN TQH 10/68','FUTS','185','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN TQH 20/32','FUTS','180','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN TQH 20/46','FUTS','180','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN TQH 20/68','FUTS','185','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ENGEN TQH 20/100','FUTS','185','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('GENGEAR 68','FUTS','185','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('GENGEAR 100','FUTS','185','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('GENGEAR 150','FUTS','185','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('GENGEAR 220','FUTS','185','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('GENGEAR 320','FUTS','185','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('GENGEAR 460','FUTS','185','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('GENGEAR 680','FUTS','185','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('GENGEAR 1000','FUTS','185','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('GENCYL 460','FUTS','185','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('PETRONAS GEO S 40','FUTS','185','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('HUILE DECLASSEE','FUTS','180','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('POWEROIL TO 1020','FUTS','180','1');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ACCEL ULTRA 20W50','FUTS','185','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ACCEL ULTRA 20W50','C24X1L','21.6','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ACCEL ULTRA 20W50','C6X4L','21.6','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ACCEL XL10  20W50','C12X1L','10.8','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ACCEL XL10  20W50','C4X5L','18','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('DEOMAX HD 10W','FUTS','180','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('DEOMAX HD 30','FUTS','185','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('DEOMAX DM5 SAE 40','FUTS','185','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('DEOMAX HD 40','C24X1L','21.6','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('DEOMAX HD 40','C6X4L','21.6','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('DEOMAX HD 50','FUTS','185','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('DEOMAX DM12 15W40','FUTS','185','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('DEOMAX SHP 15W40','C24X1L','21.6','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('DEOMAX SHP 15W40','C6X4L','21.6','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('DEOMAX DM 5 SAE 40','C12X1L','18','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('DEOMAX DM 5 SAE 40','C4X5L','21.6','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('DEOMAX DM 12 15W40','C12X1L','10.8','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('DEOMAX DM 12 15W40','C4X5L','21.6','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('DIESEL SAFARI OIL 40','FUTS','185','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('DIESEL SAFARI OIL 40','VRAC','1','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('GEAR OIL HD  80W90   GL-4','FUTS','185','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('GEAR OIL 80W90          GL-5','C24X1L','21.6','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('GEAR OIL XHD  80W90   ','C12X1L','10.8','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('GEAR OIL XHD  80W90   ','FUTS','185','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('GEAR OIL 85W140','FUTS','185','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('GEAR OIL XHD 85W140','FUTS','185','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('HP 300A MOTOR OIL 40','C6X4L','21.6','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('HYDROL HTE 32','FUTS','180','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('HYDROL 46','FUTS','180','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('HYDROL 68','FUTS','185','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('HYDROL 100','FUTS','185','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('MARINEGARD 312','FUTS','185','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('MARINEGARD 412','FUTS','185','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('MARINEGARD 570','FUTS','185','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('QUEST 2T','FUTS','180','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('QUEST 2T','C12X1L','10.8','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('RED FLUSH OIL','FUTS','180','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('THERMIC OIL','FUTS','180','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TORQGEAR XP 68','FUTS','185','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TORQGEAR XP 100','FUTS','185','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TORQGEAR XP 150','FUTS','185','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TORQGEAR XP 220','FUTS','185','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TORQGEAR XP 320','FUTS','185','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TORQGEAR XP 460','FUTS','185','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TRANS FD 50','FUTS','185','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('SAFARI OIL 40','C24X1L','21.6','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('SAFARI OIL 40','C6X4L','21.6','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('SAFARI OIL 40','FUTS','185','2');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('HUILE DECLASSEE','Fûts','180','3');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('PETRO  MOTEUR 10W','Futs','180','3');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('PETRO OKAN DRIVER 40','Fûts','185','3');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('PETRO MOTEUR 50','Fûts','185','3');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('PETRO DIESEL 15W40','Fûts','185','3');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('PETRO  DIESEL SUPER 15W40','Fûts','185','3');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('PETRO HYDRAULIQUE 32','Futs','180','3');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('PETRO HYDRAULIQUE 46','Futs','180','3');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('PETRO HYDRAULIQUE 68','Fûts','185','3');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('PETRO HYDRAULIQUE 100','Fûts','185','3');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('PETRO TRANSMISSION 80W90','Fûts','185','3');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('PETRO TRANSMISSION 85W140','Fûts','185','3');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('HUILE THERMIQUE','Futs','180','3');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('PETRO ENGRENAGE 150','Futs','185','3');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('PETRO ENGRENAGE 220','Futs','185','3');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('PETRO ENGRENAGE 320','Futs','185','3');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('PETRO ENGRENAGE 460','Futs','185','3');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('PETRO OKAN OUTBOARD 2T','Futs','180','3');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('PIZO ATF 22D','Futs','185','5');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('PIZO 15W40 CI-4','Futs','185','5');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('PIZO HYDRAULIQUE 68 HM','Futs','180','5');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('PIZO TRANSMISSION 80W90 GL-5','Futs','180','5');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('PIZO TRANSMISSION 85W140 GL-5','Futs','185','5');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('PIZO MOTEUR 10W','Futs','180','5');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('PIZO HUILE DE CHAINE','Futs','180','5');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('PIZO ENGRENAGES 460','Futs','185','5');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('SIVVA SAE 40','C4*5L','18','5');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('SIVVA SAE 40','Futs','185','5');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('ATF DEXRON II','Futs','180','5');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('PIZO 2T TCW','Futs','180','5');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('PIZO MOTEUR DIESEL 15W40','Futs','185','5');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('APC MOTEUR DIESEL 15W40','Futs','185','5');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL 2 TEMPS Z','C122T','21.6','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  2  TEMPS Z','FUTS','180','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL ATF 22 D','FUTS','180','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  AZOLLA  ZS  22','FUTS','180','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  AZOLLA  ZS  32','FUTS','180','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  AZOLLA  ZS  46','FUTS','180','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  AZOLLA  ZS  68','B20L','18','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  AZOLLA  ZS  68','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  AZOLLA  ZS  100','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  AZOLLA  ZS  150','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  CARTER EP 68','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  CARTER EP 100','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  CARTER EP 150','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  CARTER EP 220','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  CARTER EP 320','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  CARTER EP 460','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  CARTER  EP  680','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  CARTER  EP  1000','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  CARTER  EP  3000','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  FLUID II D','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL DYNATRANS AC 30','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL DYNATRANS AC 50','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL DYNATRANS AC 50','VRAC','1','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  EP  80W85','FUTS','180','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  EP  80W90','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  EPB  85W90','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  EQUIVIS ZS 32','FUTS','180','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  EQUIVIS  ZS  46','FUTS','180','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  EQUIVIS  ZS  68','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  EQUIVIS  ZS  100','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL MOTOR OIL SAE 40','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL MOTOR OIL SAE 40','C20X1L','18','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL MOTOR OIL SAE 40','C6X5L','27','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL MOTOR OIL SAE 40','VRAC','900','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL NATERIA MH 40','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL NATERIA V 40','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL NEPTUNA SUPER 2T SPORT','C20X1L','18','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL NEPTUNA SUPER 2T SPORT','C12X2L','21.6','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL NEPTUNA SUPER 2T SPORT','FUTS','180','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL PNEUMA 100','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  QUARTZ  5000  SAE  20W50','C20X1L','18','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  QUARTZ  5000  SAE  20W50','C6X5L','27','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  QUARTZ  5000  SAE  20W50','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  RUBIA  G13  ','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  RUBIA  S  10W','FUTS','180','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  RUBIA  S  10W','VRAC','4400','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  RUBIA  S  30','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  RUBIA  S  40','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  RUBIA  S  40','C20X1L','18','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  RUBIA  S  40','C6X5L','27','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  RUBIA  S  50','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  RUBIA  4400 15W40','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  RUBIA  4400 15W40','C20X1L','18','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  RUBIA  4400 15W40','C6X5L','27','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  RUBIA  TIR  7400  15W40','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  RUBIA FLEET HD 300  15W40','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  SERIOLA  1510','FUTS','180','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  SERIOLA  1510','VRAC','0','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  SERIOLA ETA 100','FUTS','180','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  SPECIALE PIROGUE','C20X1L','18','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  SPECIALE PIROGUE','C12X2L','21.6','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  SPECIALE PIROGUE','FUTS','180','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  SPECIALE CHAINE','FUTS','180','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  TOTALSOL','FUTS','170','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  TRANSMIS. TM  80W90','C12X2L','21.6','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  TRANSMIS. TM  80W90','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  TRANSMIS. TM  85W90','FUTS','185','4');
INSERT INTO produit_finis (nom,conditionnement,poids_emballage,client_id) VALUES ('TOTAL  TRANSMIS. TM  85W140','FUTS','185','4');