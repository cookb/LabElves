class TasksController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    # only for santa tasks!
    @task = Task.new
    render :new
  end
  
  def create
    # only for santa tasks!  
    # only allowed if owned and status is "requested"  
    @task = Task.new(params[:task])
    lat_long = get_lat_lng(params[:task][:location])
    @task.latitude = lat_long[0]
    @task.longitude = lat_long[1]
    if @task.save
      redirect_to tasks_url
    else
      flash.now[:notice] = @task.errors.full_messages
      render :new
    end
  end
  
  def edit
    # only for santa tasks!
    # only allowed if owned and status is "requested"
    @task = Task.find(params[:id])
    render :edit
  end
  
  def update
    # only for santa! (and owner)
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])   
      new_location = params[:task][:location]
      if new_location != @task.location
        lat_long = get_lat_lng(new_location)
        @task.latitude = lat_long[0]
        @task.longitude = lat_long[1] 
      end
      @task.save
      redirect_to tasks_url
    else
      flash.now[:notice] = @task.errors.full_messages
      render :edit
    end   
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
    # only allowed if owned and status is "requested"
    # TODO handled in view for now (change to before filter?)
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_url
  end
end
