/*删除马阳同学的所有选课记录。*/
DELETE
FROM sc
WHERE '马阳' = 
        (SELECT sname
         FROM student
         WHERE student.sno = sc.sno);