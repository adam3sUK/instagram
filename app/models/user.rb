class User < ApplicationRecord
  include Clearance::User

  validates :username, presence: true
  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :comments
end
