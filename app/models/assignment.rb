class Assignment < ApplicationRecord
      has_and_belongs_to_many :units
      has_many :users, :through => :units
end
