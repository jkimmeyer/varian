Rails.application.routes.draw do
  root to: 'home#index'

  resources :home, only: %i[index show]

  namespace :api do
    resources :patients, only: %i[index show]
  end
end
