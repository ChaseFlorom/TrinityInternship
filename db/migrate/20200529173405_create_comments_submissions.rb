class CreateCommentsSubmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :comments_submissions do |t|
      t.text :commentText
      t.integer :user_id
      t.integer :submission_id
      t.timestamps
    end
  end
end
