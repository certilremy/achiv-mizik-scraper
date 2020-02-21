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

  def self.single_music(index)
    puts ' '
    single = all[index]
    puts 'Title: ' + single.title
    puts 'Web link: ' + single.link
    puts ' '
    puts 'To go to the web page please CTRL + click on the music link'
  end
end
