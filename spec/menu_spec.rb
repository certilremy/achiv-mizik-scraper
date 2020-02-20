require_relative '../lib/menu.rb'
describe 'Menu' do
  describe '#main_menu' do
    let(:menu) { Menu.new }
    let(:output) { capture_output { menu.main_menu } }
    it 'print the menu for the user and Acept a choice from user' do
      puts 'Type 3 to continue the test'
      expect(output).to include('Welcome to Archive music cli')
      expect(output).to include('Please enter a number from 1 to 3 to make a choice')
      expect(output).to include('- 1 Latest Musics')
      expect(output).to include('- 2 Search for a music')
      expect(output).to include('- 3 Quit the app')
    end
  end

  describe '#sub_menu' do
    let(:menu) { Menu.new }
    let(:output) { capture_output { menu.main_menu } }
    it 'print the menu for the user and Acept a choice from user' do
      puts 'Type 3 to continue the test again'
      expect(output).to include('- 1 Latest Musics')
      expect(output).to include('- 2 Search for a music')
      expect(output).to include('- 3 Quit the app')
    end
  end
end
