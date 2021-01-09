--DataBase Experiment 2

-------------------------PART 1 ����ģʽ-------------------------
--����ģʽDBEXP2��ͳһ�����������ļ��ű�
create schema DBEXP2;
-------------------------END OF PART 1-------------------------


-------------------------PART 2 ������-------------------------
--����Ա����Staff��
--��һ�ζ���ʱ��δ����Dept�������Լ������Ϊ��ʱ��û��Dept��Ķ���
create table Staff (
	SNAME char(20) not null,
	SNO int not null,
	BIRTHDAY char(8) not null,
	ADDRESS char(50) not null,
	SALARY double not null,
	MNO int,
	DNO int,						--BOSS��MNO��DNO����û��value
	primary key (SNO),				--set SNO as primary key

	constraint FK_STAFF_MNO foreign key (MNO) references Staff(SNO)
		on UPDATE restrict on DELETE set null
		--������Ա����Ҳ��Ա��������Ҫ���õ���������
		--on DELETE ����Ϊset null����Ϊ��ĳ��������Ա����ְλʱ��
		---��������������֮ǰ����������Ϊnull������û�й�����Ա
	);
/*
	constraint FK_STAFF_DNO foreign key (DNO) references Dept(DNO)
		on UPDATE restrict on DELETE set null
		--���õ���Dept�����DNO��
		--on DELETE ����Ϊset null����Ϊ��ĳ�����Ž�ɢʱ��
		---ְԱ��ת����������ǰ������һ��ʱ��û����������
	--������һ�ζ���ʱ��������䲻��ͨ������Ϊ��ʱ��û�д���Dept���ű�
*/

--�������ű�Dept��
create table Dept (
	DNAME char(20) not null,
	DNO int not null,
	MNO int,						--��������������֮ǰ����������Ϊnull
	primary key (DNO),				--set DNO as primary key
	constraint FK_DEPT_MNO foreign key(MNO) references Staff(SNO)
		on UPDATE restrict on DELETE set null
		--on DELETE����Ϊset null����Ϊ��ĳ��������Ա����ְλʱ��
		--��������������֮ǰ����������Ϊnull
	);

--��ʱ���ű��Ѿ�������ɣ���Staff�У����Դ���Dept�������
---�������������Staff���������Լ��
alter table Staff 
	add constraint FK_STAFF_DNO foreign key (DNO) references Dept(DNO)
		on UPDATE restrict on DELETE set null;
		--����Staff������DNO�����ñ�Dept��DNO
		--on DELETE ����Ϊset null����Ϊ��ĳ�����Ž�ɢʱ��
		---ְԱ��ת����������ǰ������һ��ʱ��û����������
--��ʱStaff�Ѿ���ȫ��������

--������Ŀ��Project��
create table Project(
	PNAME char(50) not null,
	PNO int not null,
	CITY char(20) not null,
	DNO int not null,
	primary key (PNO),				--set PNO as primary key
	
	constraint FK_PROJECT_DNO foreign key (DNO) references Dept(DNO)
		on UPDATE restrict on DELETE Cascade
		--���õ���Dept�����DNO��
		--on DELETE ����Ϊcascade����Ϊ��ĳ�����Ž�ɢʱ��
		---�����ĿҲ����֮�����ˣ�������֮ɾȥ
	);
	

--����������JOB��
create table JOB(
	SNO int not null,
	PNO int not null,
	TIME int not null,		--��ݺ�ͬ��ʱ������λ��day
	primary key (SNO,PNO),		--set {SNO,PNO} as primary key
	
	constraint FK_JOB_SNO foreign key (SNO) references Staff(SNO)
		on UPDATE restrict on DELETE Cascade,
		--�й������˱������Ա�����������õ�Staff�������
		--on DELETE ����ΪCascade����Ϊ�Ÿ�Ա����ְʱ��
		---�乤��Ҳ�������ˣ���Ҫ��ɾ��
		
	constraint FK_JOB_PNO foreign key (PNO) references Project(PNO)
		on UPDATE restrict on DELETE Cascade
		--���й�������һ����Ŀ������Ҫ���õ�Project�����
		--on DELETE ����ΪCascade����Ϊ��ĳ����Ŀ��ɻ�����ֹʱ������JOBҲӦ�ñ�ע��
	);


--����������FMILIES��	
create table FAMILIES(
	SNO int not null,
	FMNAME char(20) not null,
	SEX char(6) not null,
	primary key(SNO,FMNAME),		--set {SNO,FMNAME} as primary key
		--���ǽ�SNO��Ϊ��������Ϊ����һ��Ա����ע��������
		--���ǽ�FMNAME��Ϊ��������Ϊ�����в�ͬ��Ա���м���ͬ��
	
	constraint SEX_VALUE check (SEX = 'female' or SEX = 'male'),
		--�����Ա�ȡֵԼ����SEX��ȡֵֻ��Ϊfemale����male���֡�
		
	constraint FK_FAMILIES_SNO foreign key (SNO) references Staff(SNO)
		on UPDATE restrict on DELETE Cascade
		--on DELETE ����ΪCascade����Ϊ�Ÿ�Ա����ְʱ��
		---�������¼ҲӦ�ñ�ɾȥ
	);
-------------------------END OF PART 2-------------------------


-------------------------PART 3 �������-------------------------
--����Ϊ�˷���ʵ������Ĺ��򣬲�������ķ�ʽ����Ӿ�������
---1.��Ӳ������ݣ���ʱ��û��ʵ��Ա�����������ܵ�����ȫ��Ϊnull
---2.���Ա�����ݣ���ʱ���Թ涨ĳЩԱ��Ϊĳ�����ŵ�����
---3.���²��ŵ����ݱ���Ӿ�������ܹ���
---4.�����Ŀ������
---5.��ӹ���������
---6.��Ӽ���������

--��ʱ��û��ʵ��Ա�����������ܵ�����ȫ��Ϊnull
INSERT INTO Dept VALUES
--(DNAME,			DNO,MNO)
('Design',			10,null),				--Department of Design
('Marketing',		20,null),				--Department of Marketing
('HumanResource',	30,null)				--Department of HR

--���Ա�����ݣ���ʱ���Թ涨ĳЩԱ��Ϊĳ�����ŵ�����
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

--���²��ŵ����ݱ���Ӿ�������ܹ���
UPDATE Dept SET MNO=1001 WHERE DNO=10;
UPDATE Dept SET MNO=1002 WHERE DNO=20;
UPDATE Dept SET MNO=1003 WHERE DNO=30;

--�����Ŀ������
INSERT INTO Project VALUES
--(PNAME,			PNO,CITY,		DNO)
('Project Lumia',	100,'NewYork',	10),
('Project Kindom',	200,'Beijing',	10),
('Project Monkey',	300,'Tokyo',	20),
('Project Banana',	400,'ShenZhen',	30)

--��ӹ���������
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

--��Ӽ���������
INSERT INTO FAMILIES VALUES
--(SNO,FMNAME,	SEX)
(1000,'Merry',	'female'),
(1001,'Tom',	'male'),
(1001,'Lily',	'female'),
(1002,'HanMei',	'female'),
(1007,'Pom',	'male')

--����ʱΪֹ�����������5�ű��ж���������������ݣ�
---�������һЩ������Υ��֮ǰ����õ�����Լ�����۲���
----------case 1 �������ݵ�������ֵΪ�ջ����ظ�----------
INSERT INTO Staff VALUES 
	('Tylan',	null,'19790809','TunDa 79',			10000,1003,30)		--����Ϊnull
INSERT INTO Staff VALUES 
	('abc',	1009,'19790809','TunDa 79',			10000,1003,30)		--�����ظ�

----------case 2 ���������ƻ�����ֵ��ȡֵ��Χ----------
INSERT INTO FAMILIES VALUES
	(1009,'Mary',	'Women')		--��SEX_VALUE��Լ����,SEX��ȡֵֻ����female����male
	
----------case 3 �������ʱ��DELETE�ķ�ʽΪCascade----------
DELETE FROM Staff Where SNO = 1007;
--��ʱ�����Կ�����FAMILIES��JOB�к���SNO=1007����ͬʱ��ɾ��

----------case 4 �������ʱ��DELETE�ķ�ʽΪset null----------
--���蹤��Ϊ1003��ְԱ����ְ��1003��Dept30�����ܣ�
DELETE FROM Staff Where SNO = 1003;
--��ʱ�����Կ�����Staff�У�ԭ����1003���ܵ�1008��1009�Ĺ�����Ա�Ĺ���Ϊnull
---Dept��Dept30������Ϊnull���ȴ��µ����ܽ��棩

----------case 5 �������ʱ��UPDATE�ķ�ʽΪRestrict----------
--�����ϼ������Dept10�Ĳ��źŸ�Ϊ40
UPDATE Dept SET DNO=40 WHERE DNO=10;
--����Staff��Project��������õ�UPDATE��ΪRestrict������������»ᱨ��
--Ϊ�˷�ֹ���ִ������������������ڲ���10��Ա��ͻȻʧҵ...���������������б�Ҫ�ġ�

-------------------------END OF PART 3-------------------------


-------------------------PART 4 ����������-------------------------
--����һ������������ְ���μ�һ���µ���Ŀʱ����н����2%
create trigger inc_salary 
	after insert on JOB
	referencing NEW as N
	for each row mode DB2SQL
		update Staff 
		set Staff.SALARY = Staff.SALARY * 1.02
		where Staff.SNO = N.SNO;

--��1004����һ��JOB����Ӧ����ĿΪ200
INSERT INTO JOB VALUES (1004,200,30)		
--1004����нӦ�ô�ԭ����10000��Ϊ10200.

-------------------------END OF PART 4-------------------------


-------------------------PART 5 ������Ȩ���û�-------------------------
--�Ͽ���ǰ�����ӣ�ʹ���µ��û�db2admin��¼���ٽ��з��ʲ���
disconnect current;
connect to MYDB1 user db2admin using ********;
select * from "DBEXP2".JOB;
--����ǣ�"DB2ADMIN" �����жԶ��� "DBEXP2.JOB" ִ�в��� "SELECT"�ı���Ȩ�޻���Ȩ��

--������MOMO���û������ӣ�������Ӧ����Ȩ
disconnect current;
connect to MYDB1;
grant SELECT on "DBEXP2".JOB
	to db2admin with grant option

--����ʹ��db2admin�������ӣ��ڽ���ͬ���Ĳ�ѯ
disconnect current;
connect to MYDB1 user db2admin using ********;--��������Ϊ��Ӧ������
select * from "DBEXP2".JOB;
--�õ���ȷ�Ľ��
		
--�ص�MOMO�����ӣ����Ի���Ȩ�ޣ�ʹ����������
---disconnect current;
---connect to MYDB1;
---revoke select on "DBEXP2".JOB from db2admin��
-------------------------END OF PART 5-------------------------


--����������������ɾ���ղŴ�����5�ű�
drop table Staff;
drop table Dept;
drop table Project;
drop table Job;
drop table Families; 
