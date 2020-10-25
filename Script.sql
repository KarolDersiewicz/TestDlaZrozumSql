create role  user_training with login password 'acc#1Passws4ord'


CREATE SCHEMA training AUTHORIZATION user_training;

drop role user_training;

reassign owned by user_training to postgres;

drop role user_training

create role reporting_ro
grant connect on database postgres to reporting_ro
grant usage, create on schema training to reporting_ro
grant select, insert, update, delete on all tables in schema training to reporting_ro

create role reporting_user with login password 'acc#1Passws4ord'
grant reporting_ro to reporting_user


revoke create on schema training from reporting_ro


