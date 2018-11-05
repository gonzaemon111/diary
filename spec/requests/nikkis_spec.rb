require 'rails_helper'

RSpec.describe "Nikkis", type: :request do
  describe "GET /nikkis" do
    it "works! (now write some real specs)" do
      get nikkis_path
      expect(response).to have_http_status(200)
    end
  end
end
