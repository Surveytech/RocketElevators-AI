# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'csv'
require 'faker'

Employee.create(first_name: 'Nadya', last_name: 'Fortier', title: 'Director', email: 'nadya.fortier@codeboxx.biz')
Employee.create(first_name: 'Nicolas', last_name: 'Genest', title: 'CEO', email: 'nicolas.genest@codeboxx.biz')
Employee.create(first_name: 'Martin', last_name: 'Chantal', title: 'Director Assistant', email: 'martin.chantal@codeboxx.biz')
Employee.create(first_name: 'Mathieu', last_name: 'Houde', title: 'Captain', email: 'mathieu.houde@codeboxx.biz')
Employee.create(first_name: 'David', last_name: 'Boutin', title: 'Engineer', email: 'david.boutin@codeboxx.biz')
Employee.create(first_name: 'Mathieu', last_name: 'Lortie', title: 'Engineer', email: 'mathieu.lortie@codeboxx.biz')
Employee.create(first_name: 'Thomas', last_name: 'Carrier', title: 'Engineer', email: 'thomas.carrier@codeboxx.biz')

r1 = Role.create({ name: 'Regular', description: 'Can read and create quotes. Can update and destroy own quotes' })
r2 = Role.create({ name: 'Employee', description: 'Employee' })
r3 = Role.create({ name: 'Admin', description: 'Can perform any CRUD operation on any resource' })

u1 = User.create({ name: 'Sally', email: 'sally@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: r1.id })
u2 = User.create({ name: 'Sue', email: 'sue@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: r1.id })
u3 = User.create({ name: 'Kev', email: 'kev@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: r2.id })
u4 = User.create({ name: 'Jack', email: 'jack@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: r3.id })
u5 = User.create({ name: 'Admin', email: 'admin@admin', password: '123456', password_confirmation: '123456', role_id: r3.id })

q1 = Quote.create({ name: 'First Quote', building_type: 'residential', number_of_apartments: '500', number_of_floors: '50', number_of_basements: '5', user_id: u1.id})
q5 = Quote.create({ name: 'This Quote', building_type: 'residential', number_of_apartments: '300', number_of_floors: '30', number_of_basements: '2', user_id: u1.id})
q2 = Quote.create({ name: 'My Quote', building_type: 'residential', number_of_apartments: '400', number_of_floors: '40', number_of_basements: '10', user_id: u2.id})
q3 = Quote.create({ name: 'This Quote', building_type: 'residential', number_of_apartments: '300', number_of_floors: '30', number_of_basements: '2', user_id: u3.id})
q4 = Quote.create({ name: 'My Quote', building_type: 'residential', number_of_apartments: '600', number_of_floors: '60', number_of_basements: '5', user_id: u4.id})
q5 = Quote.create({ name: 'My Quote', building_type: 'residential', number_of_apartments: '600', number_of_floors: '60', number_of_basements: '5', user_id: u5.id})
q6 = Quote.create({ name: 'My Quote', building_type: 'residential', number_of_apartments: '600', number_of_floors: '60', number_of_basements: '5', user_id: u5.id})

Employee.all.each do |employee|
  employee.build_user({
    email: employee.email,
    name: employee.first_name,
    surname: employee.last_name,
    title: employee.title,
    role_id: 2,
    password: 123456,
    password_confirmation: 123456})
  employee.save!
  employee.user_id = employee.user.id
  employee.save!
 end


puts "= Starting Leads Seeds ="
100.times do
  Lead.create(
    full_name: Faker::Name.name,
    company_name: Faker::Company.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    project_name: "Elevator project",
    project_description: "Confidential",
    department_in_charge_of_the_elevators: ["Sales", "Support", "Administration"].sample,
    message: "Lead's confidential message",
    file_name: ["buildingPicture.jpeg", "buildingPlan.jpeg",].sample,
    file_type: "JPEG",
    file_data: Faker::Date.between(from: '2018-01-02', to: '2019-01-01'),
    created_at: Faker::Date.between(from: '2017-01-02', to: '2018-01-01'))
end

puts "= Starting Address Seeds ="
def createAddresses
  csv_text = File.read(Rails.root.join('lib','address.csv'))
  csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
  csv.each do |row|
    address = Address.new(
      address_type: ["Residential", "Commercial", "Corporate"].sample,
      status: ["Active", "Innactive"].sample,
      number_and_street: row['number_and_street'],
      suite: row['suite'],
      city: row['city'],
      country: row['country'],
      postal_code: row['postal_code'],
      notes: "Confidential",
      entity: "is it from Customer or Building...?")
    address.save!
  end
end

puts "= Starting Seeds ="
def createElevators(columnID, amountOfElevators)
  column = Column.find(columnID)
  amountOfElevators.times do
    elevator = Elevator.create(
      column_id: column.id,
      serial_number: Faker::Device.serial,
      model_type: ["Standard", "Premium", "Excelium"].sample,
      building_type: column.building_type,
      status: ["Idle", "Moving", "Stopped"].sample,
      date_of_commissioning: Faker::Date.between(from: '2018-01-01', to: '2020-01-01'),
      date_of_last_inspection: Faker::Date.between(from: '2020-01-02', to: '2021-01-01'),
      certificate_of_operations: Faker::Crypto.md5,
      information: "Elevator's confidential information",
      notes: "Elevator's confidential notes")
    elevator.save!
    print("\n\t\t\t","Elevator created with the id: ", elevator.id, "\n")
  end
end

def createColumns(batteryID, amountOfColumns)
  battery = Battery.find(batteryID)
  amountOfColumns.times do 
    column = Column.create(
      battery_id: battery.id,
      building_type: battery.building_type,
      number_of_floors_served: Faker::Number.between(from: 2, to: 60),
      status: ["Active", "Intervention", "Inactive"].sample,
      information: battery.information,
      notes: battery.notes)
    column.save!
    print("\n\t\t\t","Column created with the id: ", column.id, "\n")
    createElevators(column.id,4)
  end
end

def createBatteries(buildingID, amountOfBatteries)
  building = Building.find(buildingID)
  amountOfBatteries.times do
    battery = Battery.create(
      building_id: building.id,
      building_type: ["Residential", "Commercial", "Corporate"].sample,
      status: ["Active", "Inactive"].sample,
      employee_id: Faker::IDNumber.valid,
      date_of_commissioning: Faker::Date.between(from: '2018-01-01', to: '2020-01-01'),
      date_of_last_inspection: Faker::Date.between(from: '2020-01-02', to: '2021-01-01'),
      certificate_of_operations: Faker::Crypto.md5,
      information: "Confidential",
      notes: "Confidential")
      battery.save!
      print("\n\t\t\t","Battery created with the id: ", battery.id, "\n")
      createColumns(battery.id,2)
  end
end

def createBuildings(customerID, amountOfBuilding)
  
  print("\n\t\t\t","= Building Seeds =","\n")
  customer = Customer.find(customerID)

  amountOfBuilding.times do
    # CSV.foreach(Rails.root.join('app/mailers/building-300.csv'), headers: true) do |row|
      building = Building.create(
        customer_id: customer.id,
        building_address: customer.company_address,#row["address"],
        building_admin_full_name: Faker::Name.name,
        building_admin_email: Faker::Internet.email,
        building_admin_phone: Faker::PhoneNumber.cell_phone,
        building_technical_full_name: Faker::Company.name,
        building_technical_email: Faker::Internet.email,
        building_technical_phone: Faker::PhoneNumber.cell_phone)

        building.save!
        print("\n\t\t\t","Building created with the id: ", building.id, "\n")
        createBatteries(building.id,2)
    # end 
  end
end

def createCustomers
  print("\n\t\t\t","= Customer Seeds =","\n")
    # CSV.foreach(Rails.root.join('app/mailers/customer-200.csv'), headers: true) do |row|
      customer = Customer.create({
        created_at: Faker::Date.between(from: '2018-01-01', to: '2020-01-01'),
        company_name: "ouer monsieur",#row["company_name"],
        company_address: "ouer garcon",#row["address"],
        company_contact_full_name: Faker::Name.name,
        company_phone: Faker::PhoneNumber.cell_phone,
        company_email: Faker::Internet.email,
        company_description: "Confidential",
        service_technical_authority_full_name: Faker::Name.name,
        service_technical_authority_phone: Faker::PhoneNumber.cell_phone,
        service_technical_authority_email: Faker::Internet.email})

        customer.save!
        createBuildings(customer.id, 2)
    # end
end

createAddresses()

2.times do 
  createCustomers()
end
