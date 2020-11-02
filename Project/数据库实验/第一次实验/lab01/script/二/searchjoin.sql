select student.SNAME,student.AGE
from dept,student
where dept.DEPTNO = student.DEPTNO 
    and dept.DNAME = 'Information'
    and student.SEX = 'f'
    and student.AGE <= 21