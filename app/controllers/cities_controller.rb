class CitiesController < ApplicationController
  before_action :create, only: [:index]
  #before_action :authenticate_user!, only: [:new, :create]

  def index
    redirect_to city_path(City.where(city: params[:city])[0].id)
  end

  def create
    @city = City.new(search_params)
    @city.save
  end

  def show
    city_name = City.find(params[:id]).city
    @country_population = Population.country_population(city_name)
  end

  def search_params
    params.permit(:city)
  end

end
