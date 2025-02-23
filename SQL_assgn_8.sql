create database job;
use job;

#Create a stored procedure to add a new record to the Worker table
DELIMITER $$

CREATE PROCEDURE AddWorker(
    IN p_first_name VARCHAR(25),
    IN p_last_name VARCHAR(25),
    IN p_salary INT,
    IN p_joining_date DATETIME,
    IN p_department VARCHAR(25)
)
BEGIN
    INSERT INTO workers (firstname, lastname, salary, joiningdate, department)
    VALUES (p_first_name, p_last_name, p_salary, p_joining_date, p_department);
END $$

DELIMITER ;

#Create a stored procedure to retrieve the salary of a worker based on WORKER_ID
DELIMITER $$

CREATE PROCEDURE GetSalaryByWorkerID(
    IN p_worker_id INT,
    OUT p_salary INT
)
BEGIN
    SELECT Salary INTO p_salary
    FROM Worker
    WHERE Worker_Id = p_worker_id;
END $$

DELIMITER ;
#Create a stored procedure to update the department of a worker based on WORKER_ID
DELIMITER $$

CREATE PROCEDURE UpdateDepartment(
    IN p_worker_id INT,
    IN p_department CHAR(25)
)
BEGIN
    UPDATE Worker
    SET Department = p_department
    WHERE Worker_Id = p_worker_id;
END $$

DELIMITER ;
#Create a stored procedure to count the number of workers in a given department
DELIMITER $$

CREATE PROCEDURE CountWorkersByDepartment(
    IN p_department CHAR(25),
    OUT p_worker_count INT
)
BEGIN
    SELECT COUNT(*) INTO p_worker_count
    FROM Worker
    WHERE Department = p_department;
END $$

DELIMITER ;

#Create a stored procedure to retrieve the average salary of workers in a given department
DELIMITER $$

CREATE PROCEDURE AvgSalaryByDepartment(
    IN p_department CHAR(25),
    OUT p_avg_salary DECIMAL(15,2)
)
BEGIN
    SELECT AVG(Salary) INTO p_avg_salary
    FROM Worker
    WHERE Department = p_department;
END $$

DELIMITER ;

