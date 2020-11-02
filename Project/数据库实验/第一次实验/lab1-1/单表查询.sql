/*查询所有学生的信息。*/
-- SELECT *
-- FROM student;
/*查询所有女生的姓名*/
-- SELECT sname
-- FROM student 
-- WHERE sex = 'f';
/*查询成绩在80到89之间的所有学生的选课记录,查询结果按成绩的降序排列。*/
-- SELECT sno,cno
-- FROM SC
-- WHERE grade >= 80 and grade <= 89
-- ORDER BY grade DESC
/* 查询各个系的学生人数*/
SELECT COUNT(student.deptno),dept.dname
FROM student,dept
WHERE student.deptno = dept.deptno
GROUP BY student.deptno;