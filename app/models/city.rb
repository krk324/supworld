class City < ActiveRecord::Base
  validates :city, presence: true,uniqueness: true #, with: /^[a-zA-Z]+$/

  has_many :comments, class_name: 'Comment' , dependent: :destroy

  has_many :users, through: :comments

  has_many :visits, class_name: 'Visit' , dependent: :destroy

  has_many :users, through: :visits
end
