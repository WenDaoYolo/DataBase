#include<pqxx/pqxx>
#include<iostream>
#include<string>
using namespace std;

void Display(pqxx::result& r)
{
    if(r.size()!=0)
    {
        int id=r[0]["id"].as<int>();
        string name=r[0]["name"].as<string>();
        string sex=r[0]["sex"].as<string>();
        string address=r[0]["address"].as<string>();
        cout<<id<<" "<<name<<" "<<sex<<" "<<address<<endl;
    }
}

int main()
{
    pqxx::connection c1("host=localhost user=postgres port=4399 dbname=base1 password=WdXdRr&424764");
    if(c1.is_open())
        cout<<"database connect success!"<<endl;
    else
    {
        cout<<"database connect default!"<<endl;
        return -1;
    }
    
    pqxx::work w1(c1);
    w1.exec("insert into student (id,name,sex,address) values(666,'zzz','male','China')");
    w1.commit();

    pqxx::work w2(c1);
    pqxx::result r1=w2.exec("select * from student where id=666");
    Display(r1);
    w2.commit();
    
    pqxx::work w3(c1);
    w3.exec("update student set id=999 where id=666");
    pqxx::result r2=w3.exec("select * from student where id=999");
    Display(r2);
    w3.commit();

    pqxx::work w4(c1);
    w4.exec("delete from student where id=999");
    pqxx::result r3=w4.exec("select * from student");
    for(int i=0;i<r3.size();i++)
    {
        int id=r3[i]["id"].as<int>();
        string name=r3[i]["name"].as<string>();
        string sex=r3[i]["sex"].as<string>();
        string address=r3[i]["address"].as<string>();

        cout<<id<<" "<<name<<" "<<sex<<" "<<address<<endl;
    }

    return 0;
}