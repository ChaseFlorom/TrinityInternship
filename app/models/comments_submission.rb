class CommentsSubmission < ApplicationRecord
  has_rich_text :commentText
  belongs_to :user
  belongs_to :submission
end
