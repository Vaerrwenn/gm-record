class AttendancesController < ApplicationController
    def index
      @attendances = Attendance.all
    end
    
    def show
      @attendance = Attendance.find()
    end
    
    def new
      @attendance = Attendance.new
    end
    
    def create
      @attendance = Attendance.new(attendance_params)
      if @attendance.save
        flash[:success] = "Attendance successfully created"
        redirect_to @attendance
      else
        flash[:error] = "Something went wrong"
        render 'new'
      end
    end
    
    
    private

    def attendance_params
      params.require(:attendance).permit(:members)
    end
    
end
