class SpecialtiesController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @specialty = Specialty.new
    render :new
  end
  
  def create
    @specialty = Specialty.new(params[:specialty])
    @specialty.save
    redirect_to all_specialties_url
  end
  
  def edit
    # TODO
    # only for author! maybe only edit description? LATER
  end
  
  def update
    # TODO
    # only for author! maybe only edit description? LATER    
  end
  
  def index
    # index of a user's specialties
    # TODO nesting!
    @user = current_user
    render :index
  end
  
  def all
    # index of all specialties
    # TOTO nesting!!!
    @specialties = Specialty.all
    render :all
  end
  
  def other
    # index of all other specialties (all - index)
    # TODO nesting!
    @specialties = Specialty.all.reject {|i| current_user.specialties.include?(i)}
    render :other
  end
  
  def show
    # detail view of one specialty
    @specialty = Specialty.find(params[:id])
    render :show
  end
end
