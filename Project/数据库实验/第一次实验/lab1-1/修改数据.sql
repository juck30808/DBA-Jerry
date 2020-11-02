/*将张星老师数据结构课的学生成绩全部加2分。*/
UPDATE sc
SET sc.grade = sc.grade + 2
WHERE sc.cno IN (SELECT  course.cno 
                FROM course
                WHERE course.cname = '数据结构');