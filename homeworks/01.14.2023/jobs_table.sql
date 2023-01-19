-- 25.
create table jobs (
	Job_id integer primary key auto_increment
);

-- 26. 
alter table jobs
add column title varchar(128) not null,
add column description varchar(128) not null,
add salary integer;

-- 27.
alter table jobs
change column title job_title varchar(128) not null,
change column description job_description varchar(128) not null;

-- 28.
alter table jobs
drop column salary;

-- 29. 
alter table jobs
add column min_salary numeric(2, 1),
add column max_salary integer;

-- 30.
alter table jobs
modify column min_salary integer;

-- 31 
drop table jobs;