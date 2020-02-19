require_relative './menu.rb'
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

  def self.single_music(index)
    puts 'To go to the web page please CTRL + click on the music link'
    single = all[index]
    puts 'Title: ' + single.title
    puts 'Web link: ' + single.link
    puts ' '
  end
end
