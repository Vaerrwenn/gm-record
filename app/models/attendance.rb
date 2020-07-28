class Attendance < ApplicationRecord
  belongs_to :event
  belongs_to :member

  def save_attendance(attendance)
    member_array = attendance.member_id
    member_array.each do |ma|
      # TODO: Insert statement?
    end
  end
end
