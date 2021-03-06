class City < ActiveRecord::Base
  geocoded_by :city do |obj,results|
    if geo = results.first
      obj.longitude = geo.longitude
      obj.latitude = geo.latitude
      obj.city = geo.city || geo.state || geo.country
      obj.country_code = geo.country_code
      obj.country = geo.country
    end
  end
  before_validation :geocode
  #reverse_geocoded_by :latitude, :longitude => :address

  validates :city, presence: true, uniqueness: true #,format: { with: /\A^([a-zA-Z]+\s)*[a-zA-Z]+$\z/, message: "only allows letters" }

  has_many :memos, class_name: 'Memo' , dependent: :destroy

  has_many :users, through: :memos

  has_many :visits, class_name: 'Visit' , dependent: :destroy

  has_many :users, through: :visits

  has_many :tweets, class_name: 'Tweet' , dependent: :destroy

  has_many :images, class_name: 'Image' , dependent: :destroy

end
