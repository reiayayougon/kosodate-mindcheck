require 'rails_helper'

RSpec.describe "Albams", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/albams/index"
      expect(response).to have_http_status(:success)
    end
  end

end
