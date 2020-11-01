--1
create schema training;

--2
ALTER SCHEMA training RENAME TO "training___zs";

--3
CREATE TABLE "training___zs".products (
	id integer NULL,
	production_qty numeric(2) NULL,
	product_name varchar(100) NULL,
	product_code varchar(10) NULL,
	description varchar NULL,
	manufacturing_date date NULL
);

--4
alter table products add constraint pk_products primary key (id);
--5
drop table if exists sales;

--6
CREATE TABLE "training___zs".sales (
id integer,
sales_date date not null,
sales_amount numeric(38,2) constraint  sales_over_1k check (sales_amount >1000),
sales_qty numeric(10,2),
product_id integer,
added_by text default 'admin',
primary key (id)
);

--7

alter table sales ADD constraint fk_test FOREIGN key (product_id) REFERENCES products (id);

-- alter table sales add foreign key (id) references products (id);    tak tez probowalem


drop schema training.zs cascade
