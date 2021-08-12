require 'rails_helper'

RSpec.describe Company::Create do
  it "has none to begin with" do
    expect(Company.count).to be 0
  end

  it "should create company by name" do
    service = Company::Create.new("teste")

    service.call

    expect(Company.count).to be 1
    expect(Company.first.name).to eq "teste"
  end

  it "should not allow empty name" do
    service = Company::Create.new("")

    expect { service.call }.to raise_error(ActiveRecord::RecordInvalid)
    expect(Company.count).to be 0
  end

  it "should not allow duplicated names" do
    service = Company::Create.new("teste")

    service.call

    expect { service.call }.to raise_error(ActiveRecord::RecordInvalid)
    expect(Company.count).to be 1
  end

end
