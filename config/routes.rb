Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api do
    resources :patients, only: %i[index show]
  end
end
