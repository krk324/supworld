class CitiesController < ApplicationController
  before_action :create, only: [:index]
  #before_action :authenticate_user!, only: [:new, :create]

  def index
    @country_population = Population.country_population(params[:search])
    #binding.pry
  end

  def create
    city_name = Geocoder.search(params[:search])[0].data['address_components'][0]["long_name"]
    @city = City.new(city: city_name)

    unless City.where(city: city_name).present?
      @city.save
    end

    redirect_to city_path(City.where(city: city_name))
  end

  def show
  end

end
