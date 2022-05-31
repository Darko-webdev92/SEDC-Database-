USE master;  
GO  
CREATE DATABASE SEDCACADEMYDB
USE SEDCACADEMYDB
GO

-- STUDENT
CREATE TABLE Student(
ID int NOT NULL IDENTITY(1,1)  PRIMARY KEY,
FirstName nvarchar(100) NOT NULL,
LastName nvarchar(100) NOT NULL,
DateOfBirth date NOT NULL,
EnrollDate date NOT NULL,
Gender nvarchar(1) NULL,
NationalIDNumber int NOT NULL,
StudentCardNumber int NOT NULL
)
-- Teacher 
CREATE TABLE Teacher(
ID int NOT NULL IDENTITY(1,1)  PRIMARY KEY,
FirstName nvarchar(100) NOT NULL,
LastName nvarchar(100) NOT NULL,
DateOfBirth date NOT NULL,
AcademicRank int NULL,
HireDate date NOT NULL,
)

-- Grade 
CREATE TABLE Grade(
ID int NOT NULL IDENTITY(1,1)  PRIMARY KEY,
StudentID int NOT NULL,
CourseID int NOT NULL,
TeacherID int NOT NULL,
Grade tinyint NOT NULL,
Comment nvarchar(MAX) null,
CreatedDate date NOT NULL,
)

-- Course
CREATE TABLE Course(
ID int NOT NULL IDENTITY(1,1)  PRIMARY KEY,
[Name] nvarchar(100) NOT NULL,
Credit tinyint NOT NULL,
AcademicYear date NOT NULL,
Semester tinyint NOT NULL
)

-- GradeDetails
CREATE TABLE GradeDetails(
ID int NOT NULL IDENTITY(1,1)  PRIMARY KEY,
GradeID int NOT NULL,
AchievementTypeID int NOT NULL,
AchievementPoints int NOT NULL,
AchievementMaxPoints tinyint NOT NULL,
AchievementDate date NOT NULL,
)

-- AchievementType
CREATE TABLE AchievementType(
ID int NOT NULL IDENTITY(1,1)  PRIMARY KEY,
[Name] nvarchar(100) NOT NULL,
[Description] nvarchar(MAX) NULL,
ParticipationRate tinyint NOT NULL,
)