CREATE VIEW CS_STUDENT (SNO,SNAME,SEX)
As  select student.SNO,student.SNAME,student.SEX
    from student
    where student.DEPTNO in ( select dept.DEPTNO
                                from dept
                                where dept.DNAME = 'Computerscience')