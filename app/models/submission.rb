class Submission < ApplicationRecord
    has_rich_text :content
    has_many :comments_submissions
    belongs_to :user
    belongs_to :assignment
    validates :content, presence: true
end
