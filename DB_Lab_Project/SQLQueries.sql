﻿create database DBLabProject
use DBLabProject;

create table Classroom
(
    classroomID int IDENTITY(1,1) not null,
    classroomName varchar(20) not null,
    classroomCode varchar(20) not null unique,
    teacherUsername varchar(20) not null,
    -- Primary key
    primary key (classroomID),
    -- Foreign key
    foreign key (teacherUsername) references tblUser(username)

)

create table tblUser
(
    username varchar(20) not null,
    password varchar(20) not null,
    name varchar(20) not null,
    role varchar(20) not null,
    isActive bit not null,
    check (role in ('Student', 'Teacher', 'Admin')),
    -- Primary key  
    primary key (username)
)

create table ClassroomAndStudent
(
    -- username from User
    studentusername varchar(20) not null,
    -- classroomID from Classroom
    classroomID int not null,
    -- Primary key
    primary key (studentusername, classroomID),
    -- Foreign key
    foreign key (studentusername) references tblUser(username),
    foreign key (classroomID) references Classroom(classroomID)
)

create table Announcement
(
    announcementID int IDENTITY(1,1) not null,
    announcementDescription varchar(100) not null,
    announcementDate date not null,
    username_Teacher varchar(20) not null,
    classroomID int not null,
    -- Primary key
    primary key (announcementID),
    -- Foreign key
    foreign key (username_Teacher) references tblUser(username),
    foreign key (classroomID) references Classroom(classroomID)
)

create table Material
(
    materialID int IDENTITY(1,1) not null,
    materialDescription varchar(100) not null,
    materialType varchar(100) not null,
    username_Teacher varchar(20) not null,
    classroomID int not null,
    -- Primary key
    primary key (materialID),
    -- Foreign key
    foreign key (username_Teacher) references tblUser(username),
    foreign key (classroomID) references Classroom(classroomID)
)

create table Assignment
(
    assignmentID int IDENTITY(1,1) not null,
    assignmentDescription varchar(100) not null,
    assignmentPoints int not null,
    assignmentDueDate date ,
    assignmentFile varchar(100),
    classroomID int not null,
    username_Teacher varchar(20) not null,
    -- Primary key 
    primary key (assignmentID),
    -- Foreign key
    foreign key (username_Teacher) references tblUser(username),
    foreign key (classroomID) references Classroom(classroomID)
)

select * from Assignment

CREATE TABLE Submissions
(
    -- username from User
    studentusername varchar(20) not null,
    -- assignmentID from Assignment
    assignmentID int not null,
    submissionFile varchar(100),
    submissionDate date,
    submissionPoints int,
    -- Primary key
    primary key (studentusername, assignmentID),
    -- Foreign key
    foreign key (studentusername) references tblUser(username),
    foreign key (assignmentID) references Assignment(assignmentID),
)

create table Comment
(
    commentID int IDENTITY(1,1) not null,
    commentDescription varchar(100) not null,
    commentDate date not null,
    assignmentID int not null,
    -- Primary key
    primary key (commentID),
    -- Foreign key
    foreign key (assignmentID) references Assignment(assignmentID)
)

