class Member < ActiveRecord::Base
  validates_presence_of :name, :email, :bio
  validates_uniqueness_of :email
end
