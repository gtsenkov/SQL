#01

SELECT `first_name`, `last_name` FROM `employees`
WHERE LEFT(`first_name`, 2) = 'Sa'
ORDER BY `employee_id`;
-- SELECT `first_name`, `last_name` FROM `employees`
-- WHERE substring(`first_name`,1, 2) = 'Sa'
-- ORDER BY `employee_id`;

#02

SELECT `first_name`, `last_name` FROM `employees`
WHERE `last_name` LIKE '%ei%'
ORDER BY `employee_id`;

#03

SELECT `first_name` FROM `employees`
WHERE `department_id` IN (3, 10) #`deparment_id` = 3 OR `deparment_id` = 10
AND YEAR(`hire_date`) BETWEEN 1995 AND 2005
ORDER BY `employee_id`;

#04

SELECT `first_name`, `last_name` FROM `employees`
WHERE `job_title` NOT LIKE '%engineer%'
ORDER BY `employee_id`;

#05

SELECT `name` FROM `towns`
WHERE CHAR_LENGTH(`name`) IN (5,6)
# WHERE CHAR_LENGTH(`name`) >= 5 AND CHAR_LENGTH(`name`)<= 6
# WHERE CHAR_LENGTH(`name`) BETWEEN 5 AND 6
ORDER BY `name`;

#06

SELECT * FROM `towns`
WHERE LEFT(`name`, 1) IN ('M', 'K', 'B', 'E')
# WHERE SUBSTRING(`name`, 1, 1)  IN ('M', 'K', 'B', 'E')
ORDER BY `name`;

#07

SELECT * FROM `towns`
WHERE LEFT(`name`, 1) NOT IN ('R', 'B', 'D')
ORDER BY `name`; 

#08

CREATE VIEW v_employees_hired_after_2000 AS
SELECT `first_name`, `last_name` FROM `employees`
WHERE YEAR(`hire_date`) > 2000;

SELECT * FROM v_employees_hired_after_2000;

#09

SELECT `first_name`, `last_name` FROM `employees`
WHERE CHAR_LENGTH(`last_name`) = 5;

#10

SELECT `country_name`, `iso_code` FROM `countries`
WHERE `country_name` LIKE '%A%A%A%'
ORDER BY `iso_code`;

#11

SELECT p.`peak_name`, r.`river_name`,
LOWER(CONCAT(`peak_name`, SUBSTRING(`river_name`, 2))) AS 'mix'
FROM `peaks` AS p, `rivers` AS r
WHERE RIGHT(`peak_name`, 1) = LEFT(`river_name`, 1)
ORDER BY `mix`;

#13

SELECT `user_name`, 
SUBSTRING(`email`, LOCATE('@', `email`) + 1) AS 'provider'
 FROM `users`
 ORDER BY `provider`, `user_name`;
 
 SELECT * FROM `games`;
 
 SELECT `name`, 
 (CASE
	WHEN HOUR(`start`) BETWEEN 0 AND 11 THEN 'Morning'
	WHEN HOUR(`start`) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'  
	END
 ) AS 'Part of the Day',
 (
 CASE
	WHEN `duration` BETWEEN 0 AND 3 THEN 'Extra Short'
	WHEN `duration` BETWEEN 4 AND 6 THEN 'Short'
	WHEN `duration` BETWEEN 7 AND 10 THEN 'Long'
    ELSE 'Extra long'
 END
 ) AS 'Duration'
 FROM `games`;











 