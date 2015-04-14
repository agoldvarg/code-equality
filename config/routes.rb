Rails.application.routes.draw do
  devise_for :users
  
  root 'subjects#random'

  get '/about' => 'subjects#about'
  get '/resources' => 'subjects#resources'

  resources :subjects

end
