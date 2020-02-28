class Music
  attr_reader :title, :link
  @@all = []

  def initialize(title = nil, link = nil)
    @title = title
    @link = link
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset
    @@all.clear
  end

  def self.single(index)
    @single = all[index]
  end
end
