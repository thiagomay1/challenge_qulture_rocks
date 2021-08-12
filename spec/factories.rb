FactoryBot.define do
  factory :company do
    sequence(:name) { |n|"Teste#{n}" } 
  end

  factory :employee do
    name { "Teste" } 
    sequence(:email) { |n| "teste#{n}@example.com" }
  end
end
