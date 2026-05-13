create table if not exists fdp_participants (
   id          int generated always as identity,
   name        varchar2(50),
   is_active   boolean,
   joined_date date
      annotations ( format 'DD-MON-YYYY' )
);

insert into fdp_participants (
   name,
   is_active,
   joined_date
) values ( 'Dr. Smith',
           true,
           sysdate ),( 'Prof. Jones',
                       false,
                       sysdate - 10 );

-- No FROM DUAL and Alias in Group By
select is_active as status,
       count(*)
  from fdp_participants
 group by status;