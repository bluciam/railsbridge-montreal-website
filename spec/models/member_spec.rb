require 'rails_helper'

RSpec.describe Member, type: :model do

  let(:member_1) { FactoryBot.create(:member) }
  # let(:member_2) { FactoryBot.create(:member) }

  it "has a valid factory" do
    expect(member_1).to be_valid
  end

  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:email)}
  it { should validate_presence_of(:bio)}
  it { should validate_uniqueness_of(:email)}
end
