/*********************************************************
 ********************** 建立基本表 ***********************
 *********************************************************/
/* [1] 创建学生表Student，由以下属性组成：
 *** 学号SNO（INT型，主键）
 *** 姓名SNAME（CHAR型，长度为8，非空）
 *** 性别SEX（CHAR型，长度为2）
 *** 所在系DEPTNO（INT型）
 */

create table Student 
( 
    sno int,
    sname char(8) not null,
    sex char(2),
    deptno int,
    primary key (sno)
);

/* [2] 创建课程表Course，由以下属性组成：
 *** 课程号CNO（INT型）
 *** 课程名CNAME（CHAR型，长度为20，非空）
 *** 授课教师编号TNO（INT型）
 *** 学分CREDIT（INT型）
 *** 其中（CNO，TNO）为主键。
 */
create table Course
( 
    cno int,
    cname char(20) not null,
    tno int,
    credit int,
    primary key (cno, tno)
);
 
/* [3] 创建学生选课表SC，由以下属性组成：
 *** 学号SNO，课程号CNO，成绩GRADE
 *** 所有属性均为INT型，其中（SNO，CNO）为主键
 */
create table SC
( 
    sno int,
    cno int,
    grade int,
    primary key (sno, cno)
);

/* [4] 创建教师表Teacher，由以下属性组成：
 *** 教师编号TNO（INT型，主键）
 *** 教师姓名TNAME（CHAR型，长度为8，非空）
 *** 所在系DEPTNO（INT型）。
 */
create table Teacher
( 
    tno int,
    tname char(8) not null,
    deptno int
);
 
/* [5] 创建系表Dept，由以下属性组成：
 *** 系号DEPTNO（INT型，主键）
 *** 系名DNAME（CHAR型，长度为20，非空）
 */
create table Dept
( 
    deptno int,
    dname char(20) not null
);