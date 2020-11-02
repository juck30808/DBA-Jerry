/*********************************************************
 *********************** 嵌套查询 ************************
 *********************************************************/
/* [1] 查询修课总学分在10分以下的学生姓名。*/
/*
select sname
from  student
where sno in 
            (
            select sno
            from sc, course
            where sc.cno = course.cno
            group by sno
            having sum(course.credit) < 10
            );
*/
/* [2] 查询各门课程取得最高成绩的学生姓名及其成绩。*/
/*
select    student.sname, sc1.cno, sc1.grade
from      student, sc sc1
where     student.sno = sc1.sno and
          sc1.grade in ( 
                        SELECT  max(sc2.grade)
                        FROM    sc sc2
                        where sc1.cno = sc2.cno
                        group by cno
                        );
*/
/*
select student.sname, sc1.cno, sc1.grade
from student, sc sc1,
        (
        select cno, max(grade) grade 
        from sc sc2
        group by sc2.cno
        ) temp
where sc1.sno = student.sno and
      sc1.cno = temp.cno and
      sc1.grade = temp.grade;
*/
/* [3] 查询选修了1001学生选课的全部课程的学生学号。*/
/*
select sc.sno
from sc
where 
    contains(
            (
            select sc1.cno 
            from sc sc1
            where sc1.sno = sc.sno
            ),
            (
            select sc2.cno 
            from sc sc2
            where sc2.sno = 1001
            ));
*/
/*
select sno
from sc
where not exists 
        (
        select sc2.cno 
        from sc sc2
        where sc2.sno = 1001 and not exists
                                            (
                                            select sc1.cno 
                                            from sc sc1
                                            where sc1.sno = sc.sno and
                                                  sc1.cno = sc2.cno
                                            )
        )
group by sno;
*/

/* [4] 查询选修了张星老师开设的全部课程的学生姓名。*/
/*
select sname
from student
where (
            select sc1.cno
            from sc sc1
            where student.sno = sc1.sno and
            not exists 
                    (
                    select course.cno
                    from teacher, course
                    where  course.tno = teacher.tno and
                           teacher.tname = '张星'
                    )
            );
*/
select sname
from student
where not exists 
        (
        select course.cno
        from teacher, course
        where  course.tno = teacher.tno and
               teacher.tname = '张星' and 
               not exists
                        (
                        select sc.cno
                        from sc
                        where student.sno = sc.sno and
                               sc.cno = course.cno
                        )
        );




