-- problem 1
SELECT *
FROM Student
WHERE St_Age IS NOT NULL;

-- problem 2
SELECT DISTINCT Ins_Name
FROM Instructor;

-- problem 3
SELECT s.St_Id StudentID, CONCAT(ISNULL(s.St_Fname,''), ' ', ISNULL(s.St_Lname,'')) StudentFullName, ISNULL(d.Dept_Name,'No Department') DepartmentName
FROM Student s
LEFT JOIN Department d
ON s.Dept_Id = d.Dept_Id;
-- problem 4
SELECT i.Ins_Name , d.Dept_Name
FROM Instructor i
LEFT JOIN Department d
ON i.Dept_Id = d.Dept_Id;

-- problem 5
SELECT s.St_Id StudentID, CONCAT(ISNULL(s.St_Fname,''), ' ', ISNULL(s.St_Lname,'')) StudentFullName, ISNULL(c.Crs_Name,'No Course') CourseName
FROM Student s
INNER JOIN Stud_Course sc
ON s.St_Id = sc.St_Id
LEFT JOIN Course c
ON sc.Crs_Id = c.Crs_Id
WHERE sc.Grade IS NOT NULL;

-- problem 6
SELECT t.Top_Name TopiName, COUNT(c.Crs_Id) NumberOfCourses
FROM Topic t
LEFT JOIN Course c
ON t.Top_Id = c.Top_Id
GROUP BY t.Top_Name;

-- problem 7
SELECT MAX(Salary), MIN(Salary)
FROM Instructor;

-- problem 8
SELECT Ins_Name, Salary
FROM Instructor
WHERE Salary < (SELECT AVG(salary) FROM Instructor);

-- problem 9
SELECT d.Dept_Name
FROM Department d 
RIGHT JOIN Instructor i 
ON d.Dept_Id = i.Dept_Id
WHERE i.Salary = (SELECT MIN(Salary) FROM Instructor);

-- problem 10 
SELECT Top(2) salary
FROM instructor
ORDER BY Salary DESC;

-- problem 11
SELECT Ins_Name, COALESCE(CAST(Salary AS VARCHAR(5)),'Bonus')
FROM Instructor

--problem 12 
SELECT AVG(SALARY)
FROM Instructor;

-- problem 13 
SELECT ISNULL(s.St_Fname,'') StudentName, super.*
FROM Student s
INNER JOIN Student super
ON s.St_Id = super.St_super

-- Problem 14 
SELECT *
FROM (
		SELECT d.Dept_Name DepartName,i.salary salary,RANK() OVER(PARTITION BY d.dept_name ORDER BY SALARY DESC) as Salary_rank 
		FROM instructor i 
		RIGHT JOIN Department d
		ON i.dept_id = d.dept_id
	) as ins
WHERE Salary_rank < 3;

-- problem 15 
SELECT Department, StudentName
FROM (
		SELECT s.St_Fname StudentName,
			   d.Dept_Name Department,
			   ROW_NUMBER() OVER ( PARTITION BY d.dept_id ORDER BY NEWID()) RowNum
		FROM Student s
		LEFT JOIN Department d
		ON s.Dept_Id = d.Dept_Id) rondom 
WHERE RowNum = 1
