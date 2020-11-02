select dept.DNAME,student.DEPTNO,count(SNO)
from student,Dept
where student.DEPTNO = dept.DEPTNO
group by DEPTNO