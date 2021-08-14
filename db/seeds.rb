# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
2.times  do
  company = Company.create(name: Faker::Company.name)
  employee1 = Employee.create(name: Faker::Name.name, email: Faker::Internet.email, company: company)
  employee2 = Employee.create(name: Faker::Name.name, email: Faker::Internet.email, company: company, parent: employee1)
  employee3 = Employee.create(name: Faker::Name.name, email: Faker::Internet.email, company: company, parent: employee2)
  employee4 = Employee.create(name: Faker::Name.name, email: Faker::Internet.email, company: company, parent: employee3)
  employee5 = Employee.create(name: Faker::Name.name, email: Faker::Internet.email, company: company, parent: employee4)
  employee6 = Employee.create(name: Faker::Name.name, email: Faker::Internet.email, company: company, parent: employee5)
  employee7 = Employee.create(name: Faker::Name.name, email: Faker::Internet.email, company: company, parent: employee6)
  employee8 = Employee.create(name: Faker::Name.name, email: Faker::Internet.email, company: company, parent: employee7)
  employee9 = Employee.create(name: Faker::Name.name, email: Faker::Internet.email, company: company, parent: employee8)
end
