Rails.application.routes.draw do
  devise_for :users
  
  root 'subjects#about'

  get '/about' => 'subjects#about'
  get '/resources' => 'subjects#resources'
  get '/random' => 'subjects#random'
  post 'subjects/search' => 'subjects#search', as: 'search_subjects'
  resources :subjects

end
