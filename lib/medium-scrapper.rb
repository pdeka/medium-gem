require "retriever/post_retriever"
require "parser/url_parser"


class MediumScrapper
  attr_reader :user

  def load_user(username)
    UserRetriever.new(UrlParser).load(username)
  end

  def load_posts(username)
    PostRetriever.new(UrlParser).load(username).to_json
  end
end
