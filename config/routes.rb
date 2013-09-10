LabElves::Application.routes.draw do
  root :to => "users#show"
  get "profile/:id" => "users#profile", :as => :profile

  devise_for :users, :controllers => {:registrations => "registrations"} 
  
  resources :specialties, :except => :destroy do
    collection { get 'all'; get 'other' }
  end
    
  resources :reviews, :only => [:new, :create, :show, :index] do
    collection { get 'authored' }
  end
  
  resources :tasks do
    collection { get 'available'; get 'performed' }
    resources :bids, :only => [:index, :new, :create]
  end
  
  resources :bids, :only => [:show, :edit, :update, :destroy] do
    collection { get 'all' }
  end
  
  resources :spec_joins, :only => [:create, :destroy]
end
