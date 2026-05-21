#include<iostream>
#include<pqxx/pqxx>                                                                    //开发库所需的头文件
using namespace std;

int main()
{
    pqxx::connection c("host=localhost port=4399 dbname=base1 user=postgres password=WdXdRr&424764");   //创建数据库连接
    if(c.is_open()) 
        cout<<"database connect success!"<<endl;
    else
    {
        cout<<"database connect default!"<<endl;
        return;
    }

    pqxx::work w(c);                                                                   //创建事务(哪个连接库的事务)
    pqxx::result r=w.exec("select current_date;");                                     //获取查询返回的结果集
    std::string name = r[0][0].as<std::string>();                                      //将结果集数据进行转换
    cout<<name<<endl;
	w.commit();                                                                        //提交事务，提交后该事务被关闭，无法再使用
	
	pqxx::work w1(c);                                                                  //创建事务1(哪个连接库的事务)
    pqxx::result r1=w1.exec("select * from student");                                  //获取查询返回的结果集
    for(int i=0;i<r1.size();i++)                                                       //循环获取结果集中每一条数据记录的字段值
    {
        int id=r1[i][0].as<int>();                                                     //数据记录的第一个字段值(即id) 
        string name=r1[i][1].as<string>();                                             //数据记录的第二个字段值(即name)
        string sex=r1[i][2].as<string>();                                              //数据记录的第三个字段值(即sex)
        string address=r1[i][3].as<string>();                                          //数据记录的第四个字段值(即address)
        
        cout<<"id:"<<id<<" name:"<<name<<
        " sex:"<<sex<<" address:"<<address<<endl;
    }
    w1.commit(); 
    return 0;
}