Rails.application.routes.draw do
  devise_for :users
  root to: 'flats#index'
  resources :flats, except: [:index]
  resources :bookings, only: [:new, :create]
end
