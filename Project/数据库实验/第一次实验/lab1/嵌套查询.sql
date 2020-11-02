/*[1] 查询修课总学分在10分以下的学生姓名。*/
-- SELECT student.sname
-- FROM student
-- WHERE student.sno IN
--     (SELECT sc.sno
--     FROM sc,course
--     WHERE sc.cno = course.cno
--     GROUP BY sc.sno
--     HAVING SUM(course.credit) <= 10);
/*[2] 查询各门课程取得最高成绩的学生姓名及其成绩。*/
SELECT student.sname, sc.grade
FROM student, sc
WHERE student.sno = sc.sno and
        sc.grade IN(
                  SELECT MAX(sc2.grade)
                  FROM sc sc2
                  WHERE sc.cno = sc2.cno
                  GROUP BY sc2.cno);
/*[3] 查询选修了1001学生选课的全部课程的学生学号。*/
-- SELECT sno
-- FROM sc 
-- WHERE  NOT EXISTS
--     (SELECT sc2.cno
--      FROM sc sc2
--      where sc2.sno = 1001 and NOT EXISTS
--                     (SELECT sc1.cno
--                     FROM sc sc1
--                     WHERE sc1.sno = sc.sno and
--                         sc1.cno = sc2.cno))
-- GROUP BY sno;
/*[4] 查询选修了张星老师开设的全部课程的学生姓名。*/
-- SELECT student.sname
-- FROM student
-- WHERE student.sno IN
--     (SELECT sc.sno
--     FROM sc
--     WHERE NOT EXISTS
--     (SELECT sc2.cno
--      FROM sc sc2,teacher
--      WHERE sc2.cno = teacher.tno and teacher.tname = '张亮' and NOT EXISTS
--                 (SELECT sc1.cno
--                 FROM sc sc1
--                 WHERE sc1.sno = sc.sno and 
--                     sc1.cno = sc2.cno))
--     GROUP BY sno);
                    