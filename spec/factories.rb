require 'faker'

FactoryBot.define do
  # factory :member do
  #   name "MyString"
  #   bio "MyString"
  #   image "MyString"
  # end

  factory :member do
    name Faker::Name.name
    bio { Faker::Lorem.sentences.to_s }
    email { Faker::Internet.email }
    # image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec',
    #   'support', 'images', 'image_2.jpg')) }
  end
end
