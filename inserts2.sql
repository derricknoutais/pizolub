INSERT INTO fournisseurs
	(id,nom)
VALUES
	(1, 'ENGEN S.A.'),
	(2, 'INDEPENDANT/ORONITE'),
	(3, 'LIBYA OIL '),
	(4, 'MOBIL'),
	(5, 'PETRO GABON'),
	(6, 'SHELL'),
	(7, 'TOTAL'),
	(8, 'TOTAL LUBS');

INSERT INTO clients
	(id,nom)
VALUES
	(1, 'ENGEN'),
	(2, 'OILIBYA'),
	(3, 'PETRO GABON'),
	(4, 'TOTAL'),
	(5, 'PIZO');

INSERT INTO `produit_bases` (`id`,`nom`, `type`, `fournisseur_id`, `cump`, `quantité`, `valeur`)
VALUES(1, '150 NS', 'Huile Base', NULL, NULL, 0, NULL),
(2, '600 NS', 'Huile Base', NULL, NULL, 0, NULL),
(3, '500 NS', 'Huile Base', NULL, NULL, 0, NULL),
(4, 'BS 150 HVI ', 'Huile Base', NULL, NULL, 0, NULL),
(5, 'CHEVRON NEUTRAL 100R', 'Huile Base', NULL, NULL, 0, NULL),
(6, 'CHEVRON NEUTRAL 220R', 'Huile Base', NULL, NULL, 0, NULL),
(7, 'CHEVRON NEUTRAL 600R', 'Huile Base', NULL, NULL, 0, NULL),
(8, 'YUBASE 4', 'Huile Base', NULL, NULL, 0, NULL),
(9, 'POWER OIL TO 1020', 'Huile Base', NULL, NULL, 0, NULL);

INSERT INTO produit_bases (id,nom, type, fournisseur_id, cump, quantité, valeur)
VALUES  (3,'STOCK 1007(BLUE DYE)','Additif',1,NULL,NULL,NULL),
		(4,'STOCK 12156','Additif',1,NULL,NULL,NULL);


INSERT INTO produit_finis
	(nom,conditionnement,poids_emballage,client_id)
VALUES
	('ENGEN DIESEL 600 SUPER 15W40', 'C24X1L', '21.6', '1');
INSERT INTO produit_finis
	(nom,conditionnement,poids_emballage,client_id)
VALUES
	('ENGEN DIESEL 600 SUPER 15W40', 'C4X5L', '18', '1');

INSERT INTO `users` (`id`,`name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES (1, 'Derrick Noutais', 'derricknoutais@gmail.com', '$2y$10$T/IWuUhbzcj2schYM6.e0u.FnEuY9Fbs.cuGIBucDVbKpE1weHe96', NULL, '2018-09-21 23:18:53', '2018-09-21 23:18:53');
