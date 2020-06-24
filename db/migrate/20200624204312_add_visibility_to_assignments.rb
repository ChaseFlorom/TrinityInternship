class AddVisibilityToAssignments < ActiveRecord::Migration[6.0]
  def change
    def change
      add_column :assignments, :visibility, :string, default: "private"
    end
  end
end
