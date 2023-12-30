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
    join products on order_details.ProductID = products.ProductID;
#
# Вывести данные о заказах (номерзаказа, имяклиента, странаклиента, фамилияменеджера, названиекомпанииперевозчика)
select
    orders.OrderID,
    customers.CustomerName as CustomerName,
    customers.Country as CustomerCountry,
    employees.LastName as ManagerLastName,
    shippers.ShipperName as ShipperName
from
    orders
        join
    customers on orders.CustomerID = customers.CustomerID
        join
    employees on orders.EmployeeID = employees.EmployeeID
        join
    shippers on orders.ShipperID = shippers.ShipperID;

#
# Вывести сумму, на которую было отправлено товаров клиентам в Germany
select
    SUM(products.Price * order_details.quantity) as TotalAmountSentToGermany
from
    orders
        join
    customers on orders.CustomerID = customers.CustomerID
        join
    order_details on orders.OrderID = order_details.OrderID
        join
    products on order_details.ProductID = products.ProductID
where
    customers.Country = 'Germany';
