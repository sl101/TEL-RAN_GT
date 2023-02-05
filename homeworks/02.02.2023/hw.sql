create database DITOK;
use DITOK;
create table users(
	id integer primary key auto_increment,
	username varchar(100) not null,
    datetime datetime,
    email varchar(100) not null,
    password varchar(100) not null,
    is_blocked boolean
 );

 create table videos(
	id integer primary key auto_increment,
	title varchar(100) not null,
    datetime datetime,
    description varchar(1000),
    duration_session integer,
    user_id integer
 );
 
  create table reactions(
	id integer primary key auto_increment,
    type char(7) check (type in("Like" , "DisLike")),
    datetime datetime,
    user_id integer,
	video_id integer
 );
 
   create table comments(
	id integer primary key auto_increment,
    datetime datetime,
    user_id integer,
	video_id integer,
    text varchar(2000)
 );
 
select * from users;
select * from videos;
select * from reactions;
select * from comments;
