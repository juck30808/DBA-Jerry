CREATE TABLE Student (
    sno INT PRIMARY KEY,
    sname CHAR(8) NOT NULL,
    sex CHAR(2),
    deptno INT);
CREATE TABLE Course(
    cno INT,
    cname CHAR(20) NOT NULL,
    tno INT,
    credit INT,
    PRIMARY KEY(cno,tno));
CREATE TABLE SC(
    sno INT,
    cno INT,
    PRIMARY KEY(sno,cno),
    grade INT);
CREATE TABLE Teacher(
    tno INT PRIMARY KEY,
    tname CHAR(8) NOT NULL,
    deptno INT);
CREATE TABLE Dept(
    deptno INT PRIMARY KEY,
    dname CHAR(20) NOT NULL);
