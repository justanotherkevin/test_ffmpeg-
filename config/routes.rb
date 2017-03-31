Rails.application.routes.draw do
  resources :ffmpegs

  root "ffmpegs#index"
end
