Rails.application.routes.draw do
  resources :users
  root to: 'static#homepage'
end
