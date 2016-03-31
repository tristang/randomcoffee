Rails.application.routes.draw do

  root 'site#index'
  get '/faq', to: "site#faq"

  resources :users do

    collection do
      get :registered
    end
  end


  get '/admin', to: "admin#index"
  # Admin nest
  namespace :admin do
    resources :departments
    resources :users
    resources :meetups
  end

end
