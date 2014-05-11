Auth::Application.routes.draw do
  get "logout" => "sessions#destroy", :as => 'logout'
  get "login" => "sessions#new", :as => 'login'
  get "sign_up" => "users#new", :as => "sign_up"
  root :to => "sessions#new"
  resources :users
  resources :sessions
end
