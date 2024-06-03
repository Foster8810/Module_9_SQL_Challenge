create table titles(
	title_id varchar(10) primary key not null,
	title varchar(35) not null
);

create table department(
	dept_no varchar(35) primary key not null,
	dept_name varchar(35) not null
);

create table employee(
	emp_no numeric primary key not null,
	emp_title varchar (10) not null,
	birth_date date not null,
	first_name varchar (35) not null,
	last_name varchar(35) not null,
	sex varchar (2) not null,
	hire_date date not null,
	foreign key (emp_title) references titles(title_id)
);

create table dept_emp(
	emp_no numeric not null,
	dept_no varchar(35) not null,
	foreign key (dept_no) references department(dept_no),
	foreign key (emp_no) references employee(emp_no)
);

create table dept_manager(
    dept_no varchar(35) not null,
    emp_no float not null,
    foreign key (dept_no) references department(dept_no)
);

create table salaries(
	emp_no numeric not null,
	salary numeric not null,
	foreign key (emp_no) references employee(emp_no)
);



	
