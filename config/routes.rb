LabElves::Application.routes.draw do
  root :to => "users#show"
  get "profile/:id" => "users#profile", :as => :profile
  get "profile/:id/reviews" => "users#reviews", :as => :user_reviews

  devise_for :users, :controllers => {:registrations => "registrations"} 
  
  resources :specialties, :except => :destroy do
    collection { get 'all'; get 'other' }
  end
    
  resources :reviews, :only => [:index, :show] do
    collection { get 'authored' }
  end
  
  resources :tasks do
    collection { get 'available'; get 'performed'; get ':id/complete' => "tasks#complete", :as => :complete }
    resources :bids, :only => [:new, :create] do
      collection { get '' => "bids#received" }
    end
    resources :reviews, :only => [:new, :create]
  end
  
  resources :bids, :only => [:index, :show, :edit, :update, :destroy] do
    collection { get 'all'; get ':id/book' => "bids#book", :as => :book }
  end
  
  resources :spec_joins, :only => [:create, :destroy]
end
