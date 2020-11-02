/*********************************************************
 *********************** 连接查询 ************************
 *********************************************************/
/* 查询信息系年龄在21岁以下(含21岁)的女生姓名及其年龄 */
select sname, age
from student
where student.sex = 'f' and
      student.age <= 21  and
      student.deptno in
                        (
                        select deptno 
                        from dept 
                        where dept.dname = '信息'
                        );
      