CREATE TABLE `ljul_articulos_tango_exp` (
  `id_art` int NOT NULL AUTO_INCREMENT,
  `SKUCode` varchar(100) NOT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `talle` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `peso` int NOT NULL DEFAULT '0',
  `marca` varchar(255) DEFAULT NULL,
  `Description` varchar(500) NOT NULL,
  `AdditionalDescription` varchar(250) DEFAULT NULL,
  `familia` varchar(250) DEFAULT NULL,
  `BarCode` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_art`)
) ENGINE=InnoDB AUTO_INCREMENT=57366 DEFAULT CHARSET=utf8;
