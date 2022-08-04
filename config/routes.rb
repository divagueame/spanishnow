Rails.application.routes.draw do
  root 'products#index'
  resources :products
  resources :webhooks, only: [:create]
  post 'checkout/create', to: 'checkout#create'
end
