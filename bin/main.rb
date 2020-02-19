require_relative '../lib/helper.rb'
require_relative '../lib/menu_helper.rb'
class Main
  include Menu
  def display_menu
    main_menu
  end
end

v = Main.new
v.display_menu
