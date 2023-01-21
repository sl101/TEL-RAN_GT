-- 7. Вывести случайные числа от 1 до 10.
select round(rand()*9 + 1);

-- 8. Используем таблицу employees.
-- Имя и фамилию соединить в новое поле full_name.
select concat_ws(" ", first_name, last_name) as full_name
from employees;

-- 9. Поле email перевести в нижний регистр.
select lower(email)
from employees;

select *from employees;

-- 10. Используем бд sakila
use sakila;

-- 11. Используем таблицу film
-- В description слово beautiful заменить словом amazing.
select 
	replace(description, 'beautiful', 'amazing')
from film;

-- 12. Вывести поле title_len (количество символов поле title).
select LENGTH(title) as title_len
from film;

-- 13. Объединить таблицы customer и staff, вывести поля first_name, last_name, email, address_id и active.
select 
	first_name, 
	last_name, 
    email, 
    address_id,
    active
from customer
union all
select 
	first_name, 
	last_name, 
    email, 
    address_id,
    active
from staff;

-- 14. Используем бд fe37_38
-- Объединить таблицы customers и employees, вывести поля full_name, email (если нет, то null).
use fe37_38;
select 
	full_name, 
	null as email
from customers
union
select 
	concat(" ", first_name, last_name) as full_name,
	email
from employees;

-- 15. Добавить сортировку по email
select 
	concat(" ", first_name, last_name) as full_name,
	email
from employees
union
select 
	full_name, 
	null as email
from customers
order by email;

select * from customers;
select * from employees;