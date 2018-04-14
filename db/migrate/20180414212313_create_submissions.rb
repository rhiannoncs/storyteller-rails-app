class CreateSubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :submissions do |t|
      t.text :content
      t.integer :story_id
      t.integer :user_id

      t.timestamps
    end
  end
end
