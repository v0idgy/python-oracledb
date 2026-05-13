create table departments (
   dept_id  number primary key,
   name     varchar2(50),
   location varchar2(50)
);

create table employees (
   emp_id  number primary key,
   name    varchar2(50),
   job     varchar2(50),
   dept_id number references departments ( dept_id )
);

insert into departments values ( 10,'ACCOUNTING', 'NEW YORK' );
insert into employees values ( 7782,'CLARK','MANAGER', 10 );





create or replace json relational duality view dept_emp_dv as
   select json{
    '_id' : d.dept_id, 
    'deptName' : d.name,
    'location' : d.location,
    'staff' :[
        select json {
                            'empId' : e.emp_id,
                            'empName' : e.name,
                            'job' : e.job
                            }
                from employees e with insert update delete
                where e.dept_id = d.dept_id 
            ]
            }
     from departments d with insert update delete;




select data from dept_emp_dv;

insert into dept_emp_dv values ( '{
    "_id": 100,
    "deptName": "Research & Development",
    "location": "Building 4",
    "staff": [
        {
            "empId": 501,
            "empName": "Grace Hopper",
            "job": "Lead Scientist"
        },
        {
            "empId": 502,
            "empName": "Ada Lovelace",
            "job": "Lead Architect"
        }
    ]
}' );


