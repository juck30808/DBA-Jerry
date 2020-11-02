/*********************************************************
 *********************** 视图操作 ************************
 *********************************************************/
/* 1. 建立视图 
 *** 在插入数据的Student基本表上为计算机科学与技术系
 *** 的学生记录建立一个视图CS_STUDENT。
 */
/*
create view cs_student (sno, sname, age, sex)
as 
select sno, sname, age, sex
from student, dept
where student.deptno = dept.deptno and
       dept.dname = '计算机';
*/
/*
select *
from cs_student;
*/
/* 2. 删除视图
 *** 在操作结束后删除视图CS_STUDENT。
 */

drop view cs_student;