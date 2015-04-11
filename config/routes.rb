Rails.application.routes.draw do
  devise_for :users
  
  root 'subjects#index'

  get '/about' => 'subjects#about'

end
