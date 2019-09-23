Rails.application.routes.draw do
  resources :guides
  devise_for :users
  get 'profile/:slug', to: 'profiles#show'
  root to: 'static#homepage'
end
