class Sample
  attr_accessor :title, :key, :download_count, :url, :creator, :bpm

  def initialize(title, key, download_count, url, creator, bpm)
    @title = title
    @key = key
    @download_count = download_count
    @url = url
    @creator = creator
    @bpm = bpm
  end
end
