use hr;

-- 1. Найти сотрудников
#  (имя, фамилия, зарплата), которые зарабатывают больше всех в компании
select
    employees.first_name,
    employees.last_name,
    employees.salary

from employees
WHERE
    salary = (select max(employees.salary) from employees);

-- 2. Найти самую маленькую зарплату в каждом департаменте.
#  Вывести айди департамента и самую маленькую зарплату в нем

select
    department_id,
    min(salary) as min_salary
from employees
group by department_id;



