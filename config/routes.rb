Rails.application.routes.draw do
  resources :flights
  resources :bookings
  root to: "flights#index"
end
