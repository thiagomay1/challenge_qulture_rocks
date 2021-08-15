require 'rails_helper'

RSpec.describe "Employees", type: :request do
  describe "GET /index" do
    it "returns http success" do
      company = create(:company)
      get "/companies/#{company.id}/employees"
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT /employees/:leader_id/subordinate" do
    it "returns http success" do
      company = create(:company)
      leader = create(:employee, company: company)
      subordinate = create(:employee, company: company)
      put "/employees/#{leader.id}/subordinate", :params => {  :subordinate_id => subordinate.id } 
      expect(response).to have_http_status(:success)
    end
  end

 describe "GET /employees/:employee_id/peers" do
    it "returns http success" do
      company = create(:company)
      employee = create(:employee, company: company)
      get "/employees/#{employee.id}/peers"
      expect(response).to have_http_status(:success)
    end
  end

end
