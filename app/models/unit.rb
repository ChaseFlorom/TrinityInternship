class Unit < ApplicationRecord
    has_rich_text :description
    has_and_belongs_to_many :users
    has_and_belongs_to_many :assignments
    accepts_nested_attributes_for :assignments
    
    validates :name, presence: true
    validates :description, presence: true
end
