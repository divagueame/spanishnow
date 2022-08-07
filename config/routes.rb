Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  # root 'products#index'

  root 'home#index'
  resources :products
  resources :webhooks, only: [:create]
  post 'checkout/create', to: 'checkout#create'
end
