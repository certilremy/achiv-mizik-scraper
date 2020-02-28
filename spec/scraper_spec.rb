require_relative '../lib/scraper.rb'

describe 'Scraper' do
  let(:scraper) { Scraper.new }

  describe '#grab_music' do
    it 'uses Nokogiri to get the HTML from a web page' do
      expect { scraper.grab_music }.to_not raise_error
    end
    it 'uses Nokogiri data and create 10 musics with them' do
      expect(Music.all.size).to eq(10)
    end
  end

  describe '#Search_music' do
    Music.reset
    it 'uses Nokogiri to get the HTML from a web page' do
      expect { scraper.search('fantom') }.to_not raise_error
    end
    it 'uses Nokogiri data to dispaly no result for an unfound music' do
      expect(scraper.search('certil')).to eq(nil)
    end
    Music.reset
    it 'uses Nokogiri data and create musics with the search result' do
      scraper.search('fantom')
      expect(Music.all.size).to eq(13)
    end
  end
end
