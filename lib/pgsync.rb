#!/usr/bin/ruby
require 'pg'
require 'yaml'


class Pgsync < ActiveRecord
    
    # attr_accessor :conn, :host, :port, :database, :user, :password 
    
    def initialize
        puts "init debut"
        # self.info
        # self.connection  
        self.sync_quotes 
        puts "init fin"
    end

    # def info
    #     puts "debut info"
    #     info = YAML.load(File.read("../config/pg.yml")) 
    #     puts info
    #     self.host = info["localhost"]
    #     self.database = info["database"]
    #     self.user = info["username"]
    #     self.password = info["password"]
    #     self.port = info["port"]

    #     puts "info fin"
    # end

    # def connection
    #     self.conn = PG.connect(
    #         host: self.host,
    #         dbname: self.database,
    #         port: self.port,
    #         user: self.user,
    #         password: self.password
    #     )    
    #     puts "connection"    
    # end

    def connection
        conn = PG.connect(
            dbname: "postgres",
            port: 5432,
            user: "gabrielrioux",
            password: "admin"
        )
    end
    def sync_quotes
        Quote.all.each do | quotes |
            sql = "INSERT INTO fact_quotes(id, created_at, company_name, email, number_of_elevator) 
            VALUES (#{quote.id},#{quote.created_at},#{quote.company_name},#{quote.number_of_elevator},#{customer.company_email})"
            self.conn.exec(sql)
        end
    end

    # def sync_elevators
    #     Elevator.all.each do | elevator |
    #         sql = "INSERT INTO fact_elevator (serial_number, date_of_commissioning, building_id, customer_id, building_city) 
    #         VALUES (#{elevator.id},#{elevator.date_of_commissioning},#{building.id},#{customer.id},#{adress.city})"
    #         self.conn.econnectionxec(sql)
    #     end
    # end

    # def sync_contact
    #     Lead.all.each do | lead |
    #         sql = "INSERT INTO fact_contact(id, created_at, company_name, email, project_name) 
    #         VALUES (#{lead.id},#{lead.created_at},#{lead.company_name},#{lead.email}.#{lead.project_name})"
    #         self.conn.exec(sql)
    #     end
    # end

    # def sync_customers
    #     Customer.all.each do | customer |
    #         sql = "INSERT INTO dim_customers(created_at, company_name, service_technical_authority_full_name, service_technical_authority_email, nbelevators, customer_city) 
    #         VALUES (#{customer.created_at},#{customer.company_name},#{customer.service_technical_authority_full_name},#{customer.service_technical_authority_email},#{quote.number_of_elevator},#{adress.city})"
    #         self.conn.exec(sql)
    #     end
    # end 

    # Pgsync.sync_quotes()
    # Pgsync.sync_contact()
    # Pgsync.sync_elevators()
#     Pgsync.sync_customers()
Pgsync.new
end
