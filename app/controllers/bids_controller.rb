class BidsController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    # only for elf!
  end
  
  def create
    # only for elf!    
  end
  
  def edit
    # only for elf!
  end
  
  def update
    # only for elf!    
  end
  
  def index
    # index of an elf's CURRENT bids
  end
  
  def show
    # detail view of one bid
  end
  
  def destroy
    # no destroy allowed? (unless is not accepted yet)?
    # or destroy all bids once a task is booked?  YEAH!
  end
end
