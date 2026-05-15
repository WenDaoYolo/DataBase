create table public.student(
    id int,
    name varchar(10),
    Math numeric(4,2),
    English numeric(4,2),
    Chinese numeric(4,2)
);

insert into student (id,name,Math,English,Chinese) values(1001,'张三',88.2,94,92);
insert into student (id,name,Math,English,Chinese) values(1002,'李四',79.5,95.4,84);
insert into student (id,name,Math,English,Chinese) values(1003,'王五',93.5,88,95);

select * from student;
select count(id) from student;
select max(Math) from student;
select min(English) from student;
select avg(Chinese) from student;
select sum(Math),sum(Math),sum(Chinese) from student;

insert into student (id,name,Math,English,Chinese) values(1003,'  test  ',93.5,88,95);
insert into student (id,name,Math,English,Chinese) values(1003,'   test',93.5,88,95);
insert into student (id,name,Math,English,Chinese) values(1003,'test   ',93.5,88,95);
select* from student;

select trim(name) from student;
select ltrim(name) from student;
select rtrim(name) from student;
select length(name),concat(id,name) from student;
select replace(name,'张三','章删'),substring(name,1,4) from student;

create table test1(times timestamp);
select current_date,current_time,now();
insert into test1 values('2025-4-5 12:30:21');
insert into test1 values('2021-7-3 7:12:55');
select times from test1;

select extract(year from times),extract(month from times),extract(days from times) from test1;

create table test2(id int,name varchar(10));
insert into test2 values(3003,'hello');

create function my_add(int,int) returns int
as 'select $1+$2;'
language sql
returns null on null input;

create or replace function my_concat(a int,b varchar(10)) returns VARCHAR
as 'select a||b;'
language sql
returns null on null input;

select my_add(4,6),my_concat(id,name) from test2;
drop function my_add(int,int);