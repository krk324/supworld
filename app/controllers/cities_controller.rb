class CitiesController < ApplicationController
  before_action :create, only: [:index]
  #before_action :authenticate_user!, only: [:new, :create]

  def index
    redirect_to city_path(City.where(city: @city.city)[0])
  end

  def create
    @city = City.new(search_params)
    @city.save #unless @city.city == City.where(city: @city.city)[0]
  end

  def show
    city_name = City.find(params[:id]).city
    @country_population = Population.country_population(city_name)
  end

  def search_params
    params.permit(:city)
  end

end
