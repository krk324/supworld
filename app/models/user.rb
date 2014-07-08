class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments, class_name: 'Comment' , dependent: :destroy

  has_many :users, through: :comments

  has_many :visits, class_name: 'Visit' , dependent: :destroy

  has_many :users, through: :visits




end
