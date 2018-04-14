class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.string :title
      t.string :genre
      t.text :description
      t.boolean :public, default: true
      t.integer :team_id

      t.timestamps
    end
  end
end
