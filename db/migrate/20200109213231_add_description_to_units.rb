class AddDescriptionToUnits < ActiveRecord::Migration[6.0]
  def change
    add_column :units, :description, :text
  end
end
