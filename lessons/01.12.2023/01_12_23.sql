-- 1.	Создать базу данных lesson4
create database lesson4;

-- 2.	Удалить ее
drop database lesson4;

-- 3.	Использовать базу данных sakila
use sakila;

-- 4.	Посмотреть какие есть 
show tables;

-- 5.
select
	address,
    district,
    city_id,
    phone,
    postal_code
from address;
	
-- 6.
select * from address
where district in('QLD', 'Alberta');

-- 7.
select * from address
where city_id not between 301 and 561;

-- 8.
select * from address
where postal_code ='';

-- 9.
select * from address
where phone like '8%1';

-- 10.	Из таблицы film вывести столбцы title, description и special_features
select 
	title,
    description,
    special_features
    from film;

-- 11.	Вывести те фильмы, названия которых начинаются на буквы A, B, E
select * from film
where title like 'A%' or  title like 'B%' or  title like 'E%';

-- 12.	Вывести те фильмы, в описании которых есть слово girl.
select * from film
where description like '%girl%';

-- 13.	Вывести те фильмы, в описании которых нет слов unbelieavable, но есть слово drama, и в special_features есть trailers.
select * from film 
where description not like '%unbelieavable%' and description like '%drama%' and special_features like '%trailers%';

-- 14.	Из таблицы customer вывести столбцы first_name, last_name, address_id и active
select 
	first_name,
    last_name,
    address_id,
    active
 from customer;

-- 15.	Вывести тех покупателей, у которых active 0
 select * from customer
 where active = 0;
 

-- 16.	Вывести тех покупателей, у которых address_id не находится в интервале [10, 15]
 select * from customer
 where address_id not between 10 and 15;
 
-- 17.	Вывести тех покупателей, у которых имя начинается с букв An, а фамилия заканчивается на букву L.
 select * from customer
 where first_name like 'An%' and last_name like '%l';

-- 18.	Из таблицы country найти и вывести id Германии.
select country_id from country 
where country = 'Germany';

-- 19.	Из таблицы city найти все города Германии и вывести их.
select city from city
where country_id = 38;

-- 20.	Из таблицы city вывести все города с country_id 3, 5, 13, 46 и 107.
select city from city
where country_id in(3, 5, 13, 46, 107);

-- --------------------------------------
-- 1.	Использовать базу данных fe37_38
use fe37_38;

-- 2.	Вывести все таблицы из этой бд
show tables;

-- 3.	Создать таблицу customers
-- id целое число первичный ключ автоинкремент, 
-- first_name строка не null,
-- last_name строка не null,
-- age целое число больше 18,
-- phone integer не null,
-- order_name строка не null,
-- delivery_status целое число 1 или 0
create table customers(
	id integer primary key auto_increment,
    first_name varchar(100) not null,
    last_name varchar(100) not null, 
    age integer check (age > 18), 
    phone integer not null,
    order_name integer not null, 
    delivery_status integer check (delivery_status in(1 , 0))
    );
    
alter table customers
modify column order_name varchar(100) not null;
	
-- 4.	Удалить поля first_name и last_name 
alter table customers
drop column	first_name, 
drop column last_name;

-- 5.	Добавить поле full_name строка не null
alter table customers
add column full_name varchar(100) not null;

-- 6.	Переименовать поле id на customer_id
alter table customers
change column id customer_id integer;

alter table customers
modify column customer_id integer auto_increment;

-- 7.	Добавить поле price целое число не null
alter table customers
add column price integer not null;

-- 8.	Изменить тип phone на строку 
alter table customers
modify column phone varchar(100);

-- 9.	Удалить поле phone
alter table customers
drop column phone;

-- 10.	Переименовать поле price на sum_price целое число не null
alter table customers
change column price sum_price integer not null;

-- 11.	Заполнить таблицу (customers.txt)
insert into customers(full_name, age, order_name, delivery_status, sum_price) 
			values( "Kris Krill" , 20 , "math_book, pen" , 0 , 9000 ) ,
				( "Kristin Brooks" , 50 , "notebook, pen, drawing_block" , 0 , 4500 ) ,
				( "Kristina Livshits" , 55 , "pencil, sharpener" , 1 , 2340 ) ,
				( "Kristina Nunez" , 43 , "math_book, eng_book, phil_book" , 1 , 18000 ) ,
				( "Kurtis Parham" , 19 , "pencil" , 1 , 350 ) ,
				( "Lai Kurtich" , 22 , "pen, sharpener" , 1 , 1200 ) ,
				( "Lakia Fitzen" , 21 , "notebook, pen" , 1 , 3500 ) ,
				( "Landon Neville" , 34 , "colored papers, pencil" , 1 , 2450 ) ,
				( "Latoria Siprasoeuth" , 32 , "pen, sharpener, rubber" , 1 , 4600 ) ,
				( "Laurice Goffredo" , 76 , "watercolors, drawing_block" , 1 , 1200 ) ,
				( "Laurice Grimstead" , 54 , "notebook" , 1 , 4500 ) ,
				( "Laurice Karl" , 19 , "colored papers" , 0 , 2250 ) ,
				( "Laveta Wida" , 34 , "pen, math_book" , 0 , 1170 ) ,
				( "Lecia Alvino" , 45 , "pencil, sharpener, notebook" , 1 , 9000 ) ,
				( "Lenore Sullivan" , 55 , "eng_book, notebook" , 1 , 175 ) ,
				( "Leon Schoepfer" , 67 , "notebook" , 0 , 600 ) ,
				( "Lexie Magee" , 54 , "watercolors, drawing_block, brushes" , 0 , 1750 ) ,
				( "Li Robleto" , 76 , "brushes, pencil, notebook" , 0 , 1225 ) ,
				( "Libby Krauss" , 78 , "brushes, watercolor" , 0 , 2300 ) ,
				( "Lillia Talbott" , 65 , "eng_book, pen, rubber" , 0 , 600 ) ,
				( "Linda Merida" , 54 , "notebook, pen, drawing_block" , 1 , 7700 ) ,
				( "Lisa Hughes" , 34 , "flag" , 1 , 5450 ) ,
				( "Lloyd Shackley" , 23 , "brushes, watercolor" , 1 , 4370 ) ,
				( "Lola Whitley" , 24 , "notebook" , 0 , 12200 ) ,
				( "Lonnie Colby" , 74 , "notepad" , 1 , 3375 ) ,
				( "Lorilee Bautista" , 24 , "pencil, sharpener" , 1 , 3800 ) ,
				( "Loris Thibadeau" , 54 , "notepad" , 1 , 4950 ) ,
				( "Lorita Koenig" , 59 , "flag" , 0 , 4425 ) ,
				( "Love Whistlehunt" , 47 , "notepad" , 1 , 5500 ) ,
				( "Lovie Ritacco" , 23 , "colored papers" , 1 , 3800 ) ,
				( "Loyd Huckeba" , 26 , "flag" , 0 , 300 ) ,
				( "Loyd Puchalla" , 25 , "notebook" , 1 , 3850 ) ,
				( "Luana Berends" , 38 , "pencil, sharpener, rubber" , 1 , 2725 ) ,
				( "Lucas Summerill" , 36 , "notepad, pen" , 0 , 2185 ) ,
				( "Luciano Lingenfelter" , 80 , "sharpener" , 1 , 6100 ) ,
				( "Lucila Heck" , 58 , "brushes, watercolor" , 1 , 1687.5 ) ,
				( "Luigi Nored" , 23 , "notepad" , 1 , 1900 ) ,
				( "Luis Pothoven" , 38 , "flag" , 1 , 2475 ) ,
				( "Luther Ardinger" , 49 , "notebook" , 1 , 2212.5 ) ,
				( "Mable Ballard" , 59 , "colored papers, pencil" , 1 , 2750 ) ,
				( "Maia Leggett" , 71 , "notepad" , 1 , 1900 ) ,
				( "Marc Domanski" , 58 , "rubber, pencil" , 1 , 4930 ) ,
				( "Marco Slivka" , 80 , "brushes, watercolor" , 1 , 2680 ) ,
				( "Margaret Bennett" , 82 , "pencil, sharpener, pen" , 1 , 1600 ) ,
				( "Marissa Pontius" , 69 , "notebook" , 1 , 9430 ) ,
				( "Markita Larner" , 58 , "notepad, flag" , 1 , 605 ) ,
				( "Martha Baker" , 38 , "colored papers, notebook" , 1 , 1030 ) ,
				( "Marvis Chou" , 27 , "pencil, sharpener" , 0 , 2180 ) ,
				( "Mary Barnes" , 28 , "brushes, watercolor" , 0 , 1655 ) ,
				( "Mary Wilson" , 78 , "notebook" , 0 , 2730 );
                
select * from customers;   

-- 12.	Найти тех покупателей, которым больше 30 лет, и они заказывали ручку(pen).
select * from customers
where age > 30 and (order_name like '%pen,%' or order_name like '%pen');

-- 13.	Найти тех покупателей, которые заказывали и ручку, и тетради (notebook), и у них статус доставки 0.
select * from customers
where (order_name like '%pen,%' or order_name like '%pen') 
and order_name like '%notebook%' and delivery_status = 0;

-- 14.	Найти тех покупателей, у которых сумма заказа больше 4000 и меньше 8000.
select * from customers
where sum_price between 4001 and 7999;

-- 15.	Увеличить сумму заказа на 100 у тех покупателей, которые заказали карандаши(pencil). 
select * from customers
where order_name like '%pencil%';

set sql_safe_updates = 0;

update customers
set sum_price = sum_price + 100
where order_name like '%pencil%';

-- 16.	Удалить записи тех покупателей, которые заказывали только тетради.
select * from customers
where order_name = 'notebook';

delete from customers
where order_name = 'notebook';

-- 17.	Найти тех покупателей, которые заказывали math_book, но не eng_book. 
select * from customers
where order_name like '%math_book%' and order_name not like '%eng_book%';

-- 18.	Поменять статус заказа на 1 для тех покупателей, 
-- у которых сумма заказа больше 12000 и статус заказа 0. 
select * from customers
where sum_price > 12000;

update customers
set delivery_status = 1
where sum_price > 12000 and delivery_status = 0;

-- 19.	Удалить записи тех покупателей, у которых имя начинается на букву L, а фамилия заканчивается на O.
delete from customers
where full_name like 'l%o';

-- 20.	Сделать скидку на 10% для тех покупателей, у которых статус заказа 0.
update customers
set sum_price = sum_price - sum_price/10
where delivery_status = 0;

-- 21.	Сделать скидку на столько процентов, сколько лет покупателю, если ему меньше 30.
update customers
set sum_price = sum_price - sum_price * age / 100
where age < 30;

-- 22.	Удалить записи тех покупателей, у которых статус доставки 0.
delete from customers
where  delivery_status = 0;

-- 23.	Увеличить сумму заказа на 5% для тех покупателей, которые заказывали цветные бумаги.
select * from customers
where order_name like '%colored papers%';

update customers
set sum_price = sum_price + sum_price * 5 / 100
where order_name like '%colored papers%';

-- 24.	Удалить таблицу
drop table customers;