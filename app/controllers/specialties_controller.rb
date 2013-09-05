class SpecialtiesController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    
  end
  
  def create
    
  end
  
  def index
    @user = current_user
    render :index
  end
  
  def show
    
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
end
