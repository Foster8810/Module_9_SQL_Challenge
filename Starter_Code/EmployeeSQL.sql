create table titles(
	title_id varchar(10) primary key,
	title varchar(35)
);

create table department(
	dept_no varchar(35) primary key,
	dept_name varchar(35)
);

create table employee(
	emp_no numeric primary key,
	emp_title varchar (10),
	birth_date date,
	first_name varchar (35),
	last_name varchar(35),
	sex varchar (2),
	hire_date date,
	foreign key (emp_title) references titles(title_id)
);

create table dept_emp(
	emp_no numeric,
	dept_no varchar(35),
	foreign key (dept_no) references department(dept_no),
	foreign key (emp_no) references employee(emp_no)
);

create table dept_manager(
    dept_no varchar(35),
    emp_no float,
    foreign key (dept_no) references department(dept_no)
);

create table salaries(
	emp_no numeric,
	salary numeric,
	foreign key (emp_no) references employee(emp_no)
);

select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employee e
join salaries s on e.emp_no = s.emp_no;

select emp_no, first_name, last_name, hire_date
from employee
where hire_date >= '1986-01-01' and hire_date < '1987-01-01';

select d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
from dept_manager dm
join department d on dm.dept_no = d.dept_no
join employee e on dm.emp_no = e.emp_no;

select d.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp de
join department d on de.dept_no = d.dept_no
join employee e on de.emp_no = e.emp_no;

select first_name, last_name, sex
from employee 
where first_name = 'Hercules' and last_name like 'B%';

select e.emp_no, e.last_name, e.first_name
from employee e
join dept_emp de on e.emp_no = de.emp_no
join department d on de.dept_no = d.dept_no
where d.dept_name = 'Sales';


select e.emp_no, e.last_name, e.first_name, d.dept_name
from employee e
join dept_emp de on e.emp_no = de.emp_no
join department d on de.dept_no = d.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development'

select last_name, count(*) as freq
from employee 
group by last_name
order by freq desc

	
