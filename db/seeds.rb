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
  # puts(employee.first_name, employee.user_id)
  print("\n\t\t\t",employee.first_name, " user_id => ", employee.user_id, "\n")
 end

puts "Done!"

 #puts "= Seeding Quotes ="
 #50.times do
 # Quote.create(
 #  #building_type: Faker::Number.between(from: , to: ),
 #  number_of_apartments: Faker::Number.between(from: 50, to: 600),
 #  number_of_floors: Faker::Number.between(from: 1, to: 50),
 #  number_of_basements: Faker::Number.between(from: 1, to: 400),
 #  number_of_companies: Faker::Number.between(from: 1, to: 500),
 #  number_of_parking_spots: Faker::Number.between(from: 1, to: 700),
 #  number_of_elevators: Faker::Number.between(from: 1, to: 200),
 #  number_of_corporations: Faker::Number.between(from: 1, to: 500),
 #  maximum_occupancy: Faker::Number.between(from: 1, to: 500))
 #end

 Random_address_type = ["#Residential or Commercial or Corporate"]


puts "= Starting Customer Seeds ="
CSV.foreach(Rails.root.join('app/mailers/customer-200.csv'), headers: true) do |row|
  Customer.create({
    created_at: Faker::Date.between(from: '2018-01-01', to: '2020-01-01'),
    company_name: row["company_name"],
    company_address: row["address"],
    company_contact_full_name: Faker::Name.name,
    company_phone: Faker::PhoneNumber.cell_phone,
    company_email: Faker::Internet.email,
    company_description: "Confidential",
    service_technical_authority_full_name: Faker::Name.name,
    service_technical_authority_phone: Faker::PhoneNumber.cell_phone,
    service_technical_authority_email: Faker::Internet.email})
  end
puts "= Customer Seeds Finished ="

puts "= Starting Building Seeds ="
CSV.foreach(Rails.root.join('app/mailers/building-300.csv'), headers: true) do |row|
  Building.create({
    #customer_id: "#from customer",
    building_address: row["address"],
    building_admin_full_name: Faker::Name.name,
    building_admin_email: Faker::Internet.email,
    building_admin_phone: Faker::PhoneNumber.cell_phone,
    building_technical_full_name: Faker::Company.name,
    building_technical_email: Faker::Internet.email,
    building_technical_phone: Faker::PhoneNumber.cell_phone})
end
puts "= Building Seeds Finished ="

puts "= Starting Address Seeds ="
10.times do
  Address.create(
    address_type: ["Residential", "Commercial", "Corporate"].sample,
    status: ["Active", "Innactive"].sample,
    notes: "Confidential",
    entity: "is it from Customer or Building...?",
    address_formatted_address: "adress of Customer or Building")
end
puts "= Address Seeds Finished ="

puts "= Starting BuildingDetail Seeds ="
10.times do
  BuildingDetail.create(
#    building_id: "#from building",
    information_key: "Confidential",
    information_value: "Confidential")
end
puts "= BuildingDetail Finished ="

puts "= Starting Battery Seeds ="
10.times do
  Battery.create(
#    building_id: "#from building",
    type: "",
    status: ["Active", "intervention", "inactive"].sample,
    employee_id: Faker::IDNumber.valid,
    date_of_commissioning: Faker::Date.between(from: '2018-01-01', to: '2020-01-01'),
    date_of_last_inspection: Faker::Date.between(from: '2020-01-02', to: '2021-01-01'),
    certificate_of_operations: Faker::Crypto.md5,
    information: "Confidential",
    notes: "Confidential")
end
puts "= Battery Seeds Finished="

puts "= Starting Column Seeds ="
10.times do
  Column.create(
#    battery_id: "#from battery",
    building_type: "",
    number_of_floors_served: Faker::Number.between(from: 2, to: 60),
    status: "",
    information: "Confidential",
    notes: "Confidential")
end
puts "= Column Seeds Finished="

puts "= Starting Elevators Seeds ="
10.times do
  Elevator.create(
#    column_id: "#from column",
    serial_number: Faker::Device.serial,
    model_type: ["Residential", "Commercial", "Corporate", "Hybrid"].sample,
    building_type: "",
    status: "",
    date_of_comissioning: Faker::Date.between(from: '2018-01-01', to: '2020-01-01'),
    date_of_last_inspection: Faker::Date.between(from: '2020-01-02', to: '2021-01-01'),
    certificate_of_operations: Faker::Crypto.md5,
    information: "Confidential",
    notes: "Confidential")
end
puts "= Elevators Seeds Finished ="