class RemoveMembersFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :member_id
  end
end
