Rails.application.routes.draw do
  
  get '/faq', to: 'faq#index', as: 'faq'
  devise_for :users

  # get 'home/index'
  root 'home#index'
  resources :products
  resources :webhooks, only: [:create]
  post 'checkout/create', to: 'checkout#create'
end
