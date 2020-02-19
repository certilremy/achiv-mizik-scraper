require 'nokogiri'
require 'open-uri'
require 'pry'
class Scraper
  def all_music
    Nokogiri::HTML(open('https://achivmizik.net/musics/')).css('.qt-vertical-padding-l').css('.row').each do |m|
      title = m.css('.qt-item-content-s').css('h4').text
      puts title
    end
  end
end

v = Scraper.new
v.all_music
