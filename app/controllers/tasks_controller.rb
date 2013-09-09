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
    # index of a user's santa_tasks
    @tasks = current_user.santa_tasks
    render :index
  end
  
  def performed 
    # index of a user's elf_tasks
    @tasks = current_user.elf_tasks
    render :performed
  end
  
  def available
    # index of all tasks with status "requested"
    @tasks = Task.all.reject { |i| i.status != "requested" }
    render :available
  end
  
  def show
    # detail view of one task
    @task = Task.find(params[:id])
    render :show
  end
  
  def destroy
    # no destroy allowed? (unless status is "requested")?
  end
end
