CREATE TABLE fact_contact (
    contact_id INTEGER PRIMARY KEY, 
    creation_date TIMESTAMP NOT NULL, 
    company_name VARCHAR (50), 
    email VARCHAR (255) NOT NULL, 
    project_name VARCHAR (50) NOT NULL
    );
CREATE TABLE FactElevator (
    serial_number INTEGER PRIMARY KEY, 
    date_of_commissioning timestamp NOT NULL, 
    building_id INTEGER NOT NULL, 
    customer_id INTEGER NOT NULL, 
    building_city VARCHAR(50) NOT NULL
    );
CREATE TABLE dim_customers (
    creation_date timestamp PRIMARY KEY, 
    company_name VARCHAR (255) NOT NULL, 
    full_name_company_main_contact VARCHAR(50) NOT NULL, 
    email_of_company_main_contact VARCHAR(255) NOT NULL, 
    nb_elevators INTEGER NOT NULL, 
    customers_city VARCHAR(100) NOT NULL   
    );
CREATE TABLE fact_quotes (
    quote_id serial PRIMARY KEYs, 
    creation_date TIMESTAMP NOT NULL, 
    company_name VARCHAR (50) NOT NULL, 
    email VARCHAR ( 255 ) NOT NULL, 
    nb_elevators INTEGER NOT NULL
    );