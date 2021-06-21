class Beat < ApplicationRecord
  validates :user_id, presence: true
  validates :name, presence: true

  belongs_to :user
  has_one_attached :audio_file
  has_many :beat_tags, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.related_beats(keywords)
    related_beats = {}
    keywords.split(' ').each do |tag|
      related_beats[tag] = BeatTag.where("tag like ?", tag).select('beat_id')
    end
    related_beats.each do |keyword, ids|
      related_beats[keyword] = []
      ids.each do |id|
        related_beats[keyword] << Beat.find(id.beat_id)
      end
    end
    related_beats
  end
end
