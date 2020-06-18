class MembersController < ApplicationController
    def index
        @members = Member.all
    end
    
    def new
        @member = Member.new
    end

    def create
        @member = Member.new(member_params)
        if @member.save
          flash[:success] = "Member successfully created"
          redirect_to @member
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    
    private

    def member_params
        params.require(:member).permit(:name, :phone, :address, :cetya,
                                        :gender, :education, :date_of_birth,
                                        :place_of_birth)
    end
    
    # Add age in show. 
end
