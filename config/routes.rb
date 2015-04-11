Rails.application.routes.draw do
  devise_for :users
  
  root 'subjects#about'

  get '/about' => 'subjects#about'

  resources :subjects

end
