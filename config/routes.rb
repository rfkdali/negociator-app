Rails.application.routes.draw do
  root to: 'itineraries#index'
  
  resources :itineraries do
    resources :visits
  end
end
