set foreign_key_checks = 0;

create database films;

use films;

create table country(
country_id int auto_increment,
country varchar(50),
last_update date,
constraint pk_contry primary key (country_id)
);

create table city(
city_id int auto_increment,
city varchar(70),
country_id int,
last_update date,
constraint pk_city primary key (city_id),
constraint fk_city_country foreign key (country_id) references country(country_id)
);

create table address(
address_id int auto_increment,
address varchar(255),
address2 varchar(255),
district varchar(50),
city_id int,
postal_code int,
phone int,
last_update date,
constraint pk_address primary key (address_id),
constraint fk_address_city foreign key (city_id) references city(city_id)
);

create table actor(
actor_id int auto_increment,
first_name varchar(50),
last_name varchar(50),
last_update date,
constraint pk_actor primary key (actor_id)
);

create table language(
language_id int auto_increment,
name varchar(30),
last_update time,
constraint pk_language primary key (language_id)
);

create table category(
category_id int auto_increment,
name varchar(30),
last_update date,
constraint pk_category primary key (category_id)
);

create table film(
film_id int auto_increment,
title varchar(70),
description varchar(255),
realease_year year,
language_id int,
original_language_id int,
rental_duration int,
rental_rate decimal,
length int,
replacement_cost decimal,
rating varchar(5),
special_features varchar(255),
last_update date,
constraint pk_film primary key (film_id),
constraint fk_film_language foreign key (language_id) references language(language_id),
constraint fk_film_original_language foreign key (original_language_id) references language(language_id)
);

create table film_actor(
actor_id int,
film_id int,
last_update date,
constraint pk_film_actor primary key (actor_id, film_id),
constraint fk_film_actor_actor foreign key (actor_id) references actor(actor_id),
constraint fk_film_actor_film foreign key (film_id) references film(film_id)
);

create table film_category(
film_id int,
category_id int,
last_update date,
constraint pk_film_category primary key (film_id, category_id),
constraint fk_film_category_film foreign key (film_id) references film(film_id),
constraint fk_film_category_category foreign key (category_id) references category(category_id)
);

create table store(
store_id int auto_increment,
manager_staff_id int,
address_id int,
last_update date,
constraint pk_store primary key (store_id),
constraint fk_store_manager_staff foreign key (manager_staff_id) references staff(staff_id),
constraint fk_store_address foreign key (address_id) references address(address_id)
);

create table staff(
staff_id int auto_increment,
first_name varchar(50),
last_name varchar(50),
address_id int,
picture char(1),
email varchar(255),
store_id int,
active boolean,
username varchar(50),
password varchar(255),
last_update date,
constraint pk_staff primary key (staff_id),
constraint fk_staff_address foreign key (address_id) references address(address_id),
constraint fk_staff_store foreign key (store_id) references store(store_id)
);

create table inventory(
inventory_id int auto_increment,
film_id int,
store_id int,
last_update date,
constraint pk_inventory primary key (inventory_id),
constraint fk_inventory_film foreign key (film_id) references film(film_id),
constraint fk_inventory_store foreign key (store_id) references store(store_id)
);

create table customer(
customer_id int auto_increment,
store_id int,
first_name varchar(50),
last_name varchar(50),
email varchar(255),
address_id int,
active boolean,
create_date date,
last_update date,
constraint pk_customer primary key (customer_id),
constraint fk_customer_store foreign key (store_id) references store(store_id),
constraint fk_customer_address foreign key (address_id) references address(address_id)
);

create table rental(
rental_id int auto_increment,
rental_date date,
inventory_id int,
customer_id int,
return_date date,
staff_id int,
last_update date,
constraint pk_rental primary key (rental_id),
constraint fk_rental_inventory foreign key (inventory_id) references inventory(inventory_id),
constraint fk_rental_customer foreign key (customer_id) references customer(customer_id),
constraint fk_rental_staff foreign key (staff_id) references staff(staff_id)
);

create table payment(
payment_id int auto_increment,
customer_id int,
staff_id int,
rental_id int,
amount decimal,
payment_date date,
last_update date,
constraint pk_payment primary key (payment_id),
constraint fk_payment_customer foreign key (customer_id) references customer(customer_id),
constraint fk_payment_staff foreign key (staff_id) references staff(staff_id),
constraint fk_payment_rental foreign key (rental_id) references rantal(rental_id)
);

set foreign_key_checks = 1;