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

INSERT INTO produit_bases (id,nom, type, fournisseur_id, cump, quantité, valeur)
VALUES  (1, '150 NS', 'Huile Base', NULL, NULL, 0, NULL),
		(2, '600 NS', 'Huile Base', NULL, NULL, 0, NULL);

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

