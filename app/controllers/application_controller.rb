class ApplicationController < ActionController::Base
  protect_from_forgery
  
  ### DEVISE NEEDS NO SESSIONS CONTROLLER
  ### DEVISE settings in config/initializers/devise.rb (password length, etc)
  
  # Devise adds in the following helper methods and filters:
  # user_signed_in?
  # current_user
  # user_session  (accesses the session for this scope)
  # before_filter :authenticate_user!   (use before any authorized action)
end
