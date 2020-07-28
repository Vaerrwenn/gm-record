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
    # TODO
  end
  
  private

  def attendance_params
    params.require(:attendance).permit(:event_id, member_id: [])
  end
    
end
