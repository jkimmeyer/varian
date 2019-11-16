Rails.application.routes.draw do
  root to: 'home#index'

  resources :home, only: %i[index show]
  get 'report', to: 'home#report'

  namespace :api do
    resources :patients, only: %i[index show]
  end
end
