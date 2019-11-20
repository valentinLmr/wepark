Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :garages do
    resources :rentals, only:[:show, :new, :create]
  end


get '/search' => 'pages#search', :as => 'search_page'

  resources :rentals, only: [:destroy, :show]

  get '/dashboard', to: 'profiles#dashboard'
end
