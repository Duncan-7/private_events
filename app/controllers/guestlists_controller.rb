class GuestlistsController < ApplicationController
  def create
    @guestlist = Guestlist.new
    @guestlist[:attendee_id] = session[:user_id]
    @guestlist[:attended_event_id] = params[:event_id]
    @guestlist.save
    redirect_to Event.find(params[:event_id])
  end
end
