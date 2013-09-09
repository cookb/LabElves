class ReviewsController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    # TODO
    # only for santa!
    @review = Review.new
    render :new
  end
  
  def create
    # TODO
    # only for santa! (can only be done when task is completed)
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
    @review = Review.find(params[:id])
    render :show
  end
end
