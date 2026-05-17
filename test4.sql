create table t1(id int,name varchar(20));

create index if not exists lyy1 on t1(id);
drop index if exists lyy1;

create table student(class_id int,s_id int,name varchar(20));
create table teacher(class_id int,t_id int,name varchar(20));

insert into student (class_id,s_id,name) values
    (1,1001,'张三'),
    (2,1002,'李四'),
    (1,1003,'王五');
insert into teacher (class_id,t_id,name) values
    (1,4001,'王灿'),
    (1,3007,'李逵'),
    (2,6002,'刘浩');
    
select * from student;
select * from teacher;

create view class1_student as
    select * from student where class_id=1;

create view class1_teacher as
    select * from teacher where class_id=1;

select * from class1_student;
select * from class1_teacher;
drop view if exists class1_student;
drop view if exists class1_teacher;