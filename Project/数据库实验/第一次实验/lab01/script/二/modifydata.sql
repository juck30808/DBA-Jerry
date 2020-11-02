update sc
set sc.GRADE = sc.GRADE + 2
where sc.CNO in ( select course.CNO
                    from course
                    where course.CNAME = 'Datastructure'
                    and course.TNO in (select teacher.TNO
                                        from teacher
                                        where teacher.TNAME = 'ZhangXin'))