class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true
  validates :image, presence: true
  validates :password, presence: true
  has_many :beats, dependent: :destroy

  has_many :following, foreign_key: 'follower_id', class_name: 'UserFollow', dependent: :destroy
  has_many :followers, foreign_key: 'user_id', class_name: 'UserFollow', dependent: :destroy

  def likes_beat?(beat)
    beat.likes.pluck(:user_id).include?(id.to_s)
  end
end
