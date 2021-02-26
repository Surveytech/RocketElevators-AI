#!/usr/bin/ruby
require 'pg'
require 'yaml'


class Pgsync 
    
    attr_accessor :conn, :host, :port, :database, :user, :password 
    
    def initialize
        # puts "init debut"
        self.info
        self.connection 
        # puts "init fin"
    end

    def info
        # puts "debut info"
        info = YAML.load(File.read("./config/pg.yml")) 
        # puts info
        self.host = info["development"]["host"]
        # puts "host #{self.host}"
        self.database = info["development"]["database"]
        # puts "database #{self.database}"
        self.user = info["development"]["username"]
        # puts "user #{self.user}"
        self.password = info["development"]["password"]
        # puts "password #{self.password}"
        self.port = info["development"]["port"]
        # puts "port #{self.port}"
    end

    def connection
        self.conn = PG.connect(
            host: self.host,
            dbname: self.database,
            port: self.port,
            user: self.user,
            password: self.password
        )    
        # puts "connection"    
    end


    def sync_quotes
        Quote.all.each do | quote |
            # puts "#{quote}"
            sql = "INSERT INTO fact_quotes(quote_id, creation_date, company_name, email) 
            VALUES (#{quote.id},'#{quote.created_at}','#{quote.company_name.gsub!(/[^0-9A-Za-z]/, '')}','#{quote.email}');"
            self.conn.exec(sql)
        end
    end

    # def sync_elevators
    #     Elevator.all.each do | elevator |
    #         sql = "INSERT INTO fact_elevator (serial_number, date_of_commissioning, building_id, customer_id, building_city) 
    #         VALUES (#{elevator.id},'#{elevator.date_of_commissioning}',#{building.id},#{customer.id},#{adress.city});",
    #         self.conn.exec(sql)
    #     end
    # end

    def sync_contact
        Lead.all.each do | lead |
            sql = "INSERT INTO fact_contact(contact_id, creation_date, company_name, email, project_name) 
            VALUES (#{lead.id},'#{lead.created_at}','#{lead.company_name.gsub!(/[^0-9A-Za-z]/, '')}','#{lead.email}','#{lead.project_name}');"
            self.conn.exec(sql)
        end
    end

    # def sync_customers
    #     Customer.all.each do | customer |
    #         sql = "INSERT INTO dim_customers(created_at, company_name, service_technical_authority_full_name, service_technical_authority_email, nbelevators, customer_city) 
    #         VALUES ('#{customer.created_at}','#{customer.company_name}','#{customer.service_technical_authority_full_name}','#{customer.service_technical_authority_email}','#{quote.number_of_elevator}','#{customer.city}');"
    #         self.conn.exec(sql)
    #     end
    # end 

    # Pgsync.sync_quotes()
    # Pgsync.sync_contact()
    # Pgsync.sync_elevators()
    # Pgsync.sync_customers()
end

