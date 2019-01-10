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
DBType VARCHAR(20)
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

CREATE TABLE test (
TestID SERIAL PRIMARY KEY,
TotalScore INT,
);

CREATE TABLE question (
QuestionID SERIAL PRIMARY KEY,
Question VARCHAR(255) NOT NULL, 
CorrectAnswer VARCHAR(255), 
QuestionScore INT, 
TestID INT REFERENCES test(TestID),
);


CREATE TABLE student_test (
StudentTestID SERIAL PRIMARY KEY,
TestID INT REFERENCES test(TestID),
ScoreAchieved INT,
StudentID INT REFERENCES student(StudentID),
);


CREATE TABLE StudentAnswer (
  QuestionID INT REFERENCES question(QuestionID),
  Answer VARCHAR(MAX),
  StudentTestID INT REFERENCES student_test(StudentTestID),
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

INSERT INTO student (CourseID, FirstName, LastName, Email, Password,)
VALUES (01, 'Hibah', 'Abid','habid@spartaglobal.com','Acd3my1'),
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
 (02, 'Jessica', 'Simmon','simmons@spartaglobal.com','password47'),
 (05, 'Bob', 'Michaels','bmichaels123@spartaglobal.com','hello123'),
 (04, 'Mollie', 'Impey','mimpey@spartaglobal.com','1234567'),
 (03, 'Anne', 'Lee','annelee@spartaglobal.com','PASSWORD'), 
 (03, 'Jeff', 'Goldblum','goldJ@spartaglobal.com','QWErty'),
 (03, 'Dua', 'Lipa','lipa@spartaglobal.com','PASSWORD123');

 INSERT INTO student (CourseID, FirstName, LastName, Email, Password, DBType)
 VALUES
 (04, 'Jim', 'Stevens','jsteven@spartaglobal.com','pacman2013', 'sql'),
 (04, 'Lilly', 'Stephens','lstephen@spartaglobal.com','pacman2013', 'psql');
 (03, 'Sharon', 'Lee','Slee@spartaglobal.com','hello2123', 'mysql');

INSERT INTO trainer (FirstName, LastName, Email, Password)
VALUES
 ('Dave', 'Collins','trainer1@spartaglobal.com','Admin'),
 ('Gary', 'Collins','gary@spartaglobal.com','Admin'),
 ('Meryl', 'Streep','MerylStreep@spartaglobal.com','prada'),
 ('Artur', 'Kondas', 'akondas@spartaglobal.com', 'ducks');

INSERT INTO course_trainer (TrainerID, CourseID) VALUES (01, 04), (02,03), (04,01);

INSERT INTO question (Question, CorrectAnswer, QuestionScore, TestID)
VALUES
 ('1.1 Write a query that lists all Customers in either Paris or London. Include Customer ID, Company Name and all address fields.', 'SELECT * FROM Customers
WHERE City = "London" OR City = "Paris"', 5, 1),
 ('1.2 List all products stored in bottles.', 'SELECT QuantityPerUnit FROM Products
WHERE QuantityPerUnit LIKE "%bottle%"', 5, 1),
 ('1.3 Repeat question above, but add in the Supplier Name and Country.', 'SELECT QuantityPerUnit, s.CompanyName, s.Country FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE QuantityPerUnit LIKE "%bottle%"', 5, 1),
 ('1.4 Write an SQL Statement that shows how many products there are in each category. Include Category Name in result set and list the highest number first.', 'SELECT c.CategoryName, COUNT(*) AS "Number Of Products"
FROM Products p
INNER JOIN Categories c ON p.CategoryID = c.CategoryID 
GROUP BY c.CategoryName 
ORDER by "Number of Products" DESC;', 5, 1),
 ('1.5 List all UK employees using concatenation to join their title of courtesy, first name and last name together. Also include their city of residence.', 'SELECT TitleOfCourtesy + " "+ FirstName + " " + LastName AS "title and name", City
FROM Employees 
WHERE Country = "UK"', 5, 1),
 ('1.6 List Sales Totals for all Sales Regions (via the Territories table using 4 joins) with a Sales Total greater than 1,000,000. Use rounding or FORMAT to present the numbers.', 'answer', 5, 1),
 ('1.7 Count how many Orders have a Freight amount greater than 100.00 and either USA or UK as Ship Country.', 'SELECT COUNT(*) AS "Orders with over 100 Freight"
FROM Orders
WHERE Freight > 100 AND (ShipCountry="USA" OR ShipCountry="UK")', 5, 1),
 ('1.8 Write an SQL Statement to identify the Order Number of the Order with the highest amount of discount applied to that order.', 'SELECT TOP 1 OrderID, Discount
FROM [Order Details]
ORDER BY Discount DESC', 5, 1),
 ('2.1 Design and build a suitable set of fully normalised tables to store the following information', 'CREATE TABLE Coures_schedule(
Student_schedule_ID int IDENTITY(1,1) UNIQUE,
Spartan_ID INT NOT NULL,
Course_ID INT NOT NULL
PRIMARY KEY (Student_schedule_ID)
)

CREATE TABLE Spartan(
Student_ID int IDENTITY(1,1) UNIQUE,
Spartan_name VARCHAR(20) NOT NULL,
Course_name VARCHAR(20)
PRIMARY KEY (Student_ID)
)

CREATE TABLE CourseDates(
Course_ID int UNIQUE,  
Course_name VARCHAR(20) NOT NULL,
Starting_date DATE,
Ending_date DATE,
)

CREATE TABLE CourseDetails(
Course_ID int IDENTITY(1,1) UNIQUE,   
Course_name VARCHAR(20) NOT NULL,
Academy_name VARCHAR(20),
Room_name VARCHAR(20),
Trainer_name VARCHAR(20)
PRIMARY KEY (Course_ID)
)

CREATE TABLE Rooms(
Room_ID VARCHAR(20) NOT NULL,
Trainer VARCHAR(20),
Academy_name VARCHAR(20),
)  

CREATE TABLE Academys(
Academy_ID int IDENTITY(1,1) UNIQUE,
Academy_name VARCHAR(20),
PRIMARY KEY (Academy_ID)
)   

CREATE TABLE Roles(
Staff_ID int IDENTITY(1,1) UNIQUE,
Staff_role VARCHAR(10),
PRIMARY KEY (Staff_ID)
)  


USE SpartaGlobal;', 10, 1),
 ('2.2 One that contains all statements required to create and re-create this database. DDL only.
NOTE: You will be provided with the DML file which contains all of the INSERT statements required to populate the tables as per the example given. (20 marks) IMPORTANT: Some tables will need the IDENTITY keyword to match this DML exactly.', 'CREATE TABLE Rooms(
RoomID int IDENTITY(1,1) UNIQUE,
AcademyID int NOT NULL,
RoomName VARCHAR(20) NOT NULL,
[Description] VARCHAR(50),
Capacity VARCHAR(20),
PRIMARY KEY (RoomID)
)

CREATE TABLE Academies(
AcademyID int IDENTITY(1,1) UNIQUE,
AcademyName VARCHAR(20) NOT NULL,
PRIMARY KEY (AcademyID)
)

CREATE TABLE CourseCatalog(
CourseID int IDENTITY(1,1) UNIQUE,
CourseName VARCHAR(20) NOT NULL,
Duration int,
PRIMARY KEY (CourseID)
)


CREATE TABLE Employees(
EmployeesID int IDENTITY(1,1) UNIQUE,
FirstName VARCHAR(20) NOT NULL,
LastName VARCHAR(20) NOT NULL,
EmployeeType CHAR(1),
StartDate DATE,
PRIMARY KEY (EmployeesID)
)

CREATE TABLE CourseSchedule(
CourseScheduleID int IDENTITY(1,1) UNIQUE,
AcademyID int NOT NULL,
RoomID int NOT NULL,
CourseID int NOT NULL,
StartDate DATE,
EndDate DATE
PRIMARY KEY (CourseScheduleID)
)

CREATE TABLE CourseScheduleTrainers(
CourseScheduleID int NOT NULL,
TrainerID int NOT NULL,
TrainerType CHAR(1),
)

CREATE TABLE CourseScheduleAttendees(
CourseScheduleID int NOT NULL,
AttendeeID int NOT NULL,
Active BIT
)', 10, 1),
 ('2.3 Add more sample data to include all current trainers and at least one TA (Training Assistant) and Spartans on your current course. (Included in above marks)', 'INSERT INTO [Employees]
           ([FirstName]
           ,[LastName]
           ,[EmployeeType]
           ,[StartDate]
           
           )
     VALUES
	 		     ("Ian","Hawe","S","2018-11-12")', 5, 1),


 ('3.1 Produce a report similar to the above table (see 2.1) from all 7 tables using one SQL statement (use FORMAT for the dates). (10 marks)', 'SELECT cc.CourseName, cs.StartDate, cs.EndDate, AcademyName, RoomName, e.FirstName + " "  + e.LastName AS "Trainers", es.FirstName + " "  + es.LastName AS "Spartans" 
FROM CourseSchedule cs
INNER JOIN CourseCatalog cc ON cc.CourseID = cs.CourseID
INNER JOIN Academies a ON cs.AcademyID = a.AcademyID
INNER JOIN Rooms r ON cs.RoomID = r.RoomID
INNER JOIN CourseScheduleTrainers cst ON cs.CourseScheduleID = cst.CourseScheduleID
INNER JOIN CourseScheduleAttendees csa ON cs.CourseScheduleID = csa.CourseScheduleID
INNER JOIN Employees e ON cst.TrainerID = e.EmployeesID
INNER JOIN Employees es ON csa.AttendeeID = es.EmployeesID', 10, 1),
 ('3.2 Repeat 3.1 above but replace the Spartan Name column with Spartan Initials. (5 marks)', 'SELECT cc.CourseName, cs.StartDate, cs.EndDate, AcademyName, RoomName, e.FirstName + " "  + e.LastName AS "Trainers", LEFT(es.FirstName,1) + " "  + LEFT(es.LastName,1) AS "Spartans" 
FROM CourseSchedule cs
INNER JOIN CourseCatalog cc ON cc.CourseID = cs.CourseID
INNER JOIN Academies a ON cs.AcademyID = a.AcademyID
INNER JOIN Rooms r ON cs.RoomID = r.RoomID
INNER JOIN CourseScheduleTrainers cst ON cs.CourseScheduleID = cst.CourseScheduleID
INNER JOIN CourseScheduleAttendees csa ON cs.CourseScheduleID = csa.CourseScheduleID
INNER JOIN Employees e ON cst.TrainerID = e.EmployeesID
INNER JOIN Employees es ON csa.AttendeeID = es.EmployeesID', 5, 1),
 ('3.3 Add a new column after End Date headed “Check Date” which uses the DATEADD function to add 8 weeks to the Start Date column for BA Test courses and 12 weeks for any others. (5 marks)', 'SELECT cc.CourseName, cs.StartDate, cs.EndDate,
(SELECT CASE
WHEN cc.CourseName = "BA-Test" THEN DATEADD(WEEK, 8, cs.StartDate)
ELSE DATEADD(WEEK, 12, cs.StartDate) END) AS "CheckDate",
AcademyName, RoomName, e.FirstName + " "  + e.LastName AS "Trainers", LEFT(es.FirstName,1) + " " + LEFT(es.LastName,1) AS "Spartans" 
FROM CourseSchedule cs
INNER JOIN CourseCatalog cc ON cc.CourseID = cs.CourseID
INNER JOIN Academies a ON cs.AcademyID = a.AcademyID
INNER JOIN Rooms r ON cs.RoomID = r.RoomID
INNER JOIN CourseScheduleTrainers cst ON cs.CourseScheduleID = cst.CourseScheduleID
INNER JOIN CourseScheduleAttendees csa ON cs.CourseScheduleID = csa.CourseScheduleID
INNER JOIN Employees e ON cst.TrainerID = e.EmployeesID
INNER JOIN Employees es ON csa.AttendeeID = es.EmployeesID
', 5, 1),
 ('4.1 Add Primary Keys and Foreign Keys to the Sparta Academy database, where needed. (If not already included).', 'ALTER TABLE Rooms
ADD FOREIGN KEY (AcademyID) REFERENCES Academies(AcademyID);

ALTER TABLE CourseSchedule
ADD FOREIGN KEY (AcademyID) REFERENCES Academies(AcademyID);

ALTER TABLE CourseSchedule
ADD FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID);

ALTER TABLE CourseSchedule
ADD FOREIGN KEY (CourseID) REFERENCES CourseCatalog(CourseID);

ALTER TABLE CourseScheduleTrainers
ADD FOREIGN KEY (TrainerID) REFERENCES Employees(EmployeesID);

ALTER TABLE CourseScheduleAttendees
ADD FOREIGN KEY (AttendeeID) REFERENCES Employees(EmployeesID);

ALTER TABLE CourseScheduleTrainers
ADD FOREIGN KEY (CourseScheduleID) REFERENCES CourseSchedule(CourseScheduleID);

ALTER TABLE CourseScheduleAttendees
ADD FOREIGN KEY (CourseScheduleID) REFERENCES CourseSchedule(CourseScheduleID);', 8, 1),
 ('4.2 Add constraints for other tables including Trainer Type ("T" Trainer or "A" Training Assistant) and Employee Type ("T" Trainer, "S" Spartan) and set a maximum capacity for Rooms to 25.', 'ALTER TABLE Rooms
ALTER COLUMN Capacity INT;

ALTER TABLE Rooms
ADD  CHECK (Capacity<=25)

ALTER TABLE CourseScheduleTrainers
ADD CHECK(TrainerType ="A" OR TrainerType = "T")', 2, 1),