Rails.application.routes.draw do
  get 'flats/index'
  devise_for :users
  root to: 'flats#index'
  resources :flats, except: [:index] do
    resources :bookings, only: [:new, :create]
  end
end
