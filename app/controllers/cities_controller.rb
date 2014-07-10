class CitiesController < ApplicationController

  def create
    @city = City.new(search_params)
    @city.save
    redirect_to city_path(City.where(city: @city.city)[0])
  end

  def show
    # show_html only can get info with in this method.
    @city = City.find(params[:id])
    @country_population = Population.country_population(@city.city)
    @time_zone = Population.time_zone(@city.latitude,@city.longitude)
    #@trending_topics = Twit.trending_topics(@city.latitude,@city.longitude)
    @images = Insta.images(@city.latitude,@city.longitude)
  end

  def search_params
    params.permit(:city)
  end

end
