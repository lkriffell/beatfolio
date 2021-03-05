class Beat < ApplicationRecord
  has_attached_file :audio, presence: true
  validates_attachment_content_type :audio, :content_type => [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ]

  validates :user_id, presence: true
  validates :name, presence: true

  belongs_to :user, dependent: :destroy
  has_many :beat_tags
end
