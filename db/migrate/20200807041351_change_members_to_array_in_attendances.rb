class ChangeMembersToArrayInAttendances < ActiveRecord::Migration[6.0]
  def change
    remove_column :attendances, :member_id
    add_column :attendances, :member_id, :text, array: true
  end
end
