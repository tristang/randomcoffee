Rails.application.routes.draw do

  root 'site#index'
  get '/faq', to: "site#faq"

  resources :users do

    collection do
      get :registered
    end
  end

  resources :departments

  # Admin nest
  namespace :admin do
    resources :users
    resources :meetups
  end

end
