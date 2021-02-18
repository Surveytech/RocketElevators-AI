# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

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

# thomas = Employee.last
# puts(thomas)
# thomas.build_user({ name: 'Thomas', email: thomas.email, password: '123456', password_confirmation: '123456', title: thomas.title, role_id: r3.id })
# puts(thomas.user)
# thomas.save
# puts("saved")
# puts(User.all)

Employee.all.each do |employee|
  employee.build_user({
    email: employee.email,
    name: employee.first_name,
    surname: employee.last_name,
    title: employee.title,
<<<<<<< HEAD
    role_id: 3,
    password: 123456,
    password_confirmation: 123456})
  employee.save
  puts(employee.first_name)
=======
    role_id: 2,
    password: 123456,
    password_confirmation: 123456})
  employee.save!
  employee.user_id = employee.user.id
  employee.save!
  # puts(employee.first_name, employee.user_id)
  print("\n\t\t\t",employee.first_name, " user_id => ", employee.user_id, "\n")
>>>>>>> main
 end

puts "Done!"

# puts "= Seeding Quotes ="
# 50.times do
#     Quote.create(
#             #building_type: Faker::Number.between(from: , to: ),
#             number_of_apartments: Faker::Number.between(from: 50, to: 600),
#             number_of_floors: Faker::Number.between(from: 1, to: 50),
#             number_of_basements: Faker::Number.between(from: 1, to: 400),
#             number_of_companies: Faker::Number.between(from: 1, to: 500),
#             number_of_parking_spots: Faker::Number.between(from: 1, to: 700),
#             number_of_elevators: Faker::Number.between(from: 1, to: 200),
#             number_of_corporations: Faker::Number.between(from: 1, to: 500),
#             maximum_occupancy: Faker::Number.between(from: 1, to: 500))
#     end
