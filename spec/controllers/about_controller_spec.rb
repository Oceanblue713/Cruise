require 'rails_helper'

RSpec.describe AboutController, type: :controller do

  describe "GET #page" do
    it "returns http success" do
      get :page
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #author" do
    it "returns http success" do
      get :author
      expect(response).to have_http_status(:success)
    end
  end

end
