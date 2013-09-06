LabElves::Application.routes.draw do
  root :to => "users#show"

  # devise_for :users
  devise_for :users, :controllers => {:registrations => "registrations"}
  
  resources :specialties
  resources :spec_joins, :only => [:create, :destroy]
  resources :reviews, :only => [:new, :create, :show, :index]
  resources :tasks
  resources :bids
end
