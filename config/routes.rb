Rails.application.routes.draw do
  root "accounts#index"

  resources :accounts
  resources :categories
end
