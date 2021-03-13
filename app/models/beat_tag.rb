class BeatTag < ApplicationRecord
  validates :tag, presence: true
  validates :beat_id, presence: true

  belongs_to :beat
end
