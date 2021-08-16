require 'rails_helper'

RSpec.describe "Companies", type: :request do
  describe "GET" do
    it "returns http success" do
      get "/api/v1/companies"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET" do
    it "returns http success" do
      get "/api/v1/companies/0"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST" do
    it "returns http success" do
      post "/api/v1/companies", :params => { :company => { :name => "Teste" } }
      expect(response).to have_http_status(:success)
    end
  end
end
