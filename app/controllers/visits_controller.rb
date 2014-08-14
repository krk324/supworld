class VisitsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_city

  def create
    @visit = Visit.count_visit(current_user,@city)
    @visit.save!

    redirect_to :back
  end

  def destroy
    @visit = Visit.find(params[:id])
    @visit.count = @visit.count - 1 if @visit.count > 0
    @visit.save!

    redirect_to @city, notice: "You've uncounted your visit."
  end

  private

  def set_city
    @city = City.find(params[:city_id])
  end

end
