class Insta

  def self.images(latitude,longitude)
    Instagram.configure do |config|
      config.client_id     = ENV["CLIENT_ID"]
      config.client_secret = ENV["CLIENT_SECRET"]
    end

    client = Instagram.client(access_token: ENV['INSTA_TOKEN'])
    html = "<h2>Recent Insagram Photos</h2>"
    for media_item in client.media_search(latitude,longitude)
      html << "<img src='#{media_item.images.thumbnail.url}'>"
    end
    html
  end

  def self.popular_images
    Instagram.configure do |config|
      config.client_id     = ENV["CLIENT_ID"]
      config.client_secret = ENV["CLIENT_SECRET"]
    end
    client = Instagram.client(access_token: ENV['INSTA_TOKEN'])
    html = "<h1>Trending Photos</h1>"
    for media_item in client.media_popular
      html << "<img src='#{media_item.images.thumbnail.url}'>"
    end
    html
  end



end
