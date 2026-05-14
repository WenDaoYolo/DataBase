create database mydb1;
create database test1;
alter database mydb1 connection limit 10;
alter database test1 rename to test;
drop database if exists test;

create schema test2;
alter schema test2 rename to test;
drop schema if exists test cascade;

create table if not exists public.table2();
create table if not exists table1(
    id int,
    score numeric(4,2),
    address varchar(20),
    days timestamp
);

alter table table1 rename to t1;
alter table t1 rename id to uid;
alter table t1 alter column uid type varchar(20);
alter table t1 drop column uid;
alter table t1 add column uid int;
insert into t1 values(94.426,'湖北武汉','2025-3-4 12:04:02',1001);
insert into t1 (score, address, days, uid) values (45.33, '湖北宜昌', '2015-5-1 6:01:01', 1002);
select uid from t1;
select * from t1;

drop table table2;

select 1+2,1-2,1*2,4/3,4%3;
select 2>1,2<1,4=4,4!=4,4<>3;
select 'b' between 'a' and 'c',1 between 4 and 8;             
select 'abcd' like 'ab_d','wkmm' not like '%m';
select least(3,4,5,6),greatest(4,5,6,7,8);
select 'no' or '1',true or false,true and 'n';
select not true,not 'no';
select 'hel'||'lo';

嵌套子查询的使用，例如：将select查询t1表的uid结果作为in判断集合
select 333 in(444,555,333),1001 in (select uid from t1); 