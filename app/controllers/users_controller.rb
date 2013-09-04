class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [:show, :edit, :update]
    
  def show
    @user = current_user
    @user.lat_long = @user.lat_lng(@user.location)
    @user.save
    render :show
  end

end
