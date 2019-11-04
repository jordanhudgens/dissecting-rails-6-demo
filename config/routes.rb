Rails.application.routes.draw do
  resources :guides
  resources :topics
  resources :followings
  get :search_query, to: 'search#search_query', as: :search_query
  devise_for :users
  get 'profile/:id', to: 'profiles#show', as: :profile
  get :profiles, to: 'profiles#index', as: :profiles
  root to: 'static#homepage'
end
