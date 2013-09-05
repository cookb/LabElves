class SpecialtiesController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    
  end
  
  def create
    
  end
  
  def edit
    # only for author!
  end
  
  def update
    # only for author!    
  end
  
  def index
    # index of a user's specialties? or all specialties?
    @user = current_user
    render :index
  end
  
  def show
    # detail view of one specialty
  end
  
  def destroy
    # no destroy allowed?
  end
end
