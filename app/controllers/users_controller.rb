class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [:show, :edit, :update, :destroy]
    
  def show
    @user = current_user
    @user.lat_long = @user.get_lat_lng(@user.location)
    @user.save
    render :show
  end
end
