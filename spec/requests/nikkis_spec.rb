require 'rails_helper'

RSpec.describe "Nikkis", type: :request do
  describe "GET /nikkis" do
    it "#index action" do
      get nikkis_path
      expect(response).to have_http_status(200)
    end
  end
  describe "GET /nikkis/:id" do
    it "#show action" do
      @nikki = create(:nikki)
      get nikki_path(@nikki)
      expect(response).to have_http_status(200)
    end
  end
  describe "GET /nikkis/new" do
    it "#new action" do
      get new_nikki_path
      expect(response).to have_http_status(200)
    end
  end
  describe "GET /nikkis/:id/edit" do
    it "#edit action" do
      @nikki = create(:nikki)
      get edit_nikki_path(@nikki)
      expect(response).to have_http_status(200)
    end
  end
  describe "POST /nikkis" do
    let(:param){
      {
        nikki: {
          value: "test1",
          datetime: "2018-11-04 20:46:57"
        }
      }
    }
    it "#create action" do
      post nikkis_path, params: param
      expect(response).to have_http_status(201)
    end
  end
  describe "DELETE /nikkis/:id" do
    it "#destroy action" do
      @nikki = create(:nikki)
      delete nikki_path(@nikki)
      expect(response).to have_http_status(200)
    end
  end
  describe "PUT /nikkis/:id" do
    let(:param){
      {
        nikki: {
          value: "test1",
          datetime: "2018-11-04 20:46:57"
        }
      }
    }
    it "#update action" do
      @nikki = create(:nikki)
      put nikki_path(@nikki), params: param
      expect(response).to have_http_status(204)
    end
  end
end
