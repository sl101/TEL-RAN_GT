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

alter table customers
add sale integer

select * from employees;
select * from customers;