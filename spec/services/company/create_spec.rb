require 'rails_helper'

RSpec.describe Company::Create do

  let(:name) { Faker::Name.unique.name } 
  let(:params) { {:name => name } }
  it "initialize with none company" do  
    expect(Company.count).to be 0 
  end


  it "should create a company" do
    service = Company::Create.new(params)

    result = service.call

    expect(Company.count).to be 1
  end

  it "should return created company" do
    service = Company::Create.new(params)

    result = service.call

    expect(result.id).not_to be 0 
    expect(result.name).to eq name
  end

end
