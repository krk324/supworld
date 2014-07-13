class Image < ActiveRecord::Base
  belongs_to :city

  validates :image, presence: true
end
