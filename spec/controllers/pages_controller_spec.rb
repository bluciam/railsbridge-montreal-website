require 'rails_helper'

RSpec.describe PagesController do
  it "should respond to home page requests" do
    get :home, locale: "en"
    expect(response).to be_success
  end
end
