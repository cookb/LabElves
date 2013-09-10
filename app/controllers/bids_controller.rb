class BidsController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    # nested under tasks
    # only for elf! (also can't be the santa)
    @bid = Bid.new
    @task = Task.find(params[:task_id])
    render :new
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
    @task = Task.find(params[:task_id])
    render :index
  end
  
  def edit
    # only for elf!
    @bid = Bid.find(params[:id])
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
    @bids = current_user.bids
    render :all
  end
  
  def show
    # detail view of one bid
    @bid = Bid.find(params[:id])
    render :show
  end
  
  def destroy
    # elf can delete 
    # otherwise, all bids automatically destroyed once a task is booked!
    @bid = Bid.find(params[:id])
    @bid.destroy
    redirect_to all_bids_url
  end
end
