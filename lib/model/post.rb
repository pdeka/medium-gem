class Post
  attr_reader :title, :description, :content, :link, :guid, :thumbnail, :author, :tags, :pubDate

  CDN_URL = 'https://cdn-images-1.medium.com/max/1024'

  def initialize(title, description, content, unique_slug, guid, image_name, author, user_name, tags, pubDate)
    @title = title
    @description = description
    @content = content
    @link = "https://medium.com/@#{user_name}/#{unique_slug}"
    @guid = guid
    @thumbnail = "#{CDN_URL}/#{image_name}"
    @author = author
    @tags = ""
    @pubDate = Time.at(pubDate/1000)
  end


    def as_json(options={})
        {
            title: @title,
            description: @description,
            content: @content,
            link: @link,
            guid: @guid,
            thumbnail: @thumbnail,
            author: @author,
            tags: @tags,
            pubDate: @pubDate
        }
    end

    def to_json(*options)
        as_json(*options).to_json(*options)
    end

end
