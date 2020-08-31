class Attendance < ApplicationRecord
  belongs_to :event
  belongs_to :member

  validates :member, uniqueness: true

  # accepts_nested_attributes_for :member, reject_if: ->(attributes){ attributes['id'].blank? }, allow_destroy: true
  
  
  # def save_attendance(attendance)
  #   attendance_event = attenance[:event_id]
  #   attendance_members = attendance[:member_id]

  #   attendance_members.each do |am|
      
  #   end
  # end
end
