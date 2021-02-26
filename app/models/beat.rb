class Beat < ApplicationRecord
  validates :user_id, presence: true
  validates :name, presence: true

  belongs_to :user
  has_many :beat_tags
end
