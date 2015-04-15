Rails.application.routes.draw do
  devise_for :users
  
  root 'subjects#about'

  get '/about' => 'subjects#about'
  get '/resources' => 'subjects#resources'
  get '/random' => 'subjects#random'

  resources :subjects

end
