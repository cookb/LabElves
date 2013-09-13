class BidsController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    # nested under tasks
    # only for elf! (also can't be the santa)
    @bid = Bid.new
    @task = Task.includes(:santa).find(params[:task_id])
    if @task.santa == current_user
      flash[:notice] = "You can't place a bid for your own task!"
      redirect_to task_url(@task)
    elsif !current_user.specialties.include?(@task.specialty)
      flash[:notice] = "You don't have the proper specialty to bid on this task!"
      redirect_to task_url(@task)
    else
      render :new
    end
  end
  
  def create
    # nested under tasks
    # only for elf!
    @bid = Bid.new(params[:bid])
    if !params[:bid][:time_bid].to_datetime.between?(@bid.task.time_start, @bid.task.time_end)
      flash[:notice] = "Time bid must be within time window!"
      @task = Task.find(params[:task_id])
      render :new
    elsif @bid.save
      redirect_to all_bids_url
    else
      @task = Task.find(params[:task_id])
      flash.now[:notice] = @bid.errors.full_messages
      render :new
    end    
  end

  def received
    # nested under tasks
    # bids received for one Santa task
    @task = Task.includes(:bids).find(params[:task_id])
    render :received
  end
  
  def edit
    # only for elf!
    @bid = Bid.includes(:task).find(params[:id])
    render :edit
  end
  
  def update
    # only for elf!
    @bid = Bid.find(params[:id])
    if !params[:bid][:time_bid].to_datetime.between?(@bid.task.time_start, @bid.task.time_end)
      flash[:notice] = "Your time bid must be within the time window!"
      render :edit
    elsif @bid.update_attributes(params[:bid])   
      redirect_to bid_url(@bid)
    else
      flash.now[:notice] = @bid.errors.full_messages
      render :edit
    end    
  end
  
  def all
    # all of an elf's CURRENT bids
    @bids = current_user.bids.order("created_at DESC")
    render :all
  end
  
  def index
    # all of Santa's CURRENT bids received
    @tasks = current_user.santa_tasks.order("created_at DESC")
    render :index
  end
  
  def show
    # detail view of one bid
    @bid = Bid.includes(:task, :santa, :elf).find(params[:id])
    render :show
  end
  
  def destroy
    # elf can delete 
    # otherwise, all bids automatically destroyed once a task is booked!
    @bid = Bid.find(params[:id])
    @bid.destroy
    redirect_to all_bids_url
  end
  
  def book
    # books elf for task. then deletes all bids for the task
    @bid = Bid.includes(:task).find(params[:id])
    @task = @bid.task
    @task.status = "booked"
    @task.elf_id = @bid.elf_id
    @task.credits = @bid.credits_bid
    @task.time_final = @bid.time_bid
    @task.save
    @task.bids.each { |bid| bid.destroy }
    redirect_to task_url(@task)
  end
end
