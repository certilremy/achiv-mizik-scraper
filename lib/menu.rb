require_relative '../lib/helper.rb'
require_relative '../lib/musics.rb'
require_relative '../lib/scraper.rb'
module Menu
  include InputHelper
  def main_menu
    puts 'Welcome to Archive music cli'
    puts 'Please enter a number from 1 to 3 to make a choice'
    puts '- 1 Display all musics'
    puts '- 2 Display music by category'
    puts '- 3 Quit the app'
    make_first_choice
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
      puts 'we will work on it'
    else
      quit
    end
  end

  def make_choice_after_all_music
    puts 'Please enter a number from 1 to 10 to view the music'
    input = gets.chomp
    choice = input.to_i
    until valide_choice(choice)
      puts 'Please enter a number from 1 to 10 to view the music'
      input = gets.chomp
      choice = input.to_i
    end

    Music.single_music(choice)
    sub_menu
  end

  def sub_menu
    puts 'Please enter a number from 1 to 3 to make a choice'
    puts '- 1 Display all musics'
    puts '- 2 Display music by category'
    puts '- 3 Quit the app'
    make_first_choice
  end



  def all_music_menu
    puts 'Here a the latest 10 music'
    puts 'Please enter a number from 1 to 10 to make a choice'
    Scraper.new.display_all
    make_choice_after_all_music
  end
end
