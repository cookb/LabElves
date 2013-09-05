LabElves::Application.routes.draw do
  root :to => "users#show"

  devise_for :users
  resources :specialties
  resources :spec_joins, :only => [:create, :destroy]
end
