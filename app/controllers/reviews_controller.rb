class ReviewsController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    # only for santa!
    @task = Task.includes(:elf).find(params[:task_id])
    @review = Review.new
    render :new
  end
  
  def create
    # only for santa!
    # updates elf's star, total and rating attribues
    @review = Review.new(params[:review])
    if @review.save
      elf = @review.elf
      elf.stars += 1 if @review.endorse
      elf.total += 1
      elf.rating = elf.stars.to_f / elf.total
      elf.save
      task = @review.task
      task.status = "completed"
      task.save
      redirect_to task_url(@review.task)
    else
      flash.now[:notice] = @review.errors.full_messages
      render :new
    end
  end
  
  def index
    # index of a elf's reviews
    @user = current_user
    render :index
  end
  
  def authored
    # index of santa reviews
    @user = current_user
    render :authored
  end
  
  def show
    # detail view of one review
    @review = Review.includes(task: [:santa, :elf]).find(params[:id])
    render :show
  end
end
