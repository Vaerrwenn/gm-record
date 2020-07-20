class AttendancesController < ApplicationController
    def create
      @event = Event.find(params[:event_id])
      @attendance = @event.attendances.create(attendance_params)
      if @attendance.save
        flash[:success] = "Data Berhasil dibuat"
        redirect_to @event
      else
        flash[:error] = "Terjadi masalah saat membuat data"
        redirect_to @event
      end
    end
    
    private

    def attendance_params
      params.require(:attendance).permit(member_ids: [])
    end
    
end
