class MembersController < ApplicationController
    def index
        @members = Member.all.order(name: :asc)

        @members.each do |m|
            m.age = age_counter(m.date_of_birth)
        end
    end

    def age_counter(dob)
        now = Time.now.utc.to_date
        now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
    end

    def new
        @member = Member.new
    end

    def create
        @member = Member.new(member_params)
        @member.age = age_counter(@member.date_of_birth)
        
        if @member.save
          redirect_to members_path
        else
          render 'new'
        end
    end

    def show
        @member = Member.find(params[:id])
    end
    
    
    private

    def member_params
        params.require(:member).permit(:name, :phone, :address, :cetya,
                                        :gender, :education, :date_of_birth,
                                        :place_of_birth)
    end
    
    # Add age in show. 
end
