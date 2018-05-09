class AddCompleteToStories < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :complete, :boolean, default: false
  end
end
