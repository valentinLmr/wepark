Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :garages do
    resources :rentals, only:[:show, :new, :create]
  end

  resources :rentals, only: [:destroy]

  get '/dashboard', to: 'profiles#dashboard'
end
