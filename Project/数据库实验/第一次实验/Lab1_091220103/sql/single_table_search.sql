/*********************************************************
 *********************** 单表查询 ************************
 *********************************************************/
/* [1] 查询所有学生的信息 */
/*
select *
from student;
*/
/* [2] 查询所有女生的姓名 */
/*
select sname
from student
where sex = 'f';
*/
/* [3] 查询成绩在 80 到 89 之间的所有学生选课记录，
 * 查询结果按成绩降序排列 
 */
/*
select *
from sc
where grade between 80 and 90
order by grade DESC;
*/
/* [4] 查询各个系的学生人数 */
select dname, COUNT(sno)
from student, dept
where student.deptno = dept.deptno
group by student.deptno;

