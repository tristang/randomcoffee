Rails.application.routes.draw do

  root 'site#index'
  get '/faq', to: "site#faq"

end
