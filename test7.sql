select ci.class_id,ci.major from people_info ci; 
select pi.id,pi.name,pi.job from people_info as pi;
select class_id as a,major as b from class_info;

select pi.id as a,pi.name b,pi.sex,ci.class_id,ci.major                   --隐式连接查询人员信息以及对应的专业信息
    from class_info as ci,people_info pi                                  --从两张表中查询数据;数据表别名，简化语句的编写长度
    where ci.class_id=pi.class_id;                                        --人员信息表的class_id和专业信息表的class_id连接

select pi.id as a,pi.name b,pi.sex,ci.class_id,ci.major                   --显示连接查询人员信息以及对应的专业信息
	from people_info pi inner                                             --从两张表中查询数据;数据表别名，简化语句的编写长度
	join class_info ci on pi.class_id=ci.class_id;                        --人员信息表的class_id和专业信息表的class_id连接

insert into class_info (class_id,major) values(1000,'test');
insert into people_info (id,class_id,name,sex,job,birthday) values
	(100,null,'张三','男','student','2004-4-4');

select pi.id as a,pi.name b,pi.sex,ci.class_id,ci.major                   --左连接查询人员信息以及对应的专业信息
	from people_info pi                                                   --从两张表中查询数据;数据表别名，简化语句的编写长度
	left join class_info ci on pi.class_id=ci.class_id                    --人员信息表的class_id和专业信息表的class_id连接
	where pi.class_id=1001;                                               --筛选class_id为1001的数据记录

select pi.id as a,pi.name b,pi.sex,ci.class_id,ci.major                   --右连接查询
	from people_info pi                                                   
	right outer join class_info ci on pi.class_id=ci.class_id;                                                          

select pi.id as a,pi.name b,pi.sex,ci.class_id,ci.major                   --全连接查询
    from people_info pi                                                  
    full outer join class_info ci on pi.class_id=ci.class_id;