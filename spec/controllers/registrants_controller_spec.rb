require 'rails_helper'

RSpec.describe RegistrantsController do
  let(:registrant_basic_params) { {
    name: "Gary Haran", email: "gary.haran@gmail.com"
  } }

  context "POST create" do
    it "should create a registrant" do
      expect {
        xhr :post, :create, registrant: registrant_basic_params
      }.to change(Registrant, :count).by 1
    end

    it "should assign the registrant" do
      xhr :post, :create, registrant: registrant_basic_params

      expect(response).to be_success
      expect(assigns(:registrant)).to be_present
    end
  end
end
