class User < ApplicationRecord
  has_many :submissions
  has_and_belongs_to_many :units
  has_many :assignments, :through => :units

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
