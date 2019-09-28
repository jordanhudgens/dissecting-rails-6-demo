Rails.application.routes.draw do
  resources :guides
  get :search_query, to: 'search#search_query', as: :search_query
  devise_for :users
  get 'profile/:id', to: 'profiles#show'
  root to: 'static#homepage'
end
