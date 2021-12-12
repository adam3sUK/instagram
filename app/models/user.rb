class User < ApplicationRecord
  include Clearance::User

  has_many :posts
  has_many :likes
  has_many :comments
end
