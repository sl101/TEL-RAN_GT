-- спроектировать и создать с помощью SQL БД для "онлайн чат"
-- users
-- chats
-- messages
-- emotions

create database if not exists online_chat;
use online_chat;

create table if not exists users(
    user_id integer primary key auto_increment,
	fullname varchar(255) not null,
	email varchar(64) not null,
    phone varchar(100),
	is_blocked BOOL default false,
	created_at datetime default current_timestamp
);

create table if not exists chats(
    chat_id integer primary key auto_increment,
	created_at datetime default current_timestamp,
	message_id integer,
    participant_1 integer not null check(participant_1 > 0),
    participant_2 integer not null check(participant_2 > 0),
    FOREIGN KEY (message_id) REFERENCES messages(message_id),
    FOREIGN KEY (participant_1) REFERENCES users(user_id),
    FOREIGN KEY (participant_2) REFERENCES users(user_id)
);

create table if not exists messages(
    message_id integer primary key auto_increment,
	created_at datetime default current_timestamp,
    user_id integer,
	chat_id integer,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (chat_id) REFERENCES chats(chat_id)
);

create table if not exists emotions(
    emotion_id integer primary key auto_increment,
    type varchar(255) not null,
	created_at datetime default current_timestamp,
    user_id integer,
	message_id integer,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (message_id) REFERENCES users(message_id)
);

select * from users;

drop table users;

-- delete from reactions
-- where reaction_id >5;