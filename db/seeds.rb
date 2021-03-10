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

$addressArray = []

puts "= Starting Quotes Seeds ="
100.times do
  Quote.create(
    name: Faker::Name.name,
    building_type: ["Residential", "Commercial", "Corporate"].sample,
    email: Faker::Internet.email,
    number_of_apartments: rand(5..500),
    number_of_floors: rand(5..500),
    number_of_basements: rand(5..500),
    number_of_parking_spots: rand(5..500),
    number_of_elevators: rand(5..500),
    number_of_corporations: rand(5..20),
    maximum_occupancy: rand(5..20),
    product_line: ["Standard", "Premium", "Excelium"].sample,
    company_name: Faker::Company.name,
    created_at: Faker::Date.between(from: '2017-01-02', to: '2018-01-01'))
end


puts "= Starting Leads Seeds ="
100.times do
  Lead.create(
    full_name: Faker::Name.unique.name,
    company_name: Faker::Company.unique.name,
    email: Faker::Internet.unique.email,
    phone: Faker::PhoneNumber.unique.cell_phone,
    project_name: "Elevator project",
    project_description: "Confidential",
    department_in_charge_of_the_elevators: ["Sales", "Support", "Administration"].sample,
    message: "Lead's confidential message",
    file_name: ["buildingPicture.jpeg", "buildingPlan.jpeg",].sample,
    file_type: "JPEG",
    file_data: Faker::Date.between(from: '2018-01-02', to: '2019-01-01'),
    created_at: Faker::Date.between(from: '2017-01-02', to: '2018-01-01'))
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
      status: ["Idle", "Moving", "Stopped", "Inactive"].sample,
      date_of_commissioning: Faker::Date.between(from: '2018-01-01', to: '2020-01-01'),
      date_of_last_inspection: Faker::Date.between(from: '2020-01-02', to: '2021-01-01'),
      certificate_of_operations: Faker::Crypto.md5,
      information: "Elevator's confidential information",
      notes: "Elevator's confidential notes")
    elevator.save!
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
      employee_id: Faker::IDNumber.unique.valid,
      date_of_commissioning: Faker::Date.between(from: '2018-01-01', to: '2020-01-01'),
      date_of_last_inspection: Faker::Date.between(from: '2020-01-02', to: '2021-01-01'),
      certificate_of_operations: Faker::Crypto.unique.md5,
      information: "Confidential",
      notes: "Confidential")
      battery.save!

      createColumns(battery.id,2)
  end
end

puts "= Starting Building Seeds ="
def createBuildings(customerID, address)

    # puts address.id
    building = Building.new(
      building_address: address.number_and_street + "," + address.city,
      building_admin_full_name: Faker::Name.unique.name,
      building_admin_email: Faker::Internet.unique.email,
      building_admin_phone: Faker::PhoneNumber.unique.cell_phone,
      building_technical_full_name: Faker::Company.unique.name,
      building_technical_email: Faker::Internet.unique.email,
      building_technical_phone: Faker::PhoneNumber.unique.cell_phone,
      address_id: address.id,
      customer_id: customerID,
      latitude: address.latitude,
      longitude: address.longitude)
      building.save!

    buildingInfos = Building_detail.new(
      information_key: 'amount_of_floors',
      information_value: Faker::Number.between(from: 4, to: 100),
      building_id: building.id)
      buildingInfos.save!

      $addressArray.delete_at(address.id)
      createBatteries(building.id,2)
end

puts "= Starting Customer Seeds ="
def createCustomers
  30.times do
    currentAddress = $addressArray.sample
    puts currentAddress.number_and_street
    customer = Customer.new(
      created_at: Faker::Date.between(from: '2018-01-01', to: '2020-01-01'),
      company_name: Faker::Company.unique.name,
      company_address: currentAddress.number_and_street + "," + currentAddress.city,
      company_contact_full_name: Faker::Name.unique.name,
      company_phone: Faker::PhoneNumber.unique.cell_phone,
      company_email: Faker::Internet.unique.email,
      company_description: Faker::Company.unique.catch_phrase,
      service_technical_authority_full_name: Faker::Name.unique.name,
      service_technical_authority_phone: Faker::PhoneNumber.unique.cell_phone,
      service_technical_authority_email: Faker::Internet.unique.email,
      address_id: currentAddress.id)
      customer.save!
      createBuildings(customer.id, currentAddress)
  end
end


puts "= Starting Address Seeds ="
def createAddresses
  csv_text = File.read(Rails.root.join('lib','address.csv'))
  csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
  csv.each do |row|
    address = Address.new(
      address_type: ["Residential", "Commercial", "Corporate"].sample,
      status: ["Active", "Inactive"].sample,
      number_and_street: row['number_and_street'],
      suite: row['suite'],
      city: row['city'],
      country: row['country'],
      postal_code: row['postal_code'],
      notes: row["notes"],
      entity: ["Building", "Customer"].sample,
      longitude: row['longitude'],
      latitude: row['latitude'])
    address.save!

    $addressArray.push(address)

  end
end


createAddresses()
createCustomers()


#Initiating Pgsync
pgsync = Pgsync.new

#Creating Postgres Tables
pgsync.create_tables

#Synchronizing Datas
pgsync.sync_mysql
