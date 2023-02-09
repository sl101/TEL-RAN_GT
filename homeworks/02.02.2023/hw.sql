create database if not exists DITOK;
use DITOK;
create table if not exists user (
	id integer primary key auto_increment,
	username varchar(100) not null,
    email varchar(100) not null,
    password varchar(100) not null,
    created_at datetime default current_timestamp,
    is_blocked boolean default false
 );

 create table if not exists videos(
	id integer primary key auto_increment,
	title varchar(100) not null,
    added_at datetime default current_timestamp,
    description varchar(1000),
    duration_secs integer,
    user_id integer,
    foreign key (user_id) references Users(id)
 );
 
  create table if not exists reactions(
	id integer primary key auto_increment,
    type char(7) check (type in("Like" , "DisLike")),
	added_at datetime default current_timestamp,
    user_id integer,
	video_id integer,
	foreign key (user_id) references Users(id),
	foreign key (video_id) references Videos(id)
 );
 
   create table if not exists comments(
	id integer primary key auto_increment,
	added_at datetime default current_timestamp,
    user_id integer,
	video_id integer,
    text varchar(2000),
    foreign key (user_id) references Users(id),
	foreign key (video_id) references Videos(id)
 );
 
select * from users;
select * from videos;
select * from reactions;
select * from comments;
