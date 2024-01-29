use hr;
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
    managers.manager_id,
    managers.first_name,
    managers.last_name,
    COUNT(employees.employee_id) AS employees_cnt
FROM
    employees
        JOIN
    employees managers ON employees.manager_id = managers.employee_id
GROUP BY
    managers.manager_id, managers.first_name, managers.last_name;


# Найти максимальную зарплату в каждом департаменте. Вывести departmentid и maxsalary
SELECT
    department_id,
    MAX(salary) AS maxsalary
FROM
    employees
GROUP BY
    department_id;

# Найти сотрудников, у которых наибольшая зарплата в их департаменте
#
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