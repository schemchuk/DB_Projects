-- Вывести ко-во товаров с ценой от 10 до 250 EUR

    use w3schools;

select
    count(*) as number_of_price_from_10_to_250_EUR
from products
where
    Price between 10 and 250;

# Вывести ко-во поставщиков не из UK и не из China
select
    count(*) as total_not_uk_china_suppliers
from suppliers
where
Country  not in ('UK', 'China');
#
# Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5
    select
        count(*) as number_googs,
        max(price) as max_price,
        min(price) as min_price
    from products
    where CategoryID in (3,5);

#
# Вывести общую сумму проданных товаров
    select
        sum(order_details.quantity * products.Price) as total_sum
    from order_details
    JOIN products on order_details.ProductID = products.ProductID;
#
# Вывести данные о заказах (номерзаказа, имяклиента, странаклиента, фамилияменеджера, названиекомпанииперевозчика)
SELECT
    orders.OrderID,
    customers.CustomerName AS CustomerName,
    customers.Country AS CustomerCountry,
    employees.LastName AS ManagerLastName,
    shippers.ShipperName AS ShipperName
FROM
    orders
        JOIN
    customers ON orders.CustomerID = customers.CustomerID
        JOIN
    employees ON orders.EmployeeID = employees.EmployeeID
        JOIN
    shippers ON orders.ShipperID = shippers.ShipperID;

#
# Вывести сумму, на которую было отправлено товаров клиентам в Germany
SELECT
    SUM(products.Price * order_details.quantity) AS TotalAmountSentToGermany
FROM
    orders
        JOIN
    customers ON orders.CustomerID = customers.CustomerID
        JOIN
    order_details ON orders.OrderID = order_details.OrderID
        JOIN
    products ON order_details.ProductID = products.ProductID
WHERE
    customers.Country = 'Germany';
