2.times  do
  company = Company.create(name: Faker::Company.name)
  leader = Employee.create(name: Faker::Name.name, email: Faker::Internet.email, company: company)
  2.times do
    subordinate = Employee.create(name: Faker::Name.name, email: Faker::Internet.email, company: company, leader: leader)
    4.times do
      second_tier_subordinate = Employee.create(name: Faker::Name.name, email: Faker::Internet.email, company: company, leader: subordinate)
      4.times do
        third_tier_subordinate = Employee.create(name: Faker::Name.name, email: Faker::Internet.email, company: company, leader: second_tier_subordinate)
      end
    end
  end
end 
Employee.rebuild! # calculate tree
