/*查询信息系年龄在21岁以下(含21岁)的女生姓名及其年龄。*/
SELECT student.sname
FROM student,dept
WHERE student.deptno = dept.deptno and dept.dname = '信息' 
        and student.age >= 20;