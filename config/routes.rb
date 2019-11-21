Rails.application.routes.draw do


  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :garages do
    resources :rentals, only:[:show, :new, :create]
    resources :reviews, only: [:index, :new, :create]
  end


  get '/search' => 'pages#search', :as => 'search_page'

  resources :rentals, only: [:destroy, :show]
  #resources :reviews

  get '/dashboard', to: 'profiles#dashboard'

  resources :orders, only: [:show, :create]do
    resources :payments, only: :new
  end
end
