#include "DataBase.h"

DataBase::DataBase():c1("user=postgres password=WdXdRr&424764 port=4399 host=localhost dbname=base1")
{
    if(c1.is_open())
    {
        std::cout<<"database connect success!"<<std::endl;
    }
    else
    {
        std::cout<<"database connect default!"<<std::endl;
        perror("database connect");
    }
}

void DataBase::InsertData(const char* sql)
{
    pqxx::work w1(this->c1);
    w1.exec(sql);
    w1.commit();
}

void DataBase::QueryData(const char* sql)
{
    pqxx::work w1(this->c1);
    pqxx::result r1=w1.exec(sql);
    for(int i=0;i<r1.size();i++)
    {
        int id=r1[i][0].as<int>();
        std::string name=r1[i][1].as<std::string>();
        std::string sex=r1[i][2].as<std::string>();
        std::string address=r1[i][3].as<std::string>();

        std::cout
        <<std::left<<std::setw(4)<<id
        <<std::left<<std::setw(12)<<name
        <<std::left<<std::setw(8)<<sex
        <<std::left<<std::setw(16)<<address
        <<std::endl;
    }
    w1.commit();
}

void DataBase::DeleteData(const char* sql)
{
    pqxx::work w1(this->c1);
    w1.exec(sql);
    w1.commit();
}

void DataBase::UpdateData(const char* sql)
{
    pqxx::work w1(this->c1);
    w1.exec(sql);
    w1.commit();
}

DataBase::~DataBase()
{
    ;
}