-- problem 1
INSERT INTO [dbo].[Works_On] (EmpNo, ProjectNo, Job, Enter_Date) Values ('11111', 'p1', 'Analyst', '2005-01-01');
UPDATE Works_On
SET EmpNo = '11111'
WHERE EmpNo = '10102'; -- Violation of PRIMARY KEY constraint 'PK_Works_On'.

-- problem 2
UPDATE Employee
SET EmpNo = '11111'
WHERE EmpNo = '10102'; -- Affected successfully

-- problem 3
DELETE
FROM Employee
WHERE EmpNo = '10102';

-- problem 4
ALTER TABLE Employee 
ADD TeleNom VARCHAR(11);

-- problem 5
ALTER TABLE Employee 
DROP COLUMN TeleNom;

-- problem 6 
CREATE SCHEMA Company;

ALTER SCHEMA Company
TRANSFER dbo.Department;