select student.SNAME
from student
where not exists ( select *
                    from course,teacher
                    where course.TNO = teacher.TNO
                        and teacher.TNAME = 'ZhangXin'
                        and not exists ( select *
                                    from sc
                                    where sc.CNO = course.CNO
                                    and sc.SNO = student.SNO
                                    )
                    )
                  