use  w3schools;
# **Задача. Вывести заказы клиентов из `France`**
#
# проекция: `номер_заказа`, `имя_клиента`
select
orders.OrderID,
customers.CustomerName

from
    orders
join
        customers on customers.CustomerID = orders.CustomerID
where customers.Country = 'France';


# **Задача. Вывести заказы клиентов из `France` и `Germany`**
#
# проекция: `номер_заказа`, `имя_клиента`, `фамилия_сотрудника`
select
    orders.OrderID,
    customers.CustomerName,
    CONCAT(employees.FirstName, ' ', employees.LastName) AS emplouer_name


from
    orders
        join
    customers on customers.CustomerID = orders.CustomerID
join
        employees on orders.EmployeeID = employees.EmployeeID
where customers.Country  in ('France', 'Germany');