use oe;
# CASE
# 	When условие1 then результат1
# 	When условие2 then результат2
# 	When условие3 then результат3
# 	...
#     [Else алтернативный_результат]
# END
create database staff;
use staff;

CREATE TABLE Staff (
                       id INTEGER PRIMARY KEY AUTO_INCREMENT,
                       firstname VARCHAR(64) NOT NULL,
                       lastname VARCHAR(64) NOT NULL,
                       position VARCHAR(128),
                       age INTEGER,
                       has_child CHAR(1),
                       username VARCHAR(128) unique
);

INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES
    ('Anna'
    , 'Khachaturyan'
    , 'Senior Teacher'
    , 22
    , 'N'
    , 'annakhach5'
    );

# select *
# from Staff
# case
#
# end



INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES
    ('Tom'
    , 'Austin'
    , 'Junior Blogger'
    , 25
    , 'Y'
    , 'tom12345'
    );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES
    ('Bill'
    , 'Lorentz'
    , 'Junior Web Developer'
    , 40
    , 'Y'
    , 'billt1'
    );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES
    ('Lily'
    , 'May'
    , 'Junior Backend Developer'
    , 25
    , 'Y'
    , 'lil12'
    );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES
    ('Nona'
    , 'Lucky'
    , 'Junior Teacher'
    , 20
    , 'N'
    , 'LuckyNona'
    );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES
    ( 'Nancy'
    , 'Greenberg'
    , 'Middle UI Designer'
    , 32
    , 'Y'
    , 'nancy1'
    );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES
    ('Daniel'
    , 'Faviet'
    , 'Senior UX Designer'
    , 43
    , 'Y'
    , 'favietD'
    );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES
    ('Ally'
    , 'Austin'
    , 'Junior UI Designer'
    , 28
    , 'N'
    , 'ally1'
    );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES
    ('Lily'
    , 'Chen'
    , 'Senior Teacher'
    , 25
    , 'Y'
    , 'lilychen'
    );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES
    ('Anna'
    , 'Austin'
    , 'Middle Teacher'
    , 34
    , 'Y'
    , 'anna28'
    );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES
    ('Alexander'
    , 'Lorentz'
    , 'Junior Backend Developer'
    , 25
    , 'N'
    , 'alex12345'
    );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES
    ('Ashley'
    , 'Lorentz'
    , 'Junior UX Designer'
    , 18
    , 'N'
    , 'lorentz99'
    );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES
    ('Tom'
    , 'Lucky'
    , 'Middle Blogger'
    , 34
    , 'Y'
    , 'lucky78'
    );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES
    ('Ashley'
    , 'Weiss'
    , 'Junior Blogger'
    , 18
    , 'N'
    , 'weiss11'
    );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES
    ('Tom'
    , 'Weiss'
    , 'Junior UI Designer'
    , 18
    , 'N'
    , 'tom222'
    );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES
    ('Anna'
    , 'Bloom'
    , 'Middle UX Designer'
    , 20
    , 'N'
    , 'bloom5'
    );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES
    ('Tom'
    , 'Berg'
    , 'Middle Teacher'
    , 34
    , 'N'
    , 'tommy1'
    );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES
    ('Ashley'
    , 'Berg'
    , 'Senior Teacher'
    , 37
    , 'N'
    , 'ash89'
    );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES
    ('Lily'
    , 'Weiss'
    , 'Middle Blogger'
    , 45
    , 'N'
    , 'lilyW1'
    );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES
    ('Anna'
    , 'Lorentz'
    , 'Senior UX Designer'
    , 31
    , 'N'
    , 'annlo1'
    );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES
    ('Ashley'
    , 'Weiss'
    , 'Middle UX Designer'
    , 18
    , 'N'
    , 'weiss1'
    );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES
    ('Anna'
    , 'Keren'
    , 'Junior UX Designer'
    , 34
    , 'N'
    , 'annaK1'
    );



-- >40, group3

select *,
       case
           when age<=18
               then 'group1'
           when age>18 and age<=40
               then 'group2'
           when age>40
               then 'group3'
           end as age_groups
from Staff;

-- info
-- has_child - N, 'нет детей'
-- has_child - Y, 'есть дети'
select *,
case
when has_child = 'N'
then 'нет детей'
when has_child = 'Y'
then 'Усть дети'

end as info
from Staff;

-- info
-- has_child - N, 'нет детей'
-- has_child - Y, 'есть дети'

select *,
       case
           when has_child = 'N'
               then 'нет детей'
           when has_child = 'Y'
               then 'есть дети'
           end as info
from Staff;

create table phones(
                       id int primary key auto_increment,
                       product_name varchar(50) not null,
                       product_count int,
                       starting_price int
);

insert into phones(product_name, product_count, starting_price)
values ('iPhone 10 pro', 3, 700),
       ('iPhone 11 pro', 2, 760),
       ('iPhone 12', 5, 900),
       ('iPhone 12 pro', 7, 950),
       ('iPhone 13', 15, 1050),
       ('iPhone 13 pro max', 10, 1150),
       ('iPhone 14', 1, 1200),
       ('iPhone 14 pro', 16, 1300)
;

-- Вывести новое поле count_info, заполнить ее:
-- Если Product_Count меньше/равно 2, category = 'Товар заканчивается',
-- Если Product_Count меньше/равно 5, category = 'Мало товара',
-- Если Product_Count меньше/равно 10, category = 'Есть в наличии',
-- В остальных случаях category ='Много товара';

select *,
    case
           when product_count <= 2
                 then 'Товар заканчивается'
           when product_count <= 5
                then 'Мало товара'
            when product_count <= 10
                then 'Есть в наличии'
            else 'Много товара'
           end as count_info
from phones;

-- Вывести новое поле tax
-- Заполнить поле tax
-- Если начальная цена меньше 700, tax = null,
-- если больше либо равно 700 и меньше 850, tax = 15,
-- если больше или равно 850, tax = 25
select *,
       case
           when phones.starting_price <= 700
                then null
            when phones.starting_price > 700 && phones.starting_price < 850
                then 15
            else 25
end as tax
from phones;

use oe;

select *
from order_items;

select  avg(order_items.UNIT_PRICE)
from order_items
where QUANTITY > 50;

select  avg(
        case
            when order_items.QUANTITY > 50
        then order_items.UNIT_PRICE
        else null
        end
        )as avg
from order_items;

# Если у покупателя credit_limit меньше 600, выводить 1, если больше либо равно 600 и меньше
# 800 выводить 2, если больше либо равно 800 вводить 3, и выводить имя и фамилию
# покупателей.

select
    CUST_FIRST_NAME,
    CUST_LAST_NAME,
    case
        when CREDIT_LIMIT < 600
            then 1
        when CREDIT_LIMIT < 800
            then 2
        else 3
end as result
from
customers;

select*
    from
        orders;

select
    orders.CUSTOMER_ID,
    sum(orders.ORDER_TOTAL)
from orders
group by  CUSTOMER_ID;

select
    orders.CUSTOMER_ID,
    case
        when sum(ORDER_TOTAL) > 15000
                 then 'member'
        else 'new'
        end as sum
from orders
group by  CUSTOMER_ID;



-- 2. Если у покупателя сумма order_total больше 15000 вывести member, в остальных случаях new

select customer_id,
       case
           when sum(order_total)>15000 then 'member'
           else 'new'
           end as sum
from orders
group by customer_id;

# Вывести название продукта и разницу между list_price и min_price, если эта разница больше
# 100, если нет вывести null(result).
#
# select * from product_information;
#
# PRODUCT_NAME, result

select
    PRODUCT_NAME,
    case
        when LIST_PRICE - MIN_PRICE > 100
        then LIST_PRICE - MIN_PRICE
        else null
        end as result
from product_information;

# alter table название_таблицы
# add название_столбца тип_данных_столбца
# drop column название_столбца
# modify column название_столбца новый_тип_данных_столбца
# alter column название_столбца set default значение_по_умолчанию
# add [constaint] ограничение
# drop [constaint] имя_ограничения

use staff;

select * from phones;

