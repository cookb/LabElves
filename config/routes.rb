LabElves::Application.routes.draw do
  root :to => "users#show"

  # devise_for :users
  devise_for :users, :controllers => {:registrations => "registrations"}
  
  resources :specialties, :except => :destroy do
    collection { get 'all'; get 'other' }
  end
  
  resources :spec_joins, :only => [:create, :destroy]
  
  resources :reviews, :only => [:new, :create, :show, :index] do
    collection { get 'authored' }
  end
  
  resources :tasks
  resources :bids
end
