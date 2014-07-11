class HomeController < ApplicationController
  def show
    @popular_images = Insta.popular_images
  end
end
