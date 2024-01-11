use w3schools;
# Задача. Вывести ко-во поставщиков не из USA и не из Spain
SELECT
    COUNT(*) AS total_not_usa_spain_suppliers
FROM suppliers

WHERE
    NOT Country IN ('USA', 'Spain');

# Задача. Вывести сред/стоимость товаров из категорий 1, 2, 5, у
# которых название начинается с t

SELECT
    AVG(Price) AS avg_price
FROM products

WHERE
    CategoryID IN (1, 2, 5)
  AND
    ProductName LIKE 't%';

#     Задача. Вывести ко-во заказов, которое оформил клиент 1

#     Задача. Вывести, какое количество раз был продан
#     товар 72 (по ко-ву заказов)

SELECT
    COUNT(*) AS sold_count
FROM order_details

WHERE
    ProductID = 72;

# **Задача. Вывести среднюю стоимость товаров от
# поставщика `3`**
#
# **(проекция: `название_компании_поставщика`, `сред/стоимость`)**
use w3schools;
SELECT
    suppliers.suppliername,
    AVG(products.Price) AS avg_price
FROM products

         JOIN suppliers ON products.supplierid = suppliers.SupplierID

WHERE
    suppliers.SupplierID = 3;

# Задача. Вывести товары с ценой в диапазоне от 10 до 500 EUR от поставщиков 1 и 4

select *
from products

where
    Price between 10 and  500
and
    SupplierID in (1,4);

# Задача. Вывести страны поставщиков
use w3schools;
select distinct
Country
from suppliers;

# Пример. Найти ко-во клиентов
-- всього
select
    count(*) as total_customers
from customers;
-- from Germanny
select
    count(*) as total_customers
from customers
where
    Country = 'Germany';

-- Пример. Товары
-- вывести сред/стоимость товара
select avg(price) as avg_price
from products;
-- от первого поставщика

select
    avg(price) as avg_price
from products
where SupplierID = 1;

-- Вывести ко-во поставщиков не из USA и не из Spain
select
    count(*) as total_not_usa_spain_suppliers
from suppliers
where
    not Country in ('usa', 'spain');
-- Вывести сред/стоимость товаров из категорий 1, 2, 5, у которых название начинается с t
select
    avg(price) as avg_price
from products
where CategoryID in (1,2,5)
and
    ProductName like 't%';

-- Вывести ко-во заказов, которое оформил клиент 1
select
    count(*) as total_orders
from orders
where CustomerID = 1;

-- Вывод статистики по товарам
select
    count(*) as total_products,
    max(price) as max_price,
    min(price) as min_price,
    sum(price) as total_cost,
    avg(Price) as avg_price

from products;

-- Задача. Вывести, какое количество раз был продан товар 72 (по ко-ву заказов)

select
    count(*) as sold_count
from order_details
where ProductID = 72;

-- Вывести среднюю стоимость товаров от поставщика 3
-- (проекция: название_компании_поставщика, сред/стоимость)

select
    suppliers.SupplierName,
    avg(products.Price)
from products

join suppliers on products.SupplierID = suppliers.SupplierID

where
    suppliers.SupplierID = 3;

-- осчитать стоимость заказа 10248
SELECT
    SUM(products.Price * order_details.Quantity) AS order_cost

FROM order_details

         JOIN products ON order_details.ProductID = products.ProductID

WHERE
    order_details.OrderID = 10248
