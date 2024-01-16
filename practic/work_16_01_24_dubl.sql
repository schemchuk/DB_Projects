use hr;
-- Вывести количество сотрудников в каждом департаменте. (имя департамента и кол/во сотрудников)
select
     departments.department_name,
    count(*) as emp_count
from
    departments
join
        employees on  employees.department_id = departments.department_id
group by departments.department_name;

-- Вывести среднюю зарплату по департаментам. (имя департамента и средняя зарплата)
select
    departments.department_name,
    avg(salary) as avg_salary
from
    departments
join
    employees on departments.department_id = employees.employee_id
group by departments.department_name;

-- Вывести общее количество сотрудников в каждом городе.
select
    locations.city,
    count(*) as emp_count
from
    employees
join
        departments on departments.department_id = employees.department_id
join
        locations on departments.location_id = locations.location_id
group by locations.city;

-- Найти департаменты с более чем 5 сотрудниками.(имя департамента, кол/во сотрудников)

select
    locations.city,
    count(*) as emp_count
from
    employees
        join
    departments on departments.department_id = employees.department_id
        join
    locations on departments.location_id = locations.location_id
group by locations.city
having count(*) > 5;

-- Найти страны, в которых количество сотрудников превышает 20. (country_name и кол/во сотрудников)

select
    countries.country_name,
    count(*)  as empt_count
from
    employees
join
        departments on employees.department_id = departments.department_id
join
        locations on  departments.location_id = locations.location_id
join
        countries on locations.country_id = countries.country_id
 group by
     countries.country_name
 having count(*) > 20;
-- Вывести среднюю зарплату по каждой должности.

select
    jobs.job_title,
    avg(jobs.max_salary - jobs.min_salary) as avg_salary
from
    jobs
group by
    jobs.job_title;

-- Вывести максимальную зарплату в каждом департаменте.
select
    departments.department_name,
    max(salary) as max_salary
from
    employees
join
        departments on employees.department_id = departments.department_id
group by departments.department_name;

-- Найти департаменты, в которых средняя зарплата превышает 10000.

select
    departments.department_name,

    avg(employees.salary) as avg_salary
from
    employees
        join
    departments on employees.department_id = departments.department_id

group by
    departments.department_name
having avg_salary > 10000;

-- Найти максимальное количество сотрудников в одном городе.

select
    locations.city,
    count(*) as nun_employees
from
    employees
join
        departments on employees.employee_id = departments.department_id
join
        locations on locations.location_id = departments.location_id
group by locations.city
#  Прекрасно работает без дальнейшего кода ???????????
# order by
#     nun_employees desc
# limit 1;












