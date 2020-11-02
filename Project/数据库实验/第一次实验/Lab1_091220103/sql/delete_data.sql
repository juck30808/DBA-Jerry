/*********************************************************
 *********************** 删除数据 ************************
 *********************************************************/
/* 删除马阳同学的所有选课记录。*/

select *
from sc, student
where sc.sno = student.sno and
       student.sname = '马阳'

/*
delete 
from    sc
where   sno  in 
                (
                select sno 
                from   student 
                where  student.sname = '马阳'
                );
*/    
