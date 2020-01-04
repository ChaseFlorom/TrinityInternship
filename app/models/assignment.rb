class Assignment < ApplicationRecord
      has_many :submissions
      has_and_belongs_to_many :units
      has_many :users, :through => :units
      accepts_nested_attributes_for :units
end
