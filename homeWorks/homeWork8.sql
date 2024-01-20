use w3schools;

# 1  В рамках БД "песочница" выведите З/П каждого менеджера, исходя из ставки в 5% от суммы заказов

SELECT
    employees.LastName,
    SUM(orders.OrderID * 0.05) AS salary
FROM
    orders
        JOIN
    employees ON orders.EmployeeID = employees.EmployeeID
GROUP BY
    employees.LastName;





# Используя MySQL WorkBench (или аналогичный инструмент) создайте БД music (сервис онлайн-музыки)
# и в рамках нее таблицы users, tracks с полями на Ваше усмотрение

create database music;

use music;

create table users(
    user_id int,
    registration_date timestamp,
    username varchar(255),
    email varchar(255),
    password varchar(255)
);

create table tracks(
    track_id int,
    title varchar(255),
    performer varchar(255),
    releace_date date,
    duration int,
    user_id int
);


