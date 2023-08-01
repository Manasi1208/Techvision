create database TECHVISION
create table Users(ID int primary key,Role varchar(10),First_Name varchar(20),Last_Name varchar(20),Email varchar(255),Contact_No numeric(10),User_ID varchar(50) unique,Password varchar(20),Sign_IN_Time datetime default current_timestamp )
INSERT INTO Signin (ID, Role, First_Name, Last_Name, Email, Contact_No, User_ID, Password)
VALUES
     (10, 'Guest', 'Emma', 'Brown', 'emma.brown@example.com', 1112223333, 'jane4856', 'pass123');
 select * from Users
