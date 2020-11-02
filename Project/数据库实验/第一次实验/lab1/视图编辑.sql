/* 在插入数据的Student基本表上为计算机科学与技术系的学生记录建立一个视图CS_STUDENT。*/
/*CREATE VIEW CS_STUDENT (sno,sname,sex,deptno,age)
AS SELECT sno,sname,sex,deptno,age
    FROM student
    WHERE student.deptno IN (SELECT dept.deptno
                             FROM dept
                             WHERE dept.dname = '计算机');*/
/*在操作结束后删除视图CS_STUDENT。*/
DROP VIEW CS_STUDENT
                