

    *-- =================================*

    *-- 1. DELETE EXISTING TABLES*

    *-- =================================*



    DROP TABLE IF EXISTS employees;

    DROP TABLE IF EXISTS departments;





    *-- =================================*

    *-- 2. CREATE DEPARTMENTS TABLE*

    *-- =================================*



    CREATE TABLE departments (

        department_id SERIAL PRIMARY KEY,

        department_name VARCHAR(50) NOT NULL

    );





    *-- INSERT DEPARTMENTS*



    INSERT INTO departments (department_name)

    VALUES

    ('ECE'),

    ('CSE'),

    ('IT');





    *-- =================================*

    *-- 3. CREATE EMPLOYEES TABLE*

    *-- =================================*



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


