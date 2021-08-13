require 'rails_helper'

RSpec.describe "Employees", type: :request do
  describe "GET /index" do
    it "returns http success" do
      company = create(:company)
      get "/companies/#{company.id}/employees"
      expect(response).to have_http_status(:success)
    end
  end

end
