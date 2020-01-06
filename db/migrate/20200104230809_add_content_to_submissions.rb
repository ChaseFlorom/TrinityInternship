class AddContentToSubmissions < ActiveRecord::Migration[6.0]
  def change
        add_column :submissions, :content, :text

  end
end
