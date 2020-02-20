require_relative '../lib/helper.rb'
describe 'InputHelper' do
  include InputHelper

  describe '#Validate_choice' do
    let(:input_1) { ' ' }
    let(:input_2) { '' }
    let(:input_3) { 2 }
    let(:input_4) { 4 }
    it 'Refuse the input because it is not valid' do
      expect(valide_choice(input_1)).to be false
    end
    it 'Refuse the input because it is not valid' do
      expect(valide_choice(input_2)).to be_falsey
    end

    it 'Acept the input because it is between the range' do
      expect(valide_choice(input_3)).to be_truthy
    end
    it 'Refuse the input because it is notin the range' do
      expect(valide_choice(input_4)).to be_falsey
    end
  end

  describe '#Validate_choice_music' do
    let(:input_1) { ' ' }
    let(:input_2) { '' }
    let(:input_3) { 2 }
    let(:input_4) { 22 }
    it 'Refuse the input because it is not valid' do
      expect(valide_choice_music(input_1)).to be false
    end
    it 'Refuse the input because it is not valid' do
      expect(valide_choice_music(input_2)).to be_falsey
    end

    it 'Acept the input because it is between the range' do
      expect(valide_choice_music(input_3)).to be_truthy
    end
    it 'Refuse the input because it is notin the range' do
      expect(valide_choice_music(input_4)).to be_falsey
    end
  end
end
