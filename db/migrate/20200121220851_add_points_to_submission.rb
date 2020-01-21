class AddPointsToSubmission < ActiveRecord::Migration[6.0]
  def change
    add_column :submissions, :points, :integer, default: 0
  end
end
