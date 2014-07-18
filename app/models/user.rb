class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :theme_reflections
  has_many :sharings
  has_many :point_of_efforts
end
