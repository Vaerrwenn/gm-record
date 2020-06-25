class AddCetyaRefToMembers < ActiveRecord::Migration[6.0]
  def change
    remove_column :members, :cetya
    add_reference :members, :cetya, foreign_key: true
  end
end
