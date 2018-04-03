CREATE TABLE `reboot_live`.`notizie` (
  `id_notizia` INT(11) NOT NULL AUTO_INCREMENT,
  `tipo_notizia` VARCHAR(255) NOT NULL,
  `autore_notizia` VARCHAR(255) NOT NULL,
  `data_pubblicazione_notizia` DATETIME NOT NULL,
  `data_ig_notizia` VARCHAR(255) NOT NULL DEFAULT 271,
  `testo_notizia` TEXT(255) NOT NULL,
  PRIMARY KEY (`id_notizia`));
