-- Create  new procedure  called CreateGrade
-- •Procedure  should create  only Grade  header  info (not Grade  Details) 
-- •Procedure  should return  the total number of grades  in the system
-- for the Student  on input (from  the CreateGrade)
-- •Procedure  should return  second resultset  with the MAX Grade of all grades
-- for the Student and Teacher  on input (regardless  the Course)

CREATE PROCEDURE CreateGrade(@StudentID int, @TeacherID int)
AS 
BEGIN 
SELECT COUNT(StudentID) FROM GRADE
WHERE StudentID = @StudentID

SELECT MAX(Grade) FROM Grade
WHERE StudentID = @StudentID  AND TeacherID = @TeacherID
END 
GO	
CreateGrade @StudentID=111 ,@TeacherID =6
DROP PROCEDURE CreateGrade


-- •Create new procedure  called CreateGradeDetail
-- •Procedure should add details for specific Grade 
-- (new record for new AchievementTypeID, Points, MaxPoints, Date for  specific Grade)
-- •Output from this procedure  should be resultset  with SUM of GradePoints
-- calculated with formula AchievementPoints/AchievementMaxPoints*ParticipationRate
-- for specific Grade

CREATE PROCEDURE CreateGradeDetail(@GradeID int, @AchievementTypeID tinyint, @AchievementPoints tinyint, @AchievementMaxPoints tinyint, @AchievementDate date)
AS 
BEGIN
Declare 
@GradePoints int
INSERT INTO GradeDetails(GradeID,AchievementTypeID,AchievementPoints,AchievementMaxPoints,AchievementDate)
VALUES(@GradeID, @AchievementTypeID, @AchievementPoints,@AchievementMaxPoints, @AchievementDate
)

SELECT SUM((AchievementMaxPoints/AchievementPoints)*p.ParticipationRate)
FROM GradeDetails g
join AchievementType p on g.ID = p.ID
END
GO

CreateGradeDetail 0,0,72,100,'1999-02-02'

drop PROCEDURE CreateGradeDetail
