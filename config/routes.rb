Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]

  root 'subjects#about'

  get '/about' => 'subjects#about'
  get '/resources' => 'subjects#resources'
  post 'subjects/search' => 'subjects#search', as: 'search_subjects'
  get '/random' => 'subjects#random', as: 'sample_subject'
  resources :subjects

end
