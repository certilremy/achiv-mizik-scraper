require_relative '../lib/musics.rb'
require 'nokogiri'
require 'open-uri'
require 'pry'
class Scraper
  def grab_music
    Nokogiri::HTML(open('https://achivmizik.net/musics/')).css('.qt-vertical-padding-l').css('.row').each do |m|
      music = Music.new
      music.title = m.css('.qt-item-content-s').css('h4').text
    end
  end

  def display_all
    grab_music
    Music.all.each do |m|
      puts m.title
    end
  end
end

v = Scraper.new
v.display_all
