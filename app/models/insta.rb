class Insta

  Insta.new.configure

  def configure
    Instagram.configure do |config|
      config.client_id = ENV["CLIENT_ID"]
      config.client_secret = ENV["CLIENT_SECRET"]
    end
  end

  def self.images(latitude,longitude)
    html = "<h2>Recent Insagram Photo</h2>"
    for media_item in Instagram.client.media_search(latitude,longitude)
      html << "<img src='#{media_item.images.thumbnail.url}'>"
    end
    html
  end

  def self.popular_images
    html = "<h1>Trending Photos</h1>"
    for media_item in Instagram.client.media_popular
      html << "<img src='#{media_item.images.thumbnail.url}'>"
    end
    html
  end

end
