class Comment < ApplicationRecord
  validates :beat_id, presence: true
  validates :user_id, presence: true
  validates :description, presence: true
  
  belongs_to :beat
  belongs_to :user
end
