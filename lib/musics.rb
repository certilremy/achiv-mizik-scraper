class Music
  attr_accessor :title, :link, :category_name
  @@all = []

  def initialize(title = nil, link = nil, category_name = nil)
    @title = title
    @link = link
    @category_name = category_name
    @@all << self
  end

  def self.all
    @@all
  end
end
