use w3schools;
# Задача. Вывести товары в диапазоне цены от 1 до 100 (вкл.)
select *
    from
        products
where
    Price
between 1 and 100;
# Пример агрегации. Вывести ко-во товаров
select
    count(products.ProductID) as num_produkts
from products;

# Задача. Вывести общее ко-во клиентов из Germany и France
    select
        count(customers.Country) as number_clients
    from customers
    where
        Country in ('France' and 'Germany');

# Задача. Вывести среднюю стоимость товаров с ценой до 150 EUR (вкл.
    select
        avg(Price) as avg_price
    from products
    where products.Price <= 150;

# **Задача. Вывести данные о заказах**
#
# (проекция: `номер_заказа`, `имя_клиента`, `фамилия_менеджера`, `название_компании_перевозчика`)
    select
        orders.OrderID,
        customers.CustomerName,
        employees.LastName,
        shippers.ShipperName
    from
        orders
    join
            customers on orders.CustomerID = customers.CustomerID
    join
            employees on orders.EmployeeID = employees.EmployeeID
    join
            shippers on orders.ShipperID = shippers.ShipperID;

#     **Задача. Вывести проданные товары с ценой от `10` EUR**
#
# (проекция: `название_товара`, `номер_заказа`)


    select
        products.ProductName,
        order_details.OrderID

    from
        order_details
    join
            products on order_details.ProductID = products.ProductID
    where
        products.Price >= 10;



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