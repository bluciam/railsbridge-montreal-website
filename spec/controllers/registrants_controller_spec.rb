require 'rails_helper'

RSpec.describe RegistrantsController do
  let(:registrant_basic_params) { {
    name: "Gary Haran", email: "gary.haran@gmail.com", course_id: course.id, edition_id: edition.id
  } }

  let!(:course) { Course.create }
  let!(:edition) { Edition.create }

  context "POST create" do
    it "should create a registrant" do
      expect {
        post :create, params: { registrant: registrant_basic_params }, format: :js
      }.to change(Registrant, :count).by 1
    end

    it "should be success" do
      post :create, params: { registrant: registrant_basic_params }, format: :js

      expect(response).to be_success
    end
  end

  context "PATCH update" do
    let(:existing_registrant) { Registrant.create!(registrant_basic_params) }

    let(:registrant_detail_params) { {
      id: existing_registrant.id,
      bringing_laptop: "true",
      language: "french",
      programmed_before: "false",
      special_needs: ""
    } }

    it "should update an existing registrant" do
      patch :update, params: { registrant: registrant_detail_params }, format: :js

      existing_registrant.reload
      expect(existing_registrant.bringing_laptop).to be_truthy
      expect(existing_registrant.language).to eq("french")
      expect(existing_registrant.level).to eq("beginner")
    end
  end
end
