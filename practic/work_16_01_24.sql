use hr;
select * from jobs;

# -- Вывести количество сотрудников в каждом департаменте.

SELECT
    departments.department_name,
    COUNT(employee_id) AS employee_count
FROM
    employees
        JOIN
    departments ON employees.department_id = departments.department_id
GROUP BY
    departments.department_name;
-- Вывести среднюю зарплату по департаментам. (имя департамента и средняя зарплата)

SELECT
    departments.department_name,
    AVG(employees.salary) AS average_salary
FROM
    employees
        JOIN
    departments ON employees.department_id = departments.department_id
GROUP BY
    departments.department_name;

-- Вывести общее количество сотрудников в каждом городе.
SELECT
    locations.city,
#     departments.department_name,
    COUNT(employees.employee_id) AS total_employees
FROM
    employees
        JOIN
    locations ON departments.location_id = locations.location_id
        JOIN
    departments ON employees.department_id = departments.department_id
GROUP BY
    locations.city, departments.department_name;

-- Найти департаменты с более чем 5 сотрудниками.(имя департамента, кол/во сотрудников)

-- Найти страны, в которых количество сотрудников превышает 20. (country_name и кол/во сотрудников)
select * from employees;
select * from departments;
select * from locations;
select * from countries;

SELECT
    countries.country_name,
    COUNT(employees.employee_id) AS total_employees
FROM
    employees
        JOIN
    departments ON employees.department_id = departments.department_id
        JOIN
    locations ON departments.location_id = locations.location_id
        JOIN
    countries ON locations.country_id = countries.country_id
GROUP BY
    countries.country_name
HAVING
    total_employees > 20;









--  Агрегатные функции

-- count кол/во
-- avg среднее
-- sum сумма
-- min наименьшее
-- max наибольшее