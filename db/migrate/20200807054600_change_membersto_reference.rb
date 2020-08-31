class ChangeMemberstoReference < ActiveRecord::Migration[6.0]
  def change
    remove_column :attendances, :member_id
    add_reference :attendances, :member, foreign_key: true
  end
end
