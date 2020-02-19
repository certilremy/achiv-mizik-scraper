class Music
  attr_accessor :title, :link, :artist_name
  @@all = []

  def initialize(title = nil, link = nil)
    @title = title
    @link = link
    @@all << self
  end

  def self.all
    @@all
  end
end
