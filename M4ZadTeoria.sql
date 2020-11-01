--1
create role  user_training with login password 'acc#1Passws4ord'

--2
CREATE SCHEMA training AUTHORIZATION user_training;

--3
drop role user_training;

--4
reassign owned by user_training to postgres;

drop role user_training


--5
create role reporting_ro
grant connect on database postgres to reporting_ro
grant usage, create on schema training to reporting_ro
grant select, insert, update, delete on all tables in schema training to reporting_ro

--Mozna bylo dac all privileges zamiast grant select, insert upade itp?
grant all privileges on all tables in schema training to reporting_ro

--6
create role reporting_user with login password 'acc#1Passws4ord'
grant reporting_ro to reporting_user

--7
--Tutaj mi wyskakuje odmowa dostepu do training, a domyslam sie ze powinienem moc skoro w nastepnnym zadaniu dopiero zabieram uprawnienia
CREATE TABLE training.Tescikdowolony (
	id integer null);

--8
revoke create on schema training from reporting_ro

--9
--Moglem i tu i tu utworzyc
create table training.tabelatestowa (
id integer null);

create table public.tabelatestowa (
id integer null);



