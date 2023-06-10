Rails.application.routes.draw do
  root "records#index"

  resources :accounts
  resources :categories
  resources :records
  resources :transfers, only: %i[new create]
end
