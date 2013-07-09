UrbanBound::Application.routes.draw do
  resources :sessions, :only => [:create, :new]
  resources :books, :only => [:create, :new]
  resources :users
  root :to => 'home#index'

  get '/logout/' => "sessions#logout", :as => 'logout'
end
