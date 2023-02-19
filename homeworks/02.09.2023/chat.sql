create database if not exists chat;
use chat;

create table if not exists users
(
    user_id integer primary key auto_increment,
    fullname varchar(256) not null,
    country varchar(64),
    is_blocked BOOL default false,
    created_at datetime default current_timestamp
);
create table if not exists chats(
    chat_id int primary key auto_increment,
    topic nvarchar(256) not null,
    created_at datetime default current_timestamp,
    user1_id INTEGER,
    user2_id INTEGER,
    FOREIGN KEY (user1_id) REFERENCES users(user_id),
    FOREIGN KEY (user2_id) REFERENCES users(user_id)
);

create table if not exists messages(
    message_id integer primary key auto_increment,
    chat_id integer,
    author_id integer,
    recipient_id integer,
    text text not null,
    created_at datetime default current_timestamp,
    is_removed BOOL default false,
    FOREIGN KEY (author_id) REFERENCES users(user_id),
    FOREIGN KEY (recipient_id) REFERENCES users(user_id),
    FOREIGN KEY (chat_id) REFERENCES chats(chat_id)
);

create table if not exists reactions(
    reaction_id integer primary key auto_increment,
    user_id integer,
    message_id integer,
    value integer not null check(value between 1 and 5),
    created_at datetime default current_timestamp,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (message_id) REFERENCES messages(message_id)
);

-- ====================================================

INSERT INTO users(fullname, country) 
	VALUES 
    ('Jeger Shtill','Germany'),
	('Mark Hoover','Germany'),
	('Petro Galushko','Ukraine'),
	('Lui de Franco','France'),
	('John Smith','USA');
    
INSERT INTO users(fullname, country) 
	VALUES 
	('Jan Men','France'),
	('Tom Hanks','USA');
    
INSERT INTO chats(topic, user1_id, user2_id) 
	VALUES 
    ("animals", 1, 2),
    ("nature", 2, 3),
    ("history", 1, 3),
    ("nature", 4, 5),
    ("job", 5, 2);
    
INSERT INTO messages(chat_id, author_id, recipient_id, text) 
	VALUES 
    (1, 5, 2,'Wow'),
    (2, 4, 3, 'tcccc'),
    (3, 3, 2, 'cring'),
    (4, 2, 5, 'topic'),
    (5, 1, 2, 'great');

INSERT INTO reactions(user_id, message_id, value) 
	VALUES 
    (5, 2, 3),
    (4, 3, 4),
    (3, 4, 5),
    (2, 5, 1),
    (1, 1, 2);
-- ================================================
-- Задача 
-- вывести информацию о чатах (КТО С КЕМ ОБЩАЕТСЯ)
-- поля
-- СОБЕСЕДНИК_1 (ИМЯ)
-- СОБЕСЕДНИК_2 (ИМЯ)

select 
	t2.fullname,
	t3.fullname
from chats t1
left join users t2 on t1.user1_id = t2.user_id
left join users t3 on t1.user2_id = t3.user_id
order by t2.fullname;

-- Задача  
-- вывести список стран пользователей
select distinct
	country
from users
order by country;

-- Задача
-- Вывести самого активного пользователя (по ко-ву сообщ.)
-- поля
	-- имя_юзера
	-- ко-во сообщ
select 
	users.fullname,
	count(message_id) as total_message
from messages
left join users on messages.author_id = users.user_id
group by messages.author_id
order by total_message desc
limit 1;

-- Задача
select 
	users.country,
	count(message_id) as total_message
from messages
left join users on messages.author_id = users.user_id
group by users.country
order by total_message desc
limit 1;

-- Задача
-- вывести ТОП-1 стран, где средняя длина сообщения выше

SELECT AVG(LENGTH(messages.text)) AS avg_length, 
	users.country
FROM messages
LEFT JOIN users ON messages.author_id = users.user_id
GROUP BY users.country
ORDER BY avg_length DESC
LIMIT 1;

-- Задача
SELECT AVG(LENGTH(text)) AS avg_length
FROM messages;

-- Задача
SELECT AVG(value) AS rating
FROM reactions;

-- Задача
-- показать среднюю реакцию пользователя №1
SELECT AVG(value) AS rating
FROM reactions
where user_id = 1;

-- Задача
-- вывести сообщения для чата № 1
select 
messages.created_at,
messages.text,
users.fullname
from messages
left join users on messages.author_id = users.user_id
where messages.chat_id = 1
order by messages.created_at desc
limit 30;

-- Задача
-- вывести список чатов, созданных в феврале
   -- тема чата
SELECT topic 
FROM chats
WHERE created_at >= '2023-02-01' AND created_at < '2023-03-01';

-- Задача
-- вывести кол. распределение оценок
-- на выходе (пример)

select 
	value,
	count(value) as total_reactions
from reactions 
group by value
order by total_reactions desc;

-- Задача
-- вывести ко-во сообщений для каждого пользователя в рамках чата №1

select 
author_id,
count(message_id) as total_messages
from messages 
where chat_id = 1
group by author_id;

-- Задача
select 
chat_id,
count(*) as total_messages
from messages 
group by chat_id
having total_messages = 1;

-- Задача
select 
chat_id,
count(*) as total_messages
from messages 
where created_at Like '2023-02-16%'
group by chat_id
having total_messages > 1 ;

SELECT 
chat_id, 
COUNT(*) AS num_messages 
FROM messages 
WHERE date(created_at) = current_date()
GROUP BY chat_id;

-- Задача
select 
chat_id,
avg(length(text)) avg_message_length
from messages 
group by chat_id;

ALTER TABLE users
ADD is_worker BOOL;

ALTER TABLE users 
ALTER is_worker SET default false;

update users
set is_worker = true
where user_id in (2, 3, 4);

select 
users.fullname,
messages.text,
users.is_worker as worker
from messages 
left join users on messages.author_id = users.user_id
where users.is_worker = true;


create table if not exists salaries(
    salary_id int primary key auto_increment,
    created_at datetime default current_timestamp,
    worker_id INTEGER not null,
	value decimal(10,2) not null check(value > 0),
    FOREIGN KEY (worker_id) REFERENCES users(user_id)
);

INSERT INTO salaries(worker_id, value) 
	VALUES 
    (2, 7499),
    (3, 4800),
    (4, 5670);
    
INSERT INTO salaries(worker_id, value) 
	VALUES 
    (2, 800),
    (3, 650),
    (4, 599);
    
    
INSERT INTO salaries(worker_id, value) 
	VALUES 
    (1, 800);
    
select 
    users.fullname,
	sum(salaries.value) as total_salary
from salaries
left join users on salaries.worker_id = users.user_id
WHERE salaries.created_at >= '2023-02-01' AND salaries.created_at < '2023-03-01' 
and users.is_worker = true
group by salaries.worker_id
order by total_salary desc
limit 1;

-- В рамках БД 'chat' с помощью SQL напишите запрос, 
-- который вывеадет информацию о чатах  (КТО С КЕМ ОБЩАЕТСЯ), 
-- отсортированных по дате посл/сообщения

select 
	t1.message_id,
	t1.created_at,
	t2.fullname,
	t3.fullname
from messages t1
left join users t2 on t1.author_id = t2.user_id
left join users t3 on t1.recipient_id = t3.user_id
left join chats t4 on t1.chat_id = t4.chat_id
order by t1.message_id desc;

select *from users;
select *from chats;
select *from messages;
select *from reactions;
select *from salaries;
