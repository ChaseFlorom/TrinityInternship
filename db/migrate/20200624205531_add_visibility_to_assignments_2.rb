class AddVisibilityToAssignments2 < ActiveRecord::Migration[6.0]
  def change
      add_column :assignments, :visibility, :string, default: "private"
  end
end
