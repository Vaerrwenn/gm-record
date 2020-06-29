class EventsController < ApplicationController
    def index
        @events = Event.all
    end
    
    def new
        @event = Event.new
    end
    
    def create
        @event = Event.new(event_params)
        if @event.save
          flash[:success] = "Event successfully created"
          redirect_to events_path
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    def show
        @event = Event.find(params[:id])
    end
    
    def edit
        @event = Event.find(params[:id])
    end
    
    def update
        @event = Event.find(params[:id])
        if @event.update_attributes(event_params)
          flash[:success] = "Event was successfully updated"
          redirect_to events_path
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end

    def destroy
        @event = Event.find(params[:id])
        if @event.destroy
            flash[:success] = 'Event was successfully deleted.'
            redirect_to events_url
        else
            flash[:error] = 'Something went wrong'
            redirect_to events_url
        end
    end
    
    
    
    private

    def event_params
        params.require(:event).permit(:name, :start_date, :location, :attendee_number)
    end
end
