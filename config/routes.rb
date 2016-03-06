Rails.application.routes.draw do

  root 'site#index'
  get '/faq', to: "site#faq"

  resources :users do

    collection do
      get :registered
    end
  end

  resources :departments

  get '/admin/users', to: "admin#users"
end
