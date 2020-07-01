class AttendancesController < ApplicationController
    def show
        @event = Event.find(params[:id])
        @attendees = Attendance.select("attendances.*, members.name").
                                joins("JOIN members ON attendances.member_id = members.id").
                                where("attendances.event_id = ?", @event.id)
    end
    
end
