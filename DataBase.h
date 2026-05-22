#include<pqxx/pqxx>
#include<iostream>
#include<iomanip>
#include<string>
#pragma once

class DataBase{
    private:
        pqxx::connection c1;
    public:
        DataBase();
        void InsertData(const char* sql);   
        void QueryData(const char* sql);
        void DeleteData(const char* sql);
        void UpdateData(const char* sql);
        ~DataBase();
};