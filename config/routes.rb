Rails.application.routes.draw do
  resources :guides
  resources :topics
  get :search_query, to: 'search#search_query', as: :search_query
  devise_for :users
  get 'profile/:id', to: 'profiles#show', as: :profile
  root to: 'static#homepage'
end
