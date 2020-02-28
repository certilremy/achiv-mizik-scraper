require_relative '../lib/musics.rb'

describe 'Music' do
  describe '#Initializer' do
    let(:music) { Music.new }
    it 'Create a  new music with empty title' do
      expect(music.title).to eq(nil)
    end
    it 'Create a  new music with empty link' do
      expect(music.link).to eq(nil)
    end

    it 'Assingn  a  new title for the music' do
      expect(Music.new('fantom').title).to eq('fantom')
    end
    it 'Assingn  a  new link for the music' do
      expect(Music.new('fantom', 'https://achvimizik.net').link).to eq('https://achvimizik.net')
    end
  end

  context 'class methods' do
    describe '.all ' do
      it 'returns an array of all the instances of the Music class' do
        Music.reset
        music_one = Music.new
        music_two = Music.new
        music_three = Music.new
        expect(Music.all).to match_array([music_one, music_two, music_three])
      end
    end
  end

  context 'class methods' do
    describe '.Single-Music ' do
      it 'returns a single instances of the Music class' do
        Music.reset
        Music.new('fantom', 'link')
        expect(Music.all[0].title).to eq('fantom')
      end
    end
  end
end
