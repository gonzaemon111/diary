require "rails_helper"

RSpec.describe "Nikkis", type: :request do
  describe "GET /monitors" do
    it "#index action" do
      get monitors_path
      expect(response).to have_http_status(200)
    end
  end
end
