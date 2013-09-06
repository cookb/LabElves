class TasksController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    # only for santa!
  end
  
  def create
    # only for santa!    
  end
  
  def edit
    # only for santa!
  end
  
  def update
    # only for santa!    
  end
  
  def index
    # index of a user's tasks? (santa or elf?)    
  end
  
  def show
    # detail view of one task
  end
  
  def destroy
    # no destroy allowed? (unless status is "requested")?
  end
end
