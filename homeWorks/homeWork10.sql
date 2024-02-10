

# 1. Создать таблицу students(1)
#     firstname varchar not null
#     lastname varchar not null
#
#     age integer
#     subject varchar not null
#     mark numeric(2, 1) от 0 до 5
    use db_Studio;
create table students(
    firstname varchar(128) not null ,
    lastname varchar(128) not null ,
    age int,
    subjekt varchar(128) not null ,
    mark numeric(2,1) check ( mark between 0 and 5)
);
#
#
# Добавить поле id уникальное значение, не null,
# автозаполнение в начало таблицы
    alter table students
    add id int primary key not null auto_increment first ;

#
# Изменить тип mark на integer
    alter table students
    modify column mark int;
#
# Удалить поле age
    alter table students
    drop age;
#
# Добавить поле class integer от 1 до 10, вставить после lastname
    alter table students
    add class int  check ( class between 1 and 10) after lastname;
#
# Заполнить таблицу строками (10 шт)
    insert into students(firstname, lastname, class, subjekt, mark)
    values
        ('Опанас', 'Довбищенко', 2, 'Математика', 5),
        ('Мария', 'Ли', 3, 'Физика', 3),
        ('Ким', 'Сидоров', 4, 'Литература', 2),
        ('Еле', 'Козло', 5, 'История', 0),
        ('Ду', 'Aфигинович', 6, 'Химия', 5),
        ('Степан', 'Пака', 7, 'Биология', 4),
        ('Андрей', 'Мор', 8, 'География', 1),
        ('Шлёма', 'Гомельский', 1, 'Информатика', 5),
        ('Гаврюша', 'Обизянов', 10, 'Иностранный язык', 5),
        ('Саломон', 'Самсонович', 9, 'Искусство', 5);
#
# Удалить из таблицы студентов, у которых оценка 0
    delete from students
    where mark = 0;

#
# Найти всех студентов, у которых оценка выше 3
    select* from students
    where mark > 3;
#
# Найти всех студентов, которые учатся в первом классе и у них оценка меньше 3
select* from students
where mark < 3;
#
# Удалить из таблицы этих студентов
    delete from students
    where mark < 3;

#
# Найти всех студентов, у которых длина имени больше 4 букв
    select
        firstname as sel_firstname
        from students
    where length(firstname) > 4;
#
# Найти всех студентов, у которых фамилия начинается с буквы "a" и имеет длину не менее 3 символов.

    select
        students.firstname,
        students.lastname
    from students
    where lastname like 'A%' and length(lastname) >= 3;

#
# Удалить таблицу.
drop table students;