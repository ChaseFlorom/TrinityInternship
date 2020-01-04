class CreateSubmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :submissions do |t|
      t.integer :user_id
      t.integer :assignment_id
      t.timestamps
    end
  end
end
