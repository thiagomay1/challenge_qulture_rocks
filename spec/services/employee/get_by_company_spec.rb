require 'rails_helper'

RSpec.describe Employee::GetByCompany do
  let(:company) { create(:company) }
  let(:other_company) { create(:company) }
  it "return only employee of company" do
    employee1 = create(:employee, company: company)
    employee2 = create(:employee, company: company)
    other_company_employee = create(:employee, company: other_company)
    service = Employee::GetByCompany.new(company.id)

    result = service.call

    expect(result.count).to be 2
    expect(result).to all( be_an(Employee) ) 
  end
end
