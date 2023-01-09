create database hw_09_01_2023;
show databases;
use hw_09_01_2023;

-- Создать таблицу students
-- id уникальное значение, не null, автозаполнение 
-- firstname varchar not null
-- lastname varchar not null
-- class integer от 1 до 10
-- subject varchar not null
-- mark integer от 0 до 5

create table students(
id integer primary key auto_increment,
firstname varchar(100) not null,
lastname varchar(100) not null,
class integer check (class between 1 and 10),
subject varchar(100) not null,
mark integer check (mark between 0 and 5)
);

-- снять ограничение на удаление и изменнений
set sql_safe_updates = 0;

-- Заполнить таблицу строками (10 шт)
insert into students (firstname, lastname, class, subject, mark)
	values ('Bob', 'Marley', 3, 'history', 4),
    ('Bon', 'Jovy', 2, 'math', 5),
    ('John', 'Elton', 6, 'english', 1),
    ('Michael', 'Jackson', 5, 'math', 0),
    ('Victor', 'Choy', 7, 'music', 5),
    ('Oleg', 'Scripka', 1, 'history', 4),
	('Elvis', 'Presley', 1, 'math', 2),
	('John', 'Lennon', 4, 'english', 5),
	('Freddie', 'Mercury', 5, 'music', 5),
	('Ozzy', 'Osborn', 8, 'english', 3);
          
 select * from students;
 
 -- Удалить из таблицы студентов, у которых оценка 0
delete from students
where mark = 0; 

-- Найти всех студентов, у которых оценка выше 3
select * from students 
where mark > 3;

-- Найти всех студентов, которые учатся в первом классе и у них оценка меньше 3
select * from students
where mark < 3 and class = 1;
 
 -- Удалить из таблицы этих студентов
delete from students
where mark < 3 and class = 1;

-- Найти всех студентов, у которых длина имени больше 4 
select * from students
where length(firstname) > 4;

-- Найти всех студентов, у которых фамилия начинается с буквы "a" и имеет длину не менее 3 символов.
select * from students
where lastname like "A%" and length(lastname) >= 3;

-- В таблице оставить тех студентов, которые (проходят Х предмет и оценка выше 4) и тех 
-- студентов (которые учатся 7-10 классах и у них оценки ниже 3).
select * from students
where (subject = "math" and mark > 4) or (class between 7 and 10 and mark < 3);

-- Удалить таблицу.
drop table students;