Rails.application.routes.draw do

  root 'movies#index'

  resources :movies do
    resource :review, only: [:new, :create]
  end
  
  get '/reviews' => 'reviews#index'

end
