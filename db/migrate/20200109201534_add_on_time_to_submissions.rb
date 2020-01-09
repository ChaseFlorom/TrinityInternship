class AddOnTimeToSubmissions < ActiveRecord::Migration[6.0]
  def change
    add_column :submissions, :ontime, :boolean
  end
end
