-- В рамках БД "онлайн-магазин" напишите след/запросы:
    use w3schools;

--
--
-- Найти мин/стоимость товаров для каждой категории
select
    categories.CategoryName,
    min(products.Price) as min_price
from
    categories
join
    products  on categories.CategoryID = products.CategoryID
group by
    categories.CategoryName;
--
-- Вывести названия категорий, в которых более 10 товаров
    select
        categories.CategoryName,
        count(products.ProductName) as quantity_goods

    from
        categories
    join
        products  on categories.CategoryID = products.CategoryID
    group by categories.CategoryName
    having
        count(products.ProductID) > 10;


--
-- Вывести три самых дешевых заказа
    select
        orders.OrderID,
        sum(products.Price * order_details.Quantity) as total_sum
    from
        orders
    join
            order_details on orders.OrderID = order_details.OrderID
    join
            products on order_details.ProductID = products.ProductID
    group by
        orders.OrderID
    order by
        total_sum asc
    limit 3;



--
-- Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15
    select
        employees.FirstName,
        employees.LastName,
        count(orders.OrderID) as total_orders
    from employees
    join
        orders on employees.EmployeeID = orders.EmployeeID
    group by
        employees.EmployeeID, employees.FirstName, employees.LastName
    having total_orders < 15;


--
-- Вывести ТОП-1 стран по ко-ву клиентов
select
    customers.Country,
    count(customers.CustomerID) as customers_number
from customers
group by
    customers.Country
order by
    customers_number desc
limit 1;
