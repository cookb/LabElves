class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [:show, :edit, :update, :destroy]
    
  def show
    @user = current_user
    render :show
  end
end
