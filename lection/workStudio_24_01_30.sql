use hr;
# . Найти сотрудников, которые зарабатывают меньше всего в своем департаменте.
# Вывести имя, фамилию сотрудника, его зп и номер департамента
SELECT
    e.first_name,
    e.last_name,
    e.salary,
    e.department_id
FROM
    employees e
        JOIN
    (
        SELECT
            department_id,
            MIN(salary) AS min_salary
        FROM
            employees
        GROUP BY
            department_id
    ) min_salaries ON e.department_id = min_salaries.department_id AND e.salary = min_salaries.min_salary;

SELECT
    employees.first_name,
    employees.last_name,
    employees.salary,
    employees.department_id
FROM
    employees
        JOIN
    (
        SELECT
            department_id,
            MIN(salary) AS min_salary
        FROM
            employees
        GROUP BY
            department_id
    ) min_salaries ON employees.department_id = min_salaries.department_id AND employees.salary = min_salaries.min_salary;

# Найти сотрудников, которые зарабатывают больше  всего в своем департаменте.
# Вывести имя, фамилию сотрудника, его зп и номер департамента

select
    department_id,
    max(employees.salary)
from employees
group by department_id;

select
    t1.first_name,
    t1.last_name,
    t1.salary,
    t2.max_salary,
    t1.department_id
    from employees t1
join (select
          department_id,
          max(employees.salary) as max_salary
      from employees
      group by department_id) t2
on t1.department_id = t2.department_id
where t1.salary = t2.max_salary;

-- 3. Вывести самую большую зп в каждом департаменте, если значение зп больше 10000

select
    department_id,
    max(employees.salary) as max_salary
from employees
group by department_id
having max_salary > 10000;

-- 4. Найти самую маленькую зарплату в каждом департаменте. Вывести Название департамента и самую маленькую зарплату в нем

SELECT
    departments.department_name,
    MIN(employees.salary) AS min_salary
FROM
    employees
        JOIN
    departments ON employees.department_id = departments.department_id
GROUP BY
    departments.department_name;
