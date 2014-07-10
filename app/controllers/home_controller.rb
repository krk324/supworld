class HomeController < ApplicationController
  def show
    @world_population = Population::world_population
    @popular_images = Insta.popular_images
  end
end
