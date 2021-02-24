require 'pg'
class Pgsync 
  
    attr_accessor :conn, :host, :port, :database, :user, :password
    
    def initialize
        self.info
        self.connection
    end

    def info
        info = File.foreach("pg.yml") { |line| puts line }

        self.user = info["username"]
        self.password = info["password"]
        self.database = info["database"]
        self.port=  info["port"]
        self.host = info["host"]
    end

    def connection
        self.connection = PG.connect(
            database: self.database
            port: self.port,
            user: self.user,
            password: self.password
            host: self.host
        )
    end

def sync_quotes
    Quote.all.each do | quote |
        sql = "INSERT INTO fact_quotes(id, created_at, company_name, email, number_of_elevator) 
        VALUES (#{quote.id},#{quote.created_at},#{quote.company_name},#{quote.number_of_elevator},#{customer.company_email})"
        self.connection.exec(sql)
    end
end

def sync_elevators
    Elevator.all.each do | elevator |
        sql = "INSERT INTO fact_elevator (serial_number, date_of_commissioning, building_id, customer_id, building_city) 
        VALUES (#{elevator.id},#{elevator.date_of_commissioning},#{building.id},#{customer.id},#{adress.city})"
        self.connection.exec(sql)
    end
end

def sync_contact
    Lead.all.each do | lead |
        sql = "INSERT INTO fact_contact(id, created_at, company_name, email, project_name) 
        VALUES (#{lead.id},#{lead.created_at},#{lead.company_name},#{lead.email}.#{lead.project_name})"
        self.connection.exec(sql)
    end
end

def sync_customers
    Customer.all.each do | customer |
        sql = "INSERT INTO dim_customers(created_at, company_name, service_technical_authority_full_name, service_technical_authority_email, nbelevators, customer_city) 
        VALUES (#{customer.created_at},#{customer.company_name},#{customer.service_technical_authority_full_name},#{customer.service_technical_authority_email},#{quote.number_of_elevator},#{adress.city})"
        self.connection.exec(sql)
    end
end 

Pgsync.sync_quotes()
Pgsync.sync_contact()
Pgsync.sync_elevators()
Pgsync.sync_customers()
