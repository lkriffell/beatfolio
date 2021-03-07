class Beat < ApplicationRecord
  has_attached_file :audio, presence: true
  validates_attachment_content_type :audio, :content_type => [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ]

  validates :user_id, presence: true
  validates :name, presence: true

  belongs_to :user, dependent: :destroy
  has_many :beat_tags

  def self.related_beats(keyword)
    related_beats = {}
    keyword.split(' ').each do |tag|
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
