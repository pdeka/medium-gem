require "retriever/post_retriever"
require "parser/url_parser"
require 'active_support/all'

class MediumScrapper
  attr_reader :user

  def load_user(username)
    UserRetriever.new(UrlParser).load(username)
  end

  def load_posts(username)
    posts = PostRetriever.new(UrlParser).load(username)
    puts posts.to_json
    posts.to_json
  end
end
