Rails.application.routes.draw do
  get 'admin/index'
  resources :lessons
  resources :blocks, only: [:new :create]
  get '/welcome', to: 'payment_sucess#index', as: 'welcome'
  
  get '/faq', to: 'faq#index', as: 'faq'
  devise_for :users, controllers: {confirmations: 'users/confirmations'}
  get '/admin', to: 'admin#index'

  resources :products
  resources :webhooks, only: [:create]
  post 'checkout/create', to: 'checkout#create'
  
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  root 'home#index'
end
