require 'rails_helper'

RSpec.describe Employee::DeleteFromCompany do
  let!(:company) { create(:company) }
  let!(:other_company) { create(:company) }
  let!(:to_destroy_employee) { create(:employee, company: company) }
  let!(:other_company_employee) { create(:employee, company: other_company) }

  it "initialize with none employee" do  
    expect(Employee.count).to be 2
    expect(Company.count).to be 2
  end

  it "should not destroy an employee from other company" do
    
    service = Employee::DeleteFromCompany.new({ :id => to_destroy_employee.id, :company_id => other_company.id })

    expect { service.call }.to raise_error(ActiveRecord::RecordNotFound)
    expect(Employee.count).to be 2
    expect(Company.count).to be 2
  end

  it "delete only employee of company" do
    service = Employee::DeleteFromCompany.new({ :id => to_destroy_employee.id, :company_id => company.id })

    service.call

    expect(Employee.count).to be 1
    expect(Company.count).to be 2
    expect(Employee.find_by(id: to_destroy_employee.id)).to be nil
  end

  it "delete only employee of company" do
    subordinate = create(:employee, company: company)
    to_destroy_employee.add_subordinate!(subordinate)
    service = Employee::DeleteFromCompany.new({ :id => to_destroy_employee.id, :company_id => company.id })

    service.call

    expect(Employee.count).to be 2
    expect(Employee.find_by(id: subordinate.id)).not_to be nil
    expect(Employee.find_by(id: subordinate.id).leader).to be nil
  end

end
