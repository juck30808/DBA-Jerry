--DataBase Experiment 2

-------------------------PART 1 创建模式-------------------------
--创建模式DBEXP2，统一管理即将创建的几张表
create schema DBEXP2;
-------------------------END OF PART 1-------------------------


-------------------------PART 2 创建表-------------------------
--创建员工表（Staff）
--第一次定义时，未含有Dept的外键的约束，因为此时还没有Dept表的定义
create table Staff (
	SNAME char(20) not null,
	SNO int not null,
	BIRTHDAY char(8) not null,
	ADDRESS char(50) not null,
	SALARY double not null,
	MNO int,
	DNO int,						--BOSS的MNO和DNO可以没有value
	primary key (SNO),				--set SNO as primary key

	constraint FK_STAFF_MNO foreign key (MNO) references Staff(SNO)
		on UPDATE restrict on DELETE set null
		--管理人员本身也是员工，所以要设置到本身的外键
		--on DELETE 设置为set null，因为当某个主管人员调离职位时，
		---在下任主管上任之前，可以设置为null，可以没有管理人员
	);
/*
	constraint FK_STAFF_DNO foreign key (DNO) references Dept(DNO)
		on UPDATE restrict on DELETE set null
		--设置到表Dept的外键DNO。
		--on DELETE 设置为set null，因为当某个部门解散时，
		---职员在转到其它部门前可以有一段时间没有所属部门
	--！！第一次定义时，这条语句不会通过，因为此时还没有创建Dept这张表
*/

--创建部门表（Dept）
create table Dept (
	DNAME char(20) not null,
	DNO int not null,
	MNO int,						--在下任主管上任之前，可以设置为null
	primary key (DNO),				--set DNO as primary key
	constraint FK_DEPT_MNO foreign key(MNO) references Staff(SNO)
		on UPDATE restrict on DELETE set null
		--on DELETE设置为set null，因为当某个主管人员调离职位时，
		--在下任主管上任之前，可以设置为null
	);

--此时部门表已经创建完成，在Staff中，可以创建Dept的外键，
---下面的语句就是在Staff中增加外键约束
alter table Staff 
	add constraint FK_STAFF_DNO foreign key (DNO) references Dept(DNO)
		on UPDATE restrict on DELETE set null;
		--设置Staff表的外键DNO，引用表Dept的DNO
		--on DELETE 设置为set null，因为当某个部门解散时，
		---职员在转到其它部门前可以有一段时间没有所属部门
--此时Staff已经完全创建好了

--创建项目表（Project）
create table Project(
	PNAME char(50) not null,
	PNO int not null,
	CITY char(20) not null,
	DNO int not null,
	primary key (PNO),				--set PNO as primary key
	
	constraint FK_PROJECT_DNO foreign key (DNO) references Dept(DNO)
		on UPDATE restrict on DELETE Cascade
		--设置到表Dept的外键DNO。
		--on DELETE 设置为cascade，因为当某个部门解散时，
		---这个项目也就随之放弃了，可以随之删去
	);
	

--创建工作表（JOB）
create table JOB(
	SNO int not null,
	PNO int not null,
	TIME int not null,		--这份合同的时长，单位是day
	primary key (SNO,PNO),		--set {SNO,PNO} as primary key
	
	constraint FK_JOB_SNO foreign key (SNO) references Staff(SNO)
		on UPDATE restrict on DELETE Cascade,
		--有工作的人本身就是员工，所以设置到Staff的外键。
		--on DELETE 设置为Cascade，因为放该员工离职时，
		---其工作也被撤销了，需要被删除
		
	constraint FK_JOB_PNO foreign key (PNO) references Project(PNO)
		on UPDATE restrict on DELETE Cascade
		--所有工作均是一个项目，所以要设置到Project的外键
		--on DELETE 设置为Cascade，因为当某个项目完成或者终止时，该项JOB也应该被注销
	);


--创建家属表（FMILIES）	
create table FAMILIES(
	SNO int not null,
	FMNAME char(20) not null,
	SEX char(6) not null,
	primary key(SNO,FMNAME),		--set {SNO,FMNAME} as primary key
		--不是将SNO作为主键，因为可能一个员工会注册多个家属
		--不是将FMNAME作为主键，因为可能有不同的员工有家属同名
	
	constraint SEX_VALUE check (SEX = 'female' or SEX = 'male'),
		--创建性别取值约束，SEX的取值只能为female或者male两种。
		
	constraint FK_FAMILIES_SNO foreign key (SNO) references Staff(SNO)
		on UPDATE restrict on DELETE Cascade
		--on DELETE 设置为Cascade，因为放该员工离职时，
		---其家属记录也应该被删去
	);
-------------------------END OF PART 2-------------------------


-------------------------PART 3 添加数据-------------------------
--这里为了符合实际世界的规则，采用下面的方式，添加具体数据
---1.添加部门数据，此时还没有实际员工，所以主管的那项全部为null
---2.添加员工数据，此时可以规定某些员工为某个部门的主管
---3.更新部门的数据表，添加具体的主管工号
---4.添加项目表数据
---5.添加工作表数据
---6.添加家属表数据

--此时还没有实际员工，所以主管的那项全部为null
INSERT INTO Dept VALUES
--(DNAME,			DNO,MNO)
('Design',			10,null),				--Department of Design
('Marketing',		20,null),				--Department of Marketing
('HumanResource',	30,null)				--Department of HR

--添加员工数据，此时可以规定某些员工为某个部门的主管
INSERT INTO Staff VALUES
--(SNMAE,	SNO, BIRTHDAY,  ADDRESS,			SOLARY,MNO,DNO)
('Smith',	1000,'19680608','GreatStreet 106',	30000,null,null),		--Boss
('Bob',		1001,'19781018','LongWall 23',		20000,1000,10),		--Dept 10 Manager
('Mark',	1002,'19721118','ManCack 21',		20000,1000,20),		--Dept 20 Manager
('Green',	1003,'19700327','LongWall 40',		20000,1000,30),		--Dept 30 Manager
('Yorky',	1004,'19700227','ShortMell 90',		10000,1001,10),		--Dept 10 Staff
('Milk',	1005,'19710227','SoMell 102',		10000,1001,10),		--Dept 10 Staff
('Jam',		1006,'19800310','TomHall 34',		10000,1002,20),		--Dept 20 Staff
('Nancy',	1007,'19790212','LintonPark 73',	10000,1002,20),		--Dept 20 Staff
('Wallet',	1008,'19800513','MonkeyD 24',		10000,1003,30),		--Dept 30 Staff
('Tylan',	1009,'19790809','TunDa 79',			10000,1003,30)		--Dept 30 Staff

--更新部门的数据表，添加具体的主管工号
UPDATE Dept SET MNO=1001 WHERE DNO=10;
UPDATE Dept SET MNO=1002 WHERE DNO=20;
UPDATE Dept SET MNO=1003 WHERE DNO=30;

--添加项目表数据
INSERT INTO Project VALUES
--(PNAME,			PNO,CITY,		DNO)
('Project Lumia',	100,'NewYork',	10),
('Project Kindom',	200,'Beijing',	10),
('Project Monkey',	300,'Tokyo',	20),
('Project Banana',	400,'ShenZhen',	30)

--添加工作表数据
INSERT INTO JOB VALUES
--(SNO,	PNO,	TIME)
(1001,	100,	30),
(1004,	100,	30),
(1001,	200,	60),
(1005,	200,	60),
(1002,	300,	60),
(1006,	300,	60),
(1007,	300,	60),
(1003,	400,	65),
(1008,	400,	65),
(1009,	400,	65)

--添加家属表数据
INSERT INTO FAMILIES VALUES
--(SNO,FMNAME,	SEX)
(1000,'Merry',	'female'),
(1001,'Tom',	'male'),
(1001,'Lily',	'female'),
(1002,'HanMei',	'female'),
(1007,'Pom',	'male')

--到此时为止，已在上面的5张表中都添加了适量的数据，
---下面进行一些操作，违反之前定义好的数据约束，观测结果
----------case 1 插入数据的主键的值为空或者重复----------
INSERT INTO Staff VALUES 
	('Tylan',	null,'19790809','TunDa 79',			10000,1003,30)		--主键为null
INSERT INTO Staff VALUES 
	('abc',	1009,'19790809','TunDa 79',			10000,1003,30)		--主键重复

----------case 2 插入数据破坏属性值的取值范围----------
INSERT INTO FAMILIES VALUES
	(1009,'Mary',	'Women')		--在SEX_VALUE的约束下,SEX的取值只能是female或者male
	
----------case 3 外键设置时，DELETE的方式为Cascade----------
DELETE FROM Staff Where SNO = 1007;
--此时，可以看到在FAMILIES，JOB中含有SNO=1007的项同时被删除

----------case 4 外键设置时，DELETE的方式为set null----------
--假设工号为1003的职员被撤职（1003是Dept30的主管）
DELETE FROM Staff Where SNO = 1003;
--此时，可以看到在Staff中，原先由1003主管的1008，1009的管理人员的工号为null
---Dept中Dept30的主管为null（等待新的主管接替）

----------case 5 外键设置时，UPDATE的方式为Restrict----------
--假设上级命令，将Dept10的部门号改为40
UPDATE Dept SET DNO=40 WHERE DNO=10;
--由于Staff、Project的外键设置的UPDATE均为Restrict，所以这项更新会报错。
--为了防止出现错误的情况（如所有属于部门10的员工突然失业...），这样做，是有必要的。

-------------------------END OF PART 3-------------------------


-------------------------PART 4 创建触发器-------------------------
--创建一个触发器，当职工参加一个新的项目时，年薪增加2%
create trigger inc_salary 
	after insert on JOB
	referencing NEW as N
	for each row mode DB2SQL
		update Staff 
		set Staff.SALARY = Staff.SALARY * 1.02
		where Staff.SNO = N.SNO;

--给1004增加一个JOB，对应的项目为200
INSERT INTO JOB VALUES (1004,200,30)		
--1004的年薪应该从原来的10000涨为10200.

-------------------------END OF PART 4-------------------------


-------------------------PART 5 创建授权新用户-------------------------
--断开先前的连接，使用新的用户db2admin登录，再进行访问操作
disconnect current;
connect to MYDB1 user db2admin using ********;
select * from "DBEXP2".JOB;
--结果是："DB2ADMIN" 不具有对对象 "DBEXP2.JOB" 执行操作 "SELECT"的必需权限或特权。

--重新以MOMO的用户名连接，进行相应的授权
disconnect current;
connect to MYDB1;
grant SELECT on "DBEXP2".JOB
	to db2admin with grant option

--重新使用db2admin进行连接，在进行同样的查询
disconnect current;
connect to MYDB1 user db2admin using ********;--×××处为对应的密码
select * from "DBEXP2".JOB;
--得到正确的结果
		
--回到MOMO的连接，可以回收权限，使用下面的语句
---disconnect current;
---connect to MYDB1;
---revoke select on "DBEXP2".JOB from db2admin；
-------------------------END OF PART 5-------------------------


--附：额外的命令，用于删除刚才创建的5张表
drop table Staff;
drop table Dept;
drop table Project;
drop table Job;
drop table Families; 
