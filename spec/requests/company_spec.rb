require 'rails_helper'

RSpec.describe "Companies", type: :request do
  describe "GET" do
    it "returns http success" do
      get "/companies"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET" do
    it "returns http success" do
      get "/companies/0"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST" do
    it "returns http success" do
      post "/companies", :params => { :company => { :name => "Teste" } }
      expect(response).to have_http_status(:success)
    end
  end
end
