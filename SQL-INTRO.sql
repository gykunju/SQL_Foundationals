-- CREATING DATABASE
drop database if exists School;
create database School;

-- SELECTING DATABASE TO USE
use School;

-- CREATING TABLES
create table Students (
	StudentID INT AUTO_INCREMENT,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL, 
    BirthDate DATE,
    PRIMARY KEY (StudentID)
    );
    
create table Courses (
	CourseID INT AUTO_INCREMENT,
	CourseName VARCHAR(10) NOT NULL,
    Credits INT NOT NULL,
    PRIMARY KEY  (CourseID),
    CONSTRAINT CHK_Credits CHECK (Credits > 0)
    );
    
create table Enrollments (
	EnrollmentID INT AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE NOT NULL,
    PRIMARY KEY (EnrollmentID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (courseID) REFERENCES Courses(CourseID) ON DELETE SET NULL,
    UNIQUE (StudentID, CourseID)
    );
    
-- INSERTING DATA INTO TABLES
INSERT INTO  Students (FirstName, LastName, BirthDate) VALUES ("Alvin" , "Gikunju" , "2005-08-08"), ("James", "Gathu", "2004-12-18"),
 ("Bastian", "Seb","2003-04-29");
 
 INSERT INTO Courses (CourseName, Credits) VALUES ("DSA", 20), ("Computer", 13), ("Data" , 10);
 
 INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate) VALUES 
 (1, 1, "2020-04-29"),
 (2, 2, "2021-02-25"),
 (3, 3, "2021-06-15");

 
 INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate) VALUES (2, 2, "2020-02-15");
 
-- ADDING A COLUMN
alter table Students 
add column Age INT default 20;

-- UPDATING COLUMN DATA
update Students 
set Age = 19 where StudentID = 1;

-- DROPPING A COLUMN
alter table Students
Drop column age;

-- DELETING A ROW
delete from Students where StudentID = 1;

delete from Courses where CourseID = 2;

-- INNER JOIN
select Courses.CourseName, Enrollments.EnrollmentDate, Courses.Credits, Students.FirstName
from Enrollments
Inner join Courses on Enrollments.CourseID = Courses.CourseID
inner join Students on Enrollments.StudentID = Students.StudentID;  
 
-- SELECTING DATA
 select * from Students;
 select * from Courses;
 select * from Enrollments;

