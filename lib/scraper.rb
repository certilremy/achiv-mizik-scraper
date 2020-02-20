require_relative '../lib/musics.rb'
require 'nokogiri'
require 'open-uri'
require 'pry'
class Scraper

  def grab_music
    Music.reset
    Nokogiri::HTML(open('https://achivmizik.net/musics/')).css('.qt-vertical-padding-l').each do |m|
      m.css('.qt-item-content-s').css('h4').each do |i|
        title = i.text.lstrip.chop
        link = 'https://achivmizik.net' + i.css('a').attribute('href').value.chomp
        Music.new(title, link)
      end
    end
  end

  def search(param)
    Music.reset
    data = Nokogiri::HTML(open('https://achivmizik.net/search?utf8=%E2%9C%93&q=' + param.to_s)).css('.qt-chart-tracklist')
    if data.text.lstrip.chop.match('No results found!')
      puts 'No results found!'

    else
      data.each do |r|
        r.css('li').each do |i|
          title = i.css('h3').text.lstrip.chop
          link = 'https://achivmizik.net' + i.css('.qt-action').css('a').attribute('href').value.chomp
          Music.new(title, link)
        end
      end
    end
  end

  def display_all
    grab_music
    Music.all.each_with_index do |m, index|
      puts "#{index + 1} : #{m.title} "
    end
    puts 'Please enter the music number to view the music detail'
  end

  def search_result(param)
    search(param)
    if Music.all.empty?
      puts 'This website contain Only Haitian music and some african music'
    else
      Music.all.each_with_index do |m, index|
        puts "#{index + 1} : #{m.title} "
      end
      puts 'Please enter the music number to view the music detail'
    end
  end
end
