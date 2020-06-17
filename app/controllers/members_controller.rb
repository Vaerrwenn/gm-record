class MembersController < ApplicationController
    def index
        @members = Member.all
    end
    
    # Add age in show. 
end
