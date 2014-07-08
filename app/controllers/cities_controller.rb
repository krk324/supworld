class CitiesController < ApplicationController
  before_action :create, only: [:index]
  #before_action :authenticate_user!, only: [:new, :create]

  def index
    @country_population = Population.country_population(params[:search])
    #binding.pry
  end

  def create
  end
end
