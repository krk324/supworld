require "flickraw"

class Flickr

  class FlickrImage
    attr_accessor :id, :title, :description, :link_url, :thumbnail_url, :original_url

    def initialize(id:nil, title:nil, description:nil, link_url:nil, thumbnail_url:nil, original_url:nil)
      @id = id
      @title = title
      @description = description
      @link_url = link_url
      @thumbnail_url = thumbnail_url
      @original_url = original_url
    end

  end

  def self.get_flickr_images(text)
    thumbnail_size = "m"
    original_size = "z"

    images = flickr.photos.search(text: text, sort: "relevance", per_page: 20)

    flickr_images = []
    images.each do |image|
      flickr_images << FlickrImage.new(
        id: image["id"],
        title: image["title"],
        description: "",
        link_url: "http://www.flickr.com/photos/#{image["owner"]}/#{image["id"]}",
        thumbnail_url: "http://farm#{image["farm"]}.static.flickr.com/#{image["server"]}/#{image["id"]}_#{image["secret"]}_#{thumbnail_size}.jpg",
        original_url: "http://farm#{image["farm"]}.static.flickr.com/#{image["server"]}/#{image["id"]}_#{image["secret"]}_#{original_size}.jpg"
      )
    end

    flickr_images
  end

  def self.get_random_city_images(city_name)
    tag_name = city_name + ' city view'
    image = Flickr.get_flickr_images(tag_name).sample
    image.original_url
  end

end
