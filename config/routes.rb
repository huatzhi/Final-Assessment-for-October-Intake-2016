Rails.application.routes.draw do
  post "upgrade" => "users#upgrade", :as => 'payment'
  get "upgrade" => "users#upgrade_page", :as => 'upgrade'
  resources :ads
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  resources :users
  resources :sessions
  root to: 'static#homepage'
end
