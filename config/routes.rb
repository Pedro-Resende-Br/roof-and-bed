Rails.application.routes.draw do
  #get 'flats/index'
  devise_for :users
  root to: 'flats#index'
  resources :flats do
    resources :bookings, only: [:new, :create, :destroy]
  end
  get 'dashboard', to: 'pages#dashboard'
end
