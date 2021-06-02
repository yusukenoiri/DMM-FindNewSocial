require 'rails_helper'

RSpec.describe "Admin::Posts", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/admin/posts/index"
      expect(response).to have_http_status(:success)
    end
  end

end
