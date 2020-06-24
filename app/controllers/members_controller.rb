class MembersController < ApplicationController
    def index
        @members = Member.all.order(name: :asc)

        @members.each do |m|
            m.age = change_date_null(m.date_of_birth)
        end
    end

    def new
        @member = Member.new
    end

    def create
        @member = Member.new(member_params)
        
        if @member.date_of_birth.blank?
            @member.age = "-"
        else
            @member.age = age_counter(@member.date_of_birth)
        end

        if @member.save
          redirect_to members_path
        else
          render 'new'
        end
    end

    def show
        @member = Member.find(params[:id])
        @member.age = change_date_null(@member.date_of_birth)
        @member.place_of_birth = change_null_to_hyphen(@member.place_of_birth)
        @member.phone = change_null_to_hyphen(@member.phone)
        @member.address = change_null_to_hyphen(@member.address)
        @member.line_id = change_null_to_hyphen(@member.line_id)
    end

    def edit
        @member = Member.find(params[:id])
    end
    
    def update
        @member = Member.find(params[:id])
        @member.age = age_counter(@member.date_of_birth)
        if @member.update_attributes(member_params)
          redirect_to @member
        else
          render 'edit'
        end
    end
    
    def destroy
        
        @member = Member.find(params[:id])
        if @member.destroy
            redirect_to members_path
        else
            redirect_to members_url
        end
    end
    

    private

    def member_params
        params.require(:member).permit(:name, :phone, :address, :cetya,
                                        :gender, :education, :date_of_birth,
                                        :place_of_birth, :line_id)
    end

    def age_counter(dob)
        now = Time.now.utc.to_date
        now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
    end

    def change_null_to_hyphen(param)
        if param.blank? 
            param = "-"
        else
            param = param
        end
    end

    def change_date_null(dob)
        if dob.blank?
            age = "-"
        else
            age = age_counter(dob)
        end
    end
end
