require 'spec_helper'
require "parser/url_parser"


describe PostRetriever do
  describe '#parse' do
    it 'retrieve values' do
      response = PostRetriever.new(UrlParser).load("prabindeka")
      expect(response.last.title).to eq "CRMs for small businesses in Australia"
    end
  end
end
