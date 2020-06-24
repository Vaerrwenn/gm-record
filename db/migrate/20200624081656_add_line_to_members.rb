class AddLineToMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :line_id, :string
  end
end
