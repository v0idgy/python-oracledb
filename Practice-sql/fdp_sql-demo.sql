create table if not exists participants (
   id          int generated always as identity,
   name        varchar2(50),
   is_active   boolean,
   joined_date date annotations ( format 'DD-MON-YYYY' )
);

insert into participants (name,is_active, joined_date) 
values  ('Dr. Smith',true,sysdate ),
        ('Prof. Jones',false,sysdate - 10 );

select is_active as status, count(*) 
from participants 
group by status;