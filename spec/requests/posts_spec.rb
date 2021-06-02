require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/posts/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/posts/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /confirm" do
    it "returns http success" do
      get "/posts/confirm"
      expect(response).to have_http_status(:success)
    end
  end

end
