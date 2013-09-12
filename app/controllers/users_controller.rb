class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [:show, :edit, :update, :destroy]
    
  def show
    @user = current_user
    render :show
  end
  
  def profile
    @user = User.find(params[:id])
    render :profile
  end
  
  def reviews
    @user = User.includes(reviews_received: [:task]).find(params[:id])
    render "reviews/index"
  end
end
