Rails.application.routes.draw do
  get '/welcome', to: 'payment_sucess#index', as: 'welcome'
  
  get '/faq', to: 'faq#index', as: 'faq'
  devise_for :users

  # get 'home/index'
  root 'home#index'
  resources :products
  resources :webhooks, only: [:create]
  post 'checkout/create', to: 'checkout#create'
end
