class User < ApplicationRecord
  mount_uploader :profileImage, ProfileImageUploader
  has_many :submissions
  has_and_belongs_to_many :units
  has_many :assignments, :through => :units

  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  
    def fullname
      if(firstname && lastname) 
        firstname + " " + lastname
      else
        "[Intern doesn't have a set first and last name]"
      end
    end
    def self.fullname
      if(firstname && lastname) 
        firstname + " " + lastname
      else
        "[Intern doesn't have a set first and last name]"
      end
    end
end
