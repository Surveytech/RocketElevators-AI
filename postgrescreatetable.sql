require 'pg'

CREATE TABLE fact_contact (contact_id integer PRIMARY KEY, creation_date TIMESTAMP NOT NULL, company_name VARCHAR (50), email VARCHAR (255) UNIQUE NOT NULL, project_name VARCHAR (50));

CREATE TABLE fact_elevator (serialnumber integer PRIMARY KEY, date_of_commissioning timestamp, building_id integer, customer_id integer, building_city VARCHAR(50));

CREATE TABLE dim_customers (creation_date timestamp PRIMARY KEY, company_name VARCHAR (255) UNIQUE NOT NULL, first_name_company_main_contact VARCHAR(50) NOT NULL, last_name_company_main_contact VARCHAR(50) NOT NULL, email_of_company_main_contact VARCHAR(255) UNIQUE NOT NULL, nbelevators smallint, customers_city VARCHAR(100));

CREATE TABLE fact_quotes (quote_id integer PRIMARY KEY, creation TIMESTAMP NOT NULL, company_name VARCHAR (50), email VARCHAR ( 255 ) UNIQUE NOT NULL, nb_elevator SMALLINT);