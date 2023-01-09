-- создаем базу данных
create database FE37_38;

show databases;

use FE37_38;
-- 1. Создать таблицу products
-- 		id первичный ключ автоинкремент
-- 		title строка 128
-- 		quantity от 0 до 10

create table products(
	id integer primary key auto_increment,
    title varchar(128),
    quantity integer check (quantity between 0 and 10)
);

select * from products;

insert into products (title, quantity)
values ('Apple', 3), 
		('Orange', 2), 
		('Banana', 10), 
		('Pineapple', 7), 
		('Kiwi', 4);
        
alter table products
add price integer default 0;

alter table products
modify column price numeric(8, 2);

alter table products
modify column price integer;

alter table products
change price item_price integer;

alter table products
drop column item_price;

-- Добавить поле quality типа numeric(2, 2) со значение по умолчанию 0
alter table products
add quality numeric(2, 2) default 0;

alter table products
modify column quality integer;

-- снять ограничение на удаление и изменнений
set sql_safe_updates = 0;

-- удалить все в таблице 
delete from products;

-- удалить таблицу
drop table products;

-- Создать таблицу students с полями
-- 		name строка (не null)
-- 		lastname строка (не null)
-- 		avg_mark целое число (от 0 до 10)
-- 		gender строка(128) (или “M” или “F”)

create table students(
name varchar(100) not null,
lastname varchar(100) not null,
avg_mark integer check (avg_mark between 0 and 10),
gender varchar(128) check (gender in("M" , "F"))
);

alter table students
add id integer primary key auto_increment;

alter table students
modify column gender char(1);

alter table students
modify column avg_mark numeric(2,1);

alter table students
change name firstname integer;

alter table students
modify column firstname varchar(100);

insert into students (firstname, lastname, avg_mark, gender)
	values ("Олег", "Петров", 4.3, "M"),
("Семен", "Степанов", 3.1, "M"),
("Ольга", "Семенова", 4.7, "F"),
("Игорь", "Романов", 3.1, "M"),
("Ирина", "Иванова", 2.2, "F");

drop table students;

create table students(
name varchar(100) not null,
lastname varchar(100) not null,
avg_mark integer check (avg_mark between 0 and 10),
gender varchar(128) check (gender in("M" , "F"))
);

--  Найти учеников, у которых оценка больше 4
select * 
from students
where avg_mark > 4;

--  Найти учеников, у которых оценка не входит в диапазон от 3 до 4
select * 
from students
where avg_mark not between 3 and 4;

--   Найти учеников, у которых имя начинается на И
select * 
from students
where firstname like "И%";

--   Найти учеников, у которых оценка 2.2 или 3.1 или 4.7
select * 
from students
where avg_mark in (2.2 , 3.1, 4.7);

-- Увеличить оценку всем студентам в 2 раза
update students
set avg_mark = avg_mark*2;

-- Поменять у Олега Петрова фамилию на Сидоров
update students
set lastname = "Сидоров"
where  firstname = "Олег" and  lastname = "Петров";

select * from students;

-- Создать таблицу employees;
--  	employee_id целое число первичный ключ автоинкремент;
--  	fname строка не null,
--  	last_name строка не null,
--  	email строка не null,
--  	phone строка не null

create table employees (
	employee_id integer primary key	 auto_increment,
    fname varchar (128) not	null,
	last_name varchar (128) not	null,
    email varchar (128) not	null,
    phone varchar (128) not	null
    );

-- Добавить поле salary numeric(9, 2)
alter table employees
add salary numeric(9,2);

-- Изменить тип salary на integer
alter table employees
modify column salary integer default 0;

-- Переименовать поле fname на first_name
alter table employees
change fname first_name varchar(128);

-- Удалить поле phone
alter table employees
drop column phone;

-- Добавить поле department строка не null
alter table employees
add department varchar(128) not	null;
    
insert into employees(first_name, last_name, email, salary, department) values("Steven","King",	"SKING", 24000, "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Neena" , "Kochhar" , "NKOCHHAR" , 17000 , "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Lex" , "De Haan" , "LDEHAAN" , 17000 , "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Alexander" , "Hunold" , "AHUNOLD" , 9000 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Bruce" , "Ernst" , "BERNST" , 6000 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Valli" , "Pataballa" , "VPATABAL" , 4800 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Diana" , "Lorentz" , "DIANALO" , 8800 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Nancy" , "Greenberg" , "NGREENBE" , 12008 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Daniel" , "Faviet" , "DFAVIET" , 9000 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Jose Manuel" , "Urman" , "JMURMAN" , 7800 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Luis" , "Popp" , "LPOPP" , 6900 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Den" , "Raphaely" , "DRAPHEAL" , 11000 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Alexander" , "Khoo" , "AKHOO" , 3100 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Shelli" , "Baida" , "SBAIDA" , 2900 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Sigal" , "Tobias" , "STOBIAS" , 2800 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Matthew" , "Weiss" , "MWEISS" , 8000 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Fripp" , "AFRIPP" , 8200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Payam" , "Kaufling" , "PKAUFLIN" , 7900 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Shanta" , "Vollman" , "SVOLLMAN" , 6500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Kevin" , "Mourgos" , "KMOURGOS" , 5800 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Julia" , "Nayer" , "JNAYER" , 3200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Markle" , "SMARKLE" , 2200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Laura" , "Bissot" , "LBISSOT" , 3300 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Mozhe" , "Atkinson" , "MATKINSO" , 2800 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Joshua" , "Patel" , "JPATEL" , 2500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Trenna" , "Rajs" , "TRAJS" , 3500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("John" , "Russell" , "JRUSSEL" , 14000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Karen" , "Partners" , "KPARTNER" , 13500 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Alberto" , "Errazuriz" , "AERRAZUR" , 12000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Gerald" , "Cambrault" , "GCAMBRAU" , 11000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Eleni" , "Zlotkey" , "EZLOTKEY" , 10500 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Vargas" , "PVARGAS" , 2500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Laura" , "Errazuriz" , "AERRAZUR" , 12000 , "IT");    

-- Найти всех ИТ работников с зарплатой выше 12000
select * from employees
where salary > 12000 and department = "IT";

-- Повысить зарплату работников отдела Human Resources в 5 раз
update employees
set salary = salary*5
where department = "Human Resources" ;

-- Найти работников отдела Marketing с зарплатой ниже 2850
select * from employees
where salary < 2850 and department = "Marketing";

-- У руководителя родились близнецы Лаура и Адам, 
-- в честь праздника он решил повысить зарплату работников с именами Лаура и Адам в 10 раз
update employees
set salary = salary*10
where first_name in ('Laura','Adam');

-- Diana Lorentz вышла замуж и поменяла фамилию на King. Поменяйте у Diana Lorentz фамилию на King.
select * from employees
where first_name = 'Diana' and last_name = 'Lorentz';

update employees
set last_name = 'King'
where first_name = 'Diana' and last_name = 'Lorentz';

select * from employees
where first_name = 'Diana' and last_name = 'King';

-- Всех работников отдела sales уволили. Удалите работников sales из таблицы
delete from employees
where department = 'sales';

-- John Russell перевели в отдел Marketing и повысили зарплату на 5000. Измените данные для  работника John Russell.
update employees
set department = 'Marketing', salary = salary + 5000
where first_name = 'John' and last_name = 'Russell';

-- После праздника руководитель протрезвел и уменьшил зарплаты работников с именами Лаура и Адам в 10 раз.
update employees
set salary = salary/10
where first_name in ('Laura','Adam');

-- Laura Bissot поменяла свой мейл на BISSOTLAURA. Измените данные для работника Laura Bissot.
update employees
set email = 'BISSOTLAURA'
where first_name = 'Laura' and last_name = 'Bissot';

-- Diana King развелась и поменяла фамилию обратно на Lorentz. 
-- И в честь развода руководитель повысил ее зарплату на 2000. Измените данные для работника Diana King.
update employees
set last_name = 'Lorentz', salary = salary + 2000
where first_name = 'Diana' and last_name = 'King';

-- посмотреть всю таблицу
select * from employees;

