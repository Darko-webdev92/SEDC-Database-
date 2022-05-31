-- Find all Students  with FirstName = Antonio
SELECT * FROM Student
WHERE FirstName = 'Antonio';

-- Find all Students with DateOfBirth greater than ‘01.01.1999’
SELECT * FROM Student
WHERE DateOfBirth > '1999.01.01'

-- Find all Students with LastName starting With ‘J’ enrolled in January/1998
SELECT * FROM Student
WHERE LastName like 'A%'
AND EnrolledDate >='1998.01.01' and EnrolledDate < '1998.02.01'


-- List all Students ordered  by FirstName
SELECT * FROM Student
ORDER BY FirstName

-- List all Teacher Last Names and Student Last Names in single result set. 
SELECT LastName from Teacher
UNION 
SELECT LastName from Student


-- Create  Foreign key constraints  from diagram or with script
ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_StudentID
FOREIGN KEY(StudentID) references Student(ID)

ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_CourseID
FOREIGN KEY(CourseID) references Course(ID)

ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_TeacherID
FOREIGN KEY(TeacherID) references Teacher(ID)

ALTER TABLE GradeDetails
ADD CONSTRAINT FK_GradeDetails_GradeID
FOREIGN KEY(GradeID) references Grade(ID)

ALTER TABLE GradeDetails
ADD CONSTRAINT FK_GradeDetails_AchievementTypeID
FOREIGN KEY(AchievementTypeID) references AchievementType(ID)


-- List all possible combinations  of Courses  names and AchievementType names
-- that can be passed  by student
Select c.[Name] as CoursesName, a.[Name] as AchievementName
from Course c
cross join AchievementType a

-- List all Teachers  without exam Grade
Select * 
from Teacher t
left join Grade g on t.ID = g.TeacherID
where g.ID is null