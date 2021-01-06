SELECT * FROM minions.minions;

ALTER TABLE `minions`
ADD COLUMN `town_id` INT,
ADD CONSTRAINT fk_minions_towns
FOREIGN KEY (`town_id`)
REFERENCES `towns`(`id`);


-- 03 Task from Judge - Insert Records in Both Tables

INSERT INTO `towns`(`id`, `name`)
VALUES
(1, 'Sofia'), (2, 'Plovdiv'), (3, 'Varna');
INSERT INTO `minions`(`id`, `name`, `age`, `town_id`)
VALUES
(1, 'Kevin', 22, 1),
(2, 'Bob', 15, 3),
(3, 'Kevin', NULL, 2);

-- 04 TURNICATE

TRUNCATE `minions`;

-- 05

DROP TABLE `minions`;
DROP TABLE `towns`;


