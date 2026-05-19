-- 提前准备2-3和2-4所需数据

create table class_info(
    class_id int primary key,
    major varchar(10)
);

create table people_info(
    id int primary key,
    class_id int,
    name varchar(20),
    sex varchar(2) default '未知',
    job varchar(10),
    birthday date,
    constraint fk1 foreign key(class_id) references class_info(class_id)
);

insert into class_info (class_id,major) values
    (1001,'机电'),
    (1002,'农艺'),
    (1003,'英语'),
    (1004,'计算机'),
    (1005,'电商管理');

insert into people_info (id,class_id,name,sex,job,birthday) values
    (101,1001,'张三','男','student','2004-4-4'),
    (102,1003,'李四','男','student','2005-6-3'),
    (103,1005,'王五','女','teacher','1995-3-2'),
    (104,1001,'小六','女','student','1998-7-7'),
    (105,1002,'小明','男','teacher','2000-5-1'),
    (106,1002,'张雨','女','teacher','2006-5-9'),
    (107,1001,'李鸣','男','student','2003-10-14'),
    (108,1004,'王小小','女','student','2005-11-21');
  
select * from class_info;
select * from people_info;

select * from class_info;                                                    --查询class_info表的所有数据
select id,name,birthday from people_info;                                    --查询people_info表中id、name、birthday字段的数据
select id,class_id,name,sex,job,birthday from people_info;                   --查询people_info表中所有字段的数据(即与*的效果相同)

select * from people_info where id<=104;                                     --查询id号小于等于104的数据记录
select * from people_info where sex='男';                                    --查询性别为男的数据记录
select * from people_info where class_id in (1001,1005);                     --查询class_id号为1001或1005的数据记录
select * from people_info where class_id not in (1001,1005);                 --查询class_id号不为1001或1005的数据记录
select * from people_info where birthday between '2004-1-1' and '2006-1-1';  --查询生日在2004-1-1到2006-1-1的数据记录
select * from people_info where name like '小%';                             --查询姓名为小开头的数据记录

insert into people_info (id,class_id,name,sex,job,birthday)
    values(109,1003,'张张','女','student',null);

select * from people_info where birthday is null;                            --查询birthday为空的数据记录
select * from people_info where birthday is not null;                        --查询birthday不为空的数据记录
select * from people_info where id<=103 or class_id>=1003;                   --查看id<=103或class_id>=1003的数据记录
select * from people_info where id in(101,102,103) and sex='男';             --查看id为101或102或103且sex为男的数据记录

select * from people_info where id<=105 order by id;                         --查询id<=105的数据记录，并按照id升序排序
select * from people_info where id<=105 order by id desc;                    --查询id<=105的数据记录，并按照id降序排序
select * from people_info where class_id<=1004 order by class_id,id desc;    --多字段排序，若class_id相同则按id排序，依次类推..

空值默认显示最后，想让其显示最前用nulls first，显示最后用null last
select * from people_info order by birthday asc nulls first;                 

select * from people_info limit 5;                                           --查看查询结果中前五条数据记录
select * from people_info limit 3 offset 5;                                  --忽略前五条数据，然后查看接下来三条数据记录 

然而，在实际的日常开发中limit + offset常用于应用程序中数据的分页显示操作，可以得出一个固定规律，例如：limit 5 offset ((页码-1)*5);