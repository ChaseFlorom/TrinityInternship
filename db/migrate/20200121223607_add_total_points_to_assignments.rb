class AddTotalPointsToAssignments < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :totalpoints, :integer, default: 0
  end
end
