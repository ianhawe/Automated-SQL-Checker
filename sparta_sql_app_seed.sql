CREATE DATABASE SpartaSQLApp;

CREATE TABLE course (
CourseID SERIAL PRIMARY KEY,
CourseName VARCHAR(40) UNIQUE, 
StartDate DATE,
EndDate DATE,
StreamType VARCHAR(40)
);

CREATE TABLE student (
StudentID SERIAL PRIMARY KEY,
CourseID INT REFERENCES Course(CourseID),
FirstName VARCHAR(20) NOT NULL, 
LastName VARCHAR(20) NOT NULL, 
Email VARCHAR(40) UNIQUE NOT NULL,
Password VARCHAR(40) NOT NULL,
Completed BOOLEAN DEFAULT FALSE, 
Score INT
);

CREATE TABLE trainer (
TrainerID SERIAL PRIMARY KEY,
FirstName VARCHAR(20) NOT NULL, 
LastName VARCHAR(20) NOT NULL, 
Email VARCHAR(40) UNIQUE NOT NULL,
Password VARCHAR(40) NOT NULL
);

CREATE TABLE course_trainer (
CourseTrainer SERIAL PRIMARY KEY,
TrainerID INT REFERENCES trainer(TrainerID),
CourseID INT REFERENCES course(CourseID)
);

----------------------
-- CONSTRAINTS
----------------------

ALTER TABLE student 
ADD CONSTRAINT CHK_Email CHECK( Email LIKE '%@spartaglobal.com');

ALTER TABLE trainer 
ADD CONSTRAINT CHK_Email CHECK( Email LIKE '%@spartaglobal.com');

----------------------
-- INSERT DATA
----------------------

INSERT INTO course(CourseName, StartDate, EndDate, StreamType) 
VALUES ('Engineering-21','2018-11-12', '2018-02-28', 'SDET'), 
  ('Engineering-22','2018-11-26', '2018-03-09', 'DevOps'),
  ('Business 17','2019-10-10', '2019-08-13', 'PMO')
  ;

INSERT INTO course(CourseName) VALUES ('Business 10'), ('Engineering-01'), ('BIZ 3');

INSERT INTO student (CourseID, FirstName, LastName, Email, Password)
VALUES
 (01, 'Ian', 'Hawe','ihawe@spartaglobal.com','Acd3my1'),
 (01, 'Hibah', 'Abid','habid@spartaglobal.com','Acd3my1'),
 (01, 'Kirpal', 'Seehra','kseehra@spartaglobal.com','Acd3my1'),
 (01, 'Emem', 'Umoh','eumoh@spartaglobal.com','Acd3my1'),
 (01, 'Thomas', 'Impey','timpey@spartaglobal.com','Acd3my1'),
 (01, 'Nitesh', 'Vairavan','nvairavan@spartaglobal.com','Acd3my1'),
 (01, 'Shahrukh', 'Khan','skhan@spartaglobal.com','Acd3my1'),
 (01, 'Orhan', 'Mustafa','omustafa@spartaglobal.com','Acd3my1'),
 (01, 'Raiyan', 'Shaheen','rshaheen@spartaglobal.com','Acd3my1'),
 (01, 'Paul', 'Ciobanita','pciobanita@spartaglobal.com','Acd3my1'),
 (01, 'Nisaanth', 'Manegavasar','nmanegavasar@spartaglobal.com','Acd3my1'),
 (01, 'Arnold', 'Chung','achung@spartaglobal.com','Acd3my1'),
 (02, 'Bob', 'Michaels','bmichaels@spartaglobal.com','Acd3my1'),
 (02, 'Steven', 'Lee','slee@spartaglobal.com','password'),
 (02, 'Jessica', 'Simmo','bmichaels@spartaglobal.com','password47'),
 (05, 'Bob', 'Michaels','bmichaels@spartaglobal.com','hello123'),
 (04, 'Bob', 'Michaels','bmichaels@spartaglobal.com','1234567'),
 (03, 'Bob', 'Michaels','bmichaels@spartaglobal.com','PASSWORD'), 
 (03, 'Bob', 'Michaels','bmichaels@spartaglobal.com','QWErty')
 (03, 'Bob', 'Michaels','bmichaels@spartaglobal.com','PASSWORD123')
 ;
 INSERT INTO student (CourseID, FirstName, LastName, Email, Password, Score)
 VALUES
 (04, 'Jim', 'Stevens','jsteven@spartaglobal.com','pacman2013', 15),
 (04, 'Jim', 'Stevens','jsteven@spartaglobal.com','pacman2013', 30);

INSERT INTO trainer (FirstName, LastName, Email, Password)
VALUES
 ('Dave', 'Collins','trainer1@spartaglobal.com','Admin')
 ('Gary', 'Collins','gary@spartaglobal.com','Admin')
 ('Meryl', 'Streep','MerylStreep@spartaglobal.com','prada');
