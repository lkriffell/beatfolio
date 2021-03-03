class Sample
  attr_accessor :title, :key, :download_count, :url, :creator, :bpm
  @@all = []

  def self.all
    @@all
  end

  def initialize(title = nil, creator = nil, genre = nil)
    @title = title
    self.creator = creator if creator
    self.genre = genre if genre
  end
end
