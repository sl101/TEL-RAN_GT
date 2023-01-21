create table phones(
id integer primary key auto_increment,
product_name varchar(128) not null,
product_count integer,
starting_price integer not null
);

insert into Phones(Product_Name, Product_Count, Starting_Price) 
			values('iPhone X', 3, 680),
                ('iPhone XR', 2, 700),
                ('iPhone XS', 10, 720),
                ('iPhone 11', 1, 790),
                ('iPhone 11 Pro', 12, 850),
                ('iPhone 11 Pro Max', 2, 890),
                ('iPhone SE', 1, 850),
                ('iPhone 12 Mini', 15, 890),
                ('iPhone 12', 20, 910),
                ('iPhone 12 Pro', 5, 950),
                ('iPhone 12 Pro Max', 13, 1000);

-- Оператор AS
--  С помощью оператора AS можно изменить название выходного столбца или определить его псевдоним:
select product_name as title
from phones;

-- Вывести поле product_name как title, посчитать и вывести общую сумму заказов (product_count * starting_price) как total_sum
select product_name as title, product_count * starting_price as total_summ
from phones;

-- Вывести поля product_name как name, product_count как count и starting_price как price.
select Product_Name as name, product_count as count, starting_price as price
from phones;   
           
-- CASE оператор
-- В MySQL оператор CASE имеет функциональность оператора IF-THEN-ELSE 

-- CASE
--     WHEN условие_1 THEN результат_1
--     WHEN условие_2 THEN результат_2
--     .................................
--     WHEN условие_N THEN результат_N
--     [ELSE альтернативный_результат]
-- END           
        
select product_name, product_count,
CASE
	when product_count <= 2 then 'Товар заканчивается'
    when product_count <= 5 then 'Мало товара'
    when product_count <= 10 then 'Есть в наличии'
    else "Много товара"
END as category
from phones;

-- Создать новое поле category, заполнить ее: 
-- Если Product_Count меньше/равно 2, category = 'Товар заканчивается',
-- Если Product_Count меньше/равно 5, category = 'Мало товара',
-- Если Product_Count меньше/равно 10, category = 'Есть в наличии',
-- В остальных случаях category ='Много товара';
           
alter table phones
add category varchar(128);

set sql_safe_updates = 0;

update phones
set category = 
CASE
	when product_count <= 2 then 'Товар заканчивается'
    when product_count <= 5 then 'Мало товара'
    when product_count <= 10 then 'Есть в наличии'
    else "Много товара"
END; 

-- Создать новое поле tax целое число
-- Заполнить поле tax
-- Если начальная цена меньше 700, tax = null,
-- если больше либо равно 700 и меньше 850, tax = 15,
-- если больше или равно 850, tax = 25

alter table phones
add tax integer;

update phones
set tax =
case
	when starting_price < 700 then null
    when starting_price < 850 then 15
    else 25
end;
-- Посчитать конечную цену и представить его как Final_price

select *, starting_price + starting_price * tax / 100 as Final_price
from phones;

-- Создать новое поле для final_price numeric(7, 2)
 -- Заполнить поле final_price (начанльная цена + процент)
alter table phones
add final_price numeric(7,2);

--  alter table phones
--  drop column final_price;

update phones
set final_price = 
case
	when tax is null then starting_price
	else starting_price + starting_price * tax / 100
end;

-- или 
-- Функция COALESCE принимает список значений и возвращает первое из них, которое не равно NULL:
update phones
set final_price = coalesce(starting_price + starting_price * tax / 100, starting_price);

select * from phones;

-- Функции для работы с числами
select -1 as value;

-- ABS: возвращает абсолютное значение числа.
select abs(-23) as abs;

-- POW(m, n): возвращает m, возведенную в степень n.
select pow(4, 2) as pow;

-- ROUND: округляет число. В качестве первого параметра передается число. Второй параметр указывает на длину. 
-- Если длина представляет положительное число, то оно указывает, до какой цифры после запятой идет округление. 
-- Если длина представляет отрицательное число, то оно указывает, до какой цифры с конца числа до запятой идет округление
select round(123.567, 2) as round_1;
select round(119.567, -2) as round_2;

-- SQRT: получает квадратный корень числа.
select sqrt(225) as sqrt;

-- RAND: генерирует случайное число с плавающей точкой в диапазоне от 0 до 1.
select rand() as rand;

-- https://metanit.com/sql/mysql/6.2.php

-- Функции работы со строками:

-- CONCAT: объединяет строки. В качестве параметра принимает от 2-х и более строк, которые надо соединить:
-- CONCAT_WS: также объединяет строки, но в качестве первого параметра принимает разделитель, который будет соединять строки:
select concat_ws(" ", "Tom", "Smith", "age", '23');
-- LENGTH: возвращает количество символов в строке. В качестве параметра в функцию передается строка, для которой надо найти длину 
-- ( в кирилице *2 - по 2 байта на символ):
-- LTRIM: удаляет начальные пробелы из строки. В качестве параметра принимает строку:
-- RTRIM: удаляет конечные пробелы из строки. В качестве параметра принимает строку:
-- TRIM: удаляет начальные и конечные пробелы из строки. В качестве параметра принимает строку:
select trim("   apple   ");

-- LEFT: вырезает с начала строки определенное количество символов. 
-- Первый параметр функции - строка, а второй - количество символов, которые надо вырезать сначала строки:
select left("apple", 2);

-- RIGHT: вырезает с конца строки определенное количество символов. 
-- Первый параметр функции - строка, а второй - количество символов, которые надо вырезать сконца строки:
select right("apple", 2);

-- SUBSTRING(str, start [, length]): вырезает из строки str подстроку, начиная с позиции start. 
-- Третий необязательный параметр передает количество вырезаемых символов:
select substring("IPhone 14  pro", 8 );
select substring("IPhone 14  pro", 8, 2);

-- REPLACE(search, find, replace): заменяет в строке find подстроку search на подстроку replace. 
-- Первый параметр функции - строка, второй - подстрока, которую надо заменить, а третий - подстрока, на которую надо заменить:
select replace("IPhone 10  pro", "10", "14" );

-- LOCATE(find, search [, start]): возвращает позицию первого вхождения подстроки find в строку search.
-- Дополнительный параметр start позволяет установить позицию в строке search, с которой начинается поиск подстроки find. 
-- Если подстрока search не найдена, то возвращается 0:
select locate('m', "Tom Smith", '4' );

-- REVERSE: переворачивает строку наоборот:
select reverse("IPhone 10  pro");

-- LOWER: переводит строку в нижний регистр:
select LOWER("IPhone 10  pro");
-- UPPER: переводит строку в верхний регистр
select UPPER("IPhone 10  pro");

-- https://metanit.com/sql/mysql/6.1.php

-- ================================================
create table user_bremen(
	id integer primary key auto_increment,
    first_name varchar(128),
    last_name varchar(128),
    age integer
);

create table user_berlin(
	id integer primary key auto_increment,
    first_name varchar(128),
    last_name varchar(128),
    age integer,
    phone varchar(128)
);

insert into user_bremen(first_name, last_name, age) 
values('Linda', 'Johnson', 35),
	('Barbara', 'Jones', 21),
    ('Laura', 'Thomas', 40),
    ('Sarah', 'Garcia', 30),
    ('Kimberly', 'Wans', 43);

insert into user_berlin(first_name, last_name, age, phone) 
values('Carol', 'Robinson', 32, '+8129808937'),
	('Barbara', 'Jones', 21, '+8129823454'),
    ('Melissa', 'King', 20, '+8129380234'),
    ('Sarah', 'Garcia', 30, '+812980223232'),
    ('Amy', 'Wans', 43, '+812932323');
    
-- UNION / UNION ALL - "вертикальное" объединение
-- Оператор UNION ALL используется для объединения наборов результатов из 2 или более предложений SELECT. 
-- Он возвращает все строки из запроса и не удаляет повторяющиеся строки между различными предложениями SELECT.
-- Оператор UNION позволяет обединить две однотипных выборки. Эти выборки могут быть из разных таблиц или из одной и той же таблицы.

select *, null as phone
from user_bremen
union all
select *
from user_berlin;

select id, first_name, last_name, age
from user_bremen
union
select id, first_name, last_name, age
from user_berlin;

-- Оператор ORDER BY сортируют значения по одному или нескольких столбцам.
-- По умолчанию данные сортируются по возрастанию, однако с помощью оператора DESC можно задать сортировку по убыванию.

select id, first_name, last_name, age
from user_bremen
union
select id, first_name, last_name, age
from user_berlin
order by id, age;

--  https://metanit.com/sql/mysql/4.3.php

select * from user_bremen;
select * from user_berlin;