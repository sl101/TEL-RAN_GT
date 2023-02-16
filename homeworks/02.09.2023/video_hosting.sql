-- Active: 1675969532138@@127.0.0.1@3306
create database if not exists platform;
use platform;

create table if not exists users(
    user_id integer primary key auto_increment,
	fullname varchar(256) not null,
	email varchar(64) not null,
	is_blocked BOOL default false,
	created_at datetime default current_timestamp
);

create table if not exists streams(
    stream_id integer primary key auto_increment,
	user_id integer,
	title varchar(256) not null,
    created_at datetime default current_timestamp,
	is_completed bool default false,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

create table if not exists reactions(
    reaction_id integer primary key auto_increment,
	user_id integer,
    value integer not null check(value between 1 and 5),
    stream_id integer,
    created_at datetime default current_timestamp,
	is_blocked bool default false,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (stream_id) REFERENCES streams(stream_id)
);

INSERT INTO users(fullname,email) 
	VALUES 
    ('Petrov Ivan','petrov@mail.com'),
	('Sidorov Petr','sidorov@mail.com'),
	('Ivanov Sidor','ivanov@mail.com'),
	('Pavlov Ivan','pavlov@mail.com'),
	('Zaharov Petr','zaharov@mail.com');

INSERT INTO streams(user_id, title) 
	VALUES 
    (1,'My video'),
    (2,'My first video'),
    (3,'My stream'),
    (4,'My chanel'),
    (5,'My story');
    
    INSERT INTO reactions(user_id, stream_id, value) 
	VALUES 
    (1, 2, 5),
    (2, 3, 4),
    (3, 4, 3),
    (4, 5, 2),
    (5, 1, 1);
    
-- 1. 
--  вывести информацию о стримах.
-- поля		
-- название_стрима		
-- имя_пользователя

select 
	t1.title,
    t2.fullname
from streams t1
left join users t2 on t1.user_id=t2.user_id
where t1.is_completed = false and t1.created_at Like '2023-02-09%'
ORDER BY t2.user_id
limit 3 offset 0;

select 
	t1.title,
    t2.fullname
from streams t1
left join users t2 on t1.user_id=t2.user_id
where t1.is_completed = false and date(t1.created_at) = current_date()
ORDER BY t2.user_id
limit 3 offset 0;

-- вывести ко-во завершенных стримов
select 
COUNT(*) AS total
from streams
where is_completed = true ;

-- добавить в таблицу 'streams' поле 'duration_secs'

update streams
set is_completed = true
where stream_id = 1;

alter table streams
add column duration_secs integer check (duration_secs >=0);

update streams
set 
	is_completed = true, 
    duration_secs = 3600
where stream_id in (1, 2);

update streams
set 
	is_completed = true, 
    duration_secs = 1200
where stream_id = 3;

update streams
set 
	is_completed = true, 
    duration_secs = 500
where stream_id = 4;

update streams
set 
	is_completed = true, 
    duration_secs = 7200
where stream_id = 5;

update streams
set 
	is_completed = true, 
	duration_secs =
    CASE 	
		when stream_id = 5 then 777
		when stream_id = 4 then 888
		when stream_id = 3 then 999
	END
where stream_id in (3, 4, 5);


-- вывести сред. продолжительность стрима
select avg(duration_secs) as avg_duration_secs
from streams;

select 
 min(duration_secs) as min_duration_secs,
 max(duration_secs) as max_duration_secs,
 count(duration_secs) as total_streams,
 sum(duration_secs) as total_duration_secs,
 avg(duration_secs) as avg_duration_secs
from streams;

--  вывести завершенные стримы, у которых имя пользователя начинается на букву "A"		- поля на выходе (проекция)		-- название_стрима		-- имя_автора		-- продолжительность_стрима
select 
t1.title,
t2.fullname,
t1.duration_secs
from streams t1
join users t2 on t1.user_id = t2.user_id
where t1.is_completed = true and t2.fullname like 'P%';

-- вывести средний рейтинг (оценку) для кадого стрима

select avg(t1.value) as avg_rating,
	t2.title
from reactions t1
left join streams t2 on t1.stream_id = t2.stream_id
group by t2.stream_id
HAVING avg_rating >=3
ORDER BY avg_rating DESC;

-- вывести один стрим, у которого больше всего оценок	- поля на выходе		- название стрима		- ко-во оценок
select count(*) as total_marks,
	t2.title
from reactions t1
left join streams t2 on t1.stream_id = t2.stream_id
group by t2.stream_id
order by total_marks desc
limit 1;

    INSERT INTO reactions(user_id, stream_id, value) 
	VALUES 
    (1, 5, 4),
    (2, 5, 5),
    (3, 5, 1),
    (4, 5, 2),
    (5, 5, 3);
    
select 
value,
count(*) as total_reactions
from reactions
where stream_id = 5
group by value
order by value desc;

create table if not exists danations (
   danation_id integer primary key auto_increment,
   donator_id integer,
   stream_id integer,
   amount decimal(10,2) check (amount>0),
   comment varchar(128),
   created_at datetime default current_timestamp,
   FOREIGN KEY (donator_id) REFERENCES users(user_id),
   FOREIGN KEY (stream_id) REFERENCES streams(stream_id)
);

-- добавить донаты в к-ве десяти штук с произвольными суммами к разным стримам
    INSERT INTO danations(donator_id, stream_id, amount, comment) 
	VALUES 
    (1, 2, 44, "Cool"),
    (2, 3, 500, "Cool"),
    (3, 4, 12.20, "Hi!"),
    (4, 5, 23, "Cool"),
    (5, 1, 1, "Oops"),
	(4, 5, 20, "Cool"),
    (5, 5, 33, "Hi"),
	(2, 2, 123, "Fine"),
    (3, 1, 99.99, "Cool"),
    (1, 3, 35, "Cool");
    
--  добавить поле country в таблицу users
alter table users
add country varchar(128);

update users
set country = "Germany"
where user_id in(1,3,5);

update users
set country = "France"
where user_id in (2, 4);

select 
avg(amount) as avg_amount
from danations ;

select distinct country 
from users;

-- HOMEWORK

-- вывести ТОП-1 юзеров по сумме донатов 
-- (КТО БОЛЬШЕ ПОЖЕРТВОВАЛ ДОНАТОВ)
-- поля
	-- имя_юзера
	-- сумма донатов

select sum(t1.amount) total_donat,
	t2.fullname
from danations t1
left join users t2 on t1.donator_id=t2.user_id
group by t1.donator_id
order by total_donat desc
limit 1;

-- вывести ТОП-3 юзеров по сумме собранных донатов
-- поля
    -- имя_юзера
    -- сумма_собранных_донатов
select
	t3.fullname,
    sum(t1.amount) as total_sum_donat
from danations t1
left join streams t2 on t1.stream_id = t2.stream_id
left join users t3 on t2.user_id = t3.user_id
group by t2.stream_id
order by total_sum_donat desc
limit 3;

select * from users;
select * from streams;
select * from reactions;
select * from danations;

-- delete from reactions
-- where reaction_id >5;

-- delete from users
-- where user_id >5;
 
-- delete from streams
-- where stream_id >5
