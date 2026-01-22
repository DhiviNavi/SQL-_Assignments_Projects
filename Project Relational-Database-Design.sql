/*
Problem Statement:
How to convert a relational design into tables in SQL Server?
Topics:
In this project, you will work on converting a relational design that enlists various
users, their roles, user accounts and their statuses into different tables in SQL
Server and insert data into them. Having at least two rows in each of the tables,
you have to ensure that you have created respective foreign keys.
Tasks To Be Performed:
● Define relations/attributes
● Define primary keys
● Create foreign keys*/

USe Assignments
--Create tables

Create table Role 
(Id Int Primary key, 
Role_Name Varchar(100))


Create table User_Has_Role
(Id Int Primary Key,
Role_Start_time Datetime, 
Role_End_Time Datetime Not null,
User_Account_Id Int,
RoleId int,
Constraint FK_UseraccountId Foreign key(User_Account_Id) references User_Account(Id),
Constraint FK_RoleId Foreign key(RoleId) references Role(ID))



Create table User_Account
(Id Int Primary key, 
UserName Varchar(100),
Email Varchar(254),
Password Varchar(200),
Password_Salt Varchar(50) Not Null,
Password_Hash_Algorithm Varchar(50));



Create table User_Has_Status
(Id Int Primary key,
Status_start_time DateTime,
Status_End_time DateTime Not Null,
User_Account_ID Int,
StatusId Int,
Constraint FK_User_AccountID Foreign key(User_Account_Id) References User_Has_Role(Id),
Constraint FK_Status Foreign key(StatusID) References Status(Id));



Create table Status
(Id int Primary key,
Status_Name Varchar(100),
Is_User_Working Bit);




--Insert the table into respective tables

Insert into Role(Id,Role_Name) 
Values(1,'Accounts'),(2,'Admin'),(3,'Sales');

Select * from Role

Insert into User_Has_Role
(ID,Role_Start_time,Role_End_Time,User_Account_Id,RoleId)
Values
(101,'02-20-2021','02-03-2023',1111,1),
(102,'03-04-2021','04-05-2023',1012,2);

Select * From User_Has_Role


INSERT INTO User_Account VALUES
(1111,'Dhivya','dhivi@gmail.com', 'dhnavi', 'dhivi', 'ACC001'),
(1012,'Dhivya','navi@gmail.com', 'dhivya', 'divinavi', 'ACC002');

Select * from User_Account


Insert into User_Has_Status
Values
(120,'09-04-23','09-04-2025',101,200),
(122,'07-04-23','05-05-2025',102,201)

Select * from User_Has_Role

Insert into Status Values
(200,'Active',1),
(201,'InActive',0)

Select * from Status


3-- Delete all rows in all table

Delete from User_Has_Status;
Delete from  User_Has_Role;
Delete from  User_Account;
Delete from  Role;
Delete from  Status;