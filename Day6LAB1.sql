-- First Part
-- problem 1
CREATE TABLE Department(
						DeptNo Varchar(20) PRIMARY KEY,
						DeptName Varchar(20),
						Location nchar (2))
sp_addtype loc, 'nchar(2)';

CREATE DEFAULT def_loc AS 'NY';

sp_bindefault 'def_loc', 'loc';

ALTER TABLE Department
ALTER COLUMN Location loc;

-- problem 2
CREATE TABLE Employee (
						EmpNo VARCHAR(10) PRIMARY KEY,
						Emp_Fname VARCHAR(20) NOT NULL,
						Emp_Lname VARCHAR(20) NOT NULL,
						DeptNo VARCHAR(20),
						Salary INT
						CONSTRAINT c1 FOREIGN KEY(DeptNo) REFERENCES Department(DeptNo),
						)
CREATE RULE salary_rule AS @salary < 6000;
sp_bindrule salary_rule, 'Employee.Salary';

