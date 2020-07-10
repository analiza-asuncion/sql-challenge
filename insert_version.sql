--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

-- Started on 2020-06-30 16:22:46

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;


CREATE TABLE public.salaries (
   	emp_no SERIAL PRIMARY KEY,
	salary float NOT NULL,
    from_date timestamp without time zone DEFAULT now() NOT NULL,
	to_date timestamp without time zone DEFAULT now() NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
ALTER TABLE public.salaries OWNER TO postgres;

CREATE TABLE public.titles (
    emp_no SERIAL PRIMARY KEY,
	title character varying(20) NOT NULL,
    from_date timestamp without time zone DEFAULT now() NOT NULL,
	to_date timestamp without time zone DEFAULT now() NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES titles(emp_no)
);

ALTER TABLE public.titles OWNER TO postgres;

CREATE TABLE public.employees (
    emp_no SERIAL PRIMARY KEY,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    birth_date timestamp without time zone DEFAULT now() NOT NULL,
	hire_date timestamp without time zone DEFAULT now() NOT NULL,
	gender character varying(3) NOT NULL
);
ALTER TABLE public.employees OWNER TO postgres;


CREATE TABLE public.dept_emp (
	emp_no SERIAL PRIMARY KEY,
    from_date timestamp without time zone DEFAULT now() NOT NULL,
	to_date timestamp without time zone DEFAULT now() NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES dept_emp(emp_no)
);

ALTER TABLE public.dept_emp OWNER TO postgres;

CREATE TABLE public.dept_manager (
	emp_no SERIAL PRIMARY KEY,
	dept_no INT NOT NULL,
 	from_date timestamp without time zone DEFAULT now() NOT NULL,
	to_date timestamp without time zone DEFAULT now() NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	
);

ALTER TABLE public.dept_manager OWNER TO postgres;

CREATE TABLE public.departments (
	dept_no SERIAL PRIMARY KEY,
	dept_name VARCHAR(255)
);

ALTER TABLE public.departments OWNER TO postgres;

