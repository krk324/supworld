class HomeController < ApplicationController
  def show
    @world_population = Population::world_population
  end
end
