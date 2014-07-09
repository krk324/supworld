class VisitsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_city

  def create
    if current_user.visits.empty?
      @visit = @city.visits.new
      @visit.user = current_user
      @visit.count = 1
    else
      @visit = current_user.visits.first
      @visit.count = count_visit
    end

    @visit.save!

    redirect_to :back
  end

  private

  def set_city
    @city = City.find(params[:city_id])
  end

  def count_visit
    current_user.visits.first.count + 1
  end
end
