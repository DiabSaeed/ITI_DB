-- problem 7 
CREATE SCHEMA HumanResources;
ALTER SCHEMA HumanResources Transfer dbo.Employee;

-- problem 8
SELECT 
    t.name AS TableName,
    c.name AS ConstraintName,
    c.type_desc AS ConstraintType
FROM sys.objects c
JOIN sys.tables t 
    ON c.parent_object_id = t.object_id
WHERE t.name = 'Employee';

-- problem 9
CREATE SYNONYM Emp FOR HumanResources.Employee;

Select * from Employee;

Select * from HumanResources.Employee;

Select * from Emp;

Select * from HumanResources.Emp;

-- problem 10 
UPDATE p
SET Budget = (Budget *.1) + Budget
FROM Company.Project p 
INNER JOIN Works_ON w
ON p.ProjectNo = w.ProjectNo
WHERE w.EmpNo = '10102' AND w.Job = 'manager';

-- problem 11 
UPDATE d
SET d.DeptName = 'Sales'
FROM Company.Department d
JOIN HumanResources.Employee e 
ON d.DeptNo = e.DeptNo
WHERE e.Emp_Fname = 'James';

-- problem 12 

UPDATE w
SET w.Enter_Date = '12.12.2007'
FROM dbo.Works_On w
JOIN Company.Project p
ON p.ProjectNo = p.ProjectNo
JOIN Emp e
ON w.EmpNo = e.EmpNo
JOIN Company.Department d
ON e.DeptNo = d.DeptNo
WHERE p.ProjectNo = 'p1' AND d.DeptName = 'Sales';

-- problem 13
DELETE w
FROM Works_On w
JOIN Emp e
ON w.EmpNo = e.EmpNo
JOIN Company.Department d
ON e.DeptNo = d.DeptNo
WHERE d.Location = 'KW';

