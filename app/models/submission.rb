class Submission < ApplicationRecord
    has_rich_text :content
    has_many :comments_submissions, dependent: :destroy
    belongs_to :user
    belongs_to :assignment
    validates :content, presence: true
end
