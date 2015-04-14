Rails.application.routes.draw do
  devise_for :users
  
  # root 'subjects#random'
  root 'subjects#about'

  get '/about' => 'subjects#about'
  get '/resources' => 'subjects#resources'

  resources :subjects

end
