class City < ActiveRecord::Base
  geocoded_by :city
  after_validation :geocode, :if => :city_changed?
  reverse_geocoded_by :latitude, :longitude, :address => :city

  validates :city, presence: true,uniqueness: true #, with: /^[a-zA-Z]+$/

  has_many :comments, class_name: 'Comment' , dependent: :destroy

  has_many :users, through: :comments

  has_many :visits, class_name: 'Visit' , dependent: :destroy

  has_many :users, through: :visits
end
