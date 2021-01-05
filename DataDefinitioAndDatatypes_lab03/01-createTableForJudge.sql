USE `gamebar`;
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
  
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
  
  DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));