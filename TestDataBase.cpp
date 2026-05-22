#include "DataBase.h"

int main()
{
    DataBase b1;
    b1.InsertData("insert into student (id,name,sex,address) values(321,'TEST','male','North')");
    b1.UpdateData("update student set name='TTTEST' where name='TEST'");
    b1.DeleteData("delete from student where name='zzz'");
    b1.QueryData("select * from student");

    return 0;
}