create table class1(
    class_id int primary key,                                          //专业是唯一不可重复的，即专业的id号是唯一的
    name varchar(20)
);

create table class_test(
    class_id int,
    name varchar(20),
    constraint pk_1 primary key(class_id)
);

create table student1(
    s_id int,
    class_id int,
    name varchar(20),
    constraint pk11 primary key(s_id),
    constraint fk1 foreign key(class_id) references class1(class_id)   //该字段的数据只能为专业记录表中存在的专业数据
);

insert into class1 (class_id,name) values
	(1001,'计算机'),
	(1002,'农艺'),
	(1003,'机电');
insert into student1 (s_id,class_id,name) values
	(1,1002,'张三'),
	(2,1003,'李四'),
	(3,1001,'王五'),
	(4,1003,'小六'),
	(5,1002,'吴彦');

select * from class1;
select * from student1;

create table test111(
    id int not null,
    phone_number varchar(12) unique,
    name varchar(20) default 'null'
);

insert into test111 (id,phone_number) values(1003,'15622741313');
insert into test111 (id,phone_number,name) values
	(1001,'18271366681','张三'),
	(1002,'18271366443','小明');
select * from test111;