create table users (
   id   number primary key,
   name varchar2(100)
);

-- The Edge table
create table friendships (
   friendship_id number primary key,
   user_id_1 number references users ( id ),
   user_id_2 number references users ( id ),
   since date
);

-- Insert sample data
insert into users values ( 1,'Alice' );
insert into users values ( 2,'Bob' );
insert into users values ( 3,'Charlie' );
insert into users values ( 4,'David' );
insert into users values ( 5,'Eve' );
INSERT INTO users VALUES ( 6, 'Frank' );

insert into friendships values ( 101, 1, 2, date '2023-01-01' ); -- Alice -> Bob
insert into friendships values ( 102, 2, 3, date '2023-06-01' ); -- Bob -> Charlie
insert into friendships values ( 103, 1, 3, date '2023-03-01' ); -- Alice -> Charlie
insert into friendships values ( 104, 3, 4, date '2023-02-01' ); -- Charlie -> David
insert into friendships values ( 105, 4, 5, date '2023-04-01' ); -- David -> Eve








create property graph social_graph2 
        vertex tables ( 
            users 
                key ( id ) 
                label users properties ( name ) 
                ) 
        edge tables ( 
            friendships
                key ( friendship_id ) 
                source key ( user_id_1 ) references users ( id ) 
                destination key ( user_id_2 ) references users ( id ) 
                label follows properties ( since ) 
                );




select * from graph_table ( social_graph2 
    match ( a is users ) -[e1 is follows]- > ( b is users ) -[e2 is follows]- > ( c is users )
    where a.name = 'Alice'
    columns ( 
        a.name as user_name,
        b.name as friend_name,
        c.name as friend_of_friend 
        ) );