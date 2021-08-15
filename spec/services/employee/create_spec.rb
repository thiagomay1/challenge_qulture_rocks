require 'rails_helper'

RSpec.describe Employee::Create do

  let(:company) { create(:company) } 
  let(:name) { Faker::Name.unique.name } 
  let(:email) { Faker::Internet.email } 
  let(:params) { {:name => name, :email => email, :company_id => company.id } }

  it "initialize with none employee" do  
    expect(Employee.count).to be 0 
  end

  it "should create a employee" do
    service = Employee::Create.new(params)

    result = service.call

    expect(Employee.count).to be 1
  end

  it "should return created emplyoee" do
    service = Employee::Create.new(params)

    result = service.call

    expect(result.id).not_to be 0 
    expect(result.name).to eq name
    expect(result.email).to eq email
    expect(result.company_id).to eq company.id
  end

end
