class Visit < ActiveRecord::Base
  belongs_to :user
  belongs_to :city

  def self.count_visit(current_user,city)
    if current_user.visits.where(city_id: city.id).empty?
      @visit = city.visits.new
      @visit.user = current_user
      @visit.count = 1
    else
      @visit = current_user.visits.where(city_id: city.id)[0]
      @visit.count = current_user.visits.where(city_id: city.id)[0].count + 1
    end
      @visit
  end

end
