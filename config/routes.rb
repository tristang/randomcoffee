Rails.application.routes.draw do
  root 'site#index'
  get '/home', to: 'site#home'

  resources :users do
    collection do
      get :registered
    end
  end

  get '/admin', to: 'admin#index'
  # Admin nest
  namespace :admin do
    resources :departments
    resources :users do
      member do
        put :acivate
        put :inacivate
      end
    end
    resources :meetups do
      member do
        post :send_emails
      end
    end
  end
end
