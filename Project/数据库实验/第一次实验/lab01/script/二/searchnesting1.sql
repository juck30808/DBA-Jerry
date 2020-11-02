select student.SNAME
from student
where 10 > (select sum(course.CREDIT)
            from Course,sc
            where sc.SNO = student.SNO
                and sc.CNO = course.CNO )