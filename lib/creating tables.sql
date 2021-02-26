CREATE TABLE fact_contact (
    contact_id serial PRIMARY KEY, 
    creation_date TIMESTAMP NOT NULL, 
    company_name VARCHAR (50), 
    email VARCHAR (255) NOT NULL, 
    project_name VARCHAR (50)
    );
CREATE TABLE fact_elevator (
    serialnumber serial PRIMARY KEY, 
    date_of_commissioning timestamp, 
    building_id serial, 
    customer_id serial, 
    building_city VARCHAR(50)
    );
CREATE TABLE dim_customers (
    creation_date timestamp PRIMARY KEY, 
    company_name VARCHAR (255) NOT NULL, 
    full_name_company_main_contact VARCHAR(50) NOT NULL, 
    email_of_company_main_contact VARCHAR(255) NOT NULL, 
    nbelevators smallint, 
    customers_city VARCHAR(100)    
    );
CREATE TABLE fact_quotes (
    quote_id serial PRIMARY KEY, 
    creation_date TIMESTAMP NOT NULL, 
    company_name VARCHAR (50), 
    email VARCHAR ( 255 ) NOT NULL, 
    nb_elevator SMALLINT
    );