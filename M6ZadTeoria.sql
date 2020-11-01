--1
--Na poczatku pytanie. Czemu te dane si? stworzyly w training_zs? Zaden schemat nie jest jakos podkreslony, skad wiemy do ktorego sie odwolujemy?
-- Myslalem ze domyslny jest public.

select distinct manufactured_date
from products

--2
select count(distinct product_code)
from products

--3
select *
from products
where product_code in ('PRD1', 'PRD9')

--4
select *
from products
where manufactured_date between '2020-08-01' and '2020-08-31'
order by product_quantity desc, manufactured_date

--5
select * 
from products
where not exists (select 1
			from sales
			where products.id = sal_product_id);
		
--6
select * from products
			where products.id = any (select sal_product_id from sales where sal_value >100)
			
--7
create table PRODUCTS_OLD_WAREHOUSE(
id SERIAL,
product_name VARCHAR(100),
product_code VARCHAR(10),
product_quantity NUMERIC(10,2),
manufactured_date DATE,
added_by TEXT DEFAULT 'admin',
created_date TIMESTAMP DEFAULT now()
);

insert into products_old_warehouse(product_name, product_code, product_quantity)
values ('Krzeslo', 'KRZ', 100),
		('Stol', 'ST', 250),
		('Talerz', 'TAL', 20)

--8
--nie rozumiem tego w poleceniu ze z 5 dowolonymi produktami, jak to zrobic? Bo chyba nie chodzi o limit?
select product_name, product_code
from products_old_warehouse
union
select product_name, product_code
from Products

--9
select product_code
from products_old_warehouse
except 
select product_code
from Products

--10
select * from sales
order by sal_value desc
limit 10

--11
-- domyslam si? ze nie o to chodzilo dokladnie xD Probowalem googlowac jak zrobic select * bez jednej kolumny 
--ale nie jest to takie proste z tego co widze. Jest na to jakis prosty sposób?
SELECT *, SUBSTRING(sal_description, 1, 3)
from sales
limit 3

--12
select * 
from sales
where sal_description like 'c4c%'











