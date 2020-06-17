class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :cetya
      t.string :gender
      t.string :education
      t.date :date_of_birth
      t.string :place_of_birth

      # add photo
      t.timestamps
    end
  end
end
