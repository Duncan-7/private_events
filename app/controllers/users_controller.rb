class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    log_in @user
    redirect_to @user
  end
  
  def show
    @user = User.find(params[:id])
    @hosting_events = @user.events_created.upcoming
    @hosted_events = @user.events_created.past
    @attending_events = @user.attended_events.upcoming
    @attended_events = @user.attended_events.past
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end
end
