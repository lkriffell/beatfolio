class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true
  has_many :beats
  # has_many :follows, foreign_key: 'followed_id', class_name: 'UserFollow', dependent: :destroy, inverse_of: :follower_id
  # has_many :followers, foreign_key: 'follower_id', class_name: 'UserFollow', dependent: :destroy, inverse_of: :followed_id
end
