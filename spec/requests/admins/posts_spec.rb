require 'rails_helper'

RSpec.describe "Admins::Posts", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/admins/posts/index"
      expect(response).to have_http_status(:success)
    end
  end

end
