class AddAttendeeNumberToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :attendee_number, :integer
  end
end
