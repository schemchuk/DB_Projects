create database oe;
use oe;

# Вывести имя, фамилию
# пользователей и даты их заказов(order_date).
select customers.CUST_FIRST_NAME,
       customers.CUST_LAST_NAME,
       orders.ORDER_DATE
from customers
         join orders on customers.CUSTOMER_ID = orders.CUSTOMER_ID;

# Вывести имя, фамилию пользователей, даты заказов(order_date), описание
# продуктов(product_description), которые они заказали и категории соответствующих
# продуктов (category_name).
SELECT customers.CUST_FIRST_NAME,
       customers.CUST_LAST_NAME,
       orders.ORDER_DATE,
       product_information.PRODUCT_DESCRIPTION,
       categories_tab.CATEGORY_NAME
FROM customers
         JOIN
     orders ON customers.CUSTOMER_ID = orders.CUSTOMER_ID
         JOIN
     order_items ON orders.ORDER_ID = order_items.ORDER_ID
         JOIN
     product_information ON order_items.PRODUCT_ID = product_information.PRODUCT_ID
         JOIN
     categories_tab ON product_information.CATEGORY_ID = categories_tab.CATEGORY_ID;
# Вывести имя, фамилию покупателей, которые купили принтеры.


SELECT customers.CUST_FIRST_NAME,
       customers.CUST_LAST_NAME,
       categories_tab.CATEGORY_DESCRIPTION

FROM customers
         JOIN
     orders ON customers.CUSTOMER_ID = orders.CUSTOMER_ID
         JOIN
     order_items ON orders.ORDER_ID = order_items.ORDER_ID
         JOIN
     product_information ON order_items.PRODUCT_ID = product_information.PRODUCT_ID
         JOIN
     categories_tab ON product_information.CATEGORY_ID = categories_tab.CATEGORY_ID
where categories_tab.CATEGORY_DESCRIPTION = 'printers';
#     product_information.PRODUCT_DESCRIPTION like 'printers';


select customers.CUST_FIRST_NAME, customers.CUST_LAST_NAME, categories_tab.CATEGORY_DESCRIPTION
from customers
         join orders on customers.CUSTOMER_ID = orders.CUSTOMER_ID
         join order_items on orders.ORDER_ID = order_items.ORDER_ID
         join product_information on order_items.PRODUCT_ID = product_information.PRODUCT_ID
         join categories_tab on product_information.CATEGORY_ID = categories_tab.CATEGORY_ID
where categories_tab.CATEGORY_DESCRIPTION = 'printers';


# Вывести названия(product_name), описания категорий(category_description) и
# количества(quantity) тех продуктов, у которых минимальная стоимость (min_price) больше
# 300.

# SELECT product_information.PRODUCT_NAME,
#        categories_tab.CATEGORY_DESCRIPTION,
#        COUNT(*) AS quantity
# FROM customers
#          JOIN
#      orders ON customers.CUSTOMER_ID = orders.CUSTOMER_ID
#          JOIN

#      order_items ON orders.ORDER_ID = order_items.ORDER_ID
#          JOIN
#      product_information ON order_items.PRODUCT_ID = product_information.PRODUCT_ID
#          JOIN (SELECT product_id,
#                       MIN(price) AS min_price
#                FROM customers
#                         JOIN
#                     orders ON customers.CUSTOMER_ID = orders.CUSTOMER_ID
#                         JOIN
#                     order_items ON orders.ORDER_ID = order_items.ORDER_ID
#                         JOIN
#                     product_information ON order_items.PRODUCT_ID = product_information.PRODUCT_ID
#                         JOIN
#                     categories_tab ON product_information.CATEGORY_ID = categories_tab.CATEGORY_ID
#                having MIN_PRICE
#                GROUP BY product_information.PRODUCT_ID, categories_tab.CATEGORY_ID, product_information.PRODUCT_NAME,
#                         categories_tab.CATEGORY_DESCRIPTION;


select product_information.product_name, categories_tab.category_description, order_items.quantity, product_information.MIN_PRICE
from product_information
         join categories_tab on product_information.CATEGORY_ID = categories_tab.CATEGORY_ID
         join order_items on product_information.PRODUCT_ID = order_items.PRODUCT_ID
where product_information.MIN_PRICE > 300;


# Вывести имя и фамилию тех покупателей, у которых лимит кредита больше среднего.
SELECT
    CUST_FIRST_NAME,
    CUST_LAST_NAME,
    CREDIT_LIMIT
FROM
    customers
WHERE
    CREDIT_LIMIT > (
        SELECT
            AVG(CREDIT_LIMIT)
        FROM
            customers
    );

#
# SELECT
#     CUST_LAST_NAME,
#     CUST_FIRST_NAME,
#     SUM(order_items.quantity * product_information.MIN_PRICE) AS total_order_amount
# FROM
#     customers
#         JOIN
#     orders ON customers.CUSTOMER_ID = orders.CUSTOMER_ID
#         JOIN
#     order_items ON orders.ORDER_ID = order_items.ORDER_ID
#         JOIN
#     product_information ON order_items.PRODUCT_ID = product_information.PRODUCT_ID
# # WHERE
# GROUP BY
#     customers.CUSTOMER_ID, CUST_LAST_NAME, CUST_FIRST_NAME;

# SELECT CUST_FIRST_NAME, CUST_LAST_NAME,SUM(ORDER_TOTAL) sum FROM oe.customers
#                                                                      join oe.orders on oe.orders.CUSTOMER_ID = oe.customers.CUSTOMER_ID
# group by oe.orders.CUSTOMER_ID;
# SELECT CUST_FIRST_NAME, CUST_LAST_NAME, SUM(ORDER_TOTAL) sum, orders.CUSTOMER_ID
# FROM oe.customers
#          join oe.orders on oe.orders.CUSTOMER_ID = oe.customers.CUSTOMER_ID
# group by oe.orders.CUSTOMER_ID;
#--------------------------------------------------

select max(customers.CREDIT_LIMIT) as max_Credit, customers.GENDER
from customers
group by GENDER;

select
    CUST_LAST_NAME,
    CUST_FIRST_NAME,
    customers.GENDER,
    customers.CREDIT_LIMIT
from customers;

-- Вывести максимальный лимит кредита покупателей женского пола и мужского по отдельности.
-- Вывести имя и фамилию этих покупателей.

-- 1. Подзапрос - находим максимальный лимит кредита и группируем по признаку гендера (максимальный лимит кредита и гендер)

select max(CREDIT_LIMIT) as max_Credit, gender
from customers
group by gender;

-- 2. Основной запрос -  имя, фамилия, гендер, лимит кредита

select customers.CUST_FIRST_NAME, customers.CUST_LAST_NAME, customers.GENDER, customers.CREDIT_LIMIT
from customers
         join (select max(CREDIT_LIMIT) as max_Credit, GENDER
               from customers
               group by GENDER) as gen_limit_max
              on customers.GENDER = gen_limit_max.GENDER
                  and customers.CREDIT_LIMIT = gen_limit_max.max_Credit;


# Найти товары с минимальным количеством, вывести имя товара и количество.
# SELECT
#     product_information.PRODUCT_NAME,
#     MIN(order_items.quantity) AS min_quantity
# FROM
#     product_information
#         JOIN
#     order_items ON product_information.PRODUCT_ID = order_items.PRODUCT_ID
# GROUP BY
#     product_information.PRODUCT_ID, product_information.PRODUCT_NAME
# HAVING
#     MIN(order_items.quantity) = (
#         SELECT
#             MIN(quantity)
#         FROM
#             order_items
#     );


--  Найти товары с минимальным количеством, вывести имя товара и количество.

-- 1. Поздапрос - находим минимальное кол/во

select min(QUANTITY)
from order_items;

-- 2. Основной запрос - Найти товары с минимальным количеством, вывести имя товара и количество.

select product_information.product_name, order_items.QUANTITY
from order_items
         join product_information
              on order_items.product_id = product_information.product_id
where order_items.QUANTITY = (select min(QUANTITY)
                              from order_items);



