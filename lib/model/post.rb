class Post
  attr_reader :title, :subtitle, :content, :url, :guid, :thumbnail, :author

  def initialize(title, subtitle, content, url, guid, thumbnail, author)
    @title = title
    @subtitle = subtitle
    @content = content
    @url = url
    @guid = guid
    @thumbnail = thumbnail
    @author = author
  end
end
