class SpecJoinsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    spec_join = SpecJoin.new(:user_id => current_user.id, :spec_id => params[:format])
    spec_join.save
    redirect_to all_specialties_url
  end
  
  def destroy
    spec_join = SpecJoin.find(params[:id])
    spec_join.destroy
    redirect_to specialties_url
  end
end
