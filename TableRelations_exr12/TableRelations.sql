#01

CREATE TABLE `passports`(
	`passport_id` INT PRIMARY KEY AUTO_INCREMENT,
    `passport_number` VARCHAR(20) UNIQUE
    );
    
CREATE TABLE `people`(
    `person_id` INT PRIMARY KEY AUTO_INCREMENT,
	`first_name` VARCHAR(20) NOT NULL,
    `salary` DECIMAL(10,2),
    `passport_id` INT UNIQUE,
    
    CONSTRAINT fk_people_passports
    FOREIGN KEY (`passport_id`)
    REFERENCES `passports`(`passport_id`)
    );
    
    INSERT INTO passports
    VALUES
    (101, 'N34FG21B'),
    (102, 'K65LO4R7'),
    (103, 'ZE657QP2');
    
    INSERT INTO `people` (`first_name`, `salary`, `passport_id`)
    VALUES
    ('Roberto', 43300.00, 102),
    ('Tom', 56100.00, 103),
    ('Yana', 60200.00, 101);
    
    #02
    
    CREATE TABLE `manufacturers`(
		`manufacturer_id` INT PRIMARY KEY AUTO_INCREMENT,
        `name` VARCHAR(20) NOT NULL,
        `established_on` DATE
        );
        
	CREATE TABLE `models` (
    `model_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
	`manufacturer_id` INT,
    
    CONSTRAINT fk_models_manufacturers
    FOREIGN KEY (`manufacturer_id`)
    REFERENCES `manufacturers`(`manufacturer_id`)
    );
    
    INSERT INTO `manufacturers` (`name`, `established_on`)
    VALUES 
    ('BMW', '1916-03-01'),
    ('Tesla', '2003-01-01'),
    ('Lada', '1966-05-01');
    
    INSERT INTO `models`
    VALUES
    (101, 'X1', 1),
    (102, 'i6', 1),
    (103, 'Model S', 2),
    (104, 'Model x', 2),
    (105, 'Model 3', 2),
    (106, 'Nova', 3);
    
    #03
    
    CREATE TABLE `students`(
    `student_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(30) NOT NULL
    );
    
    CREATE TABLE `exams`(
		`exam_id` INT PRIMARY KEY AUTO_INCREMENT,
		`name` VARCHAR(30) NOT NULL
	);
    
    INSERT INTO `students` (`student_id`, `name`)
    VALUES
    (1, 'Mila'),
    (2, 'Toni'),
    (3, 'Ron');
    
    INSERT INTO `exams` (`exam_id`, `name`)
    VALUES
    (101, 'Spring MVC'),
    (102, 'Neo4j'),
    (103, 'Oracle 11g');
    
    CREATE TABLE `students_exams`(
		`student_id` INT,
		`exam_id` INT,
        
   CONSTRAINT pk_students_exams 
   PRIMARY KEY (`student_id`, `exam_id`),
   
   CONSTRAINT fk_students_exams_students
   FOREIGN KEY (`student_id`)
   REFERENCES students(`student_id`),
   
   CONSTRAINT fk_students_exams_exams
   FOREIGN KEY(`exam_id`)
   REFERENCES exams(`exam_id`)
   
   );
   
   INSERT INTO `students_exams` 
   VALUES 
   (1, 101),
   (1, 102),
   (2, 101),
   (3, 103),
   (2, 102),
   (2, 103);
   
   #04
   
   CREATE TABLE `teachers`(
		`teacher_id` INT PRIMARY KEY AUTO_INCREMENT,
        `name` VARCHAR(20) NOT NULL,
        `manager_id` INT
	);
    
    INSERT INTO `teachers`
    VALUES
    (101, 'Jhon', NULL),
    (102, 'Maya', 106),
    (103, 'Silvia', 106),
    (104, 'Ted', 105),
    (105, 'Mark', 101),
    (106, 'Greta', 101);
    
    ALTER TABLE `teachers`
    ADD CONSTRAINT fk_teachers_managers
    FOREIGN KEY (`manager_id`)
    REFERENCES `teachers`(`teacher_id`);
    
    #05	Online Store Database
    
    CREATE TABLE `cities`(
		`city_id` INT PRIMARY KEY AUTO_INCREMENT,
        `name` VARCHAR(50)
    );
    
    CREATE TABLE `customers`(
		`customer_id` INT PRIMARY KEY AUTO_INCREMENT,
        `name` VARCHAR(50),
        `birthday` DATE,
        `city_id` INT,
        CONSTRAINT fk_customers_cities
        FOREIGN KEY (`city_id`)
        REFERENCES `cities`(`city_id`)
    );
    
    CREATE TABLE `orders`(
    `order_id` INT PRIMARY KEY AUTO_INCREMENT,
    `customer_id` INT,
    CONSTRAINT fk_orders_customers
    FOREIGN KEY (`customer_id`)
    REFERENCES `customers`(`customer_id`)
    );
    
    CREATE TABLE `item_types`(
		`item_type_id` INT PRIMARY KEY AUTO_INCREMENT,
		`name` VARCHAR(50)
    );
    
    CREATE TABLE `items`(
		`item_id` INT PRIMARY KEY AUTO_INCREMENT,
        `name` VARCHAR(50),
        `item_type_id` INT,
        CONSTRAINT fk_items_item_types
        FOREIGN KEY (`item_type_id`)
        REFERENCES `item_types`(`item_type_id`)
    );
    
    CREATE TABLE `order_items`(
		`order_id` INT,
        `item_id` INT,
        CONSTRAINT pk_order_items
        PRIMARY KEY (`order_id`, `item_id`),
        CONSTRAINT fk_order_items_orders
        FOREIGN KEY (`order_id`)
        REFERENCES `orders`(`order_id`),
        CONSTRAINT fk_order_items_items
        FOREIGN KEY (`item_id`)
        REFERENCES `items`(`item_id`)
        
    );
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    