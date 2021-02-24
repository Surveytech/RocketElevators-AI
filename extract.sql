require 'pg'


/* QUOTES

conn.exec( FOR EACH quote_id SELECT id, created_at, company_name, number_of_elevators FROM quotes) do |this|
        puts ??
        this.each do |row|
    puts ??
     row.values_at(??)  


conn.exec( FOR EACH QUOTE_ID SELECT company_email FROM controller_development.customers) do |this|
     puts ??
        this.each do |row|
        puts ??
     row.values_at(??)  
     
*/



/* Contact 

conn.exec( FOR EACH contact_id SELECT id, created_at, company_name, email, project_name FROM controller_development.leads) do |this|
        puts ??
        this.each do |row|
    puts ??
     row.values_at(??) 

*/




/* ELEVATORS 



conn.exec( FOR EACH elevator_id SELECT id, date_of_comissioning FROM controller_development.elevators) do |this|
    puts ??
        this.each do |row|
    puts ??
     row.values_at(??) 


conn.exec( FOR EACH elevator_id SELECT id FROM controller_development.buildings) do |this|
    puts ??
        this.each do |row|
    puts ??
     row.values_at(??) 


conn.exec(FOR EACH elevator_id SELECT id FROM controller_development.customers) do |this|
    puts ??
        this.each do |row|
    puts ??
     row.values_at(??) 


conn.exec(FOR EACH elevator_id SELECT address_city FROM controller_development.addresses) do |this|
    puts ??
        this.each do |row|
    puts ??
     row.values_at(??) 
*/




/* CUSTOMER 


conn.exec(FOR EACH customer_id SELECT created_at, company_name, service_technical_authority_full_name, service_technical_authority_email FROM controller_development.customers) do |this|
    puts ??
        this.each do |row|
    puts ??
     row.values_at(??) 


conn.exec(FOR EACH customer_id SELECT number_of_elevators FROM controller_development.quotes) do |this|
    puts ??
        this.each do |row|
    puts ??
     row.values_at(??) 


conn.exec(FOR EACH customer_id SELECT address_city FROM controller_development.addresses) do |this|
    puts ??
        this.each do |row|
    puts ??
     row.values_at(??) 

*/


INSERT INTO controllerpg_development.fact_quotes
SELECT id, created_at, company_name, number_of_elevators FROM controller_development.quotes;
INSERT INTO controllerpg_development.fact_quotes
SELECT company_email FROM controller_development.customers;


INSERT INTO controllerpg_development.fact_contact
SELECT id, created_at, company_name, email, project_name FROM controller_development.leads;


INSERT INTO controllerpg_development.fact_elevator
SELECT id, date_of_comissioning FROM controller_development.elevators;
INSERT INTO controllerpg_development.fact_elevator
SELECT id FROM controller_development.buildings;
INSERT INTO controllerpg_development.fact_elevator
SELECT id FROM controller_development.customers;
INSERT INTO controllerpg_development.fact_elevator
SELECT address_city FROM controller_development.addresses;



INSERT INTO controllerpg_development.dim_customers
SELECT created_at, company_name, service_technical_authority_full_name, service_technical_authority_email FROM controller_development.customers;
INSERT INTO controllerpg_development.dim_customers
SELECT number_of_elevators FROM controller_development.quotes;
INSERT INTO controllerpg_development.dim_customers
SELECT address_city FROM controller_development.addresses;

