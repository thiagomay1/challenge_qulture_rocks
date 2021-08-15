require 'rails_helper'

RSpec.describe "Employees", type: :request do
  describe "GET /index" do
    it "returns http success" do
      company = create(:company)
      get "/companies/#{company.id}/employees"
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT /leader/:leader_id/subordinate" do
    it "returns http success" do
      company = create(:company)
      leader = create(:employee, company: company)
      subordinate = create(:employee, company: company)
      put "/leader/#{leader.id}/subordinate", :params => {  :subordinate_id => subordinate.id } 
      expect(response).to have_http_status(:success)
    end
  end
end
