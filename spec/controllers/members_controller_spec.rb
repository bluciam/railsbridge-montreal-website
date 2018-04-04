require 'rails_helper'

RSpec.describe MembersController, type: :controller do

  describe "GET #index" do
    let!(:member) { FactoryBot.create(:member) }

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "members are in page" do
      get :index
      expect(assigns(:members).count).to equal(Member.count)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

end
