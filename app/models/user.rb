class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :memos, class_name: 'Memo' , dependent: :destroy

  has_many :users, through: :memos

  has_many :visits, class_name: 'Visit' , dependent: :destroy

  has_many :users, through: :visits




end
