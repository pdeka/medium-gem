require 'model/post'

class PostRetriever
  def initialize(parser)
    @parser = parser
  end

  def load(user_id, post_id)
    parsed_url = parse_url(user_id, post_id)

    Post.new(
      parsed_url['title'],
      parsed_url['content']['subtitle'],
      normalize_content(parsed_url['content']['bodyModel']['paragraphs']),
      parsed_url['canonicalUrl']
    )
  end

  def load(user_id)
    posts = parse_posts(user_id)

    returnPosts = []
    posts.each do |post|

      returnPosts.push Post.new(
        post[1]['title'],
        post[1]['content']['subtitle'],
        "",
        post[1]['uniqueSlug'],
        post[1]['id'],
        'thumbnail',
        'Prabin Deka'
      )
    end

    returnPosts

  end

  def normalize_content(paragraphs_raw)
    body = ''
    paragraphs_raw[1..-1].each do |paragraph|
      body << paragraph['text'] + '\n\n'
    end
    body
  end

  def parse_url(user_id, post_id)
    @parser.new("https://www.medium.com/@#{user_id}/#{post_id}?format=json").parse['value']
  end

  def parse_posts(user_id)
    thisUrl = "https://www.medium.com/@#{user_id}/latest?format=json&limit=1000"
    @parser.new(thisUrl).parse['references']['Post']
  end
end
