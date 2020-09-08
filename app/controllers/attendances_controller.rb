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
    # puts attendance_params[:member_id]
    # @attendance = Attendance.new(attendance_params)
    
    # puts "Yeahh"
    
    # if @attendance.save!
    #   flash[:success] = "Successfully created"
    #   redirect_to new_attendance_path
    # else
    #   @error_msg = @attendance.errors.full_messages
    #   flash[:error] = @error_msg
    #   redirect_to new_attendance_path
    # end
    Attendance.bulk_insert(:event_id, :member_id, :created_at, :updated_at) do |worker|
      attendance_params[:member_id].each do |member|
        event = attendance_params[:event_id]
        worker.add [event, member]
      end
    end

    redirect_to new_attendance_path

  end

  private

  def attendance_params
    params.require(:attendance).permit(:event_id, member_id: [])
  end
    
end
