create database timetable;
use timetable;
CREATE TABLE teachers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    subject VARCHAR(100),
    experience INT,
    salary DECIMAL(10, 2));
    
    INSERT INTO teachers (id, name, subject, experience, salary) VALUES
(1, 'Alice', 'Mathematics', 5, 40000.00),
(2, 'Bob', 'Science', 8, 45000.00),
(3, 'Williams', 'English', 12, 50000.00),
(4, 'David', 'History', 3, 38000.00),
(5, ' Davis', 'Art', 9, 42000.00),
(6, 'Harry', 'Physics', 15, 55000.00),
(7, 'Grace', 'Chemistry', 2, 37000.00),
(8, 'John', 'Biology', 7, 41000.00);

#Create a before insert trigger before_insert_teacher
DELIMITER $$

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END $$

DELIMITER ;

#Create an after insert trigger after_insert_teacher

CREATE TABLE teacher_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT,
    action VARCHAR(100),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END $$

DELIMITER ;

#Create a before delete trigger to raise an error if experience is greater than 10 years
DELIMITER $$

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete teacher with more than 10 years of experience';
    END IF;
END $$

DELIMITER ;

# Create an after delete trigger to insert into teacher_log when a row is deleted
DELIMITER $$

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END $$

DELIMITER ;

#TEST THE TRIGGERS
select * from teachers;


show triggers;


