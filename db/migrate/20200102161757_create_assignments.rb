class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.string :name
      t.text :description
      t.datetime :duedate
      #t.points :integer 
      t.timestamps
    end
  end
end
