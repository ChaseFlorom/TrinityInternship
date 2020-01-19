class AddLinkToAssignment < ActiveRecord::Migration[6.0]
  def change
        add_column :assignments, :link, :string
  end
end
