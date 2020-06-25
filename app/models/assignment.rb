class Assignment < ApplicationRecord
      TYPES = ["Question","Mark as Finished","Video"]
      VISIBILITY_TYPES = ["private", "public"]
      has_rich_text :description
      has_many :submissions, dependent: :destroy
      has_and_belongs_to_many :units
      has_many :users, :through => :units
      accepts_nested_attributes_for :units
      
      validates :duedate, presence: true
      validates :assignment_type, presence: true
      validates :units, presence: true
      
    def self.options 
        TYPES.map {|type| [type.capitalize, type]}
    end
    
    def self.visibility_options
      VISIBILITY_TYPES.map{|type| [type.capitalize, type]}
    end
end
