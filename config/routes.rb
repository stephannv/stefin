Rails.application.routes.draw do
  root "accounts#index"

  resources :accounts, only: %i[index]
end
