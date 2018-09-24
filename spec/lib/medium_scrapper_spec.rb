require 'spec_helper'
require "parser/url_parser"


describe MediumScrapper do
  describe '#parse' do
    it 'retrieve values' do
      response = MediumScrapper.new().load_posts("prabindeka")
      expect(response.last.title).to eq "CRMs for small businesses in Australia"
    end
  end
end
