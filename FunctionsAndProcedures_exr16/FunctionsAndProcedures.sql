#02

DELIMITER $$
CREATE PROCEDURE usp_get_employees_salary_above_(min_salary DECIMAL(19,4))
BEGIN
	SELECT first_name, last_name
	FROM employees
	WHERE salary >= min_salary
	ORDER BY first_name, last_name, employee_id;
END $$
DELIMITER ;

CALL usp_get_employees_salary_above_(45000);


#03

DELIMITER $$
CREATE PROCEDURE usp_get_towns_starting_with(start_str VARCHAR(20))
SELECT `name`
FROM towns
WHERE `name` LIKE concat(start_str, '%')
ORDER BY `name`;
BEGIN
END $$

CALL usp_get_towns_starting_with('b');

#05

DELIMITER $$
CREATE FUNCTION ufn_get_salary_level(e_salary DECIMAL)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
	RETURN (CASE
				WHEN e_salary < 30000 THEN 'Low'
				WHEN e_salary BETWEEN 30000 AND 50000 THEN 'Average'
				WHEN e_salary > 50000 THEN 'High'
			END
    );
END $$
DELIMITER ;

SELECT ufn_get_salary_level(51000);

#06

DELIMITER $$
CREATE PROCEDURE usp_get_employees_by_salary_level(s_level VARCHAR(10))
BEGIN
	SELECT first_name, last_name
	FROM employees
	WHERE ufn_get_salary_level(salary) = s_level
	ORDER BY first_name DESC, last_name DESC;
END $$

CALL usp_get_employees_by_salary_level('high')












