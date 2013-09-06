class ReviewsController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    # only for santa!
  end
  
  def create
    # only for santa!    
  end
  
  def index
    # index of a elf's reviews? or santa reviews?
  end
  
  def show
    # detail view of one review
  end
end
