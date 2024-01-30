
use hr;

# Найти количество сотрудников в каждом департаменте. Вывести departmentid и employeescnt
SELECT
    department_id,
    COUNT(*) AS employeescnt
FROM
    employees
GROUP BY
    department_id;

#
# Найти количество сотрудников в каждом департаменте. Вывести departmentname и employeescnt
    select
        departments.department_name,
        count(employees.employee_id) as employeescnt
    from
        departments
    join
            employees
    on
        departments.department_id = employees.department_id
    group by
        departments.department_name;

#
# Найти количество сотрудников у каждого менеджера. Вывести managerid и employeescnt
#
SELECT
    manager_id,
    COUNT(employee_id) AS employeescnt
FROM
    employees
GROUP BY
    manager_id;

# Найти количество сотрудников у каждого менеджера. Вывести firstname,  lastname и employees_cnt

SELECT
   manager_id,
    first_name,
    last_name,
    COUNT(employees.employee_id) AS employees_cnt
FROM
    employees
GROUP BY
    manager_id, first_name,last_name;


# Найти максимальную зарплату в каждом департаменте. Вывести departmentid и maxsalary
SELECT
    department_id,
    MAX(salary) AS maxsalary
FROM
    employees
GROUP BY
    department_id;

# Найти сотрудников, у которых наибольшая зарплата в их департаменте

select
    department_id,
    max(employees.salary)
from employees
group by department_id;

select
    employees.first_name,
  employees.last_name,
    employees.salary,
    t1.max_salary,
    employees.department_id
from employees
         join (select
                   department_id,
                   max(employees.salary) as max_salary
               from employees
               group by department_id) t1
              on employees.department_id = t1.department_id
where employees.salary = t1.max_salary;


# Найти департаменты, в которых больше 10 сотрудников. Вывести department_name

select
    departments.department_name,
    count(employees.employee_id) as employeescnt
from
    departments
        join
    employees
    on
        departments.department_id = employees.department_id
group by
    departments.department_name
having
    count(employees.employee_id) > 10;