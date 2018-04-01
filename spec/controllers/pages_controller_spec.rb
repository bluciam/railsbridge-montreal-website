require 'rails_helper'

RSpec.describe PagesController do
  it "should respond to home page requests" do
    get :home, params: { locale: "en" }

    expect(response).to be_success
  end

  it "should respond to team requests" do
    get :team, params: { locale: "en" }

    expect(response).to be_success
  end

  it "should respond to sponsors requests" do
    get :sponsors, params: { locale: "en" }

    expect(response).to be_success
  end

  it "should respond to schedule requests" do
    get :schedule, params: { locale: "en" }

    expect(response).to be_success
  end

  it "should respond to contact requests" do
    get :contact, params: { locale: "en" }

    expect(response).to be_success
  end
end
