require_relative '../lib/helper.rb'
require_relative '../lib/musics.rb'
require_relative '../lib/scraper.rb'
class Menu
  include InputHelper
  def main_menu
    puts 'Welcome to Archive music cli'
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
    until valide_choice(choice)
      puts 'Please enter a number from 1 to 3 to make a choice'
      input = gets.chomp
      choice = input.to_i
    end

    if choice == 1
      all_music_menu
    elsif choice == 2
      display_search_result
    else
      puts 'Goodbye glad you enjoyed achivmizik'
    end
  end

  def make_choice_after_all_music
    puts 'Type 20 to return to the main menu'
    input = gets.chomp
    choice = input.to_i
    until valide_choice(choice)
      input = gets.chomp
      choice = input.to_i
    end

    if choice == 20
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
    puts 'Here a the latest 10 music'
    scraper.display_all
    make_choice_after_all_music
  end

  def display_search_result
    puts 'Enter a music to search'
    param = gets.chomp
    puts 'Search result for: ' + param
    scraper.search_result(param)
    make_choice_after_all_music
  end
end
