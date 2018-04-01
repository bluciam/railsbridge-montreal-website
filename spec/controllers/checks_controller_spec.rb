require 'rails_helper'

RSpec.describe ChecksController do

  let(:valid_session) { {} }

  describe "GET index" do
    context "with credentials" do
      before do
        request.env["HTTP_AUTHORIZATION"] = encoded_credentials
      end

      it "should be success" do
        get :index

        expect(response).to be_ok
      end
    end
  end

  describe "GET script" do
    it "should respond with a script" do
      get :script

      expect(response).to be_ok
      expect(response.body).to match(/RUBY_VERSION/)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      let(:valid_params) { {
          email: "gary.haran@gmail.com",
          ruby_version: "2.1.1",
          ruby_platform: "x86_64-darwin13.0"
      } }

      subject { post :create, params: { check: valid_params } }

      it "should create a new Check" do
        expect {
          subject
        }.to change(Check, :count).by(1)
      end

      it "should respond with an OK" do
        subject

        expect(response).to be_ok
      end

      context "email already present" do
        before do
          Check.create!(valid_params)
        end

        it "should overwrite the existing record rather than create a new one" do
          expect {
            subject
          }.to_not change { Check.count }
        end
      end
    end

    describe "with invalid params" do
      before do
        check = double(:check, save: false)
        allow(Check).to receive(:new).and_return(check)
      end

      it "should respond with a bad request" do
        post :create, params: { check: { email: "invalid value" } }

        expect(response).to be_bad_request
      end
    end
  end

  def encoded_credentials
    ActionController::HttpAuthentication::Basic.encode_credentials(
      "volunteer",
       ENV["ADMIN_PASSWORD"]
    )
  end
end
