--1
create schema dml_excercises

--2
create table dml_excercises.sales (
id SERIAL primary key,
sales_date timestamp not null,
sales_amount numeric(38,2),
sales_qty numeric(10,2),
added_by text default 'admin',
constraint sales_less check(sales_amount<=1000));

--3
insert into sales (sales_date, sales_amount, sales_qty, added_by)
	values  (now(),  100.42, 22.44),
			(now(), 80.22,  44.00, 'karolek'),
			(now(), 1500, 800, null)
-- Tutaj przy takiej skladni jak na gorze wywala blad nie mo?emy zostawic pustej wartosci.
-- Myslalem ze jak zostawimy puste to sql domylsnien da null. A to my recznie musimy wpisywac null tak?
			
--3 correct
insert into dml_excercises.sales (sales_date, sales_amount, sales_qty, added_by)
	values  (now(), 100.42, 22.44, default),
			(now(), 80.22,  44.00, 'karolek'),
			(now(), 1555, 800, null);

--4
INSERT INTO dml_excercises.sales (sales_date, sales_amount,sales_qty, added_by)
VALUES ('20/11/2019', 101, 50, null);
--Pokaze te date i godzine 00:00:00

--5

INSERT INTO dml_excercises.sales (sales_date, sales_amount,sales_qty, added_by)
VALUES ('04/04/2020', 101, 50, NULL);

-- uzyc konstrukcji show datestyle
show datestyle


--6 

INSERT INTO dml_excercises.sales (sales_date, sales_amount, sales_qty,added_by)
SELECT NOW() + (random() * (interval '90 days')) + '30 days',
random() * 500 + 1,
random() * 100 + 1,
NULL
FROM generate_series(1, 20000) s(i);

--7
update dml_excercises.sales
set added_by =  'sales_over_200' 
where sales_amount >= 200;

--8
delete from dml_excercises.sales
where added_by is Null

--9
truncate dml_excercises.sales RESTART identity

--10 a to kieeedys xdd