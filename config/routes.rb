Resistivity::Application.routes.draw do
  get "grids/new"
  get "grids/edit"
  get "logout" => "sessions#destroy", :as => 'logout'
  get "login" => "sessions#new", :as => 'login'
  get "sign_up" => "users#new", :as => "sign_up"
  root :to => "sessions#new"
  resources :users
  resources :sessions
  resources :surveys do
    resources :grids
  end
  
end
