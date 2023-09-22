require 'rails_helper'

RSpec.describe "Questions", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/questions/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/questions/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/questions/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
