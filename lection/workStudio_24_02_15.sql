/*
SQL- tables
MongoDb - collections
JSON :

SQL
Table - person
id | name | lastname | age | passport_id
1.   Alex.   Alexeev.  35. |
2.   Maxim.  Maximov.   40.| 55555


MongoDB - collection person
Document :
BSON
{
_id : 1,
name : "Alex",
lastname : "Alexeev",
age : 35
},

{
_id : 2,
name : "Maxim",
lastname : "Maximov",
age : 40,
passport_id : 55555
}

Денормализорованное хранение данных
Отсутствие регламентированной структуры данных
---------
65cdddcfec4297c79f952adf - auto geterated id in document

65,cd,dd,cf - time
ec,42,97 - mid - machine id
c7,9f - pid - process id
95,2a,df - inc counter

use <databasename> - switch to database

show databases - list all db

show collections - list all collections in database

db.имя_коллекции.оператор - общий синтаксис для работы с данными

db.имя_коллекции.find() - like SELECT * FROM имя_таблицы in SQL

EXAMPLE one:

db.person.insertOne(
  {
    name : 'Oleg',
    lastname : 'Olegov',
    age : 25,
    address : {
      country : 'Germany',
      city : 'Berlin',
      street : 'Pushkin street',
      bulding : 1}})

Example two : one - to - many

db.person.insertOne(
  {
    name : 'Egor',
    lastname : 'Egoroff',
    age : 32,
    address : [{
      country : 'Germany',
      city : 'Berlin',
      street : 'Pushkin street',
      bulding : 1},
               {
                 country : 'Germany',
      city : 'Berlin',
      street : 'Pushkin street',
                 building : 2}]})

Example three:

db.person.find({name : 'Oleg'})

db.person.find({'address.country':'Germany'})

*/