Rails.application.routes.draw do
  resources :guides
  devise_for :users
  root to: 'static#homepage'
end
