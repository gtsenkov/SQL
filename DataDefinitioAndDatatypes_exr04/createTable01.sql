CREATE DATABASE `minions`;
USE `minions`;

CREATE TABLE `minions` (
		`id` INT PRIMARY KEY AUTO_INCREMENT,
        `name` VARCHAR(45) NOT NULL,
        `age` INT 
);

CREATE TABLE `towns` (
	`town_id` INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(20) NOT NULL
);


INSERT INTO `minions`(`id`, `name`, `age`)
VALUES
(1, 'Ivan', 20),
(2, 'Iva', NULL);

SELECT * FROM minions
