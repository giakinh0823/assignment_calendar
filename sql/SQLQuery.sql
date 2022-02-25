create table [user](
	id int not null identity(1,1) primary key,
	username nvarchar(255) not null,
	password nvarchar(255) not null,
	first_name nvarchar(255),
	last_name nvarchar(255),
	birthday date,
	email nvarchar(255) not null unique,
	phone nvarchar(20),
	gender bit,
	is_super bit default 0,
	is_active bit default 1,
	permission nvarchar(255) default 'user',
	avatar nvarchar(255),
	created_at datetime not null,
	updated_at datetime not null
)

create table calendar(
	id int not null identity(1,1) primary key,
	name nvarchar(200),
	color nvarchar(50),
	userId int foreign key references [user](id),
	created_at datetime not null,
	updated_at datetime not null,
)

create table category_calendar(
	id int not null identity(1,1) primary key,
	name nvarchar(200),
)

create table status_calendar(
	id int not null identity(1,1) primary key,
	name nvarchar(200),
)

create table additional_calendar(
	id int not null identity(1,1) primary key,
	start_date datetime not null,
	end_date datetime,
	overlap bit,
	display varchar(255) default 'default',
	created_at datetime,
	updated_at datetime,
	isAllDay bit,
	isHasEnd bit,
	calendarId int foreign key references calendar(id),
	statusId int foreign key references status_calendar(id),
	categoryId int foreign key references category_calendar(id),
)

create table event(
	id int not null identity(1,1) primary key,
	title nvarchar(255) not null,
	description nvarchar(2000),
	location nvarchar(1000),
	updated_at datetime,
	created_at datetime,
	userId int foreign key references [user](id),
	additionalId int foreign key references additional_calendar(id),
)


create table permission(
	id int not null identity(1,1) primary key,
	name varchar(200)
)

create table user_permission(
	id int not null identity(1,1) primary key,
	licensed bit not null,
	userId int foreign key references [user](id),
	permissionId int foreign key references permission(id),
)

create table [action](
	id int not null identity(1,1) primary key,
	title nvarchar(255) not null,
	code nvarchar(255) not null,
	feature varchar(200) not null,
)

create table permission_action(
	id int not null identity(1,1) primary key,
	licensed bit not null,
	permissionId int foreign key references permission(id),
	actionId int foreign key references [action](id),
)
