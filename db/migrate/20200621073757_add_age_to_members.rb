class AddAgeToMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :age, :string
  end
end
