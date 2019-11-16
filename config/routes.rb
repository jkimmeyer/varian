Rails.application.routes.draw do
  root to: 'home#index'

  resources :home, only: %i[index show]
  get 'report', to: 'home#report'
  get 'patient', to: 'home#patient'
  get '/my-therapy', :to => redirect('/my-therapy.html')

  namespace :api do
    resources :patients, only: %i[index show] do
      resources :treatment_plans, only: %i[index show] do
        member do
          post :update_status
        end
        collection do
          get :current
        end
      end
    end
  end
end
