class SpecialtiesController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    
  end
  
  def create
    
  end
  
  def edit
    # only for author!
  end
  
  def update
    # only for author! maybe only edit description?    
  end
  
  def index
    # index of a user's specialties
    # TODO nesting!
    @user = current_user
    render :index
  end
  
  def all
    # index of all other specialties
    # TODO nesting!
    @specialties = Specialty.all.reject {|i| current_user.specialties.include?(i)}
    render :all
  end
  
  def show
    # detail view of one specialty
    @specialty = Specialty.find(params[:id])
    render :show
  end
end
