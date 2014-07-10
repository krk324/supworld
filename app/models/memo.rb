class Memo < ActiveRecord::Base
  belongs_to :user
  belongs_to :city

  validates :memo, presence: true
end
