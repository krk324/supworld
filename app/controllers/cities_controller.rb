class CitiesController < ApplicationController
  before_action :create, only: [:index]
  #before_action :authenticate_user!, only: [:new, :create]

  def index
    @country_population = Population.country_population(params[:city])
  end

  def create
    @city = City.new(search_params)
    @city.save
  end

  def show
  end

  def search_params
    params.permit(:city)
  end

end
