require_relative '../lib/helper.rb'
require_relative '../lib/menu.rb'
class Main
  def menu
    @menu = Menu.new
  end

  def display_menu
    menu.main_menu
  end
end

v = Main.new
v.display_menu
