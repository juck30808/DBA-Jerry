/*********************************************************
 *********************** 修改数据 ************************
 *********************************************************/
/* 将张星老师数据结构课的学生成绩全部加2分。*/
/*
select *
from sc;
*/
/*
update sc
set grade = grade + 2
where sc.cno in 
            (
            select course.cno
            from course, teacher
            where course.cname = '数据结构' and   
                   course.tno = teacher.tno and   
                   teacher.tname = '张星'
            );
*/
select *
from sc;
