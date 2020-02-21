require_relative '../lib/helper.rb'
require_relative '../lib/musics.rb'
require_relative '../lib/scraper.rb'
require 'colorize'
class Menu
  include InputHelper
  def main_menu
    puts 'Welcome to Archive music cli'.colorize(:blue)
    puts 'Please enter a number from 1 to 3 to make a choice'
    puts '- 1 Latest Musics'
    puts '- 2 Search for a music'
    puts '- 3 Quit the app'
  end

  def scraper
    @scraper = Scraper.new
  end

  def make_first_choice
    input = gets.chomp
    choice = input.to_i
    until valide_choice?(choice)
      puts 'Please enter a number from 1 to 3 to make a choice'.colorize(:red)
      input = gets.chomp
      choice = input.to_i
    end

    if choice == 1
      all_music_menu
    elsif choice == 2
      display_search_result
    else
      puts 'Goodbye glad you enjoyed achivmizik'.colorize(:yellow)
    end
  end

  def make_choice_after_all_music
    puts 'Type 12 to return to the main menu'.colorize(:blue)
    input = gets.chomp
    choice = input.to_i - 1
    until valide_choice_music?(choice)
      puts 'Ivalid choice please try again'.colorize(:red)
      input = gets.chomp
      choice = input.to_i - 1
    end

    if choice == 11
      puts 'Make a Choice'
      sub_menu
    else
      display_single(choice)
      sub_menu
    end
  end

  def display_single(choice)
    music = Music.single(choice)
    puts "Title:  #{music.title}"
    puts "Web link:  #{music.link}"
  end

  def sub_menu
    puts '- 1 Display latest musics'
    puts '- 2 Search for a music'
    puts '- 3 Quit the app'
    make_first_choice
  end

  def all_music_menu
    puts 'Here are the 10 latest musics'.colorize(:yellow)
    display_all
    make_choice_after_all_music
  end

  def display_all
    scraper.grab_music
    Music.all.each_with_index do |m, index|
      puts "#{index + 1} : #{m.title} "
    end
    puts 'Please enter the music number to view the music detail'
  end

  def display_search_result
    puts 'Enter a music to search'.colorize(:blue)
    param = gets.chomp
    puts 'Search result for: ' + param
    search_result(param)
    make_choice_after_all_music
  end

  def search_result(param)
    scraper.search(param)
    if Music.all.empty?
      puts 'No results found!'
      puts 'This website contain Only Haitian music and some african music'
    else
      musics = Music.all.first(10)
      musics.each_with_index do |m, index|
        puts "#{index + 1} : #{m.title} "
      end
      puts 'Please enter the music number to view the music detail'
    end
  end
end
