class Sample
  attr_accessor :title, :key, :download_count, :url, :creator, :bpm

  def initialize(title = nil, creator = nil, genre = nil)
    @title = title
    @creator = creator
    self.creator = creator if creator
    self.genre = genre if genre
  end
end
