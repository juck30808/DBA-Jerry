

CREATE TABLE Student
(SNO INT PRIMARY KEY,
SNAME  CHAR(5) NOT NULL,
SEX  CHAR(2) ,
DEPTNO INT
);

CREATE TABLE Course (
CNO INT ,
CNAME CHAR(20) NOT NULL,
TNO INT ,
CREDIT INT,
PRIMARY KEY (CNO,TNO)
);

CREATE TABLE SC (
SNO INT ,
CNO INT ,
GRADE INT,
PRIMARY KEY (SNO,CNO)
);

CREATE TABLE Teacher (
TNO INT PRIMARY KEY,
TNAME CHAR(8) NOT NULL,
DEPTNO INT
);



CREATE TABLE Dept (
DEPTNO INT PRIMARY KEY,
DNAME CHAR(20) NOT NULL
);

ALTER TABLE Student ADD AGE INT;

ALTER TABLE Student DROP AGE;
ALTER TABLE Student ADD AGE SMALLINT;

INSERT INTO Student VALUES ( '1001', '张天', 'm', '10', '20');
INSERT INTO Student VALUES ( '1002', '李兰', 'f', '10', '21');
INSERT INTO Student VALUES ( '1003', '陈铭', 'm', '10', '21');
INSERT INTO Student VALUES ( '1004', '刘茜', 'f', '20', '21');
INSERT INTO Student VALUES ( '1005', '马阳', 'm', '20', '22');

INSERT INTO Course VALUES ('1', '数据结构', '101','4');
INSERT INTO Course VALUES ('2', '数据库', '102', '4');
INSERT INTO Course VALUES ('3', '离散数学', '103', '4');
INSERT INTO Course VALUES ('4', 'C语言程序设计', '101', '2');

INSERT INTO SC VALUES ('1001', '1', '80');
INSERT INTO SC VALUES ('1001', '2', '85');
INSERT INTO SC VALUES ('1001', '3', '78');
INSERT INTO SC VALUES ('1002', '1', '78');
INSERT INTO SC VALUES ('1002', '2', '82');
INSERT INTO SC VALUES ('1002', '3', '86');
INSERT INTO SC VALUES ('1003', '1', '92');
INSERT INTO SC VALUES ('1003', '3', '90');
INSERT INTO SC VALUES ('1004', '1', '87');
INSERT INTO SC VALUES ('1004', '4', '90');
INSERT INTO SC VALUES ('1005', '1', '85');
INSERT INTO SC VALUES ('1005', '4', '92');

INSERT INTO Teacher VALUES ('101', '张星', '10');
INSERT INTO Teacher VALUES ('102', '李珊', '10');
INSERT INTO Teacher VALUES ('103', '赵应', '10');
INSERT INTO Teacher VALUES ('104', '刘田', '20');

INSERT INTO Dept VALUES ('10', '计算机');
INSERT INTO Dept VALUES ('20', '信息');

SELECT * FROM Student;
SELECT SNAME FROM Student WHERE SEX = 'f';
SELECT * FROM SC WHERE GRADE BETWEEN 80 AND 89 ORDER BY GRADE DESC;
SELECT COUNT(*) FROM Student WHERE DEPTNO = 10;
SELECT COUNT(*) FROM Student WHERE DEPTNO = 20;

SELECT SNAME,AGE FROM Student WHERE SEX = 'f' AND AGE < 22;

    
SELECT SNAME,AGE
FROM Student,Dept
WHERE Course.CNO=SC.CNO AND Student.SNO=SC.SNO
group BY SNAME
having SUM(CREDIT)<10;

SELECT SNAME,GRADE 
FROM Student,SC SC1 
WHERE Student.SNO=SC1.SNO
AND SC1.GRADE=(SELECT MAX(GRADE)
                FROM SC SC2
                WHERE SC2.CNO=SC1.CNO);


SELECT DISTINCT SNO
FROM SC
WHERE CNO=any(SELECT CNO
                FROM SC
                WHERE SNO='1001')
    AND SNO != '1001';
                
SELECT SNAME
FROM  Student
WHERE SNO IN (SELECT SC.SNO
                FROM SC
                WHERE SC.CNO IN (SELECT Course.CNO
                                FROM Course
                                WHERE Course.TNO IN(SELECT Teacher.TNO
                                                    FROM Teacher
                                                    WHERE Teacher.TNAME = '张星')
                                 )
              );
              
              
 UPDATE SC
 SET GRADE = GRADE + 2
 WHERE CNO IN ( SELECT Course.CNO
                FROM Course
                WHERE Course.CNAME = '数据结构');
              
DELETE
FROM SC
WHERE SNO IN (SELECT Student.SNO 
                FROM Student 
                WHERE Student.SNAME='马阳'); 
                                                
CREATE VIEW CS_STUDENT(SNO,SNAME,SEX,DEPTNO,AGE)
        AS (SELECT *
            FROM Student
            WHERE DEPNO = '10');
            
DROP VIEW CS_STUDENT;

DROP TABLE Student;
DROP TABLE Course;
DROP TABLE SC;
DROP TABLE Teacher;
DROP TABLE Dept;