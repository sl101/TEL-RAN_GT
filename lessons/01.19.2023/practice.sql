use fe37_38;

-- Нужно повысить зарплаты для отдела sales на 20%, для finance 15%, для shipping 10%, для marketing 25%, для Human  20% и для IT 35%. 
-- Записать данные в поле new_salary. Поле создавать не нужно, используем AS.
select *,
case
	when department = 'shipping'  then salary + salary*10/100
	when department = 'finance'  then salary + salary*15/100
	when department in('sales', 'Human Resources') then salary + salary*20/100
    when department = 'marketing'  then salary + salary*25/100
    when department = 'IT'  then salary + salary*35/100
end as new_salary
from employees;

-- 2.	Создать поле new_salary numeric(7,2), заполнить.

alter table employees
add new_salary numeric(7,2);

update employees
set new_salary = 
case
	when department = 'shipping'  then salary + salary*10/100
	when department = 'finance'  then salary + salary*15/100
	when department in('sales', 'Human Resources') then salary + salary*20/100
    when department = 'marketing'  then salary + salary*25/100
    when department = 'IT'  then salary + salary*35/100
end;

-- 3.	Используем таблицу customers.
-- Создать поле sale integer.
alter table customers
add sale integer;

-- 4.	Заполнить поле sale:
-- Если sum_price < 5000 скидка null, если больше/равно 5000 и меньше 10000, скидка 5, если больше/равно 10000, скидка 10.
update customers
set sale = 
case
	when sum_price < 5000 then null
	when sum_price < 10000 then 5
    else 10
end;

-- 5.	Создать поле final_price numeric(7, 2). 
-- Заполнить поле соответственно сделав скидки.

alter table customers
add final_price numeric(7, 2);

update customers
set final_price = coalesce(sum_price - sum_price * sale / 100, sum_price);

-- 6.	В order_name поменять math_book на mathematics_book, eng_book на english_book.
update customers
set order_name = replace(order_name, 'math_book', 'mathematics_book'),
order_name = replace(order_name, 'eng_book', 'english_book');


select * from employees;
select * from customers;