class Insta

  def self.images(latitude,longitude)
    client = Instagram.client(access_token: ENV['INSTA_TOKEN'])
    html = ""
    for media_item in client.media_search(latitude,longitude)
      html << "<img src='#{media_item.images.thumbnail.url}'>"
    end
    html
  end

  def self.popular_images
    client = Instagram.client(access_token: ENV['INSTA_TOKEN'])
    html = ""
    for media_item in client.media_popular
      html << "<img src='#{media_item.images.thumbnail.url}'>"
    end
    html
  end



end
