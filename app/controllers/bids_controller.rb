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
    # index of a elf's bids
  end
  
  def show
    # detail view of one bid
  end
  
  def destroy
    # no destroy allowed? (unless is not accepted yet)?
  end
end
