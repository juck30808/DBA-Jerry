select student.SNO
from student
where not exists ( select *
                    from sc sc1
                    where sc1.SNO = 1001 and
                        not exists ( select *
                                    from sc sc2
                                    where sc2.SNO = student.SNO
                                    and sc1.CNO = sc2.CNO
                                    )
                    )
                  