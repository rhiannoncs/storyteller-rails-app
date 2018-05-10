class AddCompleteToStories < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :complete, :boolean
  end
end
