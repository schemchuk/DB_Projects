use staff;

# alter table название_таблицы
# add название_столбца тип_данных_столбца
# drop column название_столбца
# modify column название_столбца новый_тип_данных_столбца
# alter column название_столбца set default значение_по_умолчанию
# add [constaint] ограничение
# drop [constaint] имя_ограничения



select * from phones;

-- Создать поле count_info varchar

alter table phones
    add count_info varchar(128);

-- update имя_табицы
-- set столбец1 = новое_значение, ...

-- Если Product_Count меньше/равно 2, count_info = 'Товар заканчивается',
-- Если Product_Count меньше/равно 5, count_info = 'Мало товара',
-- Если Product_Count меньше/равно 10, count_info = 'Есть в наличии',
-- В остальных случаях count_info ='Много товара';

set sql_safe_updates = 0;

update phones
set count_info =
        case
            when Product_Count<=2 then 'Товар заканчивается'
            when Product_Count<=5 then 'Мало товара'
            when Product_Count<=10 then 'Есть в наличии'
            else 'Много товара'
            end;


alter table phones
drop column count_info;
