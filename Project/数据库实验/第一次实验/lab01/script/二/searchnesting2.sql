select student.SNAME,sc.GRADE
from sc,student
where sc.SNO = student.SNO 
    and sc.GRADE >= ALL (select sccopy.GRADE
                        from sc sccopy
                        where sccopy.CNO = sc.CNO)