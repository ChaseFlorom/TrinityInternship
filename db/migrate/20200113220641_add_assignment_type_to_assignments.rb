class AddAssignmentTypeToAssignments < ActiveRecord::Migration[6.0]
  def change
        add_column :assignments, :assignment_type, :string, default: "question"
  end
end
