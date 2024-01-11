use w3schools;

# ример. Вывести количественное
# распределение клиентов по странам
select
    Country,
    count(*) as total

from customers
group by Country
order by  total desc ;

select
    CategoryID,
    count(*) as total

from products
group by CategoryID
order by  total desc ;

# Задача. Вывести кол/распределение товаров по категориям
# (проекция: название_категории, ко-во_товаров)
SELECT
    categories.CategoryName,
    COUNT(*) AS total_products

FROM products

         JOIN categories ON products.CategoryID=categories.CategoryID

GROUP BY products.CategoryID

ORDER BY total_products DESC;

#Пример. Вывести кол/распределение заказов по перевозчикам (без JOIN)
SELECT
    ShipperID,
    COUNT(*) AS total
FROM orders

GROUP BY ShipperID;

# Пример. Вывести кол/распределение заказов
#Задача. Дописать предыдущий пример, чтобы выводились названия компаний
SELECT
    shippers.ShipperID,
    shippers.ShipperName,
    COUNT(*) AS total
FROM orders
join
     shippers ON orders.ShipperID = shippers.ShipperID

GROUP BY shippers.ShipperID;

# **Задача. Вывести кол/распределение заказов по клиентам**
#
# (проекция: `имя_клиента`, `ко-во_заказов`)
select
    customers.CustomerName as client_name,
    count(orders.OrderID) as total
from customers
join orders on customers.CustomerID = orders.CustomerID
group by
    customers.CustomerID
order by total desc
limit 3;

# select
#     employees.LastName as manager
# count(*) as count_orders
#     from orders
# join employees on orders.EmployeeID = orders.EmployeeID
# where employees.EmployeeID in (1,2,5)
# group by employees.LastName, employees.EmployeeID

# **Задача. Вывести статистику по заказам для менеджеров `1, 2, 5` (для каждого отдельно)**
#
# проекция: `фамилия_менеджера`, `ко-во_заказов`


SELECT
    employees.LastName,
    COUNT(*) AS count_orders
FROM orders

         JOIN employees ON orders.EmployeeID = employees.EmployeeID

WHERE
    orders.EmployeeID IN (1, 2, 5)

GROUP BY orders.EmployeeID

ORDER BY count_orders DESC;

# **Задача. Вывести ТОП-3 самых продаваемых товаров**
#
# (проекция: `название_товара`, `ко_во_проданных_единиц`)

# select
#     products.ProductName
#     sum (order_details.Quantity) as sold_count
#     from order_details
# join order_details on products.ProductID = order_details.ProductID
# group by products.ProductName
# order by sold_count desc
#     limit 3;
SELECT
    products.ProductName,
    SUM(order_details.Quantity) AS sold_count

FROM w3schools.order_details

         JOIN products ON order_details.ProductID = products.ProductID

GROUP BY order_details.ProductID

ORDER BY sold_count DESC
LIMIT 3;

# Задача. Вывести стоимость заказа 10248

# SELECT
#     orders.OrderID,
#     SUM(products.Price * order_details.Quantity) AS price_orders
# FROM
#     orders
#         JOIN
#     order_details ON orders.OrderID = order_details.OrderID
#         JOIN
#     products ON order_details.ProductID = products.ProductID
# WHERE
#     orders.OrderID = 10248
# GROUP BY
#     orders.OrderID;

SELECT
    SUM(products.Price * order_details.Quantity) AS order_cost
FROM order_details

         JOIN products ON order_details.ProductID = products.ProductID

WHERE
    order_details.OrderID = 10248;

# **Задача. Вывести стоимость каждого заказа в упорядоченном виде**
#
# (проекция: `номер_заказа`, `сумма_заказа`)
# SELECT
#     order_details.OrderID AS order_number,
#     SUM(products.Price * order_details.Quantity) AS order_cost
# FROM
#     order_details
#         JOIN
#     products ON order_details.ProductID = products.ProductID
# GROUP BY
#     order_details.OrderID
# ORDER BY
#     order_details.OrderID;

SELECT
    order_details.OrderID AS order_id,
    SUM(order_details.Quantity * products.Price) AS order_cost

FROM order_details

         JOIN products ON order_details.ProductID=products.ProductID

GROUP BY order_details.OrderID

ORDER BY order_cost DESC;

# ## Оператор `HAVING`
#
# - аналог `WHERE`, который позволяет отфильтровать агрегированные данные
#
# **Пример. Вывести заказы со стоимостью от `15000` (EUR)**

SELECT
    order_details.OrderID AS order_id,
    SUM(order_details.Quantity * products.Price) AS order_cost

FROM order_details

         JOIN products ON order_details.ProductID=products.ProductID

GROUP BY order_details.OrderID
having
    order_cost >= 15000

ORDER BY order_cost DESC;

# **Задача. Вывести поставщиков, у которых средняя стоимость товара выше `40` EUR**
#
# (проекция: `название_компании_поставщика`, `сред_стоимость`)

SELECT
    suppliers.SupplierName ,
    AVG(products.Price)
FROM
    products
        JOIN
    suppliers ON products.SupplierID = suppliers.SupplierID
GROUP BY
    suppliers.SupplierName
HAVING
    AVG(products.Price) > 40;

# SELECT
# 		Suppliers.SupplierName,
# 		AVG(Products.Price) AS avg_price
# FROM Products
#
# JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
#
# GROUP BY Products.SupplierID
# HAVING
# 	avg_price > 40
#
# ORDER BY avg_price DESC