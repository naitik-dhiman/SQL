
-- =================================
-- 1. DELETE EXISTING TABLES
-- =================================

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;


-- =================================
-- 2. CREATE DEPARTMENTS TABLE
-- =================================

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);


-- INSERT DEPARTMENTS

INSERT INTO departments (department_name)
VALUES
('ECE'),
('CSE'),
('IT');


-- =================================
-- 3. CREATE EMPLOYEES TABLE
-- =================================

CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,

    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,

    email_id VARCHAR(150) NOT NULL UNIQUE,
    phone_no VARCHAR(20),
    bio TEXT,

    job_title VARCHAR(50) NOT NULL,

    salary INT NOT NULL CHECK (salary > 0),

    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    hire_date DATE NOT NULL,
    last_login TIMESTAMP,

    employee_status VARCHAR(20) NOT NULL
        DEFAULT 'ACTIVE'
        CHECK (
            employee_status IN ('ACTIVE', 'on_leave', 'terminated')
        ),

    created_at TIMESTAMP NOT NULL DEFAULT NOW(),

    department_id INT REFERENCES departments(department_id),

    manager_id INT REFERENCES employees(emp_id)
);


-- =================================
-- 4. INSERT EMPLOYEES
-- =================================

INSERT INTO employees (
    first_name,
    last_name,
    email_id,
    phone_no,
    bio,
    job_title,
    salary,
    is_active,
    hire_date,
    last_login,
    employee_status,
    department_id,
    manager_id
)
VALUES

('Rahul', 'Sharma', 'rahul@gmail.com',
 '9876543210', 'Backend developer',
 'Software Engineer', 55000, TRUE,
 '2024-01-15', '2026-11-01 10:30:00',
 'ACTIVE', 1, NULL),

('Aman', 'Verma', 'aman@gmail.com',
 '9876543211', 'Frontend developer',
 'Frontend Engineer', 48000, TRUE,
 '2024-03-20', '2026-11-02 11:00:00',
 'ACTIVE', 2, 1),

('Priya', 'Singh', 'priya@gmail.com',
 NULL, 'ML enthusiast',
 'ML Engineer', 75000, TRUE,
 '2023-08-10', '2026-11-03 09:15:00',
 'ACTIVE', 3, NULL),

('Karan', 'Malhotra', 'karan@gmail.com',
 '9876543213', 'Database specialist',
 'Database Administrator', 65000, TRUE,
 '2023-05-12', NULL,
 'on_leave', 1, 1),

('Neha', 'Gupta', 'neha@gmail.com',
 '9876543214', 'HR professional',
 'HR Manager', 60000, TRUE,
 '2022-06-18', '2026-11-04 14:20:00',
 'ACTIVE', 2, NULL),

('Arjun', 'Mehta', 'arjun@gmail.com',
 NULL, 'Junior developer',
 'Software Developer', 35000, FALSE,
 '2025-02-01', NULL,
 'terminated', 3, 3);


-- =================================
-- 5. DISPLAY TABLES
-- =================================

SELECT * FROM departments;

SELECT * FROM employees;


-- table is created but now we have to change 
ALTER TABLE employees
ADD COLUMN internal_note VARCHAR(50) NOT NULL default 'N/A'; 


ALTER TABLE employees
RENAME COLUMN  internal_note TO HR_note ; 



ALTER TABLE employees
DROP COLUMN hr_note ; 

-- !these are called as DDL  create and alter 