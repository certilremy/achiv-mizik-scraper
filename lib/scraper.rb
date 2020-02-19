require 'nokogiri'
require 'open-uri'
class Scraper
  def all_music
    # looking for music
    data = Nokogiri::HTML(open('https://achivmizik.net/musics/'))
    puts data
  end
end

v = Scraper.new
puts v.all_music