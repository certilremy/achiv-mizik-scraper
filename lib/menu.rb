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
    make_first_choice
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
      Music.single_music(choice)
      sub_menu
    end
  end

  def sub_menu
    puts '- 1 Display latest musics'
    puts '- 2 Search for a music'
    puts '- 3 Quit the app'
    make_first_choice
  end

  def all_music_menu
    puts 'Here are the 10 latest musics'.colorize(:yellow)
    scraper.display_all
    make_choice_after_all_music
  end

  def display_search_result
    puts 'Enter a music to search'.colorize(:blue)
    param = gets.chomp
    puts 'Search result for: ' + param
    scraper.search_result(param)
    make_choice_after_all_music
  end
end
