class RenameOpenToOpenMembershipToTeams < ActiveRecord::Migration[5.2]
  def change
  	rename_column :teams, :open, :open_membership
  end
end
