class Assignment < ApplicationRecord
      has_rich_text :description
      has_many :submissions
      has_and_belongs_to_many :units
      has_many :users, :through => :units
      accepts_nested_attributes_for :units
      
      validates :duedate, presence: true
end
