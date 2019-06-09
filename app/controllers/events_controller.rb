class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    
    @event = current_user.events_created.build(event_params)
    if @event.save
      redirect_to current_user
    else
      flash.now[:danger] = "Give your event a name!"
      render 'new'
    end
  end
  
  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
  end

  def index
    @past_events = Event.past
    @upcoming_events = Event.upcoming
    @events = Event.all
  end

  private
    def event_params
      params.require(:event).permit(:name, :location, :date)
    end
end
