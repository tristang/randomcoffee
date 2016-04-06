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
    resources :meetups do
      member do
        post :send_emails
      end
    end
  end

end
