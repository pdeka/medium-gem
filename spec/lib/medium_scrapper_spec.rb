require 'spec_helper'
require "parser/url_parser"


describe MediumScrapper do
  describe '#parse' do
    it 'retrieve values' do
      response = MediumScrapper.new().load_posts("prabindeka")

      puts JSON.parse(response).last

      expect(JSON.parse(response).last['title']).to eq "CRMs for small businesses in Australia"
      expect(JSON.parse(response).last['description']).to eq "It’s been some time since I had a look at what’s out there in the customer relationship management space. I was not surprised to find a…"
      expect(JSON.parse(response).last['link']).to eq "https://medium.com/@prabindeka/crms-for-small-businesses-in-australia-46546f27c33b"
      expect(JSON.parse(response).last['guid']).to eq "46546f27c33b"
      expect(JSON.parse(response).last['thumbnail']).to eq "https://cdn-images-1.medium.com/max/1024/0*HaxbQvwojFX327Wu.png"
      expect(JSON.parse(response).last['author']).to eq "Prabin Deka"
      expect(JSON.parse(response).last['tags']).to eq ""
      expect(JSON.parse(response).last['pubDate']).to eq "2018-06-12 15:19:57 +1000"
    end
  end
end
