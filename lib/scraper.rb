require_relative '../lib/musics.rb'
require 'nokogiri'
require 'open-uri'
require 'pry'
class Scraper
  def grab_music
    # binding.pry
    Music.reset
    Nokogiri::HTML(open('https://achivmizik.net/musics/')).css('.qt-vertical-padding-l').each do |m|
      m.css('.qt-item-content-s').css('h4').each do |i|
        title = i.text.lstrip.chop
        link = 'https://achivmizik.net' + i.css('a').attribute('href').value.chomp
        Music.new(title, link)
      end
    end
  end

  def display_all
    grab_music
    Music.all.each_with_index do |m, index|
      puts "#{index + 1} : #{m.title} "
    end
  end


end

# v = Scraper.new
# v.grab_music
