delete from sc
where sc.SNO in (select student.SNO
                    from student
                    where student.SNAME = 'MaYang')