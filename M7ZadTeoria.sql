--1 
select *
from sales
inner join products on sales.sal_prd_id = products.id
where product_man_region in (1, 2)
limit 100


--1 drugi pomysl
select *
from sales
inner join products on sales.sal_prd_id = products.id 
inner join product_manufactured_region on product_manufactured_region.id = products.product_man_region 
where region_name = 'EMEA'
limit 100

--1 trzeci pomysl ale nie dziala, czemu?

select *
from sales
inner join products on sales.sal_prd_id = products.id
where product_man_region in 
(select region_name
from product_manufactured_region
where region_name = 'EMEA')
limit 100


--2 
--Jak zrobic ‘W wynikach wy?wietl wszystkie atrybuty z tabeli produktów i atrybut REGION_NAME z tabeli PRODUCT_MANUFACTURED_REGION’. 
--Da si? zrobic inaczej ni? recznie wypisywac wszystie kolumny? Bo w takim rozwiazaniu jak teraz wyswietlaja sie wsyzstkie atrybuty z 2 tabel.
select * from products
left join product_manufactured_region pmr on pmr.id = products.product_man_region
and established_year > 2012


--3
select * from products
left join product_manufactured_region pmr on pmr.id = products.product_man_region
where established_year > 2012

--Wnioski: W zadaniu 2 dla regionow <= 2012 dawalo wartosci null ale nadal laczylo jakby, a dla trzeciego zadania ju? nie laczylo w ogole.

--4
--Czemu ta skladnia nie dziala? Nie da sie wyciagnac znakow z daty?
select distinct (product_name), substring(sal_date, 1,7)
from sales
right join products
on sales.sal_prd_id = products.id 
where product_quantity >5
order by 1 desc

--4 Drugi pomysl
--Hmm nie wiem jak to zrobic ?eby by? tez miesiac. Googlowalem i proponuja DATEPART ()
--Albo select month(dateField), year(dateField) I nic mi z tego nie dzialalo.

select distinct (product_name), extract(YEAR from sal_date)
from sales
right join products 
on sales.sal_prd_id = products.id
where product_quantity > 5
order by 1 desc

--5
insert into product_manufactured_region 
values (5, 'AMS', null, '2020')


select * from products p
full join product_manufactured_region pmr 
on p.product_man_region = pmr.id


--6
--pokombinowalem sobie znowu z roznica miedzy and w joinie a where
select * from products p
left join product_manufactured_region pmr 
on p.product_man_region = pmr.id
and established_year = '2010'

--7Mhm czyli zle zrobilem 4 xD Ale nie wiem jak zrobic inaczej

--8
delete from products p
using product_manufactured_region pmr
where pmr.id = p.product_man_region and
pmr.region_name = 'EMEA' and 
pmr.region_code = 'E_EMEA';


