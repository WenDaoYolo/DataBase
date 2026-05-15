create table t1(id int,name varchar(30),birthday date,score numeric(4,2));
create table t2(id int,name varchar(30),birthday date,score numeric(4,2));
create table t3(id int,name varchar(30),birthday date,score numeric(4,2));
  
insert into t1 values(1001,'张三','2004-10-26',null);
insert into t1 (id,name,score,birthday) values(1002,'李四',77.45,'2005-4-3');
insert into t1 (id,name,birthday,score) values
    (1003,'王五','1989-1-1',54.3),
    (1004,'小六','2000-6-3',74.7),
    (1005,'小明','2004-3-8',64.2),
    (1006,'小红','2006-5-4',70.5);
select * from t1;

insert into t2 select * from t1;
insert into t3 (id,name) select id,name from t1;
select * from t2;
select * from t3;

update t1 set score=null;
update t1 set name='小吴' where id=1006;
select * from t1;

delete from t2;
delete from t1 where id=1003 or id=1001 ;
delete from t1 where birthday between '2005-1-1' and '2010-1-1';
truncate table t3;

select * from t1;
select * from t2;
select * from t3;