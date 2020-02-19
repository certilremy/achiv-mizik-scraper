require_relative '../lib/helper.rb'
module Menu
  include InputHelper
  def main_menu
    puts 'Welcome to Archive music cli'
    puts 'Please enter a number from 1 to 3 to make a choice'
    puts '-1 Display all musics'
    puts '-2 Display music by category'
    puts '-3 Quit the app'
    make_choice
  end

  def make_choice
    input = gets.chomp
    choice = input.to_i
    until valide_choice(choice)
      puts 'Please enter a number from 1 to 3 to make a choice'
      input = gets.chomp
      choice = input.to_i
    end
  end
end
