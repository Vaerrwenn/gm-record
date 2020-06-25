class CreateCetyas < ActiveRecord::Migration[6.0]
  def change
    create_table :cetyas do |t|
      t.string :cetya_name

      t.timestamps
    end
  end
end
