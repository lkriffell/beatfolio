class Like < ApplicationRecord
  validates :beat_id, presence: true
  validates :user_id, presence: true
  
  belongs_to :beat
  belongs_to :user
end
