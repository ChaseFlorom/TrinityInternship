class AddNameToUnits < ActiveRecord::Migration[6.0]
  def change
    add_column :units, :name, :string
  end
end
