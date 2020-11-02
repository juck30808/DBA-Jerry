--update:
UPDATE SC 
SET GRADE = GRADE + 2 WHERE SC.CNO IN
		(SELECT Course.CNO FROM Course WHERE Course.CNAME = '数据结构' AND Course.TNO IN
							(SELECT Teacher.TNO FROM Teacher WHERE TNAME = '张星')
		);
--delete:
DELETE FROM SC WHERE SC.SNO IN (
		SELECT Student.SNO FROM Student WHERE Student.SNAME = '马阳' );
--view:
CREATE VIEW CS_STUDENT 
	AS SELECT * FROM Student WHERE Student.DEPTNO IN (
					SELECT DEPTNO FROM Dept WHERE DNAME = '计算机');
					
DROP VIEW CS_STUDENT;

--DELETE ALL:
DROP TABLE Student,Course,SC,Teacher,Dept;
