class AttendancesController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to new_attendance_path
  end
  
  def show
    redirect_to new_attendance_path
  end
  
  def new
    @attendance = Attendance.new
  end
  
  def create
    @attendance = Attendance.create(attendance_params)
    # puts @attendance[:event_id]
    # puts @attendance[:member_id]
    # puts "Yeahh"
    
    if @attendance.save
      flash[:success] = "Successfully created"
      redirect_to new_attendance_path
    else
      @error_msg = @attendance.errors.full_messages
      flash[:error] = @error_msg
      redirect_to new_attendance_path
    end
  end
  
  private

  def attendance_params
    params.require(:attendance).permit(:event_id, :member_id)
  end
    
end
