select * from (select * from people_info where sex='男') where id<=104;     --子查询先查询sex为男的数据结果集，然后
																	        --主查询再基于此结果集查询id<=104的数据

select * from people_info where                                             --查询人员表class_id在班级表class_id中存在的记录
    exists(select * from class_info                                         --逐行遍匹配历人员表，成功返回True，主查询保留该行
    where class_info.class_id= people_info.class_id);                       --匹配失败返回False，主查询丢弃该数据行

select * from people_info where                                             --和exists相反，匹配成功返回False，主查询不保留
    not exists(select * from class_info                                     --匹配失败返回True，主查询保留该数据行
    where class_info.class_id= people_info.class_id);

select * from people_info where people_info.class_id
     in (select class_info.class_id from class_info                         --子查询获取class_id为1003或1002的数据
     where people_info.class_id=1003 or people_info.class_id=1002);         --然后主查询从子查询的结果集中获取所有数据

select (sex||job||' '||name) as info from people_info;                      --将sex、job、空格、name拼接为标量字段并重命名
                                                                            --people_info中查询的数据则以标量字段的格式显示


select * from people_info where sex='男'
union all                                                                   --将sex='男'的结果集和job='teacher'的结果集直接合并
select * from people_info where job='teacher';

select * from people_info where sex='男'
union                                                                       --将sex='男'的结果集和job='teacher'的结果集去重合并
select * from people_info where job='teacher';

select id,times,age from a 
union all                                                                   --将两个结果集合并，对于不存在某个字段的表用null占位
select id,times,null from b;