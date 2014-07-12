class VisitsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_city

  def create
    if current_user.visits.where(city_id: @city.id).empty?
      @visit = @city.visits.new
      @visit.user = current_user
      @visit.count = 1
    else
      @visit = current_user.visits.where(city_id: @city.id)[0]
      @visit.count = count_visit
    end

    @visit.save!

    redirect_to :back
  end

  def destroy
    @visit = Visit.find(params[:id])
    @visit.count = @visit.count - 1
    @visit.save!

    redirect_to @city, notice: "You've uncounted your visit."
  end

  private

  def set_city
    @city = City.find(params[:city_id])
  end

  def count_visit
    current_user.visits.where(city_id: @city.id)[0].count + 1
  end
end
