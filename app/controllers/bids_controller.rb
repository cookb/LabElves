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
    if @bid.save
      redirect_to all_bids_url
    else
      @task = Task.find(params[:task_id])
      flash.now[:notice] = @bid.errors.full_messages
      render :new
    end    
  end

  def index
    # nested under tasks
    # index of a santa's CURRENT bids 
    @task = Task.includes(:bids).find(params[:task_id])
    render :index
  end
  
  def edit
    # only for elf!
    @bid = Bid.includes(:task).find(params[:id])
    render :edit
  end
  
  def update
    # only for elf!
    @bid = Bid.find(params[:id])
    if @bid.update_attributes(params[:bid])   
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
