class ChangeCompleteDefaultValueToStories < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :stories, :complete, false
  end
end
