-- Calculate the count of all grades per Teacher in the system
 SELECT t.[FirstName], t.LastName, Count(g.Grade) as CountOfAllGrades
 FROM  [dbo].[Teacher] t 
 join Grade g on t.ID = g.TeacherID
 GROUP BY t.[FirstName], t.LastName

--Calculate the count of all grades per Teacher in the system
-- for first 100 Students (ID < 100)
SELECT t.[FirstName], t.LastName, Count(g.Grade) as CountOfAllGrades
FROM  [dbo].[Teacher] t 
join Grade g on t.ID = g.TeacherID
WHERE StudentID < 100
GROUP BY t.[FirstName], t.LastName

-- Find the Maximal Grade, and the Average Grade
-- per Student on all grades in the system
SELECT s.[FirstName], s.[LastName], Max(g.Grade) as HighestGrade, AVG(g.Grade) as AverageGrade
from Student s
join Grade g on s.ID = g.StudentID
GROUP BY s.[FirstName], s.[LastName]

-- Calculate the count of all grades per Teacher in the system
-- and filter only grade count greater then 200
 SELECT t.[FirstName], t.LastName, Count(g.Grade) as CountOfAllGrades
 FROM  [dbo].[Teacher] t 
 join Grade g on t.ID = g.TeacherID
 GROUP BY t.[FirstName], t.LastName
 HAVING COUNT(g.Grade) > 200

 -- Find the Grade Count, Maximal Grade, 
 -- and the Average Grade per Student on all grades in the 
 -- List Student First Name and Last Name next to the other details from previous query
SELECT s.[FirstName], s.[LastName], COUNT(g.Grade) as GradeCount, Max(g.Grade) as HighestGrade, AVG(g.Grade) as AverageGrade
from Student s
join Grade g on s.ID = g.StudentID
GROUP BY s.[FirstName], s.[LastName]
HAVING Max(g.Grade) =  AVG(g.Grade)

-- Create new view (vv_StudentGrades) that will List all StudentIds
-- and count of Grades per student
CREATE VIEW vv_StudentGrades
AS
SELECT s.ID, Count(g.Grade) as CountOfAllGrades
FROM Student s
 join Grade g on s.ID = g.TeacherID
GROUP BY s.ID

 -- Change the view to show Student First and Last Names instead of StudentID
ALTER VIEW vv_StudentGrades
AS
SELECT s.[FirstName], s.[LastName], Count(g.Grade) as CountOfAllGrades
FROM Student s
 join Grade g on s.ID = g.TeacherID
GROUP BY s.[FirstName], s.[LastName]

-- List all rows from view ordered by biggest Grade Count
SELECT * FROM vv_StudentGrades
ORDER BY CountOfAllGrades desc 

