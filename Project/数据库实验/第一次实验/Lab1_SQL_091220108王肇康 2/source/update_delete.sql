--update:
UPDATE SC 
SET GRADE = GRADE + 2 WHERE SC.CNO IN
		(SELECT Course.CNO FROM Course WHERE Course.CNAME = '���ݽṹ' AND Course.TNO IN
							(SELECT Teacher.TNO FROM Teacher WHERE TNAME = '����')
		);
--delete:
DELETE FROM SC WHERE SC.SNO IN (
		SELECT Student.SNO FROM Student WHERE Student.SNAME = '����' );
--view:
CREATE VIEW CS_STUDENT 
	AS SELECT * FROM Student WHERE Student.DEPTNO IN (
					SELECT DEPTNO FROM Dept WHERE DNAME = '�����');
					
DROP VIEW CS_STUDENT;

--DELETE ALL:
DROP TABLE Student,Course,SC,Teacher,Dept;
