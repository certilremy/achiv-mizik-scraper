class Music
  attr_accessor :title, :link, :artist_name
  @all = []

  def initialize
    @all << self
  end

  def self.all
    all
  end
end
