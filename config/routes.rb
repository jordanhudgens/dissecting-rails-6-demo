Rails.application.routes.draw do
  resources :guides
  devise_for :users
  get 'profile/:id', to: 'profiles#show'
  root to: 'static#homepage'
end
