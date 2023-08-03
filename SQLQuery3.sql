create database TECH
create table Tbl_ROLE(Role_Id int primary key,Role_Name varchar(20))
create table Users(L_ID int primary key,First_Name varchar(20),Last_Name varchar(20),Email varchar(255),Contact_No numeric(10),User_ID varchar(50) unique,Password varchar(20),Role_Id int foreign key references Tbl_ROLE(Role_Id),Sign_IN_Time datetime default current_timestamp )
create table Time_Use(ID int primary key identity,L_ID int foreign key references Users(L_ID),User_Id varchar(50) foreign key references Users(user_id),Role_Id int foreign key references Tbl_ROLE(Role_id),Login_Time datetime default current_timestamp,LogOut_Time datetime,Use_Time datetime)
select * from Tbl_ROLE
select * from Users
select * from Time_Use
insert into Users(L_ID,First_Name,Last_Name,Email,Contact_No,User_ID,Password,Role_Id)values(2,'Manasi','Salunke','manasisalunke2003@gmail.com',9359466028,'manu_312','manu122#',2)
insert into Time_Use(L_ID,User_Id,Role_Id,LogOut_Time,Use_Time)values(2,'manu_312',2,'','')
CREATE VIEW UsersView AS
SELECT L_ID, First_Name, Last_Name, Email, Contact_No, User_ID, Role_Id
FROM Users;

select * from UsersView
CREATE TRIGGER Calculate_Use_Time
ON Time_Use
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE Time_Use
    SET Use_Time = ISNULL(LogOut_Time, GETDATE()) - Login_Time
    FROM inserted
    WHERE Time_Use.ID = inserted.ID;
END;