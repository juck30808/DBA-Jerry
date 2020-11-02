select * from Student;
select SNAME from Student where SEX = 'f';
select * from SC where GRADE between 80 and 89 order by GRADE DESC;
SELECT DEPTNO,COUNT(*) FROM Student GROUP BY DEPTNO;